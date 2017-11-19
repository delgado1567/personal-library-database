CREATE DATABASE personal_library;
GO

USE personal_library;

CREATE TABLE Locations (
ID int NOT NULL PRIMARY KEY,
City varchar(30) NOT NULL,
State char(2) NOT NULL);

CREATE TABLE Publishers (
ID int NOT NULL PRIMARY KEY,
Company varchar(60) NOT NULL,
LocationID int NOT NULL,
CONSTRAINT FK_Location FOREIGN KEY (LocationID) REFERENCES Locations(ID));

CREATE TABLE Authors (
ID int NOT NULL PRIMARY KEY,
Fname varchar(30) NOT NULL,
Mname varchar(30) DEFAULT '',
Lname varchar(30) NOT NULL);

CREATE TABLE Books (
ISBN13 bigint NOT NULL PRIMARY KEY CHECK (ISBN13 <= 9999999999999),
Format varchar(9) NOT NULL DEFAULT 'paperback',
Edition tinyint NOT NULL DEFAULT 1 CHECK (Edition <= 99),
Pages int NOT NULL CHECK (Pages <= 99999),
ISBN10 int UNIQUE CHECK (ISBN10 <= 9999999999),
PublisherID int NOT NULL,
CONSTRAINT FK_Publisher FOREIGN KEY (PublisherID) REFERENCES Publishers(ID));

CREATE TABLE Details (
ID int NOT NULL PRIMARY KEY,
Title varchar(60) NOT NULL,
CoverPath varchar(40) UNIQUE,
SynopsisPath varchar(40) UNIQUE,
TableOfContentsPath varchar(40) UNIQUE);

CREATE TABLE Genres (
ID int NOT NULL PRIMARY KEY,
Genre varchar(20) NOT NULL);

CREATE TABLE Book_Authors (
BookISBN13 bigint NOT NULL CHECK (BookISBN13 <= 9999999999999),
AuthorID int NOT NULL,
CONSTRAINT PK_Book_Author PRIMARY KEY (BookISBN13,AuthorID),
CONSTRAINT FK_Author_Book FOREIGN KEY (BookISBN13) REFERENCES Books(ISBN13),
CONSTRAINT FK_Book_Author FOREIGN KEY (AuthorID) REFERENCES Authors(ID));

CREATE TABLE Book_Genres (
BookISBN13 bigint NOT NULL CHECK (BookISBN13 <= 9999999999999),
GenreID int NOT NULL,
CONSTRAINT PK_Book_Genre PRIMARY KEY (BookISBN13, GenreID),
CONSTRAINT FK_Genre_Book FOREIGN KEY (BookISBN13) REFERENCES Books(ISBN13),
CONSTRAINT FK_Book_Genre FOREIGN KEY (GenreID) REFERENCES Genres(ID));

CREATE TABLE Book_Details (
BookISBN13 bigint NOT NULL CHECK (BookISBN13 <= 9999999999999),
DetailID int NOT NULL,
CONSTRAINT PK_Book_Details PRIMARY KEY (BookISBN13, DetailID),
CONSTRAINT FK_Detail_Book FOREIGN KEY (BookISBN13) REFERENCES Books(ISBN13),
CONSTRAINT FK_Book_Detail FOREIGN KEY (DetailID) REFERENCES Details(ID));
