### Partitioning Performance

#### Objective
Partitioning Large Tables

- Implement table partitioning on the `bookings` table to improve performance for large datasets, specifically for queries filtering by date.

### What is Partitioning?
Partitioning is a database optimization technique where a large table is divided into smaller, more manageable pieces called partitions. Each partition can be queried independently, allowing the database engine to skip irrelevant data and improve query efficiency.

### Implementation Process

1. **Problem Context**
   - The `bookings` table contains a large volume of data.
   - Queries filtering bookings by `start_date` were slow due to full table scans.

2. **Partitioning Strategy Chosen**
   - **Range Partitioning** based on `YEAR(start_date)`.
   - This approach splits data into partitions by year, allowing efficient filtering and retrieval.

3. **Partition Table Creation**
   - A new table `bookings_partitioned` was created using `PARTITION BY RANGE`.
   - Example:
     ```sql
     PARTITION BY RANGE (YEAR(start_date)) (
       PARTITION p2022 VALUES LESS THAN (2023),
       PARTITION p2023 VALUES LESS THAN (2024),
       PARTITION p2024 VALUES LESS THAN (2025),
       PARTITION pmax VALUES LESS THAN MAXVALUE
     );
     ```

4. **Data Migration** (Optional)
   - Existing data can be copied using:
     ```sql
     INSERT INTO bookings_partitioned SELECT * FROM bookings;
     ```

5. **Testing Query Performance**
   - Query used to validate performance:
     ```sql
     EXPLAIN ANALYZE SELECT *
     FROM bookings_partitioned
     WHERE start_date BETWEEN '2023-01-01' AND '2023-12-31';
     ```
   - The engine only scanned the relevant partition (`p2023`).

6. **Benefits**
   - Significantly reduced I/O for date-based queries.
   - Lower query execution time and better index utilization.
   - Scales better for future data growth.
