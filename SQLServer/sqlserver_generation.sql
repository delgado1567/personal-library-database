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
LocationID int NOT NULL FOREIGN KEY REFERENCES Locations(ID));

CREATE TABLE Authors (
ID int NOT NULL PRIMARY KEY,
Fname varchar(30) NOT NULL,
Mname varchar(30) DEFAULT '',
Lname varchar(30) NOT NULL);

CREATE TABLE Books (
ISBN13 bigint(13) NOT NULL PRIMARY KEY,
Format varchar(9) NOT NULL DEFAULT 'paperback',
Edition tinyint(2) NOT NULL DEFAULT 1,
Pages int(5) NOT NULL,
ISBN10 int(10) UNIQUE,
PublisherID int NOT NULL FOREIGN KEY REFERENCES Publishers(ID));

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
BookISBN13 bigint(13) NOT NULL FOREIGN KEY REFERENCES Books(ISBN13),
AuthorID int NOT NULL FOREIGN KEY REFERENCES Authors(ID),
CONSTRAINT PK_Book_Author PRIMARY KEY (BookISBN13,AuthorID));

CREATE TABLE Book_Genres (
BookISBN13 bigint(13) NOT NULL FOREIGN KEY REFERENCES Books(ISBN13),
GenreID int NOT NULL FOREIGN KEY REFERENCES Genres(ID),
CONSTRAINT PK_Book_Genre PRIMARY KEY (BookISBN13, GenreID));

CREATE TABLE Book_Details (
BookISBN13 bigint(13) NOT NULL FOREIGN KEY REFERENCES Books(ISBN13),
DetailID int NOT NULL FOREIGN KEY REFERENCES Details(ID),
CONSTRAINT PK_Book_Details PRIMARY KEY (BookISBN13, DetailID));
