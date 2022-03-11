select distinct c.clientname,c.homepagelink,b.market
from MasterClientCWM a
join RetMkt b 
on a.RetMktID=b.RetMktID
join mt2sql14.sitecontrol.dbo.vw_catinfo c
on a.CategoryCodeID=c.categorycodeid
where market in ('Albany, NY','Baltimore, MD','Cleveland, OH','Dallas, TX','Los Angeles, CA','Minneapolis/St.Paul, MN','Orlando, FL','Portland, OR')
and clientserver in ('mt2sql04','mt2sql07','mt2sql08')
and (clientpdt=1 or cwmfull=1)
order by 1,2


select distinct c.clientname,c.homepagelink,b.market
from MasterClientCWMpep a
join RetMktpep b 
on a.RetMktID=b.RetMktID
join mt2sql14.sitecontrol.dbo.vw_catinfo c
on a.CategoryCodeID=c.categorycodeid
where market in ('Los Angeles, CA','Atlanta, GA','Chicago, IL','Boston, MA','Minneapolis, MN','New York, NY','Cleveland, OH','Philadelphia, PA','Dallas, TX','boston, ma')
and fvcctype in (2,4,6)
and (clientpdt=1 or cwmfull=1)
and Advertiser='fsi'
order by 1,2


