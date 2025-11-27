CREATE TABLE teacher (
    TeacherID VARCHAR(10) PRIMARY KEY,
    UserID    VARCHAR(15),

    CONSTRAINT fk_teacher_user
        FOREIGN KEY (UserID) REFERENCES user(UserID)
);
