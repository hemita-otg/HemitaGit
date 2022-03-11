alter procedure [customstepsp_buac](
@Category varchar(50),
@Flag int,
@IsDebug int = 0
)
AS
Begin
--exec [CustomStepSP_buac] 'buac',2,1
declare @alt nvarchar(max)
declare @sql nvarchar(max)
declare @vchrControDbPrefix varchar(50)
SET @vchrControDbPrefix = dbo.mtfunc_GetDatabasePrefix('Control')

if @Category='buac' and @flag=2
begin

set @alt='If Exists (select top 1 name from tempdb.dbo.sysobjects where xtype=''u'' and name='''+@Category+'tradeclass'')
		Drop Table tempdb.dbo.'+@Category+'tradeclass'
	if @IsDebug=1
		Print @alt
	else
		Exec (@alt)

set @alt='select * into tempdb.dbo.'+@Category+'tradeclass from ' + @vchrControDbPrefix + ''+@Category+'tradeclass'
if @IsDebug=1
		Print @alt
	else
		Exec (@alt)

set @alt='update a set a.tradeclass=b.tradeclass, tradeclassid=b.tradeclassid
	from '+@category+'flyerreports a
	inner join tempdb..'+@category+'tradeclass b
	on a.advertiser=b.advertiser and a.market=b.market'
	if @IsDebug=1
		Print @alt
	else
		Exec (@alt)
set @alt='update a set a.tradeclass=b.tradeclass, tradeclassid=b.tradeclassid
	from '+@category+'pagereports a
	inner join tempdb..'+@category+'tradeclass b
	on a.advertiser=b.advertiser and a.market=b.market'
	if @IsDebug=1
		Print @alt
	else
		Exec (@alt)

set @alt='exec mt_proc_Create_DisplayTables'''+@Category+''',1'
If @IsDebug = 1
		Print @Alt
	Else
		Exec (@Alt)
end
end
