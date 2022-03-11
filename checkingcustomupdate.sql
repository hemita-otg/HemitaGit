select * from ptcaCategoryUpdate

select * from vw_catinfo where ClientName like '%prem%'

select * from tempdb..ptcaCategoryUpdate a
join
sql02..ptcaDetailReports b
on a.Category=b.Category and a.Brand=b.Brand and a.Comments1=b.Comments1
where a.Category<>b.Category
--where b.Category not like '%non%'


select distinct a.Category from MasterClientCoverage..tempjapagedetailtable a
join tempdb..ptcaCategoryUpdate b
on a.Category=b.Category and a.Brand=b.Brand and a.Comments1=b.Comments1
where a.PageDetailID in (select originalpagedetailid from sql02..ptcaDetailReports)


select distinct a.Category,b.Category from MasterClientCoverage..tempjapagedetailtable a
join sql02..ptcaDetailReports b
on a.PageDetailId=b.OriginalPageDetailID
order by 1,2



select * from CategoryCode 
where category like '%merge%'