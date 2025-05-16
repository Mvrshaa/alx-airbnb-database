
### 3. Implement Indexes for Optimization

Create indexes on high-usage columns across major tables to improve query performance and reduce full-table scans.

### **1. Identify High-Usage Columns**
- Identify high-usage columns in the User, Booking, and Property tables.

| Table      | Columns to Index          | Usage Context                     |
|------------|---------------------------|-----------------------------------|
| `users`    | `email`, `created_at`     | Login (`WHERE`), analytics (`ORDER BY`) |
| `bookings` | `user_id`, `property_id`, `start_date` | Joins, date-range queries |
| `properties` | `host_id`, `location`   | Host dashboards, search filters |


**Users Table:**
- `email`: commonly queried for authentication.
- `created_at`: useful for sorting/filtering recent users.

**Bookings Table:**
- `user_id`: joins with `users` table.
- `property_id`: joins and property-based aggregation.
- `start_date`: range queries on bookings.

**Properties Table:**
- `host_id`: used in owner-specific dashboards.
- `location`: filters and search features.


### **2. Create Indexes for the columns.**
- create the indexes to optimize query performance.

```sql
-- Users table indexes
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_users_created_at ON users(created_at);

-- Bookings table indexes
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_bookings_start_date ON bookings(start_date);

-- Properties table indexes
CREATE INDEX idx_properties_host_id ON properties(host_id);
CREATE INDEX idx_properties_location ON properties(location);
```

### **3. Performance Measurement**

- Measure the query performance before and after adding indexes using EXPLAIN or ANALYZE

#### Performance Before Indexing
- Full table scans occurred on all filters and joins.
- Queries on `email`, `start_date`, `location` were slow.

#### After Indexing
- `EXPLAIN ANALYZE` shows index usage (for measuring execution plans).
- Faster lookups for `users.email`, `bookings.start_date`, etc.
- Join and filter performance greatly improved.

#### **Test Query 1: User Login**
```sql
-- Before index
EXPLAIN ANALYZE SELECT * FROM users WHERE email = 'guest@example.com';

-- After index
EXPLAIN ANALYZE SELECT * FROM users WHERE email = 'guest@example.com';
```

#### **Test Query 2: Date-Range Bookings**
```sql
-- Before index
EXPLAIN ANALYZE 
SELECT * FROM bookings 
WHERE start_date BETWEEN '2024-01-01' AND '2024-12-31';

-- After index
EXPLAIN ANALYZE 
SELECT * FROM bookings 
WHERE start_date BETWEEN '2024-01-01' AND '2024-12-31';
```




