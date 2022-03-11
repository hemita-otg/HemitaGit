If OBJECT_ID('tempdb..kp')is not null
Drop table tempdb..kp

If OBJECT_ID('tempdb..kp1')is not null
Drop table tempdb..kp1

;With CTE as (
select c.clientid,ClientName,HomePageLink,SubscriptionName,FirstName,LastName,EmailAddresses
,DateTimeSaved as SubCreatedOn,TimePeriod,min(StartDate) [StartDate],max(enddate) [EndDate]
from Subscription..Subscription A join SiteControl..vw_catinfo b 
on a.CategoryCodeId=b.CategoryCodeId
join Subscription..vwUser c on c.UserID=a.UserID
join Subscription..subscriptionschedule d on a.SubscriptionID=d.SubscriptionID
join Subscription..subscriptionemail e on a.SubscriptionID=e.SubscriptionID
where (IsPDT=1 or clientpdt=1 or cwmfull=1) and SiteAccess=1 and enddate>getdate() 
and d.SubscriptionID in (select distinct subscriptionid from Subscription..PendingSubscriptions)
group by d.subscriptionid,c.clientid,ClientName,A.CategoryCodeID,HomePageLink,SubscriptionName,FirstName,LastName,EmailAddresses
,DateTimeSaved,TimePeriod )
SELECT Clientid,ClientName,HomePageLink,SubscriptionName,FirstName,LastName,SubCreatedOn,TimePeriod,[StartDate],[EndDate],
Recipient = cast(STUFF((SELECT ';' + EmailAddresses FROM CTE t1 WHERE 
 t1.Clientid = t2.Clientid and t1.ClientName = t2.ClientName 
and t1.HomePageLink = t2.HomePageLink and t1.SubscriptionName = t2.SubscriptionName and t1.FirstName = t2.FirstName
and t1.LastName = t2.LastName and  t1.SubCreatedOn = t2.SubCreatedOn
and t1.TimePeriod = t2.TimePeriod and t1.[StartDate] = t2.[StartDate] and t1.[EndDate] = t2.[EndDate]
FOR XML PATH ('')), 1, 1, '') as varchar(max)) into tempdb..kp from CTE t2 
group by Clientid,ClientName,HomePageLink,SubscriptionName,FirstName,LastName,SubCreatedOn,TimePeriod,[StartDate],[EndDate]
Order by 2,4,1

select *,cast('' as varchar(max))Recipient1 into tempdb..kp1 from tempdb..kp 

Update tempdb..kp1 
set Recipient1 = case when LEN(Recipient) > 3999
					  then RIGHT(Recipient,LEN(Recipient)-3999)
					  else '' 
					  end
Update tempdb..kp1 
set Recipient = case when LEN(Recipient) > 3999
					  then left(Recipient,3999)
					  else Recipient 
					  end




Update tempdb..kp1 
set Recipient1 = case when LEN(Recipient) = 3999
					  then right(Recipient,CHARINDEX(';',reverse (Recipient))-1)+Recipient1
					  else Recipient1 
					  end

Update tempdb..kp1 
set Recipient = case when LEN(Recipient) = 3999
					  then SUBSTRING(Recipient,1,len(Recipient)-CHARINDEX(';',reverse (Recipient))+1)
					  else Recipient 
					  end

select * from mt2sql14.tempdb.dbo.kp1 order by LEN(Recipient) desc

update mt2sql14.tempdb.dbo.kp1 set SubCreatedOn=CAST(SubCreatedOn as date)

					
					 