update categorycodetable set isfull = 1 where category in  ('kaoca')
--select * from categorycodetable where  category in  ('gal50','mus50','fmd50','adGAL50','adFMD50')
Declare @CategoryCodeTable varchar(255)
Declare @Category varchar(50)
Declare @NSQL Nvarchar(1000)
Declare @ClientTable VARCHAR(50)
Declare @FVver tinyint
Declare @CustomStep Bit
Declare @ROWCount int = 0
Declare @i int = 1

SELECT @ClientTable = dbo.mtfunc_GetDatabasePrefix('Sub') + 'ClientProfile'
EXECUTE GetTableName 'CategoryCode', 0, @CategoryCodeTable OUTPUT

if object_id('tempdb..#myTab') is not null
	Drop Table #myTab
Create TABLE  #myTab (Catid INT IDENTITY(1,1),Category varchar(15),FVver int,CustomStep Int)

SET @NSQL = 'insert into #myTab(category, FVver, CustomStep)
Select Category, FVver,IsNULL(CustomStep,0) CustomStep From ' + @CategoryCodeTable + ' WHERE category in  (''kaoca'')
		order by ProcessOrder '
execute (@NSQL)

SELECT @ROWCount = COUNT(Distinct Catid) FROM #myTab 
print @ROWCount

WHILE (@i <= @ROWCount) 
	BEGIN 
	
	SET @NSQL = 'Select @Category = Category, @FVver = FVver,@CustomStep=IsNULL(CustomStep,0) From #myTab where Catid= '+cast(@i as varchar)
		execute sp_executesql @NSQL, N'@Category varchar(15) OUTPUT,@FVver tinyint OUTPUT,@CustomStep Bit OUTPUT', @Category OUTPUT, @FVver OUTPUT,@CustomStep OUTPUT
	print @Category + '  ' + cast(@i as varchar)
	EXECUTE('insert into categorycodelog values('''+ @Category +''',''StartCWM for ' + @Category +''',''StartCWM - ' + @Category +''',getdate())')
	
	IF Exists(Select Category from MT2SQL14.SiteControl.dbo.CategoryCode_NF_MT2 where Category=@Category)	
			EXECUTE CreateFlyerReports @Category,'',0
	Else

	Begin
		IF IsNull(@FVver,0) < 5
			EXECUTE CreateClientCWMTable @Category,'',0
		Else
			EXECUTE CreateClientCWMTable_50 @Category,'',0
	End
	
	EXECUTE('insert into categorycodelog values('''+ @Category +''',''EndCWM for ' + @Category +''',''EndCWM - ' + @Category +''',getdate())')
	
	If @CustomStep=1
	begin
		Print @Category +' CustoomStep run'
       Exec MasterCustomUpdate @Category,2,0
	End
	--EXECUTE('update  ' + @CategoryCodeTable + '  set ClientRun = 0 where Category = ''' + @Category + '''')

	--Set FutureDelete=1 For DAA Code
	--EXECUTE('update  ' + @CategoryCodeTable + '  set FD = 1 , FDTime = getdate() where ISNULL(IsDAA,0)=1 and Category = ''' + @Category + '''')

	--SET @Category = ''
	--SET @NSQL = 'Select Top 1 @Category = Category, @FVver = FVver,@CustomStep=IsNULL(CustomStep,0) From ' + @CategoryCodeTable + ' WHERE category in (''fdmpg50'',''FDMPGPR'',''FSI50'',''FSIPNG50'',''gil50'',''PGfeed50'',''PGNBDCon50'',''pgo'',''PGPR50'',''pngca50'') order by ProcessOrder '
	--execute sp_executesql @NSQL, N'@Category varchar(15) OUTPUT,@FVver tinyint OUTPUT,@CustomStep Bit OUTPUT', @Category OUTPUT, @FVver OUTPUT,@CustomStep OUTPUT
	
	SELECT @i = @i + 1

END

