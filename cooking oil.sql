select * from vw_catinfo
where ClientName like '%nestle%'


use Subscription


select distinct  c.clientname,HomePageLink,b.QueryName,e.FirstName,e.LastName,e.DefaultEmailAddress
from SavedQueriesDetail a
join SavedQueries b
on a.QueryID=b.QueryID
join SiteControl..vw_catinfo c
on c.CategoryCodeId=b.CategoryCodeId
join SiteControl..vw_QvfcFields d
on c.CategoryCodeId=d.CategoryCodeId
join vwUser e
on e.UserID=b.UserID
where SessionIDName='display126'
and d.FieldId=126
and SiteAccess=1
and d.DisplaySeq is not null
and ( SessionIDValue like '%Algae Oil%'
 or SessionIDValue like '%Avocado Oil%'
 or SessionIDValue like '%Basting Oil%'
 or SessionIDValue like '%Coconut Oil%'
 or SessionIDValue like '%Cooking Oil%'
 or SessionIDValue like '%Dipping Oil%'
 or SessionIDValue like '%Grapeseed Oil%'
 or SessionIDValue like '%MCT Oil%'
 or SessionIDValue like '%Oil-Bulk%'
 or SessionIDValue like '%Oive Oil%'
 or SessionIDValue like '%Olive Oil%'
 or SessionIDValue like '%Pomace Oil%'
 or SessionIDValue like '%Safflower Oil%'
 or SessionIDValue like '%Sesame Oil%'
 or SessionIDValue like '%SunCoco Oil%'
 or SessionIDValue like '%Truffle Oil%'
 or SessionIDValue like '%Walnut Oil%')


select * from SiteControl..MasterFields
where FieldName='comments3'