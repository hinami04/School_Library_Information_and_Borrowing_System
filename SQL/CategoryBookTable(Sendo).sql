CREATE TABLE categorybook (
    CategoryID INT(15),
    BookID     VARCHAR(50),

    PRIMARY KEY (CategoryID, BookID),

    CONSTRAINT fk_categorybook_category
        FOREIGN KEY (CategoryID) REFERENCES category(CategoryID),
    CONSTRAINT fk_categorybook_book
        FOREIGN KEY (BookID) REFERENCES book(BookID)
);
