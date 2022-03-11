select * from SiteControl..vw_catinfo where clientname  like '%dia%' and FVCCType in (2,4,6)

select max(DisplaySeq)DisplaySeq,max(AdvQPDisplaySeq)AdvQPDisplaySeq 
from SiteControl..vw_QvfcFields where CategoryCodeId = 9364

select max(DisplaySeq)DisplaySeq from SiteControl..vw_ReportFields 
where CategoryCodeId = 9364


--and FieldId in (106,107,108)

