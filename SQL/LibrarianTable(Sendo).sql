CREATE TABLE librarian (
    LibrarianID VARCHAR(15) PRIMARY KEY,
    UserID      VARCHAR(15),

    CONSTRAINT fk_librarian_user
        FOREIGN KEY (UserID) REFERENCES user(UserID)
);
