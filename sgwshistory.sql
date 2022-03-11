select distinct advertiser,market,media,AdMonth,count(distinct flyerid)
from ACFVFlyerReports a
join BLsgwsPEPDisAdLevelCoverage b
on a.RetMktId=b.RetMktId and a.mediaId=b.MediaId
group by advertiser,market,media,AdMonth
order by 1,2,3,4


select  advertiser,market,media,a.merchandisecategory,a.merchandisesubcat,a.category,AdMonth
,count(distinct flyerid),count(distinct pagedetailid)
from ACFVdetailReports a with (nolock)
join mt2sql17.sql17.dbo.BLsgwsPEPDisAdLevelCoverage b on a.RetMktId=b.RetMktId and a.mediaId=b.MediaId
join mt2sql17.sql17.dbo.BLsgwsPEPDisQueryPage c on a.categoryid=c.Categoryid
group by advertiser,market,media,a.merchandisecategory,a.merchandisesubcat,a.category,AdMonth

