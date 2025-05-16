-- Total number of bookings made by each user using COUNT and GROUP BY
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
  COUNT(*) AS total_bookings,
  RANK() OVER (ORDER BY COUNT(*) DESC) AS booking_rank
FROM
  bookings
GROUP BY
  property_id;