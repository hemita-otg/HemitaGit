select distinct clientname,b.homepagelink,Advertiser,market 
from masterclientcwm a
join mt2sql14.sitecontrol.dbo.vw_catinfo b
on a.CategoryCodeID=b.categorycodeid
join retmkt c
on a.RetMktID=c.RetMktID
join mt2sql14.subscription.dbo.clientdatabases d
on a.CategoryCodeID=d.CategoryCodeID
 where a.retmktid in (select distinct retmktid from retmkt where market in ('Twitter','Facebook'))
 and b.homepagelink like '%social%' and (b.cwmfull=1 or b.clientpdt=1) and d.status=1 
union
select distinct clientname,b.homepagelink,Advertiser,market 
from ClientCWMException a
join mt2sql14.sitecontrol.dbo.vw_catinfo b
on a.CategoryCodeID=b.categorycodeid
join retmkt c
on a.FieldValue=c.RetMktID
join mt2sql14.subscription.dbo.clientdatabases d
on a.CategoryCodeID=d.CategoryCodeID
 where a.FieldValue in (select distinct retmktid from retmkt where market in ('Twitter','Facebook'))
 and a.Fieldid=153 and d.status=1 
 and b.homepagelink like '%social%' and (b.cwmfull=1 or b.clientpdt=1) 
order by 1,2,3,4


