
-- Insert Into TPRImageProcessing
select Distinct OriginalPageDetailID As PageDetailID, VehicleID, Comments1 PageImage, Comments3 ProductImage, 0 As Created, NULL AS DTTM
from TPRdetailreports
where OriginalPageDetailID Not In (Select PageDetailID From TPRImageProcessing)


Select Distinct Advertiser, AdvertiserID, Category, CategoryID, Event, EventID, Market, MarketID, Media, MediaID, MPVPageEventID, MPVVarietyID
From TPRDetailReports 
 
select * from TPRImageProcessing

SelecT  Distinct Advertiser, AdvertiserID From Advertiser 
order by 2

select * From TPRDetailReports 
 order by 1

