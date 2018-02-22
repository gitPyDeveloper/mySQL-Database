CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_GET_TICKER`(IN in_ticker varchar(30), 
								  IN in_field varchar(30), 
								  IN in_source varchar(30),
                                  IN in_key varchar(100))
BEGIN

	Declare p_accessLevel int;
    Declare p_tickerLevel int;
    
    select accessLevel
    into p_accessLevel
    from crtuseraccess
    where userKey = in_key;
    
    if p_accessLevel is Null then
		
        select 'Invalid User';
	
    else
    
		select accessLevel
        into p_tickerLevel
        from crttickername
        where ticker = in_ticker and
        field = in_field and
        data_source = in_source;
        
        if p_accessLevel < p_tickerLevel then
        
			select 'User is not authorized';
		
        else
    
			select db_date , db_value
			from CRTTickerValue where crtvalue_id = (
			select crt_id
			from crttickerName
			where ticker = in_ticker 
			and field = in_field
			and data_source = in_source)
			order by db_date;
            
		end if;
    
    end if;
        
END