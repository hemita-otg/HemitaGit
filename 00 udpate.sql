select distinct * 
from PRDDisDateRanges
where AdMonth='december - 2018'
and AdDate in ('2018-12-27 16:05:58.000','2018-12-27 18:15:16.000')

select * from PRDflyerReports
--where AdDate in ('2018-12-27 16:05:58.000','2018-12-27 18:15:16.000')
where FlyerID in (21614956,21614947)

update  PRDflyerReports set addate =CAST(addate as date)
--select * from PRDflyerReports
where cast(addate as time)!= '00:00:00:000'

update  PRDPageReports set addate =CAST(addate as date)
--select * from PRDPageReports
where cast(addate as time)!= '00:00:00:000'

update  PRDDetailReports set addate =CAST(addate as date)
--select * from PRDPageReports
where cast(addate as time)!= '00:00:00:000'


exec mt_proc_Create_DisplayTables 'BAR50'



--select retmktid,* 
--from MasterAdviewData..AdviewMain with (nolock)
--where FlyerID in (21614956,21614947)






 
 