--Users
INSERT INTO User (user_id, first_name, last_name, email, password_hash, role)
VALUES
('uuid-1','Alice','Johnson','alice@example.com','hashedpass1','guest'),
('uuid-2','Bob','Smith','bob@example.com','hashedpass2','host'),
('uuid-3','Clara','Davis', 'clara@example.com','hashedpass3','admin');

--properties
INSERT INTO Property(property_id, host_id, name, description, location, pricepernight)
VALUES
('uuid-10', 'uuid-2','Cozy Cottage','A small cottage in the countryside of Kirinyaga','Kirinyaga,Kenya', '5000.00'),
('uuid-20','uuid-2','Modern Loft','Spacious loft with a city view ','Mombasa,Kenya','7000.00');

--Bookings
INSERT INTO Booking(booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
('uuid-20','uuid-10','uuid-1','2025-10-01','2025-10-05', 20000,'confirmed'),
('uuid-21','uuid-11','uuid-1','2025-11-10','2025-11-12', 14000,'pending');

--payments
INSERT INTO Payment(payment_id, booking_id, amount, payment_method)
VALUES
('uuid-30', 'uuid-20', 20000, 'credit_card'),
('uuid-31', 'uuid-21', 14000, 'paypal'),

--Reviews
INSERT INTO Reviews(review_id, property_id, user_id, rating, comment)
VALUES
('uuid-40','uuid-10', 'uuid-1',5,'Wonderful stay!very cold'),
('uuid-41','uuid-11', 'uuid-1',4,'Great location ,but too many mosquitoes'),

--Messages
INSERT INTO Message(message_id, sender_id, recipient_id, message_body)
VALUES
('uuid-50','uuid-1','uuid-2','Hi, isyour loft available in November 2nd?'),
('uuid-51','uuid-2','uuid-1','Hi,Yes it is available from 2nd to the 4th.');
