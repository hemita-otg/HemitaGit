

--insert into CategoryMarkedFull 
select categorycodeid,getdate(),'hbhagat'
from vw_catinfo where category in ( select distinct categorycode from PRDCNDCustomCategoryUpdates)