# Airbnb Database Normalization

## 1. First Normal Form (1NF)
- **Atomic Values**: All columns contain single, indivisible values.
- **Primary Keys**: UUIDs ensure unique identification for all records.

## 2. Second Normal Form (2NF)
- **No Composite Keys**: Single-column UUID primary keys eliminate partial dependencies.

## 3. Third Normal Form (3NF)
- **Identified Transitive Dependencies**:
  1. **Booking.total_price**:  
     - Derived from `Property.pricepernight` and date difference (`Booking.end_date - start_date`).  
     - **Reason for Denormalization**: Required to preserve historical pricing data.  
  2. **Payment.amount**:  
     - Matches `Booking.total_price` for auditability.  

- **Design Justification**:  
  - **Business Requirements**: Historical accuracy and audit trails take precedence over strict normalization.  
  - **Performance**: Avoids recalculating prices during frequent queries.  


## Step-by-Step Normalization


### 1. User Table

- **1NF**: All fields contain atomic values 
- **2NF**: Primary key is `user_id`. No partial dependencies
- **3NF**: All non-key fields depend only on `user_id`. No transitive dependencies

### 2. Property Table

- **1NF**: No repeating fields, atomic values
- **2NF**: Primary key is `property_id`. `host_id` correctly references User 
- **3NF**: No transitive dependency (e.g., price and location directly relate to property)

### 3. Booking Table

- **1NF**: Atomic values only 
- **2NF**: Fully functionally dependent on `booking_id` 
- **3NF**: No non-key column depends on another non-key 

### 4. Payment Table

- **1NF**: Atomic fields  
- **2NF**: Fully dependent on `payment_id`  
- **3NF**: All attributes directly relate to primary key 


### 5. Review Table

- **1NF**: No repeating groups  
- **2NF**: Composite relation between `property_id` and `user_id` but we use `review_id` as primary   
- **3NF**: No transitive dependencies   


### 6. Message Table

- **1NF**: Atomic fields   
- **2NF**: Fully dependent on `message_id`   
- **3NF**: `sender_id`, `recipient_id`, and `message_body` all directly related to primary key   

## Final Schema Status  
The database design complies with 3NF except for intentional, justified denormalizations. 

➡️ Fully normalized.