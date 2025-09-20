# Database Schema (DDL)

This folder contains the SQL Data Definition Language (DDL) script for the Airbnb-like database.

## Files
- `schema.sql`: Contains the CREATE TABLE statements, constraints, and indexes.

## Highlights
- All tables use `UUID` as their primary key.
- Foreign keys ensure relationships between users, properties, bookings, payments, reviews, and messages.
- Constraints:
  - Unique constraint on user email.
  - CHECK constraint on review ratings (1–5).
  - ENUM constraints for roles, booking status, and payment methods.
- Indexes added on frequently queried columns (`email`, `property_id`, `booking_id`) for performance optimization.

