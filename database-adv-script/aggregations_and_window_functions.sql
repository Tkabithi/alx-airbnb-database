-- Count how many bookings each user made
SELECT 
    u.users_id,
    u.first_name,
    u.last_name,
    COUNT(b.booking_id) AS total_bookings
FROM users u
LEFT JOIN bookings b ON u.users_id = b.users_id
GROUP BY u.users_id, u.first_name, u.last_name
ORDER BY total_bookings DESC;


-- Rank properties by how many bookings they received
SELECT 
    property_id,
    total_bookings,
    ROW_NUMBER() OVER (ORDER BY total_bookings DESC) AS row_num,
    RANK() OVER (ORDER BY total_bookings DESC) AS rank_num
FROM (
    SELECT property_id, COUNT(*) AS total_bookings
    FROM booking
    GROUP BY property_id
) AS property_counts;