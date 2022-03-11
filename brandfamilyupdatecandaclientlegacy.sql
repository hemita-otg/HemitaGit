declare @catcode varchar(35)

declare @cnt int
set @catcode = ''
declare @sql nvarchar(max);

declare curRMC cursor for
select  distinct Category
from Categorycodetable
where category in ('acoca50','afca','afxca50','allca50','asmca50','atnca','bicca50','cansca','clxca50','conca50','corca50','cotca','cott','csca50','danca50','diaca50','edsca50','fbca','fbrca','fclca50','henca','hlfca50','itaca','itca50','jffca50','jnjca50','kcca50','labca','lasca50','lclca50','mcca50','meica50','mmmca50','nchca50','nwca50','olyca50','penca','pepca50','pofca','prgca50','ronca50','scjca50','simca','stoca50','unica50','vanca50','wlmca50','casPEP','blaca','cabca','cabcat','casca','cfca','colca50','emccan','genca50','gmca','gskca50','herca','jlca50','kruca50','linca50','lisca','mabca','mbca','mlcca50','ntca','pdwca','pfabca','pfzca50','pfzcan','pinca','pmca','rbca50','wcmca','abtca50','agpca50','alca','baxca','bayca50','bcrca','bdfca50','bfca','blsca','bngca','burca','camca','CBNC','ccca50','cnrca','comca','craca','crgca','delca','dfca','dfcac','droca','edwca','effca','eofca','ferca','fpca','framca','gpca','gtca','infca','ivo','jsca','kaoca','kelca','kkca','kraca50','lorca50','lvca','marca50','mcc50','METCA','mheyca','molsca','monca','mopca','motca50','mrica50','nayca','newca50','npca','nstca50','NSTCAN','osca','parca50','pdfca','pdlca50','pelca','ptca','purca50','redca','revca','rexca','saca','scica50','scoca50','sdca','sdpca50','slbca','smuca50','snca','spbca','srpca50','wfca','wnpca50')
and clientserver= @@SERVERNAME
order by 1 
open curRMC

fetch next from curRMC
into @catcode

while @@fetch_Status = 0
begin 

set @sql='Update '+@catcode+'DetailReports Set PTUpdatedOn=NULL

Exec BatchUpdate '''+@catcode+''',0,1

Exec mt_proc_Create_ID_Update '''+@catcode+'DetailReports'', ''ProductTerritory''

Exec mt_proc_Create_DisplayTables '''+@catcode+''''

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










