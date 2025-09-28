-- Drop existing bookings table if it exists (be careful in production!)
DROP TABLE IF EXISTS bookings CASCADE;

-- Step 1: Create parent table with partitioning
CREATE TABLE bookings (
    booking_id UUID PRIMARY KEY,
    property_id UUID NOT NULL,
    users_id UUID NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10,2) NOT NULL,
    status VARCHAR(50) NOT NULL
) PARTITION BY RANGE (start_date);

-- Step 2: Create child partitions
CREATE TABLE bookings_2025 PARTITION OF bookings
    FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

CREATE TABLE bookings_2026 PARTITION OF bookings
    FOR VALUES FROM ('2026-01-01') TO ('2027-01-01');

-- Optional: default partition for unexpected dates
CREATE TABLE bookings_default PARTITION OF bookings
    DEFAULT;

-- Step 3: Indexes on partitions
CREATE INDEX idx_bookings_2025_start_date ON bookings_2025(start_date);
CREATE INDEX idx_bookings_2026_start_date ON bookings_2026(start_date);



EXPLAIN ANALYZE
SELECT * 
FROM bookings
WHERE start_date BETWEEN '2025-05-01' AND '2025-05-31';
