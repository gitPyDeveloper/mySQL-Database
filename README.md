# mySQL-Database
Use above files to create database in mysql.

sqldb.sql - Creates database CRT
The database has 3 Tables.
  1. CRTuseraccess - Tables storing keys for each user.
  2. CRTtickername - Key is combination of [ ticker, field , data_source ]
  3. CRTtickervalue - Value table refrencing tickerid. Table has date and values.
 
 Following are 3 stored procedures associated with CRT database.
 
 sp_create_user.sql :-
  The store procedure checks if userName exists in CRTuserAccess Table. If it does exists, it returns the old userKey of that user.
  Else it creates new entry in CRTuserAccess table with userName and Key.
  
sp_get_ticker.sql :- 
  The store procedure returns all date and values of the given combination of [ ticker, field, data_source ].
  It checks accessLevel of user and then returns the values. User needs accessLevel equal or more than the accessLevel mentioned for 
  the ticker. In order to see the information of ticker.

sp_upd_ticker.sql :- 
  The store procedure is used to create and update tickers. Only users with accessLevel 3 and above can create and update tickers.
  By defaults tickers are created with accessLevel 1.


The database and store procedures are used in both of the web-services.

SOAP - Tornado

RESTful - Flask
