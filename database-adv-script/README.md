# Joins Documentation

#### Objective
Practice different types of SQL joins to combine data across the users, bookings, reviews, and properties tables.

#### INNER JOIN
- Retrieves only the rows where users and bookings match. 
- Useful for identifying all valid booking transactions and their owners.
- Fetches bookings with associated users.

#### LEFT JOIN
- Shows all properties, with or without reviews.
- Helps identify which properties haven't received feedback yet.
- Includes properties without reviews.

#### FULL OUTER JOIN 
- Combines both matched and unmatched rows between users and bookings.
- Helps spot users who have not made bookings and bookings that may not be linked to valid users.
- Combines `LEFT` and `RIGHT JOIN` via `UNION`.

