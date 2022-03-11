select distinct b.clientname,b.category,b.clientserver
from ClientCWMException a
join mt2sql14.sitecontrol.dbo.vw_catinfo b
on a.CategoryCodeID=b.categorycodeid
where a.FieldValue in ('23875','24816') and  Fieldid= 153
and (b.cwmfull=1)
and isnull(b.isadlert,0)=0
order by 3

select * from retmkt
where RetMktID in (23875,24816)

select * from MasterClientCoverage..ClientCWMException
where FieldValue in ('23875','24816')
and Fieldid= 153
order by 1