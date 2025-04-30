--SQL QUESTIONS FOR INTERVIEW PRACTICE

--1.)	Write a Query to find person id, name, number of friends,
--sum of marks of person who have friends with total score greater than 100
--2.)	Write a query to find the highest-scoring friend for each person.
--3.)	Write a query to find persons who have no friends in the given dataset.
--4.)	Write a query to find the person with the highest number of friends.
--5.)	Write a query to find mutual friends between any two given person IDs.
--6.)	Write a query to find each person’s average score of all their friends.
--7.)	Write a query to find people whose average friend score is higher than their own score.
--8.)	Write a query to list all possible pairs of persons who are not friends yet.
--9.)	Write a query to find pairs of friends whose scores differ by at most 10 points.
--10.)	Write a query to calculate the total sum of scores for each person’s friends.


--First, let's create a Table and import the Datasets

--LETS IMPORT FRIEND DATA

CREATE TABLE friend_data (Person_id Int,
					Friend_id Int
);

SELECT *
FROM friend_data



--LETS IMPORT PERSON DATA

CREATE TABLE person_data (Person_id Int,
						  Name Varchar,
						  Email Text,
						  Score Int
);

SELECT *
FROM person_data




--1.)	Write a Query to find person id, name, number of friends,
--sum of marks of person who have friends with total score greater than 100


SELECT 
    p.Person_id,
    p.Name,
    COUNT(f.Friend_id) AS number_of_friends,
    SUM(p2.Score) AS total_friends_score
FROM person_data AS p
JOIN friend_data f ON p.Person_id = f.Person_id
JOIN person_data p2 ON f.Friend_id = p2.Person_id
GROUP BY p.Person_id, p.Name
HAVING SUM(p2.Score) > 100;








--2.)	Write a query to find the highest-scoring friend for each person.

SELECT DISTINCT ON (f.Person_id)
    f.Person_id,
    p.Name AS person_name,
    f.Friend_id,
    pf.Name AS friend_name,
    pf.Score AS friend_score
FROM friend_data AS f
JOIN person_data AS pf ON f.Friend_id = pf.Person_id
JOIN person_data AS p ON f.Person_id = p.Person_id
ORDER BY f.Person_id, pf.Score DESC;







--3.)	Write a query to find persons who have no friends in the given dataset.


SELECT p.Person_id, p.Name
FROM person_data AS p
LEFT JOIN friend_data AS f ON p.Person_id = f.Person_id
WHERE f.Friend_id IS NULL;









--4.)	Write a query to find the person with the highest number of friends.

SELECT f.Person_id, p.Name, COUNT(f.Friend_id) AS number_of_friends
FROM friend_data AS f
JOIN person_data AS p ON f.Person_id = p.Person_id
GROUP BY f.Person_id, p.Name
ORDER BY number_of_friends DESC
LIMIT 1;






--5.)	Write a query to find mutual friends between any two given person IDs.

SELECT f1.Friend_id AS mutual_friend_id, p.Name
FROM friend_data AS f1
JOIN friend_data AS f2 ON f1.Friend_id = f2.Friend_id
JOIN person_data AS p ON f1.Friend_id = p.Person_id
WHERE f1.Person_id = 1 AND f2.Person_id = 2;









--6.)	Write a query to find each person’s average score of all their friends.

SELECT 
    f.Person_id,
    p.Name,
    AVG(pf.Score) AS avg_friend_score
FROM friend_data AS f
JOIN person_data AS p ON f.Person_id = p.Person_id
JOIN person_data AS pf ON f.Friend_id = pf.Person_id
GROUP BY f.Person_id, p.Name;






--7.)	Write a query to find people whose average friend score is higher than their own score.


SELECT p.Person_id, p.Name, p.Score, AVG(p2.Score) AS AverageFriendScore
FROM Person_data AS p
JOIN Friend_data AS f ON p.Person_id = f.Person_id
JOIN Person_data AS p2 ON f.Friend_id = p2.Person_id
GROUP BY p.Person_id, p.Name, p.Score
HAVING AVG(p2.Score) > p.Score;





--8.)	Write a query to list all possible pairs of persons who are not friends yet.


SELECT p1.Person_id AS Person1,  p2.Person_id AS Person2
FROM Person_data AS p1
JOIN Person_data AS p2 ON p1.Person_id < p2.Person_id
LEFT JOIN Friend_data f ON p1.Person_id = f.Person_id AND p2.Person_id = f.Friend_id
WHERE f.Person_id IS NULL;









--9.)	Write a query to find pairs of friends whose scores differ by at most 10 points.

SELECT f.Person_id, f.Friend_id, ABS(p1.Score - p2.Score) AS score_diff
FROM friend_data AS f
JOIN person_data AS p1 ON f.Person_id = p1.Person_id
JOIN person_data AS p2 ON f.Friend_id = p2.Person_id
WHERE ABS(p1.Score - p2.Score) <= 10;










--10.) Write a query to calculate the total sum of scores for each person’s friends.

SELECT 
    f.Person_id,
    p.Name,
    SUM(pf.Score) AS total_friend_score
FROM friend_data AS f
JOIN person_data AS p ON f.Person_id = p.Person_id
JOIN person_data AS pf ON f.Friend_id = pf.Person_id
GROUP BY f.Person_id, p.Name;

