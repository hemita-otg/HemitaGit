select * from SavedQueriesDetail



select queryname,DefaultEmailAddress,FirstName,LastName from SavedQueries a
join vwUser b
on a.userid= b.userid
join SavedQueriesDetail c
on a.QueryID = c.queryid
where CategoryCodeId =2348
and SiteAccess = 1
and c.sessionidname = 'display179'
order by 1,2,3,4

select * from vwUser
where DefaultEmailAddress = 'will.oconnell@ca.nestle.com'

select * from ClientProfile
where ClientID=464
