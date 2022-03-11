
Select * from Subscription.dbo.ClientProfile 

Select * from SiteControl..categorycode where category='snpep'

Select a.Category,b.CategoryCodeID, b.username,b.fullrundate 
from SiteControl..CategoryCode a
Join SiteControl..CategoryMarkedFull b
On a.ID=b.CategoryCodeID
Where a.Category in ('snpep')
Order by b.FullRunDate Desc