select distinct a.clientid,a.clientname,a.category,clientserver,b.IsCanadaClient,FullSourceCode
from vw_catinfo a
join Subscription..ClientProfile b
on a.ClientID=b.ClientID
where a.Category in ('shell50','gar50','owiADL','emcADL','robADL','spbCAN','gtADL') order by ClientServer


select distinct a.clientid,a.ClientName,a.category,'' as FullSourceCode,d.IsCanadaClient,c.FieldName,e.DisplayName,LastUpdatedOn
from vw_catinfo a
join vw_MasterSegmentation c
on a.CategoryCodeId=c.ID
join Subscription..ClientProfile d
on a.ClientID=d.ClientID
join vw_qvfcFields e
on e.CategoryCodeId=a.CategoryCodeId and a.ClientID=e.ClientId and c.FieldId=e.FieldId
where a.Category in ('shell50','gar50','owiADL','emcADL','robADL','spbCAN','gtADL')

select * from vw_MasterSegmentationDetail



select * from  vw_catinfo where clientid in (798,417,1412,797,1108,329,1146) and FVCCType in (2,4,6)

	


	select * from masterc