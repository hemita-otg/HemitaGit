use MasterClientCoverage

--insert into mt2sql00.masterclientcoverage.dbo.masterclientcwmpep( clientid,categorycodeid,acretmktid,retid,mktid,retmktid,mediaid,tcid,startdate)
select distinct c.ClientId,c.CategoryCodeID,4087260,10876744,14065116,13720,a.mediaid,9206008,'2016-10-01 00:00:00.000'
from MasterClientCWMPEP a
join retmktpep b
on a.retmktid=b.retmktid
join mt2sql14.sitecontrol.dbo.vw_catinfo c
on c.categorycodeid=a.CategoryCodeID
where b.Advertiser='Acme Markets (NAI)' and b.Market='Newark, NJ'



select * from retmktpep b
where b.Advertiser='Acme Markets (NAI)' and b.Market='Jersey City, NJ'

select * from MasterClientCWMPEP 
where CategoryCodeID=7115 and Advertiser='Acme Markets (NAI)' and Market='Jersey City, NJ'

--------insert into mt2sql00.masterclientcoverage.dbo.masterclientcwmpep( clientid,categorycodeid,acretmktid,retid,mktid,retmktid,tcid,startdate)
select distinct 95,4803,acretmktid,retid,mktid,retmktid,tcid,'2015-01-01 00:00:00.000' from mt2sql00.masterclientcoverage.dbo.retmktpep where 
(Advertiser='Acme Markets (NAI)' and Market='Jersey City, NJ') 





select distinct Advertiser,Market,media,a.mediaid
from MasterClientCWMPEP a
join retmktpep b
on a.retmktid=b.retmktid
join mt2sql14.sitecontrol.dbo.vw_catinfo c
on c.categorycodeid=a.CategoryCodeID
where b.Advertiser='Acme Markets (NAI)' 
and c.CategoryCodeID=7115