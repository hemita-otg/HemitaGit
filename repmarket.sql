select distinct *
--into tempdb..repmarketslegacy
from (
select * from mt2sql04.tempdb.dbo.repmarket union
select * from mt2sql07.tempdb.dbo.repmarket union
select * from mt2sql08.tempdb.dbo.repmarket ) a
join SiteControl..vw_catinfo b
on a.catcode= b.Category
where (b.cwmfull=1 or b.ClientPDT=1)
order by 1,2

select distinct ClientName,Category,HomePageLink,advertiser,market 
from vw_catinfo a
join mt2sql00.masterclientcoverage.dbo.masterclientcwm b
on a.CategoryCodeId=b.categorycodeid 
join mt2sql00.masterclientcoverage.dbo.retmkt c
on c.retmktid = b.retmktid
where isnull(isinternal,0)=0
and (a.cwmfull=1 or a.ClientPDT=1)
union
select distinct ClientName,Category,HomePageLink,advertiser,market 
from vw_catinfo a
join mt2sql00.masterclientcoverage.dbo.clientcwmexception b
on a.CategoryCodeId=b.categorycodeid 
join mt2sql00.masterclientcoverage.dbo.retmkt c
on c.retmktid = b.fieldvalue
where isnull(isinternal,0)=0
and (a.cwmfull=1 or a.ClientPDT=1) and fieldid=153
order by 1,2,4,5,3




