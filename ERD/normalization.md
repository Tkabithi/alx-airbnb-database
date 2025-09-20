# Normalization for Airbnb Database
![alt text](<AirBnb erd 2.PNG>)

## First Normal Form (1NF)
- All tables contain atomic values (no multi-valued or repeating attributes).
- Example: `phone_number` in the User table stores a single value, not a list.
chema is in 1NF.

## Second Normal Form (2NF)
- Each table already has a single-column primary key (UUID).
- Therefore, no partial dependency issues exist.
 Schema is in 2NF.

## Third Normal Form (3NF)
- Checked for transitive dependencies:
  - **User**: Attributes depend only on `user_id`.
  - **Property**: Attributes depend only on `property_id`.
  - **Booking**: All attributes depend on `booking_id`.  
    - Note: `total_price` is *derivable* from `(end_date - start_date) × pricepernight`.  
      Keeping it introduces a denormalization for performance reasons.
  - **Payment**: Attributes depend only on `payment_id`.
  - **Review**: Attributes depend only on `review_id`.
  - **Message**: Attributes depend only on `message_id`.
 Schema is in 3NF (with a justified denormalization for `total_price`).

## Conclusion
The Airbnb database schema is normalized up to **Third Normal Form (3NF)**.  
The only exception is `total_price` in the Booking table, which is intentionally retained for efficiency and historical accuracy.

