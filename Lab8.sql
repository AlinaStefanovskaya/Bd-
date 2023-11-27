SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

CREATE TABLE IF NOT EXISTS Projects (
    ProjectID INT AUTO_INCREMENT PRIMARY KEY,
    ProjectName VARCHAR(255),
    Description TEXT
);
INSERT INTO Projects (ProjectName, Description) VALUES 
('Розробка Веб-Сайту', 'Створення нового корпоративного веб-сайту'),
('Мобільний Додаток', 'Розробка мобільного додатку для iOS та Android');

CREATE TABLE IF NOT EXISTS Users (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    UserName VARCHAR(255),
    Email VARCHAR(255)
);
INSERT INTO Users (UserName, Email) VALUES 
('Аліна', 'alina@example.com'),
('Максим', 'maxim@example.com'),
('Олена', 'olena@example.com');

CREATE TABLE IF NOT EXISTS Tasks (
    TaskID INT AUTO_INCREMENT PRIMARY KEY,
    ProjectID INT,
    Title VARCHAR(255),
    Description TEXT,
    Status VARCHAR(50),
    CreatedByUserID INT,
    CreatedDate DATETIME,
    FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID),
    FOREIGN KEY (CreatedByUserID) REFERENCES Users(UserID)
);
INSERT INTO Tasks (ProjectID, Title, Description, Status, CreatedByUserID, CreatedDate) VALUES 
(1, 'Дизайн головної сторінки', 'Створити макет головної сторінки сайту', 'Відкрита', 1, '2023-11-15 10:00:00'),
(2, 'Розробка API', 'Розробити бекенд для мобільного додатку', 'В роботі', 2, '2023-11-15 11:00:00');

CREATE TABLE IF NOT EXISTS TaskAssignments (
    TaskID INT,
    UserID INT,
    PRIMARY KEY (TaskID, UserID),
    FOREIGN KEY (TaskID) REFERENCES Tasks(TaskID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);
INSERT INTO TaskAssignments (TaskID, UserID) VALUES 
(1, 1),
(2, 2),
(2, 3);

CREATE TABLE IF NOT EXISTS Project_User (
    ProjectID INT,
    UserID INT,
    PRIMARY KEY (ProjectID, UserID),
    FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);
INSERT INTO Project_User (ProjectID, UserID) VALUES 
(1, 1),
(1, 2),
(2, 3);


CREATE TABLE IF NOT EXISTS Files (
    FileID INT AUTO_INCREMENT PRIMARY KEY,
    TaskID INT,
    ProjectID INT,
    FileName VARCHAR(255),
    FileURL VARCHAR(255),
    FOREIGN KEY (TaskID) REFERENCES Tasks(TaskID) ON DELETE SET NULL,
    FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID) ON DELETE SET NULL
);
INSERT INTO Files (TaskID, ProjectID, FileName, FileURL) VALUES 
(1, NULL, 'mockup.png', 'http://example.com/files/mockup.png'),
(NULL, 2, 'specification.doc', 'http://example.com/files/specification.doc');
