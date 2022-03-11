select distinct clientname,HomePageLink,Category
from vw_catinfo a
join tempbevalpep b
on a.CategoryCodeId=b.CategoryCodeId
where status=1 and (ispdt=1 or clientpdt=1 or CWMFull=1)


select distinct ClientName,HomePageLink,category,clientserver,clientid,categorycodeid,status from vw_catinfo 
where ClientID in (select distinct ClientID from vw_catinfo a join tempbevalpep b on a.CategoryCodeId=b.CategoryCodeId)
and CategoryCodeId not in (select * from tempbevalpep)
and status=0
--and (ispdt=1 or clientpdt=1 or CWMFull=1)
order by 1,2,3
