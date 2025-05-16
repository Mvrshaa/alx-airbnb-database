-- Total number of bookings made by each user
SELECT
  user_id,
  COUNT(*) AS total_bookings
FROM
  bookings
GROUP BY
  user_id;

-- Rank properties based on the number of bookings they received
SELECT
  property_id,
  COUNT(*) AS booking_count,
  RANK() OVER (ORDER BY COUNT(*) DESC) AS property_rank
FROM
  bookings
GROUP BY
  property_id;