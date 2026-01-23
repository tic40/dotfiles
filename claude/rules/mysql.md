# MySQL Best Practices

## Principles

- Always use EXPLAIN before running complex queries
- Avoid full table scans on large tables
- Design indexes based on query patterns
- Be cautious with ALTER on large tables

## Index Design

```sql
-- Good: use covering index for frequent queries
CREATE INDEX idx_users_status_created ON users(status, created_at);

-- Query uses index efficiently (leftmost prefix)
SELECT * FROM users WHERE status = 'active' ORDER BY created_at DESC;

-- Bad: index not used (skipping leftmost column)
SELECT * FROM users WHERE created_at > '2024-01-01';
```

## Dangerous Patterns to Avoid

```sql
-- NG: function on indexed column (causes full scan)
SELECT * FROM users WHERE YEAR(created_at) = 2024;
-- OK: use range instead
SELECT * FROM users WHERE created_at >= '2024-01-01' AND created_at < '2025-01-01';

-- NG: implicit type conversion
SELECT * FROM users WHERE phone = 09012345678;  -- phone is VARCHAR
-- OK: use correct type
SELECT * FROM users WHERE phone = '09012345678';

-- NG: leading wildcard (causes full scan)
SELECT * FROM users WHERE email LIKE '%@example.com';
-- OK: trailing wildcard uses index
SELECT * FROM users WHERE email LIKE 'john%';

-- NG: OR on different columns (often causes full scan)
SELECT * FROM users WHERE email = 'x' OR name = 'y';
-- OK: use UNION
SELECT * FROM users WHERE email = 'x'
UNION
SELECT * FROM users WHERE name = 'y';

-- NG: NOT IN / <> with large sets
SELECT * FROM users WHERE status NOT IN ('deleted', 'banned');
-- OK: use positive condition if possible
SELECT * FROM users WHERE status IN ('active', 'pending');
```

## Large Table Operations

```sql
-- NG: UPDATE/DELETE without LIMIT on large tables
DELETE FROM logs WHERE created_at < '2023-01-01';

-- OK: batch delete
DELETE FROM logs WHERE created_at < '2023-01-01' LIMIT 10000;
-- Repeat until affected rows = 0

-- NG: SELECT * on large tables without LIMIT
SELECT * FROM logs WHERE user_id = 1;

-- OK: always use LIMIT or pagination
SELECT * FROM logs WHERE user_id = 1 ORDER BY id DESC LIMIT 100;

-- NG: COUNT(*) on large tables (slow)
SELECT COUNT(*) FROM logs;

-- OK: use approximate count if acceptable
SELECT table_rows FROM information_schema.tables
WHERE table_name = 'logs';
```

## EXPLAIN Checklist

```sql
EXPLAIN SELECT * FROM users WHERE email = 'test@example.com';
```

Check for:
- `type`: Avoid `ALL` (full scan). Prefer `ref`, `range`, `const`
- `rows`: Lower is better
- `Extra`: Watch for `Using filesort`, `Using temporary`
- `key`: Confirm expected index is used

## Migration Safety

```sql
-- Large table ALTER: use pt-online-schema-change or gh-ost
-- Avoid direct ALTER on tables with millions of rows

-- NG: adding column with default (locks table in older MySQL)
ALTER TABLE users ADD COLUMN status VARCHAR(20) DEFAULT 'active';

-- OK: add nullable column, then backfill in batches
ALTER TABLE users ADD COLUMN status VARCHAR(20);
-- Then: UPDATE in batches with LIMIT
```

## Cautions

- Never run unbounded SELECT/UPDATE/DELETE on production
- Test queries with EXPLAIN on production-like data volume
- Add indexes before deploying queries that need them
- Monitor slow query log regularly
