USE AutoWashDB_New;
GO

-- Demo data script.
-- Luu y:
-- - Chay AutoWashDB_New.sql truoc de tao database va table.
-- - File nay co IF NOT EXISTS, nen co the chay lai nhieu lan.

-- Demo loyalty tiers.
IF NOT EXISTS (SELECT 1 FROM LoyaltyTiers WHERE tier_name = 'Member')
BEGIN
    INSERT INTO LoyaltyTiers
    (tier_name, min_washes, min_spending, point_multiplier, discount_percent, booking_window_days, description)
    VALUES
    ('Member', 0, 0, 1.00, 0, 7, 'Basic member tier');
END
GO

IF NOT EXISTS (SELECT 1 FROM LoyaltyTiers WHERE tier_name = 'Silver')
BEGIN
    INSERT INTO LoyaltyTiers
    (tier_name, min_washes, min_spending, point_multiplier, discount_percent, booking_window_days, description)
    VALUES
    ('Silver', 5, 2000000, 1.10, 5, 10, '5 percent discount and 10 percent bonus points');
END
GO

IF NOT EXISTS (SELECT 1 FROM LoyaltyTiers WHERE tier_name = 'Gold')
BEGIN
    INSERT INTO LoyaltyTiers
    (tier_name, min_washes, min_spending, point_multiplier, discount_percent, booking_window_days, description)
    VALUES
    ('Gold', 15, 6000000, 1.20, 10, 12, '10 percent discount and 20 percent bonus points');
END
GO

IF NOT EXISTS (SELECT 1 FROM LoyaltyTiers WHERE tier_name = 'Platinum')
BEGIN
    INSERT INTO LoyaltyTiers
    (tier_name, min_washes, min_spending, point_multiplier, discount_percent, booking_window_days, description)
    VALUES
    ('Platinum', 30, 15000000, 1.30, 15, 14, '15 percent discount and 30 percent bonus points');
END
GO

-- Demo services.
IF NOT EXISTS (SELECT 1 FROM Services WHERE service_name = 'Basic Auto Wash')
BEGIN
    INSERT INTO Services
    (service_name, price, duration_minutes, status)
    VALUES
    ('Basic Auto Wash', 50000, 10, 1);
END
GO

IF NOT EXISTS (SELECT 1 FROM Services WHERE service_name = 'Pro Auto Wash')
BEGIN
    INSERT INTO Services
    (service_name, price, duration_minutes, status)
    VALUES
    ('Pro Auto Wash', 180000, 15, 1);
END
GO

-- Demo accounts.
-- Login demo:
-- admin@autowash.com / 123456
-- customer1@gmail.com / 123456
-- customer2@gmail.com / 123456
-- customer3@gmail.com / 123456
-- customer4@gmail.com / 123456
-- customer5@gmail.com / 123456
-- customer6@gmail.com / 123456

IF NOT EXISTS (SELECT 1 FROM Users WHERE email = 'admin@autowash.com')
BEGIN
    INSERT INTO Users (full_name, email, password, role, phone)
    VALUES ('System Admin', 'admin@autowash.com', '123456', 'ADMIN', '0900000000');
END
GO

IF NOT EXISTS (SELECT 1 FROM Users WHERE email = 'customer1@gmail.com')
BEGIN
    INSERT INTO Users (full_name, email, password, role, phone)
    VALUES ('Nguyen Van A', 'customer1@gmail.com', '123456', 'CUSTOMER', '0911111111');
END
GO

IF NOT EXISTS (SELECT 1 FROM Users WHERE email = 'customer2@gmail.com')
BEGIN
    INSERT INTO Users (full_name, email, password, role, phone)
    VALUES ('Tran Thi B', 'customer2@gmail.com', '123456', 'CUSTOMER', '0922222222');
END
GO

IF NOT EXISTS (SELECT 1 FROM Users WHERE email = 'customer3@gmail.com')
BEGIN
    INSERT INTO Users (full_name, email, password, role, phone)
    VALUES ('Le Van C', 'customer3@gmail.com', '123456', 'CUSTOMER', '0933333333');
END
GO

IF NOT EXISTS (SELECT 1 FROM Users WHERE email = 'customer4@gmail.com')
BEGIN
    INSERT INTO Users (full_name, email, password, role, phone)
    VALUES ('Pham Minh D', 'customer4@gmail.com', '123456', 'CUSTOMER', '0944444444');
END
GO

IF NOT EXISTS (SELECT 1 FROM Users WHERE email = 'customer5@gmail.com')
BEGIN
    INSERT INTO Users (full_name, email, password, role, phone)
    VALUES ('Hoang Demo E', 'customer5@gmail.com', '123456', 'CUSTOMER', '0955555555');
END
GO

IF NOT EXISTS (SELECT 1 FROM Users WHERE email = 'customer6@gmail.com')
BEGIN
    INSERT INTO Users (full_name, email, password, role, phone)
    VALUES ('Bui Demo F', 'customer6@gmail.com', '123456', 'CUSTOMER', '0966666666');
END
GO

-- Demo customer profiles.
-- Tao Customer dua theo email de tranh phu thuoc user_id co dinh.

DECLARE @memberTierId INT = (SELECT tier_id FROM LoyaltyTiers WHERE tier_name = 'Member');
DECLARE @silverTierId INT = (SELECT tier_id FROM LoyaltyTiers WHERE tier_name = 'Silver');
DECLARE @goldTierId INT = (SELECT tier_id FROM LoyaltyTiers WHERE tier_name = 'Gold');
DECLARE @platinumTierId INT = (SELECT tier_id FROM LoyaltyTiers WHERE tier_name = 'Platinum');

DECLARE @userId INT;

SET @userId = (SELECT user_id FROM Users WHERE email = 'customer1@gmail.com');
IF @userId IS NOT NULL AND NOT EXISTS (SELECT 1 FROM Customers WHERE user_id = @userId)
BEGIN
    INSERT INTO Customers (user_id, tier_id, points, total_washes, total_spending)
    VALUES (@userId, @memberTierId, 0, 0, 0);
END

SET @userId = (SELECT user_id FROM Users WHERE email = 'customer2@gmail.com');
IF @userId IS NOT NULL AND NOT EXISTS (SELECT 1 FROM Customers WHERE user_id = @userId)
BEGIN
    INSERT INTO Customers (user_id, tier_id, points, total_washes, total_spending)
    VALUES (@userId, @silverTierId, 250, 6, 2500000);
END

SET @userId = (SELECT user_id FROM Users WHERE email = 'customer3@gmail.com');
IF @userId IS NOT NULL AND NOT EXISTS (SELECT 1 FROM Customers WHERE user_id = @userId)
BEGIN
    INSERT INTO Customers (user_id, tier_id, points, total_washes, total_spending)
    VALUES (@userId, @goldTierId, 900, 18, 7200000);
END

SET @userId = (SELECT user_id FROM Users WHERE email = 'customer4@gmail.com');
IF @userId IS NOT NULL AND NOT EXISTS (SELECT 1 FROM Customers WHERE user_id = @userId)
BEGIN
    INSERT INTO Customers (user_id, tier_id, points, total_washes, total_spending)
    VALUES (@userId, @platinumTierId, 1800, 35, 16000000);
END

SET @userId = (SELECT user_id FROM Users WHERE email = 'customer5@gmail.com');
IF @userId IS NOT NULL AND NOT EXISTS (SELECT 1 FROM Customers WHERE user_id = @userId)
BEGIN
    INSERT INTO Customers (user_id, tier_id, points, total_washes, total_spending)
    VALUES (@userId, @memberTierId, 80, 2, 350000);
END

SET @userId = (SELECT user_id FROM Users WHERE email = 'customer6@gmail.com');
IF @userId IS NOT NULL AND NOT EXISTS (SELECT 1 FROM Customers WHERE user_id = @userId)
BEGIN
    INSERT INTO Customers (user_id, tier_id, points, total_washes, total_spending)
    VALUES (@userId, @silverTierId, 420, 8, 3200000);
END
GO

-- Demo vehicles.
-- Lay customer_id theo email de tranh sai ID neu database da co data cu.

DECLARE @customerId INT;

SET @customerId = (
    SELECT c.customer_id
    FROM Customers c
    JOIN Users u ON c.user_id = u.user_id
    WHERE u.email = 'customer1@gmail.com'
);
IF @customerId IS NOT NULL AND NOT EXISTS (SELECT 1 FROM Vehicles WHERE license_plate = '51A-12345')
BEGIN
    INSERT INTO Vehicles (customer_id, model, brand, color, license_plate)
    VALUES (@customerId, 'Vios', 'Toyota', 'White', '51A-12345');
END

SET @customerId = (
    SELECT c.customer_id
    FROM Customers c
    JOIN Users u ON c.user_id = u.user_id
    WHERE u.email = 'customer2@gmail.com'
);
IF @customerId IS NOT NULL AND NOT EXISTS (SELECT 1 FROM Vehicles WHERE license_plate = '51B-22222')
BEGIN
    INSERT INTO Vehicles (customer_id, model, brand, color, license_plate)
    VALUES (@customerId, 'City', 'Honda', 'Black', '51B-22222');
END

SET @customerId = (
    SELECT c.customer_id
    FROM Customers c
    JOIN Users u ON c.user_id = u.user_id
    WHERE u.email = 'customer3@gmail.com'
);
IF @customerId IS NOT NULL AND NOT EXISTS (SELECT 1 FROM Vehicles WHERE license_plate = '51C-33333')
BEGIN
    INSERT INTO Vehicles (customer_id, model, brand, color, license_plate)
    VALUES (@customerId, 'CX-5', 'Mazda', 'Red', '51C-33333');
END

SET @customerId = (
    SELECT c.customer_id
    FROM Customers c
    JOIN Users u ON c.user_id = u.user_id
    WHERE u.email = 'customer4@gmail.com'
);
IF @customerId IS NOT NULL AND NOT EXISTS (SELECT 1 FROM Vehicles WHERE license_plate = '51D-44444')
BEGIN
    INSERT INTO Vehicles (customer_id, model, brand, color, license_plate)
    VALUES (@customerId, 'Ranger', 'Ford', 'Blue', '51D-44444');
END

IF @customerId IS NOT NULL AND NOT EXISTS (SELECT 1 FROM Vehicles WHERE license_plate = '51E-55555')
BEGIN
    INSERT INTO Vehicles (customer_id, model, brand, color, license_plate)
    VALUES (@customerId, 'Seltos', 'Kia', 'Gray', '51E-55555');
END

SET @customerId = (
    SELECT c.customer_id
    FROM Customers c
    JOIN Users u ON c.user_id = u.user_id
    WHERE u.email = 'customer5@gmail.com'
);
IF @customerId IS NOT NULL AND NOT EXISTS (SELECT 1 FROM Vehicles WHERE license_plate = '51F-66666')
BEGIN
    INSERT INTO Vehicles (customer_id, model, brand, color, license_plate)
    VALUES (@customerId, 'Accent', 'Hyundai', 'Silver', '51F-66666');
END

SET @customerId = (
    SELECT c.customer_id
    FROM Customers c
    JOIN Users u ON c.user_id = u.user_id
    WHERE u.email = 'customer6@gmail.com'
);
IF @customerId IS NOT NULL AND NOT EXISTS (SELECT 1 FROM Vehicles WHERE license_plate = '51G-77777')
BEGIN
    INSERT INTO Vehicles (customer_id, model, brand, color, license_plate)
    VALUES (@customerId, 'Civic', 'Honda', 'White', '51G-77777');
END
GO

-- Demo promotion for admin screen later.
IF NOT EXISTS (SELECT 1 FROM Promotions WHERE promotion_name = 'Gold Weekend Discount')
BEGIN
    INSERT INTO Promotions
    (promotion_name, description, discount_percent, target_tier_id, start_date, end_date, status)
    VALUES
    ('Gold Weekend Discount', 'Weekend discount for Gold customers',
     12, (SELECT tier_id FROM LoyaltyTiers WHERE tier_name = 'Gold'),
     '2026-01-01', '2026-12-31', 1);
END
GO
