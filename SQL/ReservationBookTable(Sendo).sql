CREATE TABLE reservationbook (
    BookID         VARCHAR(50),
    ReservationID  VARCHAR(20),

    PRIMARY KEY(BookID, ReservationID),

    CONSTRAINT fk_reservationbook_book
        FOREIGN KEY (BookID) REFERENCES book(BookID),
    CONSTRAINT fk_reservationbook_res
        FOREIGN KEY (ReservationID) REFERENCES reservation(ReservationID)
);
