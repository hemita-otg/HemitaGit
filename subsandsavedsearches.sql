select homepagelink,QueryName,DateCreated,LastExecuted,LastUpdated,DefaultEmailAddress,FirstName,LastName
from Subscription..SavedQueries a
join Subscription..vwUser c
on a.userid=c.UserID
join sitecontrol..vw_catinfo d
on a.categorycodeid=d.CategoryCodeId
where a.CategoryCodeid in (5862,5863)

select a.subscriptionid,homepagelink,SubscriptionName,DateTimeSaved,StartDate,EndDate,TimePeriod,DefaultEmailAddress,FirstName,LastName
from Subscription..Subscription a
join Subscription..SubscriptionSchedule b
on a.SubscriptionID=b.SubscriptionID
join Subscription..vwUser c
on a.userid=c.UserID
join sitecontrol..vw_catinfo d
on a.categorycodeid=d.CategoryCodeId
 where a.CategoryCodeid in (5862,5863)

 select * from SubscriptionEmail where SubscriptionID in (select a.subscriptionid
from Subscription..Subscription a
join Subscription..SubscriptionSchedule b
on a.SubscriptionID=b.SubscriptionID
join Subscription..vwUser c
on a.userid=c.UserID
join sitecontrol..vw_catinfo d
on a.categorycodeid=d.CategoryCodeId
 where a.CategoryCodeid in (5862,5863))
 order by 1