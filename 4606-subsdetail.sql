--insert into tempdb..testing
select distinct b.clientname [Client Name],b.HomePageLink as [Database Name],subscriptionname as [Subscription Name] ,c.DefaultEmailAddress as [created by],d.EmailAddresses as [receivers]
from subscription a 
join sitecontrol.dbo.vw_catinfo b on a.categorycodeid=b.categorycodeid
join vwuser c on a.userid=c.userid
join SubscriptionEmail d on a.SubscriptionID=d.SubscriptionID
where b.Category in ('wlmADL50','wlmPeP') 


Select [Client Name],[Database Name],[Subscription Name],[created by],   
EmailIDs = STUFF((
            SELECT '; ' + [receivers]
            FROM tempdb..testing
            FOR XML PATH('')
            ), 1, 1, '')
FROM tempdb..testing
order by 3,4,5

SELECT Distinct p.[Client Name],p.[Database Name],p.[Subscription Name],p.[created by],   
    EmailIDs = STUFF((
        SELECT distinct '; ' + t.[receivers]
        FROM tempdb..testing pt
        INNER JOIN tempdb..testing t
            ON pt.[Client Name] = t.[Client Name]
			and pt.[Database Name] = t.[Database Name]
        Where pt.[Subscription Name] = p.[Subscription Name] 
		and pt.[created by]=t.[created by]
        FOR XML PATH(''), TYPE).value('.', 'VARCHAR(MAX)'), 1, 1, '')
FROM tempdb..testing p
ORDER BY p.[Client Name],p.[Database Name];