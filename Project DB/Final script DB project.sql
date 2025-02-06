CREATE DATABASE app_store;

USE app_store;

CREATE TABLE Developers (
    DeveloperID INT AUTO_INCREMENT PRIMARY KEY ,
    Name VARCHAR(255) NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL,
    Country VARCHAR(100),
    JoinDate DATE NOT NULL
);

CREATE TABLE Apps (
    AppID INT AUTO_INCREMENT PRIMARY KEY,
    DeveloperID INT,
    Name VARCHAR(255) NOT NULL,
    Category VARCHAR(100),
    Price DECIMAL(10, 2) NOT NULL,
    ReleaseDate DATE NOT NULL,
    Rating DECIMAL(3, 2),
    Downloads INT NOT NULL,
    FOREIGN KEY (DeveloperID) REFERENCES Developers(DeveloperID)
);

CREATE TABLE Users (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL,
    DeviceType VARCHAR(100),
    Country VARCHAR(100),
    RegistrationDate DATE NOT NULL
);

CREATE TABLE Reviews (
    ReviewID INT AUTO_INCREMENT PRIMARY KEY,
    AppID INT,
    UserID INT,
    Rating INT CHECK (Rating BETWEEN 1 AND 5),
    Comment TEXT,
    ReviewDate DATE NOT NULL,
    FOREIGN KEY (AppID) REFERENCES Apps(AppID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

CREATE TABLE Purchases (
    PurchaseID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT,
    AppID INT,
    PurchaseDate DATE NOT NULL,
    Amount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (AppID) REFERENCES Apps(AppID)
);

INSERT INTO Developers (Name, Email, Country, JoinDate) VALUES
('Ali Raza', 'ali.raza@example.com', 'Pakistan', '2023-05-01'),  
('Arham Khattak', 'arham.khattak@example.com', 'Pakistan', '2023-06-15'),  
('Chen Wei', 'chen.wei@example.com', 'China', '2023-07-20'),  
('Daniel Smith', 'daniel.smith@example.com', 'UK', '2023-08-30'),  
('Aisha Khan', 'aisha.khan@example.com', 'Pakistan', '2023-09-10'),  
('Fatima Malik', 'fatima.malik@example.com', 'Pakistan', '2023-10-05'),  
('Mohsin Javed', 'mohsin.javed@example.com', 'Pakistan', '2023-11-12'),  
('Takumi Sato', 'takumi.sato@example.com', 'Japan', '2023-12-01'),  
('Isabella Conti', 'isabella.conti@example.com', 'Italy', '2024-01-15'),  
('Ahmed Hassan', 'ahmed.hassan@example.com', 'Egypt', '2024-02-05'),  
('Sophia Turner', 'sophia.turner@example.com', 'Australia', '2024-03-10'),  
('Diego Ramirez', 'diego.ramirez@example.com', 'Mexico', '2024-04-20');

INSERT INTO Apps (DeveloperID, Name, Category, Price, ReleaseDate, Rating, Downloads) VALUES
(1, 'Apple Health', 'Fitness', 4.99, '2023-06-01', 4.5, 10000),
(2, 'Extreme Racing', 'Games', 0.00, '2023-06-20', 4.8, 500000),
(3, 'Snapchat', 'Photography', 2.99, '2023-07-15', 4.3, 75000),
(4, 'Easypaisa', 'Finance', 0.00, '2023-08-10', 4.7, 120000),
(5, 'Instagram', 'Social', 3.99, '2023-09-01', 4.6, 2000000);

INSERT INTO Users (Name, Email, DeviceType, Country, RegistrationDate) VALUES
('Michael Brown', 'michael.brown@example.com', 'Android', 'USA', '2023-01-05'),
('Sarah Johnson', 'sarah.johnson@example.com', 'iPhone', 'UK', '2023-02-20'),
('Ahmed Ali', 'ahmed.ali@example.com', 'Android', 'Pakistan', '2023-03-15'),
('Emily Davis', 'emily.davis@example.com', 'Tablet', 'Australia', '2023-04-25'),
('James Wilson', 'james.wilson@example.com', 'iPad', 'Canada', '2023-06-10');



INSERT INTO Reviews (AppID, UserID, Rating, Comment, ReviewDate) VALUES
(1, 1, 5, 'Great Health app!', '2023-06-10'),
(2, 2, 4, 'Very entertaining game.', '2023-06-22'),
(3, 3, 3, 'Needs more features.', '2023-07-18'),
(4, 4, 5, 'Helps throughout the day in transactions.', '2023-08-15'),
(5, 5, 4, 'Helpful for contacting friends.', '2023-09-20'),
(1, 3, 4, 'Accurate and useful.', '2023-07-25'),
(2, 4, 5, 'Addictive gameplay!', '2023-08-01'),
(3, 5, 2, 'Too many ads.', '2023-09-05'),
(4, 1, 4, 'Good transaction tool.', '2023-09-15'),
(5, 2, 5, 'Loved the different filters.', '2023-09-25');

INSERT INTO Purchases (UserID, AppID, PurchaseDate, Amount) VALUES
(1, 1, '2023-06-05', 4.99),
(2, 2, '2023-06-20', 0.00),
(3, 3, '2023-07-15', 2.99),
(4, 4, '2023-08-10', 0.00),
(5, 5, '2023-09-01', 3.99),
(1, 3, '2023-07-18', 2.99),
(2, 4, '2023-08-15', 0.00),
(3, 5, '2023-09-20', 3.99),
(4, 1, '2023-10-01', 4.99),
(5, 2, '2023-10-10', 0.00);
