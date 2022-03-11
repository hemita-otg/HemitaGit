select count(distinct a.pagedetailid) from ACFVDetailReports a with (nolock)
join nwPepDisAdLevelCoverage b
on a.retmktid=b.RetMktId and a.mediaid=b.MediaId
join nwPepDisQueryPage c
on c.CategoryId=a.categoryid


select count(1) from ACFVDetailReports with (nolock)
where retmktid = 3334 and category in (select distinct category from acoPepDisQueryPage)

