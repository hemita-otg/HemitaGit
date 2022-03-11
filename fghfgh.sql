--Total failed subs for today
select Hostname, Error, ExecuteId, Cast(DateDiff(ss, stdttm, isnull(eddttm, getdate()))/60.00 as decimal(9,2)) timetaken, *, 'EXEC [Subscription].[dbo].[procReprocessFailedSub] ' + cast(subscriptionid as varchar(20)) + ',''MT2SQL10''' 
 from sitelog..executedsubrequest with (nolock)
where stdttm > Convert(varchar(10), getdate(), 101) and SubType < 3
And Subscriptionid in (select  Subscriptionid from sitelog..executedsubrequest with (nolock)
where stdttm > Convert(varchar(10), getdate(), 101) and SubType < 3 and Error <> '' --and error like '%cross%' 
) 
order by   categorycodeid, subscriptionid desc 



--Pending subs for today
select a.*,b.SubscriptionName,b.HostName,b.Error,b.UserID from subscription..temppendingsubscriptions a
join sitelog..executedsubrequest b with (nolock)
on a.subscriptionid=b.SubscriptionID
order by deliverydate desc




