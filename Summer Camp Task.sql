/* Task1 */
CREATE TABLE Campers (
    YouthID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    MiddleName VARCHAR(50),
    DateOfBirth DATE,
    Email VARCHAR(100),
    Gender CHAR(1),
    PersonalPhone VARCHAR(15)
);
CREATE TABLE Camps (
    CampID INT PRIMARY KEY,
    CampTitle VARCHAR(100),
    StartDate DATE,
    EndDate DATE,
    Price DECIMAL(10, 2),
    Capacity INT
);
CREATE TABLE Visits (
    VisitID INT PRIMARY KEY,
    YouthID INT,
    CampID INT,
    VisitDate DATE,
    FOREIGN KEY (YouthID) REFERENCES Campers(YouthID),
    FOREIGN KEY (CampID) REFERENCES Camps(CampID)
);

/* Task2 */

CREATE TEMPORARY TABLE TempCampers (
    YouthID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    MiddleName VARCHAR(50),
    DateOfBirth DATE,
    Email VARCHAR(100),
    Gender CHAR(1),
    PersonalPhone VARCHAR(15)
);

INSERT INTO TempCampers (FirstName, LastName, MiddleName, DateOfBirth, Email, Gender, PersonalPhone)
SELECT 
    SUBSTRING(MD5(RAND()), 1, 10),  # Random first name
    SUBSTRING(MD5(RAND()), 1, 10),  # Random last name
    SUBSTRING(MD5(RAND()), 1, 10),  # Random middle name
    CASE
        WHEN RAND() < 0.18 THEN DATE_SUB(CURDATE(), INTERVAL FLOOR(7 + (RAND() * 6)) YEAR)  # 7-12 years old
        WHEN RAND() < 0.45 THEN DATE_SUB(CURDATE(), INTERVAL FLOOR(13 + (RAND() * 2)) YEAR) # 13-14 years old
        WHEN RAND() < 0.65 THEN DATE_SUB(CURDATE(), INTERVAL FLOOR(15 + (RAND() * 3)) YEAR) # 15-17 years old
        ELSE DATE_SUB(CURDATE(), INTERVAL FLOOR(18 + (RAND() * 2)) YEAR) -- 18-19 years old
    END AS DateOfBirth,
    CONCAT(SUBSTRING(MD5(RAND()), 1, 5), '@example.com') AS Email,  # Random email
    CASE
        WHEN RAND() < 0.65 THEN 'F'  
        ELSE 'M'  
    END AS Gender,
    CONCAT('9', FLOOR(RAND() * 1000000000)) AS PersonalPhone  # Random phone number
FROM
    (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9 UNION SELECT 10) t1,
    (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9 UNION SELECT 10) t2,
    (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9 UNION SELECT 10) t3,
    (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9 UNION SELECT 10) t4,
    (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9 UNION SELECT 10) t5
LIMIT 5000;

INSERT INTO Campers (YouthID, FirstName, LastName, MiddleName, DateOfBirth, Email, Gender, PersonalPhone)
SELECT YouthID, FirstName, LastName, MiddleName, DateOfBirth, Email, Gender, PersonalPhone
FROM TempCampers;

DROP TEMPORARY TABLE TempCampers;    

# The reason that I created a temporary table was to use the auto increment count for YouthID
    
/* Task3 */

SELECT 
    CASE 
        WHEN DateOfBirth BETWEEN '1965-01-01' AND '1980-12-31' THEN 'Gen X'
        WHEN DateOfBirth BETWEEN '1981-01-01' AND '1996-12-31' THEN 'Millennials'
        WHEN DateOfBirth BETWEEN '1997-01-01' AND '2012-12-31' THEN 'Gen Z'
        WHEN DateOfBirth BETWEEN '2013-01-01' AND '2025-12-31' THEN 'Gen Alpha'
        ELSE 'Other'
    END AS generation,
    gender,
    COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (PARTITION BY 
        CASE 
            WHEN DateOfBirth BETWEEN '1965-01-01' AND '1980-12-31' THEN 'Gen X'
            WHEN DateOfBirth BETWEEN '1981-01-01' AND '1996-12-31' THEN 'Millennials'
            WHEN DateOfBirth BETWEEN '1997-01-01' AND '2012-12-31' THEN 'Gen Z'
            WHEN DateOfBirth BETWEEN '2013-01-01' AND '2025-12-31' THEN 'Gen Alpha'
            ELSE 'Other'
        END) AS percentage
FROM Campers
GROUP BY generation, Gender
ORDER BY generation, Gender;












