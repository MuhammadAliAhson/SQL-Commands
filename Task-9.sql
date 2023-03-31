CREATE TABLE user (
id int(10) unsigned NOT NULL AUTO_INCREMENT,
name varchar(50) NOT NULL,
username varchar(50) NOT NULL,
DOB int(10) unsigned DEFAULT NULL,
PRIMARY KEY (id)
);

INSERT INTO user (id, name, username, DOB) VALUES
(1, 'John Doe', 'johndoe', 1530403200),
(2, 'Jane Smith', 'janesmith', 1561939200),
(3, 'Bob Johnson', 'bobjohnson', NULL);

CREATE TABLE post (
id int(10) unsigned NOT NULL AUTO_INCREMENT,
description varchar(255) NOT NULL,
date int(10) unsigned DEFAULT NULL,
user_id int(10) unsigned NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY (user_id) REFERENCES user (id)
);

INSERT INTO post (id, description, date, user_id) VALUES
(1, 'This is my first post.', 1630396800, 1),
(2, 'Check out this awesome photo!', 1641484800, 2),
(3, 'Feeling excited about my new project!', 1632854400, 3);

CREATE TABLE comment (
id int(10) unsigned NOT NULL AUTO_INCREMENT,
description varchar(255) NOT NULL,
date int(10) unsigned DEFAULT NULL,
post_id int(10) unsigned NOT NULL,
user_id int(10) unsigned NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY (post_id) REFERENCES post (id),
FOREIGN KEY (user_id) REFERENCES user (id)
);

INSERT INTO comment (id, description, date, post_id, user_id) VALUES
(1, 'Great post, thanks for sharing!', 1631308800, 1, 2),
(2, 'I love the photo, where was it taken?', 1642828800, 2, 3),
(3, 'Congratulations on your new project!', 1633017600, 3, 1);

Scenario:
Assuming we want to get the user name and the total number of comments they have made on all of their posts.


SELECT u.name, COUNT(*) as total_comments
FROM user u
INNER JOIN post p ON u.id = p.user_id
INNER JOIN comment c ON p.id = c.post_id
GROUP BY u.id;

Explanation:
This query uses the INNER JOIN operator to join the user, post, and comment tables together. The GROUP BY clause is used to group the results by user id. The COUNT(*) function is used to count the number of comments made by each user. The SELECT statement returns the user name and the total number of comments made by that user.

Scenario:
Assuming we want to get the user names who have made a post and also commented on their own post.

Query:

SELECT u.name
FROM user u
INNER JOIN post p ON u.id = p.user_id
INNER JOIN comment c ON p.id = c.post_id
WHERE c.user_id = u.id;