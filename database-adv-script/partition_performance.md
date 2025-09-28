# Partitioning Performance Report

## Objective
We implemented table partitioning on the `bookings` table using the `start_date` column to optimize queries on large datasets.

## Implementation
- The `bookings` table was partitioned by **RANGE (start_date)**.
- Child tables:
  - `bookings_2025` for bookings in 2025
  - `bookings_2026` for bookings in 2026
  - `bookings_default` for all other bookings
- Indexes were created on `start_date` for each partition.

## Testing
We compared query performance before and after partitioning using:

```sql
EXPLAIN ANALYZE
SELECT * FROM bookings
WHERE start_date BETWEEN '2025-05-01' AND '2025-05-31';
