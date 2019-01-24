DROP DATABASE IF EXISTS moviedb;
CREATE DATABASE moviedb;
USE moviedb;

CREATE TABLE movies(
   id	VARCHAR(10),
   title varchar(100) not null,
   year Integer not null,
   director varchar(100) not null,
   PRIMARY KEY (id)
  );
  

CREATE TABLE stars(
   id	VARCHAR(10),
   name varchar(100) not null,
   birthYear Integer,
   PRIMARY KEY (id)
  );
  
CREATE TABLE stars_in_movies(
	starId VARCHAR(10),
	movieId varchar(10),
	Foreign Key (starId)  REFERENCES stars(id) ON DELETE CASCADE,
	Foreign Key (movieId)  REFERENCES movies(id) ON DELETE CASCADE
  );
  
CREATE TABLE genres(
	id integer AUTO_INCREMENT,
	name varchar (32) not null,
    PRIMARY KEY (id)
  );
  
CREATE TABLE genres_in_movies(
	genreId integer,
	movieId varchar(10),
    Foreign Key (genreId)  REFERENCES genres(id) ON DELETE CASCADE,
    Foreign Key (movieId)  REFERENCES movies(id) ON DELETE CASCADE
  );

CREATE TABLE creditcards(
	id varchar(20),
	firstName varchar(50)  not null,
    lastName varchar(50) not null,
    expiration date not null,
	PRIMARY KEY(id)
  );

CREATE TABLE customers(
	id integer AUTO_INCREMENT,
	firstName varchar(50)  not null,
    lastName varchar(50)  not null,
    ccId varchar(20)  not null,
    address varchar(200)  not null,
    email varchar(50)  not null,
    password varchar(20)  not null,
    PRIMARY KEY (id),
    Foreign Key (ccId)  REFERENCES creditcards(id) ON DELETE CASCADE
  );

CREATE TABLE sales(
	id integer AUTO_INCREMENT,
	customerId integer not null,
    movieId varchar(10) not null,
    saleDate date not null,
    PRIMARY KEY (id),
	Foreign Key (customerId)  REFERENCES customers(id) ON DELETE CASCADE,
	Foreign Key (movieId)  REFERENCES movies(id) ON DELETE CASCADE
  );


CREATE TABLE ratings(
	movieId varchar(10),
	rating float not null,
    numVotes integer not null,
	Foreign Key (movieId)  REFERENCES movies(id) ON DELETE CASCADE
  );




