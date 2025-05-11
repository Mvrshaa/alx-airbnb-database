# Airbnb Database Seeding Documentation

The directory contains SQL scripts to populate the Airbnb-like database with realistic sample data. The dataset simulates real-world scenarios, including user registrations, property listings, bookings, payments, reviews, and guest-host communication.

## Purpose

These scripts help populate the development or testing of the database with:
- Sample users (guests, hosts, admins)
- Properties in different locations
- Bookings with real-world dates and pricing
- Payments
- Reviews
- Messages exchanged between users

## Entities & Examples

| Entity        | Records | Key Details                                  |
|---------------|---------|----------------------------------------------|
| **Users**     | 3       | Guest, Host, Admin roles                     |
| **Properties**| 2       | Coastal and mountain getaways                |
| **Bookings**  | 2       | Confirmed + pending statuses                 |
| **Payments**  | 2       | Credit Card + PayPal methods                 |
| **Reviews**   | 2       | 5-star and 4-star ratings                    |
| **Messages**  | 2       | Check-in coordination                        |


## Key Features

### 1. **South African Context**
- **Locations**: 
  - Clifton, Cape Town (Coastal property)
  - Champagne Valley, KZN (Mountain retreat)
- **Phone Numbers**: Valid SA formats (`+27 72 XXX XXXX`)
- **User Names**: Authentic SA names (Thandi, Sipho, Naledi)

### 2. **Booking Scenarios**
- **Confirmed Booking**: 
  - 5 nights @ R1,450/night = R7,250 total
  - Credit Card payment
- **Pending Booking**:
  - 5 nights @ R980/night = R4,900 total
  - PayPal payment

### 3. **Relationship Integrity**
```sql
-- Guest Thandi owns all bookings/reviews
user_id: d5f1c22e-a111-4a4a-8c55-1c2a5bb3f1ee

-- Host Sipho manages both properties 
host_id: f3b9d4a7-bb77-4c92-9a76-998f4a5beea2
