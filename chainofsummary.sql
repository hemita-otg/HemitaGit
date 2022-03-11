select * from SiteControl..vw_ReportFields
where  CategoryCodeId = 5876 and FieldName like '%aceventname%'

select *
from CategorySummaryDisplayControl
where CategoryCodeId = 5876 and FieldId in (88,142)
and GroupName = 'MPV'

--update control type
1-single select - chain
2-multiselect - no chain

--update CategorySummaryDisplayControl
set GroupDisplaySeq =13,GroupFieldDisplaySeq=4
where CategoryCodeId = 5876 and FieldId in (142)
