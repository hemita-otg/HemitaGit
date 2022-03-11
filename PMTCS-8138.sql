Select distinct advertiser,market,media
from MT2SQL14.archivesub.dbo.MasterClientCWMpep a
 join mt2sql00.masterclientcoverage.dbo.retmktpep b
 on a.retmktid=b.retmktid
where categorycodeid in (7033)
order by 1,2

Select distinct advertiser,market 
from MT2SQL14.archivesub.dbo.MasterClientCWM a
 join mt2sql00.masterclientcoverage.dbo.retmkt b
 on a.retmktid=b.retmktid
where categorycodeid in (1113)
order by 1,2

select * from archivesub..MerchandiseCategoryControl where categorycodeid in (7033)
select distinct * from archivesub..MerchandiseCategoryTemplatesDetail where MCTemplateID=4748