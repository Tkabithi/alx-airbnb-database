-- Enable UUID generator
CREATE EXTENSION IF NOT EXISTS "pgcrypto";

-- USERS TABLE
CREATE TABLE users (
    users_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(225) UNIQUE NOT NULL,
    phone_number VARCHAR(20),
    password_hash VARCHAR(225) NOT NULL,
    role VARCHAR(20) CHECK (role IN ('guest','host','admin')) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- PROPERTIES TABLE
CREATE TABLE properties (
    property_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    host_id UUID NOT NULL,
    name VARCHAR(150) NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR(225) NOT NULL,
    price_per_night DECIMAL(10,2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (host_id) REFERENCES users(users_id)
);

-- BOOKINGS TABLE
CREATE TABLE bookings (
    booking_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    property_id UUID NOT NULL,
    users_id UUID NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10,2) NOT NULL,
    status VARCHAR(20) CHECK (status IN ('pending','confirmed','cancelled')),
    FOREIGN KEY (property_id) REFERENCES properties(property_id),
    FOREIGN KEY (users_id) REFERENCES users(users_id)
);

-- PAYMENTS TABLE
CREATE TABLE payments (
    payment_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    booking_id UUID NOT NULL,
    amount DECIMAL (10,2) NOT NULL,
    payment_method VARCHAR(20) CHECK (payment_method IN ('credit_card','paypal','stripe')) NOT NULL,
    FOREIGN KEY (booking_id) REFERENCES bookings(booking_id)
);

-- REVIEWS TABLE
CREATE TABLE reviews (
    review_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    property_id UUID NOT NULL,
    users_id UUID NOT NULL,
    rating INT NOT NULL CHECK(rating >=1 AND rating <=5),
    comment TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY(property_id) REFERENCES properties(property_id),
    FOREIGN KEY(users_id) REFERENCES users(users_id)
);

-- MESSAGES TABLE
CREATE TABLE messages (
    message_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    sender_id UUID NOT NULL,
    recipient_id UUID NOT NULL,
    message_body TEXT NOT NULL,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (sender_id) REFERENCES users(users_id) ON DELETE CASCADE,
    FOREIGN KEY (recipient_id) REFERENCES users(users_id) ON DELETE CASCADE
);

-- INDEXES
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_property_host_id ON properties(host_id);
CREATE INDEX idx_booking_property_id ON bookings(property_id);
CREATE INDEX idx_booking_users_id ON bookings(users_id);
CREATE INDEX idx_payment_booking_id ON payments(booking_id);
CREATE INDEX idx_review_property_id ON reviews(property_id);
CREATE INDEX idx_review_users_id ON reviews(users_id);
