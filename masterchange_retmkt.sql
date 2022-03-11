select distinct clientname,homepagelink,a.CategoryCodeID,b.Advertiser,b.Market
from MasterClientCWMPEP  a
join retmktpep b on a.retmktid=b.retmktid --and a.mediaid=b.mediaid
join mt2sql14.sitecontrol.dbo.vw_catinfo c on a.CategoryCodeID=c.categorycodeid
where b.advertiser = 'Food Maxx' and b.Market in ('Berkeley, CA','Oakland, CA')
--group by (clientname,homepagelink,a.CategoryCodeID,b.Advertiser,b.Market)
order by 1,2,3,4,5 --fePEP

select distinct clientname,homepagelink,a.CategoryCodeID,b.Advertiser,b.Market
from MasterClientCWMPEP  a
join retmktpep b on a.retmktid=b.retmktid --and a.mediaid=b.mediaid
join mt2sql14.sitecontrol.dbo.vw_catinfo c on a.CategoryCodeID=c.categorycodeid
where b.advertiser = 'Pak ''n Save (NAI)' and b.Market in ('Berkeley, CA','Oakland, CA')
order by 1,2 --idaPEP

select distinct clientname,homepagelink,a.CategoryCodeID,b.Advertiser,b.Market
from MasterClientCWMPEP  a
join retmktpep b on a.retmktid=b.retmktid --and a.mediaid=b.mediaid
join mt2sql14.sitecontrol.dbo.vw_catinfo c on a.CategoryCodeID=c.categorycodeid
where b.advertiser = 'Safeway EAS' and b.Market in ('Alexandria, VA','Fairfax, VA')
order by 1,2 --camPep,cffPeP,ahlPeP,idaPEP

select distinct clientname,homepagelink,a.CategoryCodeID,c.clientserver,b.Advertiser,b.Market
from MasterClientCWMPEP  a
join retmktpep b on a.retmktid=b.retmktid --and a.mediaid=b.mediaid
join mt2sql14.sitecontrol.dbo.vw_catinfo c on a.CategoryCodeID=c.categorycodeid
where b.advertiser = 'Shoppers Food & Pharmacy' and b.Market in ('Alexandria, VA','Fairfax, VA')
order by 1,2 --camPep,cffPeP,ahlPeP,idaPEP,digiPEP



(select distinct retmktid from retmktpep where advertiser = 'Shoppers Food & Pharmacy' and Market in ('Alexandria, VA'))