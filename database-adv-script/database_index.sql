
-- Users table indexes
-- Improve lookup speed by email, common in login or user fetch queries
CREATE INDEX idx_users_email ON users(email);

-- Optimize queries filtering or sorting by account creation date
CREATE INDEX idx_users_created_at ON users(created_at);

-- Bookings table indexes
-- Speeds up joins between bookings and users
CREATE INDEX idx_bookings_user_id ON bookings(user_id);

-- Used when retrieving bookings per property or joining bookings to properties
CREATE INDEX idx_bookings_property_id ON bookings(property_id);

-- Improves performance for date-range queries (e.g., availability filtering)
CREATE INDEX idx_bookings_start_date ON bookings(start_date);

-- Properties table indexes
-- Index for faster filtering or joining properties by host
CREATE INDEX idx_properties_host_id ON properties(host_id);

-- Enhances queries filtering or aggregating by location (e.g., city-based search)
CREATE INDEX idx_properties_location ON properties(location);

-- Example: Before adding index
EXPLAIN ANALYZE SELECT * FROM users WHERE email = 'guest@example.com';

-- Example: After adding index
EXPLAIN ANALYZE SELECT * FROM users WHERE email = 'guest@example.com';






