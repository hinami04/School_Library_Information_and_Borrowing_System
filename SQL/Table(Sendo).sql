DROP TABLE IF EXISTS penalty;
DROP TABLE IF EXISTS borrowtransactionbook;
DROP TABLE IF EXISTS reservationbook;
DROP TABLE IF EXISTS borrowtransaction;
DROP TABLE IF EXISTS reservation;
DROP TABLE IF EXISTS categorybook;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS book;
DROP TABLE IF EXISTS student;
DROP TABLE IF EXISTS teacher;
DROP TABLE IF EXISTS librarian;
DROP TABLE IF EXISTS user;


CREATE TABLE user (
    UserID      VARCHAR(15) PRIMARY KEY,
    firstname   VARCHAR(75) NOT NULL,
    lastname    VARCHAR(75) NOT NULL,
    contactno   INT(11),
    email       VARCHAR(75)
);
