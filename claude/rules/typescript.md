# TypeScript Best Practices

## Principles

- Prefer standard library over external dependencies
- Use pure functions instead of classes
- Separate state and logic
- Keep functions idempotent

## Package Manager

```bash
npm install
npm add <package>
```

## Testing

Use vitest:

```bash
npm add -D vitest
```

```typescript
// foo.test.ts
import { expect, test } from 'vitest';
import { add } from './foo.ts';

test('add', () => {
  expect(add(1, 2)).toBe(3);
});
```

## Code Style

```typescript
// Good: pure function + separate state
type State = { count: number };

const increment = (state: State): State => ({
  ...state,
  count: state.count + 1,
});

// Avoid: mutable class
class Counter {
  count = 0;
  increment() { this.count++; }
}
```

## Prefer Standard APIs

```typescript
// fetch
const res = await fetch(url);
const data = await res.json();

// crypto
const id = crypto.randomUUID();

// URL
const url = new URL('/path', base);
```
