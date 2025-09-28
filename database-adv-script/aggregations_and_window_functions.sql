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
    p.property_id,
    p.name AS property_name,
    COUNT(b.booking_id) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(b.booking_id) DESC) AS rank
FROM properties p
LEFT JOIN bookings b ON p.property_id = b.property_id
GROUP BY p.property_id, p.name
ORDER BY rank;
