CREATE TABLE student (
    StudentID   VARCHAR(15) PRIMARY KEY,
    Course      VARCHAR(10) NOT NULL,
    YearLevel   INT(1),
    UserID      VARCHAR(15),

    CONSTRAINT fk_student_user
        FOREIGN KEY (UserID) REFERENCES user(UserID)
);
