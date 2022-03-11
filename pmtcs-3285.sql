select distinct *
from tempmodelpep
where category like 'American Whiskey%'
 or category like 'Canadian Whiskey%'
 or category like 'Cognac/Brandy%'
 or category like 'Cordial%'
 or category like 'Gin%'
 or category like 'Infused%'
 or category like 'Irish Whiskey%'
 or category like 'Pre-Mix%'
 or category like 'Rum%'
 or category like 'Scotch%'
 or category like 'Tequila%'
 or category like 'Vodka%'
 order by 3



--select distinct c.clientname,c.Category,c.HomePageLink,a.MerchandiseCategory,a.MerchandiseSubCat,a.Category
select distinct c.Category
from merchandisecategorytemplatesdetail a
join MerchandiseCategoryControl b
on a.MCTemplateID=b.MCTemplateID
join vw_catinfo c
on b.CategoryCodeID=c.CategoryCodeId
where a.Category in ('American Whiskey'
,'Canadian Whiskey'
,'Cognac/Brandy'
,'Cordial'
,'Gin'
,'Infused'
,'Irish Whiskey'
,'Pre-Mix'
,'Rum'
,'Scotch'
,'Tequila'
,'Vodka')
and c.FVCCType in (2,4,6)
order by a.Category


select distinct Category
from tempmodelpep
where category like 'American Whiskey-%'
 or category like 'Brandy-%'
 or category like 'Gin-%'
 or category like 'Rum-%'
 or category like 'Scotch-%'
 or category like 'Vodka-%'
 order by Category


