select top 10 * from ACFVDetailReports
where category = 'frozen prepared food'

select * from mt2sql14.sitecontrol.dbo.merchandisecategorytemplatesdetail 
where category like 'frozen%'


select distinct a.Category,b.category,a.MCTemplateID,b.DBCreatedOn
from mt2sql14.sitecontrol.dbo.vw_merchandisecategory a
join categorycode b
on a.CategoryCodeId=b.id
where a.category = 'frozen prepared food' 
and a.Category != 'frozen prepared food-other'
and b.FVCCType in (2,4)
order by b.DBCreatedOn desc



select distinct MCTemplateID from merchandisecategorytemplatesdetail
where category = 'frozen prepared food'



select * from mt2sql14.sitecontrol.dbo.vw_merchandisecategory