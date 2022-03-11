Use Subscription 
GO

select Distinct  lower(DefaultEmailAddress) , 0 from vwuser 
where type = 1 and SiteAccess = 1 and Isnull(IsSSOEnabled, 0) = 0 and ClientID not in (3,87)

-- STEP 1
-- Insert Into mt2dev0.subscription50.dbo.SSOUserConfiguration (defaultemailaddress, enabledsso)
select Distinct  lower(DefaultEmailAddress) , 0 from vwuser 
where 
clientid in (354) and
type = 1 and SiteAccess = 1 and Isnull(IsSSOEnabled, 0) = 0 
and ( (LastAccessed is not null and LastAccessed >= '01/01/2019') OR (DateCreated is not null and DateCreated >= '01/01/2020'))

-- Select * from mt2dev0.subscription50.dbo.SSOUserConfiguration  with (nolock) Where EnabledSSO = 0 

-- STEP 2
-- Update a set IsSSOEnabled =  1 
from vwuser a
where clientid in (354)
and type = 1 and SiteAccess = 1 and Isnull(IsSSOEnabled, 0) = 0 
and DefaultEmailAddress in (select DefaultEmailAddress from  mt2dev0.subscription50.dbo.SSOUserConfiguration)

select count(*) from mt2dev0.subscription50.dbo.SSOUserConfiguration with (nolock) where EnabledSSO =0

select * from mt2dev0.subscription50.dbo.SSOUserConfiguration with (nolock) where defaultemailaddress like '%manish%'