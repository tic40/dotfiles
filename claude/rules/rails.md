# Rails Best Practices

## Principles

- Fat Model, Skinny Controller
- Follow RESTful design
- Avoid N+1 queries
- Extract business logic to Service objects

## Directory Structure

```
app/
├── controllers/    # Request handling only
├── models/         # Data layer + validations
└── views/          # Presentation layer
```

## Models

```ruby
# Good: improve readability with scopes
class User < ApplicationRecord
  scope :active, -> { where(active: true) }
  scope :recent, -> { order(created_at: :desc) }
end

# Good: avoid N+1
User.includes(:posts).where(active: true)
```

## Controllers

```ruby
# Good: keep it simple
class UsersController < ApplicationController
  def create
    result = UserCreationService.call(user_params)
    if result.success?
      render json: result.user, status: :created
    else
      render json: { errors: result.errors }, status: :unprocessable_entity
    end
  end
end
```

## Service Objects

```ruby
# app/services/user_creation_service.rb
class UserCreationService
  def self.call(params)
    new(params).call
  end

  def initialize(params)
    @params = params
  end

  def call
    user = User.new(@params)
    if user.save
      Result.new(success: true, user: user)
    else
      Result.new(success: false, errors: user.errors.full_messages)
    end
  end
end
```

## Testing

```ruby
# RSpec recommended
RSpec.describe User, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:email) }
  end

  describe '.active' do
    it 'returns only active users' do
      active = create(:user, active: true)
      inactive = create(:user, active: false)
      expect(User.active).to eq([active])
    end
  end
end
```

## Migrations

```ruby
# Don't forget indexes
class AddUserIdToPosts < ActiveRecord::Migration[7.0]
  def change
    add_reference :posts, :user, null: false, foreign_key: true, index: true
  end
end
```

## Cautions

- Never commit `binding.pry`
- Manage secrets with `rails credentials:edit`
- Use environment variables or credentials for environment-specific values
