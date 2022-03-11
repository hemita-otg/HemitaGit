USE MasterData

Declare @DatabaseCategory varchar(15)
Declare @OldTypeOfExport int
Declare @NewTypeOfExport int
Declare @SQL varchar(8000) = ''

Set @DatabaseCategory='whcaADLTest'

Set @OldTypeOfExport =(select TypeOfExport from ADlertToFV where DatabaseCategory=@DatabaseCategory)
Set @NewTypeOfExport =(select pr.fullid from masterdata.dbo.ADlertToFV ata 
	join masterdata.dbo.vwADlertToFVProcRelationship pr on ata.typeofexport = pr.incrementalID
	where databasecategory=@DatabaseCategory)

If Exists(select top 1 * from masterdata.dbo.ADlertToFV ata 
join masterdata.dbo.vwADlertToFVProcRelationship pr on ata.typeofexport = pr.fullid
where databasecategory=@DatabaseCategory)
  Begin
	Print 'Old ExportId-' + cast( @OldTypeOfExport as varchar(10))
	Print 'New ExportId-' + cast (@NewTypeOfExport as varchar(10))
	
	Set @SQL='update ata set ata.typeofexport=pr.fullid ,rerun=1
	from masterdata.dbo.ADlertToFV ata 
	join masterdata.dbo.vwADlertToFVProcRelationship pr on ata.typeofexport = pr.incrementalID
	where databasecategory='''+@DatabaseCategory+''''
	Print @SQL
	--Exec (@SQL)
  End
Else
  Begin
	Print 'The Export is already set as full: ExportId-' + cast( @OldTypeOfExport as varchar(10))
	Print @OldTypeOfExport
  End


--  Select * from masterdata.dbo.ADlertToFV ata 	where databasecategory in ('adl4')
--  update ata set rerun=1,ExportStartTime='2020-01-06 00:21:40.823'	from masterdata.dbo.ADlertToFV ata 	where databasecategory in ('adl4')
