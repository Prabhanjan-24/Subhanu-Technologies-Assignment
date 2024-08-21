/*1. Write SQL statement select to display customer Full Name in one column, their City and Amount of sales. We need data only for customers whose mother has brown eyes.*/

SELECT CONCAT(c.FirstName, ' ', c.LastName) AS FullName, a.City,s.Amount
FROM Sales s
JOIN Customer c ON s.CustomerID=c.Id
JOIN Address a ON s.CityID=a.ID
JOIN Customer m ON c.MotherIDNumber=m.IDNumber
WHERE m.EyeColor="Brown";

/*2. Write SQL statement select to display First Name and Last Name of users which ordered 3 and more courses. Use tables from below.*/

SELECT u.FirstName , u.LastName
FROM User u
JOIN Order1 o ON u.ID=o.UserID
GROUP BY u.ID
HAVING COUNT(o.CourseID)>=3;

/*3. What will be the result of the select below*/

SELECT SUM(p.Amount) AS Amount
FROM Payments p
INNER JOIN Clients c ON p.ClientId = c.Id
INNER JOIN Address a ON c.Id = a.ClientId
WHERE c.Name LIKE '%iro' 

# The Output will be 1000



/* Python Questions*/

#  1. What is tuple in Python? What is the difference between list and tuple?
/* ans:
      Tuple in Python is a collection of objects which are seperated from each other by commas. The major difference between list and tuple is that tuples are immuatable where
      as lists are mutable, meaning you can change the object after creation in lists. */
   
#  2. What are the rules for a local and global variable in Python? 
/* ans:
      Local variables are defined inside a function and there scope is limited/associated with only that function only, whereas a global variable are created outside the
      function and have a global scope i.e., anywhere in any functions.*/
   
#  3. What is Python's parameter passing mechanism? Name it and explain it.
/* ans:
	  Python's parameter passing mechanism is called "Pass By Object Reference". It means if you pass an immutable object, the changes made inside the function will not
      affect the original object but for mutable object it affects the original object if you make changes to it within a function. */

#  4. Write a method to open a text file and display its content?
/* ans:
	  file= open("File_name.txt,"r")
      print(file.read()*/
   
#5. You have two lists: strList = ["Vishesh", "For", "Python"] and valList = [1, 2] for the first two tasks
#   and one list valList = [1, 2, 3] for third task. Write the sintax so you will get these results:

/*  1) {'key2': ['Vishesh', 'For', 'Python'], 'key1': [1, 2]}
 ans:
	strList = ["Vishesh", "For", "Python"]
	valList = [1, 2]
	result = {'key2': strList, 'key1': valList}
	print(result)
    
    2) {'key1': [1, 2, ['vishesh', 'For', 'python']]}
 ans:
    strList = ["Vishesh", "For", "Python"]
    valList = [1, 2]
    result = {'key1': [valList, strList]}
    print(result)
    
    3) {'1': [1, 2], '3': [3, 4], '2': [2, 3]} # Creating a dictionary of lists using list comprehension.
 ans:
    valList = [1, 2, 3]
    result = {str(i): [i, i + 1] for i in valList}
    print(result)  */







