-- USERS
INSERT INTO users (users_id, first_name, last_name, email, password_hash, role)
VALUES
('11111111-1111-1111-1111-111111111111','Alice','Johnson','alice@example.com','hashedpass1','guest'),
('22222222-2222-2222-2222-222222222222','Bob','Smith','bob@example.com','hashedpass2','host'),
('33333333-3333-3333-3333-333333333333','Clara','Davis','clara@example.com','hashedpass3','admin');

-- PROPERTIES
INSERT INTO properties (property_id, host_id, name, description, location, price_per_night)
VALUES
('44444444-4444-4444-4444-444444444444','22222222-2222-2222-2222-222222222222','Cozy Cottage','A small cottage in the countryside of Kirinyaga','Kirinyaga, Kenya',5000.00),
('55555555-5555-5555-5555-555555555555','22222222-2222-2222-2222-222222222222','Modern Loft','Spacious loft with a city view','Mombasa, Kenya',7000.00);

-- BOOKINGS
INSERT INTO bookings (booking_id, property_id, users_id, start_date, end_date, total_price, status)
VALUES
('66666666-6666-6666-6666-666666666666','44444444-4444-4444-4444-444444444444','11111111-1111-1111-1111-111111111111','2025-10-01','2025-10-05',20000.00,'confirmed'),
('77777777-7777-7777-7777-777777777777','55555555-5555-5555-5555-555555555555','11111111-1111-1111-1111-111111111111','2025-11-10','2025-11-12',14000.00,'pending');

-- PAYMENTS
INSERT INTO payments (payment_id, booking_id, amount, payment_method)
VALUES
('88888888-8888-8888-8888-888888888888','66666666-6666-6666-6666-666666666666',20000.00,'credit_card'),
('99999999-9999-9999-9999-999999999999','77777777-7777-7777-7777-777777777777',14000.00,'paypal');

-- REVIEWS
INSERT INTO reviews (review_id, property_id, users_id, rating, comment)
VALUES
('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa','44444444-4444-4444-4444-444444444444','11111111-1111-1111-1111-111111111111',5,'Wonderful stay! Very cold'),
('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb','55555555-5555-5555-5555-555555555555','11111111-1111-1111-1111-111111111111',4,'Great location, but too many mosquitoes');

-- MESSAGES
INSERT INTO messages (message_id, sender_id, recipient_id, message_body)
VALUES
('cccccccc-cccc-cccc-cccc-cccccccccccc','11111111-1111-1111-1111-111111111111','22222222-2222-2222-2222-222222222222','Hi, is your loft available in November 2nd?'),
('dddddddd-dddd-dddd-dddd-dddddddddddd','22222222-2222-2222-2222-222222222222','11111111-1111-1111-1111-111111111111','Yes, it is available from 2nd to the 4th.');
