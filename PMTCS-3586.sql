select distinct b.tradeclassid,tradeclass,a.ClientId,a.CategoryCodeID,b.advertiser,a.retmktid
from MasterClientCWMPEP a
join mt2sql17.sql17.dbo.acfvflyerreports b
on b.retmktid= a.retmktid
where b.tradeclass in('Delhaize America')



