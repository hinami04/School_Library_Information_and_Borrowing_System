CREATE TABLE penalty (
    PenaltyID  VARCHAR(20) PRIMARY KEY,
    Amount     DECIMAL(8,2),
    Status     VARCHAR(20),
    BorrowID   VARCHAR(25),

    CONSTRAINT fk_penalty_borrow
        FOREIGN KEY (BorrowID) REFERENCES borrowtransaction(BorrowID)
);
