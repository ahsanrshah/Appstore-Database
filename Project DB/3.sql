-- Insert data into Developers table
INSERT INTO Developers (Name, Email, Country, JoinDate) VALUES
('Rameen Nayyab', 'rameen.nayyab@outlook.com', 'USA', '2023-05-01'),
('Bobby Smith', 'bob.smith@example.com', 'Canada', '2023-06-15'),
('Celia Wang', 'celia.wang@example.com', 'China', '2023-07-20'),
('Daniel Brown', 'daniel.brown@example.com', 'UK', '2023-08-30'),
('Emma Davis', 'emma.davis@example.com', 'Australia', '2023-09-10'),
('Faisal Khan', 'faisal.khan@example.com', 'Pakistan', '2023-10-05'),
('Grace Lee', 'grace.lee@example.com', 'South Korea', '2023-11-12'),
('Hiro Tanaka', 'hiro.tanaka@example.com', 'Japan', '2023-12-01'),
('Isabella Rossi', 'isabella.rossi@example.com', 'Italy', '2024-01-15'),
('Jamal Ahmed', 'jamal.ahmed@example.com', 'Egypt', '2024-02-05'),
('Karen White', 'karen.white@example.com', 'New Zealand', '2024-03-10'),
('Luis Martinez', 'luis.martinez@example.com', 'Mexico', '2024-04-20');

-- Insert data into Apps table (No zero price apps)
INSERT INTO Apps (DeveloperID, Name, Category, Price, ReleaseDate, Rating) VALUES
(1, 'Weather', 'Productivity', 4.99, '2023-06-01', 4.5),
(2, 'Careem', 'Travel', 2.99, '2023-06-20', 4.8),
(3, 'KFC', 'Food', 2.99, '2023-07-15', 4.3),
(4, 'Cheezious', 'Food', 3.99, '2023-08-10', 4.7),
(5, 'Maps', 'Travel', 3.99, '2023-09-01', 4.6);

-- Insert data into Users table
INSERT INTO Users (Name, Email, DeviceType, Country, RegistrationDate) VALUES
('Sophia Taylor', 'sophia.taylor@example.com', 'iPhone', 'USA', '2023-06-05'),
('Liam Johnson', 'liam.johnson@example.com', 'iPad', 'Canada', '2023-06-15'),
('Olivia Brown', 'olivia.brown@example.com', 'iPhone', 'UK', '2023-07-10'),
('Noah Wilson', 'noah.wilson@example.com', 'iPad', 'Australia', '2023-08-25'),
('Emma Davis', 'emma.davis@example.com', 'iPhone', 'India', '2023-09-12');

-- Insert data into Reviews table
INSERT INTO Reviews (AppID, UserID, Rating, Comment, ReviewDate) VALUES
(1, 1, 5, 'Great weather app!', '2023-06-10'),
(2, 2, 4, 'Very affordable rides.', '2023-06-22'),
(3, 3, 3, 'Slow.', '2023-07-18'),
(4, 4, 5, 'Excellent food.', '2023-08-15'),
(5, 5, 4, 'Helpful for travel.', '2023-09-20'),
(1, 3, 4, 'Accurate and useful.', '2023-07-25'),
(2, 4, 5, 'Fast', '2023-08-01'),
(3, 5, 2, 'Too many ads.', '2023-09-05'),
(5, 2, 5, 'Loved the travel tips.', '2023-09-25');

-- Insert data into Purchases table (No zero price purchases)
-- Ensure that purchases only happen after downloading
INSERT INTO Purchases (UserID, AppID, PurchaseDate, Amount) VALUES
(1, 1, '2023-06-05', 4.99),
(3, 3, '2023-07-15', 2.99),
(5, 5, '2023-09-01', 3.99),
(1, 3, '2023-07-18', 2.99),
(3, 5, '2023-09-20', 3.99),
(4, 1, '2023-10-01', 4.99);

-- Insert download records (Multiple users can download the same app)
INSERT INTO Downloads (AppID, UserID, DownloadDate) VALUES
(1, 1, '2023-06-10'),
(1, 3, '2023-07-25'),
(1, 4, '2023-08-10'),
(2, 2, '2023-06-22'),
(2, 4, '2023-08-01'),
(3, 3, '2023-07-18'),
(3, 5, '2023-09-05'),
(4, 4, '2023-08-15'),
(5, 5, '2023-09-01');
purchases