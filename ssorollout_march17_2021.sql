Use Subscription 
GO

--15167
--select * from mt2dev0.subscription50.dbo.SSOUserConfiguration where defaultemailaddress


-- --33003
select Distinct  lower(DefaultEmailAddress) DefaultEmailAddress,0 from vwuser with (nolock) 
where type = 1 and SiteAccess = 1 
and Isnull(IsSSOEnabled, 0) = 0 
and ClientID not in (3,87)
--and DefaultEmailAddress not in (select x.DefaultEmailAddress from tempdb..SSOEnabledUsers x) 
and clientid not in (select y.clientid from vwclient y where y.isactiveclient=0) 

-- STEP 1
-- Insert Into mt2dev0.subscription50.dbo.SSOUserConfiguration (defaultemailaddress, enabledsso)
select Distinct  lower(DefaultEmailAddress) DefaultEmailAddress, 0 from vwuser with (nolock) 
where type = 1 and SiteAccess = 1 
and (Isnull(IsSSOEnabled, 0) = 0 Or (Isnull(IsSSOEnabled, 0) = 1 and SSOLastAccessed is null ))
and ClientID not in (3,87)
and DefaultEmailAddress not in (select x.DefaultEmailAddress from tempdb..SSOEnabledUsers x)


-- Select * from mt2dev0.subscription50.dbo.SSOUserConfiguration  with (nolock) Where EnabledSSO = 0 

-- STEP 2
-- Update a set IsSSOEnabled =  1 
from vwuser a
where type = 1 and SiteAccess = 1 
and Isnull(IsSSOEnabled, 0)=0
and ClientID not in (3,87)
and DefaultEmailAddress not in (select x.DefaultEmailAddress from tempdb..SSOEnabledUsers x) 
and DefaultEmailAddress  in (select y.DefaultEmailAddress from mt2dev0.subscription50.dbo.SSOUserConfiguration y)



