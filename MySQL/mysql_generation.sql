CREATE DATABASE personal_library;
GO

USE personal_library;

CREATE TABLE Locations (
ID int NOT NULL,
City varchar(30) NOT NULL,
State char(2) NOT NULL,
PRIMARY KEY(ID));

CREATE TABLE Publishers (
ID int NOT NULL,
Company varchar(60) NOT NULL,
LocationID int NOT NULL,
PRIMARY KEY(ID),
CONSTRAINT FK_Location FOREIGN KEY(LocationID) REFERENCES Locations(ID));

CREATE TABLE Authors (
ID int NOT NULL,
Fname varchar(30) NOT NULL,
Mname varchar(30) DEFAULT '',
Lname varchar(30) NOT NULL,
PRIMARY KEY(ID));

CREATE TABLE Books (
ISBN13 bigint(13) NOT NULL,
Format varchar(9) NOT NULL DEFAULT 'paperback',
Edition tinyint(2) NOT NULL DEFAULT 1,
Pages mediumint(5) NOT NULL,
ISBN10 int(10),
PublisherID int NOT NULL,
PRIMARY KEY(ISBN13),
CONSTRAINT FK_Publisher FOREIGN KEY(PublisherID) REFERENCES Publishers(ID),
CONSTRAINT UQ_ISBN10 UNIQUE(ISBN10));

CREATE TABLE Details (
ID int NOT NULL,
Title varchar(60) NOT NULL,
CoverPath varchar(40),
SynopsisPath varchar(40),
PRIMARY KEY(ID),
TableOfContentsPath varchar(40),
CONSTRAINT UQ_CoverPath UNIQUE(CoverPath),
CONSTRAINT UQ_SynopsisPath UNIQUE(SynopsisPath),
CONSTRAINT UQ_TableOfContentsPath UNIQUE(TableOfContentsPath));

CREATE TABLE Genres (
ID int NOT NULL,
Genre varchar(20) NOT NULL,
PRIMARY KEY(ID));

CREATE TABLE Book_Authors (
BookISBN13 bigint(13) NOT NULL,
AuthorID int NOT NULL,
CONSTRAINT PK_Book_Author PRIMARY KEY (BookISBN13,AuthorID),
CONSTRAINT FK_Book FOREIGN KEY(BookISBN13) REFERENCES Books(ISBN13),
CONSTRAINT FK_Author FOREIGN KEY(AuthorID) REFERENCES Authors(ID));

CREATE TABLE Book_Genres (
BookISBN13 bigint(13) NOT NULL,
GenreID int NOT NULL,
CONSTRAINT PK_Book_Genre PRIMARY KEY (BookISBN13, GenreID),
CONSTRAINT FK_Book FOREIGN KEY(BookISBN13) REFERENCES Books(ISBN13),
CONSTRAINT FK_Author FOREIGN KEY(GenreID) REFERENCES Genres(ID));

CREATE TABLE Book_Details (
BookISBN13 bigint(13) NOT NULL,
DetailID int NOT NULL,
CONSTRAINT PK_Book_Details PRIMARY KEY (BookISBN13, DetailID),
CONSTRAINT FK_Book FOREIGN KEY(BookISBN13) REFERENCES Books(ISBN13),
CONSTRAINT FK_Detail FOREIGN KEY(DetailID) REFERENCES Details(ID));
