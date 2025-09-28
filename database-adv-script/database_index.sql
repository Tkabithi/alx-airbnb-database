-- Index on users.email for faster lookups (e.g., login, search)
CREATE INDEX idx_users_email ON users(email);

-- Index on booking.users_id for joins with users
CREATE INDEX idx_booking_users_id ON booking(users_id);

-- Index on booking.property_id for joins with property
CREATE INDEX idx_booking_property_id ON booking(property_id);

-- Index on property.host_id for joins with users (who is the host)
CREATE INDEX idx_property_host_id ON property(host_id);

-- Index on review.property_id for faster review lookups by property
CREATE INDEX idx_review_property_id ON review(property_id);

-- Index on review.users_id for faster review lookups by user
CREATE INDEX idx_review_users_id ON review(users_id);


EXPLAIN SELECT * 
FROM booking b
JOIN users u ON b.users_id = u.users_id
WHERE u.email = 'alice@example.com';

-- 1. Measure performance BEFORE indexes
EXPLAIN ANALYZE 
SELECT * 
FROM booking b
JOIN users u ON b.users_id = u.users_id
WHERE u.email = 'alice@example.com';


-- 2. Create indexes
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_booking_users_id ON booking(users_id);
CREATE INDEX idx_booking_property_id ON booking(property_id);
CREATE INDEX idx_property_host_id ON property(host_id);


-- 3. Measure performance AFTER indexes
EXPLAIN ANALYZE 
SELECT * 
FROM booking b
JOIN users u ON b.users_id = u.users_id
WHERE u.email = 'alice@example.com';
