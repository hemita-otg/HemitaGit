
select * from (
select a.clientid,d.clientname,a.category,b.categorycodeid,c.advertiser,c.market,'Circular'media
from mt2sql14.sitecontrol.dbo.categorycode a
join mt2sql00.masterclientcoverage.dbo.masterclientcwmpep b on a.id=b.categorycodeid
join (select distinct * from mt2sql00.masterclientcoverage.dbo.retmktpep) c on b.retmktid=c.retmktid and b.mediaid is null
join mt2sql14.subscription.dbo.clientprofile d on a.clientid=d.clientid
where a.fvcctype in (2,4,6) 
union
select a.clientid,d.clientname,a.category,b.categorycodeid,c.advertiser,c.market,c.media
from mt2sql14.sitecontrol.dbo.categorycode a
join mt2sql00.masterclientcoverage.dbo.masterclientcwmpep b on a.id=b.categorycodeid
join mt2sql00.masterclientcoverage.dbo.retmktpep c on b.retmktid=c.retmktid and b.mediaid = c.mediaid
join mt2sql14.subscription.dbo.clientprofile d on a.clientid=d.clientid
where a.fvcctype in (2,4,6) and c.media in ('fsi','Web Promotion','Email Promotion')) as x
order by clientname 


