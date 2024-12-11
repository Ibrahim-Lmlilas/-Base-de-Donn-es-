-- Active: 1733930101794@@127.0.0.1@3306@itthink
CREATE DATABASE IF NOT EXISTS `mydb`;
USE mydb;


--utlilisateur
----------------- Users table-----------------------------
CREATE TABLE `users` (
    id_user INT AUTO_INCREMENT,
    nom_user VARCHAR(50),
    email VARCHAR(100),
    password VARCHAR(255),
    PRIMARY KEY (id_user)
);
ALTER Table users
MODIFY COLUMN email VARCHAR(100) NOT NULL;
ALTER Table users
MODIFY COLUMN nom_user VARCHAR(100) NOT NULL;

ALTER Table users
MODIFY COLUMN password VARCHAR(100) NOT NULL;

ALTER Table users add constraint email_format CHECK(email LIKE '%@%.%') ;

INSERT INTO users (nom_user, email, password)
VALUES('brahim','brahim@gmail.com','123')

INSERT INTO users (nom_user, email, password)
VALUES('rayan','rayan@gmail.com','123')

UPDATE users set nom_user = 'Omar' WHERE id_user = 3

DELETE from users WHERE id_user = 2

SELECT * from users where nom_user='rayan'

SELECT * from users



---------- Categories table ----------------------------------
CREATE TABLE Categories (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(50) NOT NULL
);

INSERT INTO Categories (category_name)
VALUES ('Web Development');
INSERT INTO Categories (category_name)
VALUES ('Mobile Development');
INSERT INTO Categories (category_name)
VALUES ('Design');

SELECT * from categories;





-------------------- SubCategories table --------------------------------------
CREATE TABLE SubCategories (
    subcategory_id INT PRIMARY KEY AUTO_INCREMENT,
    subcategory_name VARCHAR(50) NOT NULL,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

INSERT INTO SubCategories (subcategory_name, category_id)
VALUES ('Frontend', 1);
INSERT INTO SubCategories (subcategory_name, category_id) 
VALUES ('Backend', 1);
INSERT INTO SubCategories (subcategory_name, category_id)
VALUES ('Android', 2);

SELECT * FROM SubCategories



----------------------- Projects table-----------------------------
CREATE TABLE Projects (
    project_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    description TEXT,
    category_id INT,
    subcategory_id INT,
    id_user INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (category_id) REFERENCES Categories(category_id),
    FOREIGN KEY (subcategory_id) REFERENCES SubCategories(subcategory_id),
    FOREIGN KEY (id_user) REFERENCES Users(id_user)
);

INSERT INTO Projects (title, description, category_id, subcategory_id, id_user)
VALUES ('E-commerce Website', 'Online shop project', 1, 1, 1);

SELECT * FROM Projects;



------------------ Freelancers table----------------------------
CREATE TABLE Freelancers (
    freelancer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    skills TEXT,
    id_user INT,
    FOREIGN KEY (id_user) REFERENCES Users(id_user)
);

INSERT INTO Freelancers (name, skills, id_user)
VALUES ('Brahim Dev', 'HTML, CSS, JavaScript', 1);

INSERT INTO Freelancers (name, skills, id_user)
VALUES ('Rayan Dev', 'HTML, CSS,', 1);

SELECT * FROM Freelancers;



----------------- Offers table--------------------
CREATE TABLE Offers (
    offer_id INT PRIMARY KEY AUTO_INCREMENT,
    amount FLOAT NOT NULL,
    deadline VARCHAR(50),
    freelancer_id INT,
    project_id INT,
    FOREIGN KEY (freelancer_id) REFERENCES Freelancers(freelancer_id),
    FOREIGN KEY (project_id) REFERENCES Projects(project_id)
);

INSERT INTO Offers (amount, deadline, freelancer_id, project_id)
VALUES (5000, '2024-03-30', 1, 1);


SELECT * FROM Offers;

----------------- Reviews table--------------------------
CREATE TABLE Reviews (
    review_id INT PRIMARY KEY AUTO_INCREMENT,
    comment TEXT NOT NULL,
    id_user INT,
    FOREIGN KEY (id_user) REFERENCES Users(id_user)
);

INSERT INTO Reviews (comment, id_user)
VALUES ('Great work!', 1);


SELECT * FROM Reviews;