-- Properties with avg rating > 4.0
SELECT 
    p.property_id,
    p.name,
    p.location
FROM properties p
WHERE p.property_id IN (
    SELECT r.property_id
    FROM reviews r
    GROUP BY r.property_id
    HAVING AVG(r.rating) > 4.0
)
ORDER BY p.name;

-- Users with more than 3 bookings
SELECT 
    u.users_id,
    u.first_name,
    u.last_name
FROM users u
WHERE (
    SELECT COUNT(*)
    FROM bookings b
    WHERE b.users_id = u.users_id
) > 3
ORDER BY u.first_name;
