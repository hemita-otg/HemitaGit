use ApimaPractice

CREATE PROCEDURE [dbo].[CustomStepSP_dtzpep] 
(
@Category varchar(50),
@Flag int,
@IsDebug int = 0
)
AS
Begin
--exec [CustomStepSP_dtzpep] 'dtzpep',1,1
Declare @SQL NVARCHAR(max)
---------------------------------------------------------------------------------------------------------------------------------------------

If @Category = 'dtzpep' and @Flag=1
Begin

	Set @SQL='UPDATE ' + @Category + 'FlyerReports Set Advertiser = ''Albertsons POR'',AdvertiserID=12042783 Where Advertiser = ''Albertsons NW'' And Market = ''Portland, OR'''
	
	If @IsDebug=1
		Print @SQL
	Else
		Exec (@SQL)

	Set @SQL='UPDATE ' + @Category + 'FlyerReports Set Advertiser = ''Albertsons SEA'',AadvertiserID=12042782 Where Advertiser = ''Albertsons NW'' And Market = ''Seattle, WA'''
	
	If @IsDebug=1
		Print @SQL
	Else
		Exec (@SQL)

	
	Set @SQL='UPDATE ' + @Category + 'PageReports Set Advertiser = ''Albertsons POR'',AdvertiserID=12042783 Where Advertiser = ''Albertsons NW'' And Market = ''Portland, OR'''
	
	If @IsDebug=1
		Print @SQL
	Else
		Exec (@SQL)

	Set @SQL='UPDATE ' + @Category + 'PageReports Set Advertiser = ''Albertsons SEA'',AdvertiserID=12042782 Where Advertiser = ''Albertsons NW'' And Market = ''Seattle, WA'''
	
	If @IsDebug=1
		Print @SQL
	Else
		Exec (@SQL)


	---Create Distables
	Set @SQL='EXECUTE mt_proc_Create_DisplayTables ''' + @Category + ''''
	If @IsDebug = 1
		Print @SQL
	Else
		Exec (@SQL)

End
---------------------------------------------------------------------------------------------------------------------------------------------
End


--exec [CustomStepSP_dtzpep] 'dtzpep',1,1
