use Subscription 

update subscription set DateTimeExecuted = getdate() - 7 where subscriptionid = 224400       
insert into temppendingsubscriptions values (224400 , Convert(varchar(10), getdate(), 101), 0)

Select Distinct Hostname, a.Error, Cast(DateDiff(ss, stdttm, isnull(eddttm, getdate()))/60.00 as decimal(9,2)) timetaken,Category,ClientServer, * 
From sitelog..executedsubrequest a with (nolock) 
join SiteControl..CategoryCode b with (nolock) 
on a.CategoryCodeID = b.id
Where stdttm > Convert(varchar(10), getdate()-5, 101) and Subtype < 3  
and ClientServer  in('MT2SQL01','MT2SQL03','MT2SQL05','MT2SQL09','MT2SQL12')
--and (Category not like '%merge') 
and a.Error Like '%cross.gif%'
--and b.category like '%drppep%'
--and Subscriptionid in (224400)
Order By stdttm Desc
GO


select Hostname,ClientServer, Category, SubscriptionID, a.Error,userid, stdttm, eddttm , Cast(DateDiff(ss, stdttm, isnull(eddttm, getdate()))/60.00 as decimal(9,2)) timetaken, HasAttachment
 from sitelog..executedsubrequest a with (nolock) 
join SiteControl..CategoryCode b with (nolock) 
on a.CategoryCodeID = b.id
where stdttm > Convert(varchar(10), getdate(), 101) and SubType < 3
And Subscriptionid in (select  Subscriptionid from sitelog..executedsubrequest with (nolock)
where stdttm > Convert(varchar(10), getdate(), 101) and SubType < 3 and Error <> '' --and error like '%cross%' 
) 
order by    StDtTm desc 



select Hostname,ClientServer, Category, SubscriptionID, a.Error,userid, stdttm, eddttm , Cast(DateDiff(ss, stdttm, isnull(eddttm, getdate()))/60.00 as decimal(9,2)) timetaken, HasAttachment
 from sitelog..executedsubrequest a with (nolock) 
join SiteControl..CategoryCode b with (nolock) 
on a.CategoryCodeID = b.id
where stdttm > Convert(varchar(10), getdate(), 101) and SubType < 3
And Subscriptionid in (select  Subscriptionid from sitelog..executedsubrequest with (nolock)
where stdttm > Convert(varchar(10), getdate(), 101) and SubType < 3 and Error <> '' and error like '%cross%' 
) 
order by    StDtTm desc 

