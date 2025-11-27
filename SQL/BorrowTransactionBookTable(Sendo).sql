CREATE TABLE borrowtransactionbook (
    BookID    VARCHAR(50),
    BorrowID  VARCHAR(25),

    PRIMARY KEY(BookID, BorrowID),

    CONSTRAINT fk_borrowtransbook_book
        FOREIGN KEY (BookID) REFERENCES book(BookID),

    CONSTRAINT fk_borrowtransbook_borrow
        FOREIGN KEY (BorrowID) REFERENCES borrowtransaction(BorrowID)
);
