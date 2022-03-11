select distinct clientname,homepagelink,b.Advertiser,b.market,
case when b.media in ('International','Instore Coupon Books','Newspaper','Newspaper (ROP)','Testing','Mailer','Archive Circular','Bonus Pages') or a.mediaid is null then 'Circular' 
 when b.media in ('Web Promotion') then  'Web Promotion' 
 when b.media in ('Email Promotion') then  'Email Promotion' End as media
from MasterClientCWMPEP a
join retmktpep b
on a.retmktid=b.retmktid --and a.mediaid=b.mediaid
join mt2sql14.sitecontrol.dbo.vw_catinfo c
on a.CategoryCodeID=c.categorycodeid
--left join retmktpep d 
--on b.mktid=d.mktid and b.mediaid=d.mediaid
--where (a.mediaid in (1,8,12010005,12010006) or a.mediaid is null) 
where fvcctype in (2,4,6)
order by 1,2,3,4

--legacy
select distinct clientname,homepagelink,b.Advertiser,b.market
--case when b.media in ('International','Instore Coupon Books','Newspaper','Newspaper (ROP)','Testing','Mailer','Archive Circular','Bonus Pages') or a.mediaid is null then 'Circular' 
-- when b.media in ('Web Promotion') then  'Web Promotion' 
-- when b.media in ('Email Promotion') then  'Email Promotion' End as media
from MasterClientCWM a
join retmkt b
on a.retmktid=b.retmktid --and a.mediaid=b.mediaid
join mt2sql14.sitecontrol.dbo.vw_catinfo c
on a.CategoryCodeID=c.categorycodeid
--left join retmktpep d 
--on b.mktid=d.mktid and b.mediaid=d.mediaid
--where (a.mediaid in (1,8,12010005,12010006) or a.mediaid is null) 
where clientserver in ('mt2sql04','mt2sql07','mt2sql08','mt2sql11')
order by 1,2,3,4



--select * from MasterClientCWMPEP where clientid=1175

--select distinct media from retmktpep







