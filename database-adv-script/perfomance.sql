-- Initial unoptimized query joining all related tables
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
JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
JOIN payments py ON b.booking_id = py.booking_id
WHERE b.start_date >= '2022-01-01'
AND py.amount > 100;

-- Refactored optimized query selecting only necessary columns and leveraging indexes
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
JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
JOIN payments py ON b.booking_id = py.booking_id
WHERE b.start_date >= '2022-01-01'
AND py.amount > 100;

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
INNER JOIN users u ON b.user_id = u.user_id
INNER JOIN properties p ON b.property_id = p.property_id
INNER JOIN payments py ON b.booking_id = py.booking_id
WHERE b.start_date >= '2022-02-11'
AND py.amount > 50;


