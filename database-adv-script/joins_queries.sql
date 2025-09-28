-- INNER JOIN: bookings with their respective users
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    u.first_name,
    u.last_name,
    u.email
FROM bookings b
INNER JOIN users u ON b.users_id = u.users_id;

-- LEFT JOIN: properties and their reviews
SELECT 
    p.property_id,
    p.name AS property_name,
    r.review_id,
    r.rating,
    r.comment
FROM properties p
LEFT JOIN reviews r ON p.property_id = r.property_id;
ORDER BY p.property_id, r.review_id;

-- FULL OUTER JOIN: all users and all bookings
SELECT 
    u.users_id,
    u.first_name,
    u.last_name,
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price
FROM users u
FULL OUTER JOIN bookings b ON u.users_id = b.users_id;
