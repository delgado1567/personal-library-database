USE personal_library;

ALTER TABLE Publishers
DROP FOREIGN KEY FK_Location;

ALTER TABLE Books
DROP FOREIGN KEY FK_Publisher;

ALTER TABLE Book_Authors
DROP FOREIGN KEY FK_Book;

ALTER TABLE Book_Authors
DROP FOREIGN KEY FK_Author;

ALTER TABLE Book_Genres
DROP FOREIGN KEY FK_Book;

ALTER TABLE Book_Genres
DROP FOREIGN KEY FK_Author;

ALTER TABLE Book_Details
DROP FOREIGN KEY FK_Book;

ALTER TABLE Book_Details
DROP FOREIGN KEY FK_Detail;

DROP TABLE Locations;

DROP TABLE Publishers;

DROP TABLE Authors;

DROP TABLE Books;

DROP TABLE Details;

DROP TABLE Genres;

DROP TABLE Book_Authors;

DROP TABLE Book_Genres;

DROP TABLE Book_Details;

DROP DATABASE personal_library;
