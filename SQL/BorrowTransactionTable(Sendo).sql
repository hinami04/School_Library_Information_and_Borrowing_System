CREATE TABLE borrowtransaction (
    BorrowID     VARCHAR(25) PRIMARY KEY,
    DueDate      DATE,
    BorrowDate   DATE,
    ReturnDate   DATE,
    StudentID    VARCHAR(15),
    TeacherID    VARCHAR(10),
    LibrarianID  VARCHAR(15),

    CONSTRAINT fk_borrow_student
        FOREIGN KEY (StudentID) REFERENCES student(StudentID),

    CONSTRAINT fk_borrow_teacher
        FOREIGN KEY (TeacherID) REFERENCES teacher(TeacherID),

    CONSTRAINT fk_borrow_librarian
        FOREIGN KEY (LibrarianID) REFERENCES librarian(LibrarianID)
);
