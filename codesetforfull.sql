Select distinct C.ID,C.Category,C.ClientServer,F.Username ,f.fullrundate
from mt2sql14.SiteControl.dbo.CategoryMarkedFull F
join mt2sql14.SiteControl.dbo.CategoryCode C
on C.ID = F.CategoryCodeID 
--where F.FullRunDate =''
--where c.category = 'conac'
order by 5 desc, 1,2


select * from Connection..nightlyprocessing
order by ProcessID desc