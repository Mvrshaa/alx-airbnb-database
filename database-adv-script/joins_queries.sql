-- INNER JOIN: Show bookings along with the user who made each booking
-- Retrieve all bookings with their corresponding users

SELECT
  b.booking_id,
  b.start_date,
  b.end_date,
  u.users_id,
  u.user_name
FROM
  bookings b
INNER JOIN users u ON b.user_id = u.users_id;


-- LEFT JOIN: List all properties and any reviews they may have
-- Retrieve all properties and their reviews (if any), including properties with no reviews

SELECT
  p.property_id,
  p.property_name,
  r.review_id,
  r.review_rating
FROM
  properties p
LEFT JOIN reviews r ON p.property_id = r.property_id;

-- FULL OUTER JOIN: Include all users and all bookings, even unmatched/not linked

SELECT
  u.user_id,
  u.user_name,
  b.booking_id,
  b.start_date
FROM
  users u
FULL OUTER JOIN bookings b ON u.user_id = b.user_id;

-- Note: FULL OUTER JOIN may require UNION in MySQL
"""SELECT
  u.user_id,
  u.user_name,
  b.booking_id,
  b.start_date
FROM
  users u
LEFT JOIN bookings b ON u.user_id = b.user_id

UNION

SELECT
  u.user_id,
  u.user_name,
  b.booking_id,
  b.start_date
FROM
  users u
RIGHT JOIN bookings b ON u.user_id = b.user_id;"""





