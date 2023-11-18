SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';
CREATE TABLE News (
    news_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255),
    content TEXT,
    category_id INT,
    publish_date DATETIME,
    author_id INT,
    FOREIGN KEY (category_id) REFERENCES Categories(category_id),
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);
INSERT INTO News (title, content, category_id, publish_date, author_id) VALUES ('Новость о спорте', 'Кто же выиграл матч?', 1, NOW(), 1);
INSERT INTO News (title, content, category_id, publish_date, author_id) VALUES ('Новости о технологиях', 'Как собрать бюджетный комптютер? ', 2, NOW(), 2);

CREATE TABLE Categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100)
);
INSERT INTO Categories (name) VALUES ('Технологии');
INSERT INTO Categories (name) VALUES ('Спорт');
INSERT INTO Categories (name) VALUES ('Культура');


CREATE TABLE Comments (
    comment_id INT AUTO_INCREMENT PRIMARY KEY,
    news_id INT,
    user_id INT,
    content TEXT,
    publish_date DATETIME,
    FOREIGN KEY (news_id) REFERENCES News(news_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);
INSERT INTO Comments (news_id, user_id, content, publish_date) VALUES (1, 1, 'Отличная статья!', NOW());
INSERT INTO Comments (news_id, user_id, content, publish_date) VALUES (1, 2, 'Согласен с предыдущим комментарием', NOW());

CREATE TABLE Ratings (
    rating_id INT AUTO_INCREMENT PRIMARY KEY,
    news_id INT,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    ip_address VARCHAR(15),
    FOREIGN KEY (news_id) REFERENCES News(news_id)
);
INSERT INTO Ratings (news_id, rating, ip_address) VALUES (1, 5, '192.168.1.1');
INSERT INTO Ratings (news_id, rating, ip_address) VALUES (1, 4, '192.168.1.2');

CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100),
    email VARCHAR(100)
);
INSERT INTO Users (username, email) VALUES ('user1', 'user1@example.com');
INSERT INTO Users (username, email) VALUES ('user2', 'user2@example.com');

CREATE TABLE Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100)
);
INSERT INTO Authors (name) VALUES ('Никита Иванов ');
INSERT INTO Authors (name) VALUES ('Соня Андреевна ');