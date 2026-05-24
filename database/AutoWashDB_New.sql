CREATE DATABASE AutoWashDB_New;
GO

USE AutoWashDB_New;
GO

CREATE TABLE Users (
    user_id INT IDENTITY(1,1) PRIMARY KEY,
    full_name NVARCHAR(100) NOT NULL,
    email NVARCHAR(100) NOT NULL UNIQUE,
    password NVARCHAR(255) NOT NULL,
    role NVARCHAR(20) NOT NULL CHECK (role IN ('ADMIN', 'CUSTOMER')),
    phone NVARCHAR(20),
    status BIT NOT NULL DEFAULT 1,
    created_at DATETIME NOT NULL DEFAULT GETDATE()
);

CREATE TABLE LoyaltyTiers (
    tier_id INT IDENTITY(1,1) PRIMARY KEY,
    tier_name NVARCHAR(50) NOT NULL UNIQUE,
    min_washes INT NOT NULL DEFAULT 0,
    min_spending DECIMAL(18,2) NOT NULL DEFAULT 0,
    point_multiplier DECIMAL(4,2) NOT NULL DEFAULT 1.00,
    discount_percent INT NOT NULL DEFAULT 0,
    booking_window_days INT NOT NULL DEFAULT 7,
    description NVARCHAR(255)
);

CREATE TABLE Customers (
    customer_id INT IDENTITY(1,1) PRIMARY KEY,
    user_id INT NOT NULL UNIQUE,
    tier_id INT NOT NULL,
    points INT NOT NULL DEFAULT 0,
    total_washes INT NOT NULL DEFAULT 0,
    total_spending DECIMAL(18,2) NOT NULL DEFAULT 0,
    created_at DATETIME NOT NULL DEFAULT GETDATE(),

    CONSTRAINT FK_Customers_Users
        FOREIGN KEY (user_id) REFERENCES Users(user_id),

    CONSTRAINT FK_Customers_LoyaltyTiers
        FOREIGN KEY (tier_id) REFERENCES LoyaltyTiers(tier_id)
);

CREATE TABLE Vehicles (
    vehicle_id INT IDENTITY(1,1) PRIMARY KEY,
    customer_id INT NOT NULL,
    model NVARCHAR(50),
    brand NVARCHAR(50),
    color NVARCHAR(30),
    license_plate NVARCHAR(20) NOT NULL UNIQUE,

    CONSTRAINT FK_Vehicles_Customers
        FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE Services (
    service_id INT IDENTITY(1,1) PRIMARY KEY,
    service_name NVARCHAR(100) NOT NULL UNIQUE,
    price DECIMAL(18,2) NOT NULL,
    duration_minutes INT NOT NULL,
    status BIT NOT NULL DEFAULT 1
);

CREATE TABLE Bookings (
    booking_id INT IDENTITY(1,1) PRIMARY KEY,
    customer_id INT NOT NULL,
    vehicle_id INT NOT NULL,
    service_id INT NOT NULL,
    booking_time DATETIME NOT NULL,
    status NVARCHAR(20) NOT NULL DEFAULT 'PENDING'
        CHECK (status IN ('PENDING', 'CONFIRMED', 'CANCELLED', 'COMPLETED')),

    original_price DECIMAL(18,2) NOT NULL,
    discount_percent INT NOT NULL DEFAULT 0,
    discount_amount DECIMAL(18,2) NOT NULL DEFAULT 0,
    final_price DECIMAL(18,2) NOT NULL,

    note NVARCHAR(255),
    created_at DATETIME NOT NULL DEFAULT GETDATE(),

    CONSTRAINT FK_Bookings_Customers
        FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),

    CONSTRAINT FK_Bookings_Vehicles
        FOREIGN KEY (vehicle_id) REFERENCES Vehicles(vehicle_id),

    CONSTRAINT FK_Bookings_Services
        FOREIGN KEY (service_id) REFERENCES Services(service_id)
);

CREATE TABLE WashHistory (
    wash_id INT IDENTITY(1,1) PRIMARY KEY,
    booking_id INT NOT NULL UNIQUE,
    customer_id INT NOT NULL,
    vehicle_id INT NOT NULL,
    service_id INT NOT NULL,
    wash_date DATETIME NOT NULL DEFAULT GETDATE(),

    original_price DECIMAL(18,2) NOT NULL,
    discount_percent INT NOT NULL DEFAULT 0,
    discount_amount DECIMAL(18,2) NOT NULL DEFAULT 0,
    final_price DECIMAL(18,2) NOT NULL,

    points_earned INT NOT NULL DEFAULT 0,

    CONSTRAINT FK_WashHistory_Bookings
        FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id),

    CONSTRAINT FK_WashHistory_Customers
        FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),

    CONSTRAINT FK_WashHistory_Vehicles
        FOREIGN KEY (vehicle_id) REFERENCES Vehicles(vehicle_id),

    CONSTRAINT FK_WashHistory_Services
        FOREIGN KEY (service_id) REFERENCES Services(service_id)
);

CREATE TABLE PointTransactions (
    transaction_id INT IDENTITY(1,1) PRIMARY KEY,
    customer_id INT NOT NULL,
    type NVARCHAR(20) NOT NULL CHECK (type IN ('EARN', 'EXPIRE', 'ADJUST')),
    points INT NOT NULL,
    description NVARCHAR(255),
    created_at DATETIME NOT NULL DEFAULT GETDATE(),
    expired_at DATETIME NULL,

    CONSTRAINT FK_PointTransactions_Customers
        FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE Promotions (
    promotion_id INT IDENTITY(1,1) PRIMARY KEY,
    promotion_name NVARCHAR(100) NOT NULL,
    description NVARCHAR(255),
    discount_percent INT NOT NULL,
    target_tier_id INT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status BIT NOT NULL DEFAULT 1,

    CONSTRAINT FK_Promotions_LoyaltyTiers
        FOREIGN KEY (target_tier_id) REFERENCES LoyaltyTiers(tier_id)
);

