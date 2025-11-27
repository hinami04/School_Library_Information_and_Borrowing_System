CREATE TABLE reservation (
    ReservationID  VARCHAR(20) PRIMARY KEY,
    DateReserved   DATE NOT NULL,
    DateStatus     VARCHAR(20),
    StudentID      VARCHAR(15),

    CONSTRAINT fk_reservation_student
        FOREIGN KEY (StudentID) REFERENCES student(StudentID)
);
