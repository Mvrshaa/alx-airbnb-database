-- Partition bookings table by year of start_date
CREATE TABLE bookings_partitioned (
  id INT,
  user_id INT,
  property_id INT,
  start_date DATE,
  end_date DATE,
  INDEX(start_date)
)
PARTITION BY RANGE (YEAR(start_date)) (
  PARTITION p2022 VALUES LESS THAN (2023),
  PARTITION p2023 VALUES LESS THAN (2024),
  PARTITION p2024 VALUES LESS THAN (2025),
  PARTITION pmax VALUES LESS THAN MAXVALUE
);

-- Example query to test performance
EXPLAIN ANALYZE SELECT * FROM bookings_partitioned WHERE start_date BETWEEN '2023-01-01' AND '2023-12-31';