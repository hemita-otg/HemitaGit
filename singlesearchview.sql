;With CTE as (
select distinct a.clientid,b.clientname,a.ID as categorycodeid,a.Category as Categorycode,c.HomePageLink,a.ClientServer
,a.ispdt,a.ClientPDT,a.cwmfull,a.IsAdlert 
,b.MasterCategoryCodeID50,a.FVCCType, c.Status as DBenabled,b.fv40 as clientfv40
--,type as usertype,IsSSOEnabled 
from SiteControl..CategoryCode a 
join Subscription..ClientProfile b on a.ClientID=b.ClientID
join Subscription..clientdatabases c on a.id=c.CategoryCodeID and a.ClientID = c.ClientID 
where (a.CWMFull=1 or a.ClientPDT=1 or isadlert=1) and b.IsActiveClient=1  
and a.clientid=3 ) ,

VWUser as (
Select ClientID,  UV40 = STUFF(
(Select Distinct ',' + Cast(fv40 as Varchar)
 from Subscription..vwUser t1
 Where t1.ClientID = t2.ClientID
 and t1.SiteAccess=1 
 FOR XML PATH (''))
, 1, 1, '') from Subscription..vwUser t2
group by ClientID), 

MasterCat as (
Select Distinct C.ClientID,MasterCategoryCodeID50,FVCCType 
from SiteCOntrol..CategoryCode C
join Subscription..ClientProfile P 
on C.ID=P.MasterCategoryCodeID50 and  C.ClientID=P.ClientID)

Select Distinct C.*, U.UV40,M.MasterCategoryCodeID50,M.FVCCType MasterFVCCType    
from CTE C 
Join VWUser U On C.ClientID = U.ClientID 
Join MasterCat M On C.ClientID = M.ClientID

