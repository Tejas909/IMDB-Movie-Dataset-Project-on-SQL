create database project;
use project;

CREATE TABLE Movie 
(Movie_Id INT,
Title VARCHAR(512),
Genres VARCHAR(512));

INSERT INTO Movie VALUES
('1', 'Toy Story (2001)', 'Adventure|Animation|Children|Comedy|Fantasy'),
('2', 'Jumanji (1995)', 'Adventure|Children|Fantasy'),
('3', 'Grumpier Old Men (1998)', 'Comedy|Romance'),
('4', 'Waiting to Exhale (1990)', 'Comedy|Drama|Romance'),
('5', 'Father of the Bride Part II (1985)', 'Comedy'),
('6', 'Heat (1966)', 'Action|Crime|Thriller'),
('7', 'Sabrina (2002)', 'Comedy|Romance'),
('8', 'Tom and Huck (2000)', 'Adventure|Children'),
('9', 'Sudden Death (1995)', 'Action'),
('10', 'GoldenEye (1995)', 'Action|Adventure|Thriller'),
('11', 'American President, The (1997)', 'Comedy|Drama|Romance'),
('12', 'Dracula: Dead and Loving It (1991)', 'Comedy|Horror'),
('13', 'Balto (1989)', 'Adventure|Animation|Children'),
('14', 'Nixon (1988)', 'Drama'),
('15', 'Cutthroat Island (2008)', 'Action|Adventure|Romance'),
('16', 'Casino (2000)', 'Crime|Drama'),
('17', 'Sense and Sensibility (2003)', 'Drama|Romance'),
('18', 'Four Rooms (2013)', 'Comedy'),
('19', 'Ace Ventura: When Nature Calls (1958)', 'Comedy'),
('20', 'Money Train (2014)', 'Action|Comedy|Crime|Drama|Thriller');

select * from Movie;

CREATE TABLE Link 
(Movie_Id INT,
IMDB_Id	INT,
TMDB_Id	INT);

INSERT INTO Link VALUES 
('1', '114709', '862'),
('2', '113497', '8844'),
('3', '113228', '15602'),
('4', '114885', '31357'),
('5', '113041', '11862'),
('6', '113277', '949'),
('7', '114319', '11860'),
('8', '112302', '45325'),
('9', '114576', '9091'),
('10', '113189', '710'),
('11', '112346', '9087'),
('12', '112896', '12110'),
('13', '112453', '21032'),
('14', '113987', '10858'),
('15', '112760', '1408'),
('16', '112641', '524'),
('17', '114388', '4584'),
('18', '113101', '5'),
('19', '112281', '9273'),
('20', '113845', '11517');

select * from Link;

CREATE TABLE Ratings
(User_Id	INT,
Movie_Id	INT,
Rating	INT,
Timestamp	VARCHAR(512));

INSERT INTO Ratings VALUES
('1081', '1', '4', 'November 22, 2001'),
('1097', '2', '4', 'December 15, 1995'),
('1056', '3', '4', 'December 22, 1998'),
('1053', '4', '5', 'December 22, 1990'),
('1040', '5', '5', 'December 8, 1985'),
('1028', '6', '3', 'December 15, 1966'),
('1015', '7', '5', 'December 15, 2002'),
('1003', '8', '4', 'December 22, 2000'),
('990', '9', '5', 'December 22, 1995'),
('978', '10', '5', 'November 17, 1995'),
('965', '11', '5', 'November 17, 1997'),
('953', '12', '5', 'December 22, 1991'),
('940', '13', '3', 'December 22, 1989'),
('928', '14', '5', 'December 20, 1988'),
('915', '15', '4', 'December 22, 2008'),
('903', '16', '5', 'November 22, 2000'),
('890', '17', '3', 'December 13, 2003'),
('878', '18', '3', 'December 25, 2013'),
('865', '19', '5', 'November 10, 1958'),
('853', '20', '4', 'November 22, 2014');

select * from Ratings;

CREATE TABLE Tags
(User_Id	INT,
Movie_Id	INT,
Tag	VARCHAR(512),
Timestamp	VARCHAR(512));

INSERT INTO Tags VALUES
('1081', '1', 'Funny', 'November 22, 2001'),
('1097', '2', 'Funny', 'December 15, 1995'),
('1056', '3', 'Romantic', 'December 22, 1998'),
('1053', '4', 'Drama', 'December 22, 1990'),
('1040', '5', 'Funny', 'December 8, 1985'),
('1028', '6', 'Thriller', 'December 15, 1966'),
('1015', '7', 'Comedy', 'December 15, 2002'),
('1003', '8', 'Adventure', 'December 22, 2000'),
('990', '9', 'Action', 'December 22, 1995'),
('978', '10', 'Thriller', 'November 17, 1995'),
('965', '11', 'Drama', 'November 17, 1997'),
('953', '12', 'Horror', 'December 22, 1991'),
('940', '13', 'Children', 'December 22, 1989'),
('928', '14', 'Drama', 'December 20, 1988'),
('915', '15', 'Action', 'December 22, 2008'),
('903', '16', 'Crime', 'November 22, 2000'),
('890', '17', 'Romantic', 'December 13, 2003'),
('878', '18', 'Comedy', 'December 25, 2013'),
('865', '19', 'Funny', 'November 10, 1958'),
('853', '20', 'Drama', 'November 22, 2014');

select * from Tags;

desc Movie;
desc Link;
desc Ratings;
desc Tags;

select count(Movie_Id) as Total_Movies from Movie;

SELECT * FROM Movie 
WHERE Title LIKE '%(1995)%';

SELECT * FROM Movie 
WHERE Genres LIKE '%Comedy%';

SELECT * FROM Movie WHERE Genres LIKE '%Action%' AND Title LIKE '%(2008)%';

SELECT AVG(Rating) AS Average_Rating FROM Ratings WHERE Movie_Id = 1;

SELECT User_Id FROM Ratings WHERE Movie_Id = 10;

SELECT Movie.Title 
FROM Movie 
WHERE Movie.Movie_Id NOT IN 
(SELECT Movie_Id FROM Ratings WHERE User_Id = 1081);

SELECT Movie.Title 
FROM Movie 
WHERE Movie.Movie_Id NOT IN 
(SELECT Movie_Id FROM Tags WHERE Tag IN ('Funny', 'Romantic'));

SELECT Movie.Title 
FROM Movie 
WHERE Movie.Movie_Id IN 
(SELECT Movie_Id FROM Movie WHERE Genres LIKE '%Action%');

SELECT Movie.Title 
FROM Movie 
WHERE Movie.Movie_Id IN 
(SELECT Movie_Id FROM Ratings WHERE Timestamp < 'December 15, 2002');

SELECT Movie.Title, AVG(Ratings.Rating) AS Avg_Rating
FROM Movie
JOIN Ratings ON Movie.Movie_Id = Ratings.Movie_Id
GROUP BY Movie.Movie_Id HAVING AVG(Ratings.Rating) > 4;

SELECT Movie.Title 
FROM Movie 
JOIN Ratings ON Movie.Movie_Id = Ratings.Movie_Id 
WHERE Ratings.User_Id = 1040 
ORDER BY Ratings.Rating DESC 
LIMIT 1;

SELECT Movie.Title 
FROM Movie 
JOIN Link ON Movie.Movie_Id = Link.Movie_Id 
WHERE Link.IMDB_Id > 113000;

SELECT Movie.Title, Link.IMDB_Id 
FROM Movie 
INNER JOIN Link ON Movie.Movie_Id = Link.Movie_Id;

SELECT Ratings.User_Id, Movie.Title, Ratings.Rating 
FROM Ratings 
RIGHT JOIN Movie ON Ratings.Movie_Id = Movie.Movie_Id;

SELECT Movie.Title, Tags.Tag 
FROM Movie 
LEFT JOIN Tags ON Movie.Movie_Id = Tags.Movie_Id;