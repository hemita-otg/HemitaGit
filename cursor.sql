declare @catcode varchar(35)

declare @cnt int
set @catcode = ''
declare @sql nvarchar(max);

declare curRMC cursor for
select distinct b.Category 
from mt2sql14.sitecontrol.dbo.TableNames a
join mt2sql14.sitecontrol.dbo.vw_catinfo b 
on a.CategoryCodeID = b.CategoryCodeId
where ClientTableName like '%mastercanproductterritory%' and (b.ClientPDT=1 ) and (b.status=1) 
and b.bupt=1 and b.ClientServer =@@SERVERNAME 
order by 1 
open curRMC

fetch next from curRMC
into @catcode

while @@fetch_Status = 0
begin 

set @sql='update '+@catcode+'detailreports
set productterritory=null, PtUpdatedOn=null

Exec BatchUpdate '''+@catcode+''',0,1

exec mt_proc_Create_ID_Update '''+@catcode+'detailreports'',''productterritory'' 
exec mt_proc_Create_DisplayTables '''+@catcode+''' 
'


	print @catcode +' Started'
	--print (@sql)
	exec (@sql)
	print @catcode +' completed'
	
fetch next from curRMC
into @catcode

END                       
close curRMC
deallocate curRMC

 ----
 --select distinct * from tempdb..repmarket 

-- drop table tempdb..giantcase
-- select *
--into tempdb..giantcase 
--from mt2sql14.tempdb.dbo.giantcase
--where 1=2
