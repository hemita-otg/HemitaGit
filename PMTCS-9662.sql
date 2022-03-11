use subscription

select distinct ClientName,HomePageLink,SubscriptionName,FirstName,LastName,DefaultEmailAddress
from Subscription..Subscription A
join SiteControl..vw_catinfo b 
on a.CategoryCodeId=b.CategoryCodeId
join Subscription..vwUser c
on c.UserID=a.UserID
where (IsPDT=1 or clientpdt=1 or cwmfull=1) and SiteAccess=1
order by 1,2,3,4,5

select * from Subscription..subscription where subscriptionid=219917

select * from Subscription..subscriptionschedule where subscriptionid=219917

select d.subscriptionid,c.clientid,ClientName,HomePageLink,SubscriptionName,FirstName,LastName,DefaultEmailAddress,DateTimeSaved as SubCreatedOn,TimePeriod,min(StartDate),max(enddate)
from Subscription..Subscription A
join SiteControl..vw_catinfo b 
on a.CategoryCodeId=b.CategoryCodeId
join Subscription..vwUser c
on c.UserID=a.UserID
join Subscription..subscriptionschedule d
on a.SubscriptionID=d.SubscriptionID
where (IsPDT=1 or clientpdt=1 or cwmfull=1) and SiteAccess=1 and enddate>getdate() and d.SubscriptionID in (select distinct subscriptionid from Subscription..PendingSubscriptions)
group by d.subscriptionid,c.clientid,ClientName,HomePageLink,SubscriptionName,FirstName,LastName,DefaultEmailAddress,DateTimeSaved,TimePeriod
order by 2,3,4,5,6


select distinct ClientName,HomePageLink,SubscriptionName,FirstName,LastName,DefaultEmailAddress,SubscriptionID
from Subscription..Subscription A
join SiteControl..vw_catinfo b 
on a.CategoryCodeId=b.CategoryCodeId
join Subscription..vwUser c
on c.UserID=a.UserID
where (IsPDT=1 or clientpdt=1 or cwmfull=1) and SiteAccess=1
order by 1,2,3,4,5



