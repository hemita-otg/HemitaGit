--insert into robin.acfv.dbo.ACFVRetMktImport
select distinct retailer_i,company_nm ,city_i ,city_nm,state_i ,state_c ,getdate(),1,null,null 
from robin.acfv.dbo.ACFVRetMktImport 
where company_nm  = 'Price Chopper (Golub)' 
and city_nm = 'Albany'