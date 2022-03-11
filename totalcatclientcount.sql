
select c.MerchandiseCategory,c.MerchandiseSubCat,c.realcategory,d.clientname,a.category
from mt2sql14.sitecontrol.dbo.categorycode a
join mt2sql14.sitecontrol.dbo.vw_merchandisecategory c 
on a.id=c.categorycodeid 
join mt2sql14.subscription.dbo.clientprofile d 
on a.clientid=d.clientid
where a.fvcctype in (2,4,6)
group by c.MerchandiseCategory,c.MerchandiseSubCat,c.realcategory,d.clientname,a.category
order by 3,4,5,1,2



select c.realcategory,count(distinct d.clientid) as #ofclients,count(distinct a.ID) as #catcodecount
from mt2sql14.sitecontrol.dbo.categorycode a
join mt2sql14.sitecontrol.dbo.vw_merchandisecategory c 
on a.id=c.categorycodeid 
join mt2sql14.subscription.dbo.clientprofile d 
on a.clientid=d.clientid
where a.fvcctype in (2,4,6)
group by c.realcategory
order by 1



