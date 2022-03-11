select * from MasterCanProductTerritory

select distinct clientname,HomePageLink
from mt2sql14.sitecontrol.dbo.TableNames a
join mt2sql14.sitecontrol.dbo.vw_catinfo b 
on a.CategoryCodeID = b.CategoryCodeId
where ClientTableName like '%mastercanproductterritory%'
and ClientServer in ('mt2sql04','mt2sql07','mt2sql08','mt2sql11','mt2sql12') and Status=1

select * from vw_MasterCustomStep 
where ClientServer in ('mt2sql04','mt2sql07','mt2sql08','mt2sql11','mt2sql12') 
and fieldname = 'productterritory'

select clientname,homepagelink,displayname,fieldname from vw_catinfo a
 join vw_reportFields b
 on a.CategoryCodeId=b.CategoryCodeId
 where bupt=1 and DisplayName like '%brand group%' and FVCCType=3 and DisplaySeq is not null
 order by 1,2,3,4