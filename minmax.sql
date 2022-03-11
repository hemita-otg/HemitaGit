declare @catcode varchar(35)

declare @cnt int
set @catcode = ''
declare @sql nvarchar(max);

declare curRMC cursor for
select distinct Category 
from mt2sql14.sitecontrol.dbo.vw_catinfo 
where ClientServer =@@SERVERNAME  and status=1 and ispdt=1
order by 1 
open curRMC

fetch next from curRMC
into @catcode

while @@fetch_Status = 0
begin 

set @sql='select '''+@catcode+''',min(addate),max(Addate) from '+@catcode+'detailreports union'


	--print @catcode +' Started'
	print (@sql)
	--exec (@sql)
	--print @catcode +' completed'
	
fetch next from curRMC
into @catcode

END                       
close curRMC
deallocate curRMC

