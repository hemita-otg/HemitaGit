select distinct c.clientname,c.HomePageLink,c.Category,a.MerchandiseCategory,a.MerchandiseSubCat,a.Category,a.RealCategory
from merchandisecategorytemplatesdetail a
join MerchandiseCategoryControl b
on a.MCTemplateID=b.MCTemplateID
join vw_catinfo c
on b.CategoryCodeID=c.CategoryCodeId
where a.realCategory in('Wine'
,'Wine-Dessert'
,'Wine-Non-Alcoholic'
,'Wine-Sake/Plum'
,'Wine-Sparkling')
and (MerchandiseCategory!='Grocery'
and MerchandiseSubCat!='Wine/Sparkling')
--where a.MerchandiseSubCat ='Wine/Sparkling' --and a.Category = 'Wine/Sparkling'
--and b.MCTemplateID = 3326
and c.FVCCType in (2,4,6)
order by 1,2,3,4,5,6



select distinct c.clientname,c.HomePageLink,c.Category,a.MerchandiseCategory,a.MerchandiseSubCat,a.Category,a.RealCategory
from merchandisecategorytemplatesdetail a
join MerchandiseCategoryControl b
on a.MCTemplateID=b.MCTemplateID
join vw_catinfo c
on b.CategoryCodeID=c.CategoryCodeId
where a.realCategory in('Wine'
,'Wine-Dessert'
,'Wine-Non-Alcoholic'
,'Wine-Sake/Plum'
,'Wine-Sparkling')
and a.RealCategory!=a.Category
and c.FVCCType in (2,4,6)
order by 1,2,3,4,5,6




select * from merchandisecategorytemplatesdetail
where RealCategory like 'wine%' and MCTemplateID = 3326


select distinct *
from tempmodelpep
where MerchandiseSubCat ='Wine/Sparkling' --and a.Category = 'Sparkling'