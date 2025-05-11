# Airbnb Database Schema Documentation

## Schema Design

### Tables Overview
1. **users**: Stores user accounts (guests, hosts, admins).
2. **properties**: Contains property listings with pricing and location.
3. **bookings**: Manages reservations with status tracking.
4. **payments**: Records financial transactions for bookings.
5. **reviews**: Stores guest feedback and ratings.
6. **messages**: Handles user-to-user communication.

### Key Features
- **UUID Primary Keys**: All tables use UUIDs for secure, non-sequential identifiers.
- **Referential Integrity**: Foreign keys enforce relationships between tables.
- **Constraints**:
  - `CHECK` constraints validate ENUM values (e.g., `role`, `status`).
  - `NOT NULL` ensures required fields are populated.
- **Automatic Timestamps**: `created_at` and `updated_at` track record timelines.

## Indexing Strategy
| Index Name              | Table     | Column(s)       | Purpose                              |
|-------------------------|-----------|-----------------|--------------------------------------|
| idx_user_email          | users     | email           | Fast login/authentication            |
| idx_property_host       | properties| host_id         | Quick access to host's listings      |
| idx_booking_property    | bookings  | property_id     | Speed up property-related queries    |
| idx_payment_booking     | payments  | booking_id      | Link payments to bookings efficiently|
| idx_review_property     | reviews   | property_id     | Aggregate property ratings quickly   |

## Design Decisions
1. **Denormalized Fields**:
   - `bookings.total_price`: Stored for historical accuracy (price changes over time).
   - `payments.amount`: Redundant copy of `total_price` for auditability.

2. **UUID Benefits**:
   - Obfuscates sequential IDs for security.
   - Works in distributed systems.

3. **ENUM Handling**:
   - Used `CHECK` constraints instead of SQL ENUM type for portability.

4. **Indexing**:
   - Foreign keys and frequently queried columns are indexed.
   - No over-indexing to balance write performance.
