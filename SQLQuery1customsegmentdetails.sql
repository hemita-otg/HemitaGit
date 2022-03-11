Select b.clientname[Client Name],b.HomePageLink [Database],FieldName[type of custom segmentation],
Case When ISNULL(b.Isadlert,0)=1 Then 'Durable'
When FVCCType in (2,4,6) Then 'PEP'
Else 'Consumable'
End as ClientType
from SiteControl..vw_MasterSegmentation a
join SiteControl..vw_catinfo b
on a.ID=b.CategoryCodeId
where (ClientPDT=1 or CWMFull=1 or b.IsAdlert=1)
order by 1,2,3,4
