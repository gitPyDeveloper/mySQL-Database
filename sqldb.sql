create database CRT;
USE CRT;

create table CRTuseraccess(
user_id int auto_increment UNIQUE,
userName varchar(30),
userKey varchar(100) UNIQUE NOT NULL,
accessLevel int,
last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
Primary key(userKey));

create table CRTtickername(
crt_id int auto_increment UNIQUE,
ticker varchar(30),
field varchar(30),
data_source varchar(30),
accessLevel int,
last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
Primary key(ticker,field,data_source));

CREATE TABLE CRTtickervalue(
crtvalue_id int,
db_date date,
db_value float,
last_modify TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
primary key (crtvalue_id,db_date),
foreign key (crtvalue_id) REFERENCES CRTtickername(crt_id) ON update CASCADE);