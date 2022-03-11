declare @catcode varchar(35)

declare @cnt int
set @catcode = ''
declare @sql nvarchar(max);

declare curRMC cursor for
select category from mt2sql14.sitecontrol.dbo.categorycode 
--where FVCCType = 3 and (ClientPDT=1) and ClientServer=@@SERVERNAME and BUPT=1
where category in('kcca50')
open curRMC

fetch next from curRMC
into @catcode

while @@fetch_Status = 0
begin

set @sql='
Update '+@catcode+'DetailReports Set PtUpdatedOn=NULL,ProductTerritory=null,ProductTerritoryID=0
Exec BatchUpdate '''+@catcode+''',0,1
Exec mt_proc_Create_ID_Update '''+@catcode+'DetailReports'',''ProductTerritory''
Exec mt_proc_Create_DisplayTables '''+@catcode+'''
'
    print @catcode +' started'
    exec (@sql)
    print @catcode +' completed'
    
fetch next from curRMC
into @catcode

END
close curRMC
deallocate curRMC