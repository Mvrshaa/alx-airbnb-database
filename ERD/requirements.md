# ER Diagram Requirements

This ERD visualizes the core entities and relationships for an Airbnb-style platform. It includes the following entities:

## Entities and Attributes

### 1. **User**
Stores account information for hosts, guests, and administrators.
- **Attributes**:
  - `user_id` (UUID, PK)
  - `first_name` (VARCHAR(50), NOT NULL
  - `last_name` (VARCHAR(50), NOT NULL
  - `email` (VARCHAR(100), UNIQUE, NOT NULL
  - `password_hash` (VARCHAR(255)), NOT NULL
  - `phone_number` (VARCHAR(20)), NULL
  - `role` (ENUM: guest/host/admin), NOT NULL
  - `created_at` (TIMESTAMP), DEFAULT CURRENT_TIMESTAMP

### 2. **Property**
Contains listing details created by hosts.
- **Attributes**:
  - `property_id` (UUID, PK)
  - `host_id` (UUID, FK → User), NOT NULL
  - `name` (VARCHAR(100)), NOT NULL
  - `description` (TEXT)), NOT NULL
  - `location` (VARCHAR(255)), NOT NULL
  - `pricepernight` (DECIMAL(10,2)), NOT NULL
  - `created_at` (TIMESTAMP), DEFAULT CURRENT_TIMESTAMP
  - `updated_at` (TIMESTAMP), ON UPDATE CURRENT_TIMESTAMP

### 3. **Booking**
Manages reservation lifecycle and financial calculations.
- **Attributes**:
  - `booking_id` (UUID, PK)
  - `property_id` (UUID, FK → Property), NOT NULL
  - `user_id` (UUID, FK → User), NOT NULL
  - `start_date` (DATE)), NOT NULL
  - `end_date` (DATE)), NOT NULL
  - `total_price` (DECIMAL(10,2)), NOT NULL
  - `status` (ENUM: pending/confirmed/canceled)), NOT NULL
  - `created_at` (TIMESTAMP), DEFAULT CURRENT_TIMESTAMP

### 4. **Payment**
Tracks financial transactions.
- **Attributes**:
  - `payment_id` (UUID, PK)
  - `booking_id` (UUID, FK → Booking), NOT NULL
  - `amount` (DECIMAL(10,2)), NOT NULL
  - `payment_method` (ENUM: credit_card/paypal/stripe)), NOT NULL
  - `payment_date` (TIMESTAMP), DEFAULT CURRENT_TIMESTAMP

### 5. **Review**
Stores guest feedback and ratings.
- **Attributes**:
  - `review_id` (UUID, PK)
  - `property_id` (UUID, FK → Property), NOT NULL
  - `user_id` (UUID, FK → User), NOT NULL
  - `rating` (INTEGER, CHECK: 1-5), NOT NULL
  - `comment` (TEXT)), NOT NULL
  - `created_at` (TIMESTAMP), DEFAULT CURRENT_TIMESTAMP

### 6. **Message**
Handles user-to-user communication.
- **Attributes**:
  - `message_id` (UUID, PK)
  - `sender_id` (UUID, FK → User), NOT NULL
  - `recipient_id` (UUID, FK → User), NOT NULL
  - `message_body` (TEXT)), NOT NULL
  - `sent_at` (TIMESTAMP), DEFAULT CURRENT_TIMESTAMP

## Relationships

### 1. **Core Relationships**
| Relationship                | Type    | Description                                |
|-----------------------------|---------|--------------------------------------------|
| User → Property             | 1:M     | A host can list multiple properties       |
| User → Booking              | 1:M     | A guest can make multiple bookings         |
| Property → Booking          | 1:M     | A property can have multiple bookings      |
| Booking → Payment           | 1:1     | Each booking has one payment record        |
| Property → Review           | 1:M     | A property can receive multiple reviews    |
| User → Review               | 1:M     | A user can write multiple reviews         |
| User ↔ Message ↔ User       | M:M     | Users exchange messages via junction table|

### 2. **Visual Notation**

![Entity-Relationship Diagram](ERD/airbnb_erd.png)
 
## Design Decisions

## Design Decisions

### 1. **Primary Keys**
- **UUIDs** instead of sequential IDs:
  - Prevents ID guessing attacks
  - Works in distributed systems

### 2. **Constraints**
- **ENUM Validation**:
  - `role`: Restricts to valid user types
  - `status`: Ensures booking lifecycle integrity
- **Temporal Columns**:
  - `created_at`: Audit trail for record creation
  - `updated_at`: Tracks price/location changes in properties

### 3. **Denormalization**
- **Booking.total_price**:
  - Stored despite being derivable from `pricepernight * nights`
  - Ensures historical accuracy if prices change later

### 4. **Indexing Strategy**
| Indexed Column       | Purpose                                  |
|----------------------|------------------------------------------|
| `users.email`        | Fast login/authentication                |
| `properties.host_id` | Quick access to host's listings          |
| `bookings.status`    | Efficient filtering of active reservations |

## Constraints
1. **Referential Integrity**
   - All foreign keys use `ON DELETE CASCADE`
   - Example: Deleting a user removes their properties and bookings

2. **Data Validation**
   - `CHECK (end_date > start_date)` in bookings
   - `CHECK (rating BETWEEN 1 AND 5)` in reviews

3. **Uniqueness**
   - `email` enforced as UNIQUE in users
   - `booking_id` enforced as UNIQUE in payments

## ER Diagram Instructions
1. **Tool**: Draw.io/Lucidchart
2. **File Formats**:
   - Source: `Lucidchart`
   - Export: `airbnb_erd.png`

