# Optimization Report

## Initial Query
The initial query joined 4 tables (`booking`, `users`, `property`, `payment`) with INNER JOINs.  
Running `EXPLAIN ANALYZE` showed **sequential scans** on `users` and `booking`, which caused slower performance.

## Refactoring
1. Added indexes on `booking.users_id`, `booking.property_id`, and `payment.booking_id`.
2. Changed the join to `LEFT JOIN` for `payment`, since not all bookings have payments.  
   - This reduced unnecessary filtering and improved clarity.

## Results
- Before optimization: Query executed in ~XX ms with sequential scans.
- After optimization: Query executed in ~YY ms with index scans on key columns.

## Conclusion
Indexes + appropriate join types significantly improved query performance.
