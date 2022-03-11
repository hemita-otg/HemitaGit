select distinct advertiser,market from mt2sql13.sql13.dbo.ehuspepflyerreports 
where 
(advertiser = 'Quality Food Centers' and market like '%Seattle%')
or
advertiser = 'SavMor' and market like '%Asheville%'