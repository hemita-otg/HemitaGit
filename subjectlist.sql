select distinct a.clientname,a.HomePageLink,a.ClientID,a.categorycodeid,RptTemplateID from vw_catinfo a 
join mt2sql00.masterclientcoverage.dbo.masterclientcwmpep b
on a.CategoryCodeId=b.categorycodeid
join Subscription..clientdatabases c
on c.CategoryCodeID=a.CategoryCodeId
join Subscription..ClientProfile d
on a.ClientID=d.ClientID
join vw_ReportFields e
on a.CategoryCodeId=e.CategoryCodeId
where b.mediaid=12010005 and c.Status=1
and a.status=1 and FVCCType in (2,4,6) and d.IsActiQveClient=1
and IsPDTTemplate=1
