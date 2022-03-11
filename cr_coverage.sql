select distinct Advertiser from mt2sql15.sql15.dbo.logCRDisAdvertiserMarket order by 1
where Advertiser = '100%.'
order by 1



select  distinct Advertiser  from mt2sql15.sql15.dbo.crDetailReports
where advertiser like '%hse%'

--7006

select * from MasterCRRegion
--update MasterCRAdvertiser set advertiser = 'W''Hse Stationery'
where CategoryCodeid =7006 
and  merchandisesubcat  in ('Gaming Accessories','Headphones','PC Peripherals','Speakers')