select distinct advertiser from mt2sql00.masterclientcoverage.dbo.retmktpep
--order by Advertiser
where Advertiser like '%lowe%'

select * from ACFVFlyerReports
where Advertiser like '%round%'

select advertiser,market,retmktid from RetMktpep
where Advertiser like '%maria%' 


select distinct b.clientname,b.category--, c.advertiser,c.market 
from masterclientcwmpep a
join mt2sql14.sitecontrol.dbo.vw_catinfo b on a.CategoryCodeID=b.categorycodeid
join retmktpep c on c.retmktid=a.retmktid
where a.retmktid in (11718
,7633
,7634
,7635
,7636
,12390
,1955
,1956
,1957
,6282
,6283
,6112,6113) order by 1,2
order by 1