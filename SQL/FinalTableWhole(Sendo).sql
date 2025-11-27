-- ============================================================
-- SCHOOL LIBRARY INFORMATION & BORROWING SYSTEM - FINAL SQL SCHEMA
-- USE THIS CODE AS A FINAL OPTION INCASE THE OTHER SQL FILES DOES NOT WORK
-- ============================================================

DROP TABLE IF EXISTS project_penalty;
DROP TABLE IF EXISTS project_borrowtransactionbook;
DROP TABLE IF EXISTS project_reservationbook;
DROP TABLE IF EXISTS project_borrowtransaction;
DROP TABLE IF EXISTS project_reservation;
DROP TABLE IF EXISTS project_categorybook;
DROP TABLE IF EXISTS project_category;
DROP TABLE IF EXISTS project_book;
DROP TABLE IF EXISTS project_student;
DROP TABLE IF EXISTS project_teacher;
DROP TABLE IF EXISTS project_librarian;
DROP TABLE IF EXISTS project_user;

-- ============================================================
-- USER TABLE
-- ============================================================
CREATE TABLE project_user (
    UserID VARCHAR(15) PRIMARY KEY,
    firstname VARCHAR(75) NOT NULL,
    lastname VARCHAR(75) NOT NULL,
    contactno INT(11),
    email VARCHAR(75)
);

-- ============================================================
-- STUDENT TABLE
-- ============================================================
CREATE TABLE project_student (
    StudentID VARCHAR(15) PRIMARY KEY,
    Course VARCHAR(10) NOT NULL,
    YearLevel INT(1),
    UserID VARCHAR(15),
    CONSTRAINT fk_student_user
        FOREIGN KEY (UserID) REFERENCES project_user(UserID)
);

-- ============================================================
-- TEACHER TABLE
-- ============================================================
CREATE TABLE project_teacher (
    TeacherID VARCHAR(10) PRIMARY KEY,
    UserID VARCHAR(15),
    CONSTRAINT fk_teacher_user
        FOREIGN KEY (UserID) REFERENCES project_user(UserID)
);

-- ============================================================
-- LIBRARIAN TABLE
-- ============================================================
CREATE TABLE project_librarian (
    LibrarianID VARCHAR(15) PRIMARY KEY,
    UserID VARCHAR(15),
    CONSTRAINT fk_librarian_user
        FOREIGN KEY (UserID) REFERENCES project_user(UserID)
);

-- ============================================================
-- BOOK TABLE
-- ============================================================
CREATE TABLE project_book (
    BookID VARCHAR(50) PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    Author VARCHAR(75)
);

-- ============================================================
-- CATEGORY TABLE
-- ============================================================
CREATE TABLE project_category (
    CategoryID INT(15) PRIMARY KEY,
    Name VARCHAR(75) NOT NULL,
    Description VARCHAR(255)
);

-- ============================================================
-- CATEGORY ↔ BOOK (Many-to-Many)
-- ============================================================
CREATE TABLE project_categorybook (
    CategoryID INT(15),
    BookID VARCHAR(50),
    PRIMARY KEY (CategoryID, BookID),
    CONSTRAINT fk_categorybook_category
        FOREIGN KEY (CategoryID) REFERENCES project_category(CategoryID),
    CONSTRAINT fk_categorybook_book
        FOREIGN KEY (BookID) REFERENCES project_book(BookID)
);

-- ============================================================
-- RESERVATION TABLE
-- ============================================================
CREATE TABLE project_reservation (
    ReservationID VARCHAR(20) PRIMARY KEY,
    DateReserved DATE NOT NULL,
    DateStatus VARCHAR(20),
    StudentID VARCHAR(15),
    CONSTRAINT fk_reservation_student
        FOREIGN KEY (StudentID) REFERENCES project_student(StudentID)
);

-- ============================================================
-- RESERVATIONBOOK (Many-to-Many)
-- ============================================================
CREATE TABLE project_reservationbook (
    BookID VARCHAR(50),
    ReservationID VARCHAR(20),
    PRIMARY KEY(BookID, ReservationID),
    CONSTRAINT fk_reservationbook_book
        FOREIGN KEY (BookID) REFERENCES project_book(BookID),
    CONSTRAINT fk_reservationbook_res
        FOREIGN KEY (ReservationID) REFERENCES project_reservation(ReservationID)
);

-- ============================================================
-- BORROW TRANSACTION TABLE
-- ============================================================
CREATE TABLE project_borrowtransaction (
    BorrowID VARCHAR(25) PRIMARY KEY,
    DueDate DATE,
    BorrowDate DATE,
    ReturnDate DATE,
    StudentID VARCHAR(15),
    TeacherID VARCHAR(10),
    LibrarianID VARCHAR(15),
    CONSTRAINT fk_borrow_student
        FOREIGN KEY (StudentID) REFERENCES project_student(StudentID),
    CONSTRAINT fk_borrow_teacher
        FOREIGN KEY (TeacherID) REFERENCES project_teacher(TeacherID),
    CONSTRAINT fk_borrow_librarian
        FOREIGN KEY (LibrarianID) REFERENCES project_librarian(LibrarianID)
);

-- ============================================================
-- BORROWTRANSACTIONBOOK (Many-to-Many)
-- ============================================================
CREATE TABLE project_borrowtransactionbook (
    BookID VARCHAR(50),
    BorrowID VARCHAR(25),
    PRIMARY KEY(BookID, BorrowID),
    CONSTRAINT fk_borrowtransbook_book
        FOREIGN KEY (BookID) REFERENCES project_book(BookID),
    CONSTRAINT fk_borrowtransbook_borrow
        FOREIGN KEY (BorrowID) REFERENCES project_borrowtransaction(BorrowID)
);

-- ============================================================
-- PENALTY TABLE
-- ============================================================
CREATE TABLE project_penalty (
    PenaltyID VARCHAR(20) PRIMARY KEY,
    Amount DECIMAL(8,2),
    Status VARCHAR(20),
    BorrowID VARCHAR(25),
    CONSTRAINT fk_penalty_borrow
        FOREIGN KEY (BorrowID) REFERENCES project_borrowtransaction(BorrowID)
);

