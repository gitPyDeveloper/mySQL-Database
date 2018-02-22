CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CREATE_USER`(IN in_name varchar(30),
															 IN in_key varchar(100))
BEGIN
	
    
    Declare p_accessLevel int;
    set p_accessLevel = 0;
    
    select accessLevel
    into p_accessLevel
    from crtuseraccess
    where userName = in_name;
    
    if p_accessLevel = '' then

		insert into crtuseraccess(userName,userKey,accessLevel,last_update)
        values(in_name,in_key,1,CURRENT_TIMESTAMP);   

	else

		select userKey
		from crtuseraccess
		where userName = in_name;
    
    end if;




		


  
END