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
    RANK() OVER (ORDER BY COUNT(*) DESC) AS property_rank,
    ROW_NUMBER() OVER (ORDER BY COUNT(*) DESC) AS row_num
FROM
    bookings
GROUP BY
    property_id;
ORDER BY
    property_rank;