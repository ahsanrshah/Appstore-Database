-- Create Developers table
CREATE TABLE Developers (
    DeveloperID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL,
    Country VARCHAR(100),
    JoinDate DATE NOT NULL
);

-- Create Apps table
CREATE TABLE Apps (
    AppID INT PRIMARY KEY AUTO_INCREMENT,
    DeveloperID INT,
    Name VARCHAR(255) NOT NULL,
    Category VARCHAR(100),
    Price DECIMAL(10, 2) NOT NULL,
    ReleaseDate DATE NOT NULL,
    Rating DECIMAL(3, 2),
    Downloads INT NOT NULL DEFAULT 0,  -- Downloads column with default value of 0
    FOREIGN KEY (DeveloperID) REFERENCES Developers(DeveloperID)
);

-- Create Users table
CREATE TABLE Users (
    UserID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL,
    DeviceType VARCHAR(100),
    Country VARCHAR(100),
    RegistrationDate DATE NOT NULL
);

-- Create Reviews table
CREATE TABLE Reviews (
    ReviewID INT PRIMARY KEY AUTO_INCREMENT,
    AppID INT,
    UserID INT,
    Rating INT CHECK (Rating BETWEEN 1 AND 5),
    Comment TEXT,
    ReviewDate DATE NOT NULL,
    FOREIGN KEY (AppID) REFERENCES Apps(AppID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Create Purchases table
CREATE TABLE Purchases (
    PurchaseID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT,
    AppID INT,
    PurchaseDate DATE NOT NULL,
    Amount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (AppID) REFERENCES Apps(AppID)
);

-- Create Downloads table to track each app download
CREATE TABLE Downloads (
    DownloadID INT PRIMARY KEY AUTO_INCREMENT,
    AppID INT,
    UserID INT,
    DownloadDate DATE NOT NULL,
    FOREIGN KEY (AppID) REFERENCES Apps(AppID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Trigger to increment the Downloads count on the Apps table whenever a new download is added
DELIMITER //

CREATE TRIGGER IncrementDownloads
AFTER INSERT ON Downloads
FOR EACH ROW
BEGIN
    UPDATE Apps
    SET Downloads = Downloads + 1
    WHERE AppID = NEW.AppID;
END //

DELIMITER ;


