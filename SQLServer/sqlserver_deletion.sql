USE personal_library;

ALTER TABLE Publishers
DROP CONSTRAINT FK_Location;

ALTER TABLE Books
DROP CONSTRAINT FK_Publisher;

ALTER TABLE Book_Authors
DROP CONSTRAINT FK_Author_Book;

ALTER TABLE Book_Authors
DROP CONSTRAINT FK_Book_Author;

ALTER TABLE Book_Genres
DROP CONSTRAINT FK_Genre_Book;

ALTER TABLE Book_Genres
DROP CONSTRAINT FK_Book_Genre;

ALTER TABLE Book_Details
DROP CONSTRAINT FK_Detail_Book;

ALTER TABLE Book_Details
DROP CONSTRAINT FK_Book_Detail;

DROP TABLE Locations;

DROP TABLE Publishers;

DROP TABLE Authors;

DROP TABLE Books;

DROP TABLE Details;

DROP TABLE Genres;

DROP TABLE Book_Authors;

DROP TABLE Book_Genres;

DROP TABLE Book_Details;

Use master;
Go

DROP DATABASE personal_library;
