-- Insert Sample Users

-- Insert Users (Guest, Host, Admin)
INSERT INTO "User" (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES 
  ('d5f1c22e-a111-4a4a-8c55-1c2a5bb3f1ee', 'Thandi', 'Nkosi', 'thandi@hashnode.dev', 'hashed_pw1', '+27 72 123 4567', 'guest'),
  ('f3b9d4a7-bb77-4c92-9a76-998f4a5beea2', 'Sipho', 'Mokoena', 'sipho@codesandbox.io', 'hashed_pw2', '+27 78 987 6543', 'host'),
  ('c18ac5c3-00b5-4e0c-8d5a-129c6d9f9b5b', 'Naledi', 'Mthembu', 'naledi@admin.co.za', 'hashed_pw3', '+27 76 345 6789', 'admin');

-- Insert Properties
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight)
VALUES
  ('86a41e0c-4662-4c30-b6d4-3eac25c2f13e', 'f3b9d4a7-bb77-4c92-9a76-998f4a5beea2',
   'Seaside Escape', 
   'Modern 2-bedroom apartment with ocean views in Clifton. Wi-Fi, Netflix, and pool access included.', 
   'Clifton, Cape Town', 1450.00),

  ('97bd5f9d-9c1d-4c5e-a6a5-4e6e9b67920a', 'f3b9d4a7-bb77-4c92-9a76-998f4a5beea2',
   'Drakensberg Cabin Retreat', 
   'Rustic log cabin perfect for hikers and nature lovers. Fire pit, mountain views, and quiet trails.', 
   'Champagne Valley, KZN', 980.00);

-- Insert Bookings
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
  ('c3f7a1f0-7e1a-4c70-9f1e-bfdc453fe22c', '86a41e0c-4662-4c30-b6d4-3eac25c2f13e', 'd5f1c22e-a111-4a4a-8c55-1c2a5bb3f1ee',
   '2025-04-20', '2025-04-25', 7250.00, 'confirmed'),

  ('a79e4c29-4a50-4988-9c6c-bef3ccf0fc6e', '97bd5f9d-9c1d-4c5e-a6a5-4e6e9b67920a', 'd5f1c22e-a111-4a4a-8c55-1c2a5bb3f1ee',
   '2025-05-05', '2025-05-10', 4900.00, 'pending');

-- Insert Payments
INSERT INTO Payment (payment_id, booking_id, amount, payment_method)
VALUES
  ('ee938d98-e137-42a7-9431-9ea0d9028a21', 'c3f7a1f0-7e1a-4c70-9f1e-bfdc453fe22c', 7250.00, 'credit_card'),
  ('d8b83956-49c6-4ef2-924b-c8cfb34f5bb0', 'a79e4c29-4a50-4988-9c6c-bef3ccf0fc6e', 4900.00, 'paypal');

-- Insert Reviews
INSERT INTO Review (review_id, property_id, user_id, rating, comment)
VALUES
  ('b1b5d04e-f6d5-42e7-b1be-9468dc7e4c51', '86a41e0c-4662-4c30-b6d4-3eac25c2f13e', 'd5f1c22e-a111-4a4a-8c55-1c2a5bb3f1ee',
   5, 'Absolutely loved the view and the peaceful vibe! Will definitely return.'),

  ('c7e5ed20-0881-4c3f-bb73-e8c9f71894cf', '97bd5f9d-9c1d-4c5e-a6a5-4e6e9b67920a', 'd5f1c22e-a111-4a4a-8c55-1c2a5bb3f1ee',
   4, 'Cozy and quiet. Great for a weekend away. Could use better bedding.');

-- Insert Messages
INSERT INTO Message (message_id, sender_id, recipient_id, message_body)
VALUES
  ('f78b6f6f-0f6d-4e9e-a74e-26f78f5cbe21', 'd5f1c22e-a111-4a4a-8c55-1c2a5bb3f1ee', 'f3b9d4a7-bb77-4c92-9a76-998f4a5beea2',
   'Hi Sipho! Just checking if early check-in is possible?'),

  ('dc654e4c-8a48-4e9d-b07d-c9dfe2c3e5b7', 'f3b9d4a7-bb77-4c92-9a76-998f4a5beea2', 'd5f1c22e-a111-4a4a-8c55-1c2a5bb3f1ee',
   'Hey Thandi! Yes, early check-in from 12 PM is no problem at all.');
