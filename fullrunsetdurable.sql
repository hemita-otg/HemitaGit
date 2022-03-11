Declare @SQL nvarchar(max)
,@Databasecategory varchar(100)='gameADL'

set @SQL='INSERT INTO ADlertToFVExportMarkedFull(databasecategory,fullexportdt) values('''+@Databasecategory+''',cast(getdate() as date))'
 
exec MT1SQL01.Masterdata.dbo.sp_executesql @sql 

select * from MT1SQL01.Masterdata.dbo.ADlertToFVExportMarkedFull order by 3 desc