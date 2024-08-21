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

/* 
	import random
	import mysql.connector
	from datetime import datetime, timedelta

	db_config = {
		'user': 'root',
		'password': '****',
		'host': '127.0.0.1',
		'database': 'temp1'
	}

	connection = mysql.connector.connect(**db_config)
	cursor = connection.cursor()

	total_records = 5000
	
	gender_distribution = {
		'F': int(0.65 * total_records),  # 65% girls
		'M': int(0.35 * total_records)   # 35% boys
	}

	age_groups = {
		(7, 12): 0.18,   # 18% aged 7-12
		(13, 14): 0.27,  # 27% aged 13-14
		(15, 17): 0.20,  # 20% aged 15-17
		(18, 19): 0.35   # 35% aged 18-19
	}

	def generate_birth_date(age):
		today = datetime.today()
		start_date = today.replace(year=today.year - age - 1) + timedelta(days=1)
		end_date = today.replace(year=today.year - age)
		return start_date + (end_date - start_date) * random.random()

	insert_query = """
	INSERT INTO Campers (YouthID, FirstName, LastName, MiddleName, DateOfBirth, Email, Gender, PersonalPhone)
	VALUES (%s, %s, %s, %s, %s, %s, %s, %s);
	"""

	youth_id = 1
	for gender, count in gender_distribution.items():
		for age_range, age_percent in age_groups.items():
			age_count = int(count * age_percent)
			for _ in range(age_count):
				age = random.randint(*age_range)
				birth_date = generate_birth_date(age).strftime('%Y-%m-%d')
				first_name = f'FirstName{random.randint(1, 10000)}'
				last_name = f'LastName{random.randint(1, 10000)}'
				email = f'{first_name.lower()}.{last_name.lower()}@example.com'
				phone = f'{random.randint(100, 999)}-555-{random.randint(1000, 9999)}'
				
				cursor.execute(insert_query, (youth_id, first_name, last_name, '', birth_date, email, gender, phone))
				youth_id += 1

	connection.commit()

	cursor.close()
	connection.close()

	print(f"Successfully populated the Campers table with {total_records} records.") */
    
    
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












