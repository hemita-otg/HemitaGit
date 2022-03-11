--update mt2sql13.sql13.dbo.dtzpepflyerreports 
set advertiser = 'Albertsons POR',advertiserID=12042783
where advertiser = 'Albertsons NW' and market = 'Portland, OR'

--update mt2sql13.sql13.dbo.dtzpepflyerreports 
set advertiser = 'Albertsons SEA',advertiserID=12042782
where advertiser = 'Albertsons NW' and market = 'Seattle, WA'

--update mt2sql13.sql13.dbo.dtzpeppagereports 
set advertiser = 'Albertsons POR',advertiserID=12042783
where advertiser = 'Albertsons NW' and market = 'Portland, OR'

--update mt2sql13.sql13.dbo.dtzpeppagereports 
set advertiser = 'Albertsons SEA',advertiserID=12042782
where advertiser = 'Albertsons NW' and market = 'Seattle, WA'
