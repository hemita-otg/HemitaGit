select  a.advertiser,a.market,a.category,a.media 
from ACFVdetailReports a
join mt2sql14.sitecontrol.dbo.vw_merchandisecategory b
on a.category=b.realcategory and b.categorycodeid=7050
where advertiser = 'Sentry Foods'
and market = 'Madison, WI'

