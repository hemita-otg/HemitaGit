select distinct MainOffer--,SUBSTRING(MainOffer, CHARINDEX('/', MainOffer)+1,LEN(MainOffer)) 
from chrPePDetailReports
--where MainOffer like '%/$%'
where Promotions ='x/for'

select distinct MainOffer
,LEFT(MainOffer, CHARINDEX('/', MainOffer) - 1) AS [qty]
,SUBSTRING(MainOffer, CHARINDEX('/', MainOffer)+1,LEN(MainOffer)) 
--case when (LEFT(MainOffer, CHARINDEX('/', MainOffer) - 1)) like '%[0-9]%' then [qty]='' end
from chrPePDetailReports
where MainOffer like '%/$%'


;with cte
as
(

select distinct MainOffer
,case 
when (LEFT(MainOffer, CHARINDEX('/', MainOffer) - 1)) like '[0-9]%' 
then LEFT(MainOffer, CHARINDEX('/', MainOffer) - 1) 
else  '' 
 end as qty 
from chrPePDetailReports
where MainOffer like '%/$%'
) 

select *, (case when qty = '' then '' else SUBSTRING(MainOffer, CHARINDEX('/', MainOffer)+1,LEN(MainOffer)) end Descrip 
from cte

$2.00 (Limit: 1), 5/$2.00, w/purchase/$25.00



$15.00 w/purchase/3