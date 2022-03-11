


declare @Category varchar(50)
set @Category='mil50'
declare @IsDebug int 
set @IsDebug= 1
Declare @SQL VARCHAR(max)
Declare @vchrControDbPrefix varchar(50)
SET @vchrControDbPrefix = dbo.mtfunc_GetDatabasePrefix('control')

Set @SQL='IF EXISTS(SELECT * FROM tempdb..sysobjects WHERE name = ''' + @Category + 'ChainOrgTypeupdate'' AND xtype = ''u'') 
		drop table tempdb..' + @Category + 'ChainOrgTypeupdate'
	If @IsDebug = 1
		Print @SQL
	Else
		Exec (@SQL)
Set @SQL='Select  * into tempdb..' + @Category + 'ChainOrgTypeupdate From '+@vchrControDbPrefix+ @Category + 'ChainOrgTypeupdate'
	 If @IsDebug = 1
		Print @SQL
	Else
		Exec (@SQL)

Set @SQL='update a set a.addist=b.addist
from ' + @Category + 'flyerReports a
join tempdb..' + @Category + 'ChainOrgTypeupdate b 
on a.Advertiser=b.Advertiser and a.Market=b.Market
where isnull(a.addist,'''')!=isnull(b.addist,'''')'
	 If @IsDebug = 1
		Print @SQL
	Else
		Exec (@SQL)

Set @SQL='update a  set a.addist=b.addist
from ' + @Category + 'pageReports a
join tempdb..' + @Category + 'ChainOrgTypeupdate b 
on a.Advertiser=b.Advertiser and a.Market=b.Market
where isnull(a.addist,'''')!=isnull(b.addist,'''')'
	 If @IsDebug = 1
		Print @SQL
	Else
		Exec (@SQL)


