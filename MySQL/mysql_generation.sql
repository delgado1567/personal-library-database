CREATE DATABASE personal_library;
GO

USE personal_library;

CREATE TABLE Locations (
ID int not null,
City varchar(30) not null,
State char(2) not null,
PRIMARY KEY(ID));

CREATE TABLE Publishers (
ID int not null,
Company varchar(60) not null,
LocationID int not null,
PRIMARY KEY(ID),
CONSTRAINT FK_Location FOREIGN KEY(LocationID) REFERENCES Locations(ID));

CREATE TABLE Authors (
ID int not null,
Fname varchar(30) not null,
Mname varchar(30) DEFAULT '',
Lname varchar(30) not null);

CREATE TABLE Books (
ISBN13 bigint(13) not null,
Format varchar(9) not null DEFAULT 'paperback',
Edition tinyint(2) not null DEFAULT 1,
Pages mediumint(5) not null,
ISBN10 int(10),
PublisherID int not null,
PRIMARY KEY(ISBN13),
CONSTRAINT FK_Publisher FOREIGN KEY(PublisherID) REFERENCES Publishers(ID),
CONSTRAINT UQ_ISBN10 UNIQUE(ISBN10));

CREATE TABLE Details (
ID int not null,
Title varchar(60) not null,
CoverPath varchar(40),
SynopsisPath varchar(40),
PRIMARY KEY(ID),
TableOfContentsPath varchar(40),
CONSTRAINT UQ_CoverPath UNIQUE(CoverPath),
CONSTRAINT UQ_SynopsisPath UNIQUE(SynopsisPath),
CONSTRAINT UQ_TableOfContentsPath UNIQUE(TableOfContentsPath));

CREATE TABLE Genres (
ID int not null,
Genre varchar(20) not null,
PRIMARY KEY(ID));

CREATE TABLE Book_Authors (
BookISBN13 bigint(13) not null,
AuthorID int not null,
CONSTRAINT PK_Book_Author PRIMARY KEY (BookISBN13,AuthorID),
CONSTRAINT FK_Book FOREIGN KEY(BookISBN13) REFERENCES Books(ISBN13),
CONSTRAINT FK_Author FOREIGN KEY(AuthorID) REFERENCES Authors(ID));

CREATE TABLE Book_Genres (
BookISBN13 bigint(13) not null,
GenreID int not null,
CONSTRAINT PK_Book_Genre PRIMARY KEY (BookISBN13, GenreID),
CONSTRAINT FK_Book FOREIGN KEY(BookISBN13) REFERENCES Books(ISBN13),
CONSTRAINT FK_Author FOREIGN KEY(GenreID) REFERENCES Genres(ID));

CREATE TABLE Book_Details (
BookISBN13 bigint(13) not null,
DetailID int not null,
CONSTRAINT PK_Book_Details PRIMARY KEY (BookISBN13, DetailID),
CONSTRAINT FK_Book FOREIGN KEY(BookISBN13) REFERENCES Books(ISBN13),
CONSTRAINT FK_Detail FOREIGN KEY(DetailID) REFERENCES Details(ID));
