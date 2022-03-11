select  distinct a.categorycodeid,b.clientname,b.Category
from vw_merchandisecategory a
join vw_catinfo b
on a.CategoryCodeId=b.CategoryCodeId
where a.category = 'Gaming Media/Games' and FVCCType in (2,4,6)
order by 3,2,1
