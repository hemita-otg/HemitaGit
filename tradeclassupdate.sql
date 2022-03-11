
select distinct RetID,Advertiser from MasterClientCoverage..RetMkt where Advertiser like '%super v%'
where advertiser in (
select distinct advertiser from kcca50DisAdvertiserMarket)



Select * from MasterClientCoverage..tblAVTradeclass