select  * from ACFVDetailReports with(nolock)
where advertiser='walgreens'
and market = 'Tampa, FL'


select  distinct a.advertiser,a.market,count(distinct a.clientid) as sdf
into tempdb..totalcountpep3
from ACFVDetailReports a with(nolock)
join 
group by a.advertiser,a.market


select * from tempdb..totalcountpep1

select distinct a.advertiser,a.market,b.retmktid,a.totalpagedetailid,count(distinct c.clientid) as clientcount  from tempdb..totalcountpep1 a
join MasterClientCoverage..retmktpep b
on a.advertiser=b.advertiser and a.market=b.market
join MasterClientCoverage..MasterClientCWMpep c
on b.retmktid=c.retmktid
group by a.advertiser,a.market,b.retmktid,a.totalpagedetailid

select distinct * from MasterClientCoverage..MasterClientCWMpep a
join  MasterClientCoverage..retmktpep b
on a.retmktid=b.retmktid

select distinct categorycodeid,category from mt2sql14.sitecontrol.dbo.vw_catinfo



select distinct categorycodeid from MasterClientCoverage..MasterClientCWMpep
where retmktid=24





