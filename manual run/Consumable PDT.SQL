Update CategoryCodetable set isfull=1 where category='kaoca'

Declare @CurProcessOrder int
Declare @category varchar(15)
Declare @PrintSQL bit
Declare @Return_Val int
Declare @RunVal bit
Declare @CategoryCodeTable varchar(255)
Declare @NSQL Nvarchar(1000)
Declare @FVver tinyint
Declare @CustomStep Bit
Declare @ROWCount int = 0
Declare @i int = 1

set nocount on          
set ansi_warnings on

EXECUTE GetTableName 'CategoryCode', 0, @CategoryCodeTable OUTPUT
select @PrintSQL = 0 -- 0 means execute the script, 1 means prints the sqls

if object_id('tempdb..#myTab') is not null
	Drop Table #myTab
Create TABLE  #myTab (Catid INT IDENTITY(1,1),Category varchar(15),FVver int,CustomStep Int)

SET @NSQL = 'insert into #myTab(category, FVver, CustomStep)
Select Category, FVver,IsNULL(CustomStep,0) CustomStep From ' + @CategoryCodeTable + ' WHERE category in   (''kaoca'')
		order by ProcessOrder '
execute (@NSQL)

SELECT @ROWCount = COUNT(Distinct Catid) FROM #myTab 
print @ROWCount


WHILE (@i <= @ROWCount) 
	BEGIN 
	
	
	SET @NSQL = 'Select @Category = Category, @FVver = FVver,@CustomStep=IsNULL(CustomStep,0) From #myTab where Catid= '+cast(@i as varchar)
		execute sp_executesql @NSQL, N'@Category varchar(15) OUTPUT,@FVver tinyint OUTPUT,@CustomStep Bit OUTPUT', @Category OUTPUT, @FVver OUTPUT,@CustomStep OUTPUT
	print @Category + '   ' +cast(@i as varchar)
	set @RunVal = 1
	if @RunVal = 1
	begin
		Select @Return_Val = 0
		EXECUTE('update ' + @CategoryCodeTable + ' set Error = null where Category = ''' + @Category + '''')

		IF Exists(Select Category from MT2SQL14.SiteControl.dbo.CategoryCode_NF_MT2 where Category=@Category)	
			Exec CreateDetailReports @Category,'',0
		ELSE
		Begin
			IF IsNull(@FVver,0) < 5
				Exec CreateClientTables @Category, 0, 0
			Else 
				Exec CreateClientTables_50_PDTIdInt @Category, @Return_Val output, @PrintSQL				
		End

		
	end
	

	EXECUTE('insert into categorycodelog values('''+ @Category +''',''EndPDT for ' + @Category +''',''EndPDT - ' + @Category +''',getdate())')

	If @CustomStep=1 
	Begin
		print @Category +' CustomStep Run'
		Exec MasterCustomUpdate @Category,1,0
	End	

	IF Exists(select category from mt2sql14.sitecontrol.dbo.[vw_MasterSegmentation] where category=@Category)
	Begin	
		print @Category +' Segmentation Run'
		Exec MasterSegmentation @Category,0
	End
	
	SELECT @i = @i + 1

END

Go




