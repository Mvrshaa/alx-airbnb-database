-- Initial Query Analysis

-- Unoptimized query joining all tables with SELECT *

SELECT *
FROM bookings b
JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
JOIN payments py ON b.booking_id = py.booking_id;


-- Performance Analysis

EXPLAIN ANALYZE
SELECT *
FROM bookings b
JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
JOIN payments py ON b.booking_id = py.booking_id;

-- Optimization Steps

-- Step 1: Create Required Indexes

-- Ensure foreign key columns are indexed
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_payments_booking_id ON payments(booking_id);

-- Step 2: Refactor the Query

-- Optimized query with specific columns and efficient joins
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.status,
    u.user_id,
    u.first_name,
    u.email,
    p.property_id,
    p.name AS property_name,
    p.location,
    py.payment_id,
    py.amount,
    py.payment_date
FROM bookings b
JOIN users u USING (user_id)
JOIN properties p USING (property_id)
JOIN payments py USING (booking_id);

-- Step 3: Verify Performance Improvements

EXPLAIN ANALYZE
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    u.first_name,
    u.email,
    p.name AS property_name,
    py.amount
FROM bookings b
JOIN users u USING (user_id)
JOIN properties p USING (property_id)
JOIN payments py USING (booking_id);


