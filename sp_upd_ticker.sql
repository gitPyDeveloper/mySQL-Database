CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPD_TICKER`(IN in_ticker varchar(30), 
								  IN in_field varchar(30), 
								  IN in_source varchar(30),
                                  IN in_accessKey varchar(100),
                                  IN in_accessLevel int,
								  IN in_date date,
                                  IN in_value float)
BEGIN
	
	Declare p_crt_id int;
    Declare p_crtvalue_id int;
    Declare p_accessLevel int;

    set p_crt_id = 0;
    set p_crtvalue_id = 0;
    set p_accessLevel = 0;

	set	in_ticker = Ucase(in_ticker);
    set	in_field = Ucase(in_field);
    set	in_source = Ucase(in_source);
    
    Select accessLevel
    into p_accessLevel
    from crtuseraccess
    where userKey = in_accessKey;
    
    if p_accessLevel = 3  then
    
		select crt_id
		into p_crt_id
		from CRTTickerName
		where ticker = in_ticker 
		and field = in_field
		and data_source = in_source;
		
		IF p_crt_id <> 0 then
		
			select crtvalue_id
			into p_crtvalue_id
			from crtTickerValue
			where crtvalue_id = p_crt_id and db_date = in_date;
			
			IF p_crtvalue_id <> 0 then
			
				UPDATE crtTickerValue set db_value = in_value,
				last_modify = CURRENT_TIMESTAMP
				where crtvalue_id = p_crt_id and db_date = in_date;
			
			ELSE
			
				insert into crtTickervalue(crtvalue_id, db_date, db_value, last_modify)
				values(p_crt_id,in_date,in_value,CURRENT_TIMESTAMP);
				
			END IF;
		
		ELSE
			
			insert into crttickerName(ticker,field,data_source,accessLevel,last_update)
			values(in_ticker,in_field,in_source,in_accessLevel,CURRENT_TIMESTAMP);   

			select crt_id
			into p_crt_id
			from CRTTickerName
			where ticker = in_ticker
			and field = in_field
			and data_source = in_source;        
			
			insert into crtTickerValue(crtvalue_id, db_date, db_value, last_modify)
			values(p_crt_id,in_date,in_value,CURRENT_TIMESTAMP);        
			
			
		END if;
    
	End if;
    
    
END