USE AutoWashDB_New;
GO

INSERT INTO LoyaltyTiers
(tier_name, min_washes, min_spending, point_multiplier, discount_percent, booking_window_days, description)
VALUES
('Member', 0, 0, 1.00, 0, 7, 'Hạng thành viên cơ bản'),
('Silver', 5, 2000000, 1.10, 5, 10, 'Giảm 5%, cộng thêm 10% điểm'),
('Gold', 15, 6000000, 1.20, 10, 12, 'Giảm 10%, cộng thêm 20% điểm'),
('Platinum', 30, 15000000, 1.30, 15, 14, 'Giảm 15%, cộng thêm 30% điểm');

INSERT INTO Services
(service_name, price, duration_minutes, status)
VALUES
('Basic Auto Wash', 50000, 10, 1),
('Pro Auto Wash', 180000, 15, 1);

INSERT INTO Users
(full_name, email, password, role, phone)
VALUES
('System Admin', 'admin@autowash.com', '123456', 'ADMIN', '0900000000'),
('Nguyen Van A', 'customer1@gmail.com', '123456', 'CUSTOMER', '0911111111');

INSERT INTO Customers
(user_id, tier_id, points, total_washes, total_spending)
VALUES
(2, 1, 0, 0, 0);

INSERT INTO Vehicles
(customer_id, model, brand, color, license_plate)
VALUES
(1, 'Vios', 'Toyota', 'White', '51A-12345');

INSERT INTO Promotions
(promotion_name, description, discount_percent, target_tier_id, start_date, end_date, status)
VALUES
('Gold Weekend Discount', 'Ưu đãi cuối tuần cho khách Gold', 12, 3, '2026-01-01', '2026-12-31', 1);