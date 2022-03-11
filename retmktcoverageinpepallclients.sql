select distinct clientname,homepagelink,Advertiser,Market,'Circular' media,clientpdt,cwmfull,ispdt from MasterClientCWMPEP a
join retmktpep b
on a.retmktid=b.retmktid
join mt2sql14.sitecontrol.dbo.vw_catinfo c
on a.CategoryCodeID=c.categorycodeid
 where a.retmktid in (12815,12804,12814,12817) and a.mediaid is null
union
select distinct clientname,homepagelink,Advertiser,Market,media,clientpdt,cwmfull,ispdt from MasterClientCWMPEP a
join retmktpep b
on a.retmktid=b.retmktid and a.mediaid=b.mediaid
join mt2sql14.sitecontrol.dbo.vw_catinfo c
on a.CategoryCodeID=c.categorycodeid
where a.retmktid in (12815,12804,12814,12817) and media is not null
 

 select distinct * from retmktpep where advertiser like '%peapod%'