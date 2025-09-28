# Index Performance Report

## Queries Tested
1. Fetch bookings by user email:
```sql
EXPLAIN SELECT * 
FROM booking b
JOIN users u ON b.users_id = u.users_id
WHERE u.email = 'alice@example.com';
