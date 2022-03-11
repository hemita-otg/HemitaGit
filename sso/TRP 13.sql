use sql13

Truncate table TPRDetailReports
Truncate Table TPRFlyerReports
Truncate Table TPRPageReports

--Alter table TPRDetailReports Alter Column MPVOriginID varchar(5000)

Insert Into TPRDetailReports ([PageDetailID], [OriginalPageDetailID], [flyerid], [OriginalFlyerID], [page], [pagetype], [OrderValue], [Height], [Width], [PageSpace], [AdvertiserId], [Advertiser], [marketid], [market], [mediaId], [media], [eventId], [Event], [Size], [FirstPageHeight], [FirstPageWidth], [FlyerSpace], [themeid], [theme], [PublicationId], [Publication], [TradeClassId], [tradeclass], [pages], [CouponInd], [RegionId], [Region], [DistrictId], [District], [CountryID], [Country], [LanguageID], [Language], [WeekOfn], [WeekOfi], [AdMonth], [admonthid], [subject], [persona], [SalesTerritory], [SalesTerritoryId], [SalesTerritoryGroup], [SalesTerritoryGroupId], [SalesTerritorySubGroup], [SalesTerritorySubGroupId], [ManufacturerId], [Manufacturer], [MerchandiseCategoryId], [MerchandiseCategory], [MerchandiseSubCatId], [MerchandiseSubCat], [CategoryId], [Category], [Brandid], [brand], [SKUDescription1ID], [SKUDescription1], [SKUDescription2ID], [SKUDescription2], [SKUDescription3ID], [SKUDescription3], [SKUTypeID], [SKUType], [SalePrice1], [SalePrice2], [RegularPrice1], [RegularPrice2], [NorPrice], [RebateAmount], [LowestRebatePrice], [LowestDiscountPrice], [UnitPrice], [Promotions], [Features], [NumberPackage], [CouponValueP1], [CouponValueP2], [RequiredQuantity], [MaximumQuantity], [AdSize], [AdCost], [Illustrated], [SaleStDt], [SaleEndDt], [CouponExpirationDate], [Optional1], [Optional2], [Optional3], [Optional4], [Optional5], [Optional6], [Optional7], [Optional8], [Optional9], [Optional10], [Optional11], [Optional12], [Comments], [ProductTerritoryID], [ProductTerritory], [ProductTerritorySubGroupID], [ProductTerritorySubGroup], [ProductTerritoryGroupID], [ProductTerritoryGroup], [EnteredClient], [CouponExpirationDate1], [CouponExpirationDate2], [OtherDiscountP1], [OtherDiscountP2], [OtherDiscountP3], [Comments1], [OfferDes], [comments2], [comments3], [comments4], [topleftx], [toplefty], [bottomrightx], [bottomrighty], [UnitTypeId], [UnitType], [PkgSizeId], [PkgSize], [MPVPageEvent], [MPVPageEventId], [MPVPageTheme], [MPVPageThemeId], [MPVVariety], [MPVVarietyid], [MPVOrigin], [MPVOriginId], [MPVOffer], [MPVOfferId], [MPVOfferType], [MPVOfferTypeId], [MPVSKU], [MPVSKUID], [McUpdatedOn], [MscUpdatedOn], [MfrUpdatedOn], [PtUpdatedOn], [PtgUpdatedOn], [PtsgUpdatedOn], [FeaturesId], [AdType], [Img], [PageTypeId], [TaggedCompany], [DTAdded], [Weight], [MainOffer], [offerid], [AdDay], [AdDayId], [VehicleId], [CreationMonth], [ImageName], [PageName], [FVSystemPage], [FVDisplayPage], [FrontPageInd], [BackPageInd], [AdSalePeriod], [AdSaleWeek], [AdSaleMonth], [AdSaleYear], [MediaDetail], [MediaDetailID], [Channel], [ChannelID], [DisplayMedia], [Source], [DistDt], [AdDist], [AdTypeID], [AdDistID], [City], [State], [ZipCode], [Gender], [DoB], [AgeBracket], [PageStartDt], [PageEndDt], [AC_Volume], [AC_Count], [AC_Form], [ACCOVID19], [ACMustBuy], [ACAdCompBrandId], [ACSegment], [ACNetPriceAfterIncentive], [ACEventName], [ACShowMathFlag], [ACNewItem], [ACAttributeName], [ACLoyaltyFlag], [ACCouponFlag], [ACRebateFlag], [ACLimtedTimeFlag], [ACLinerFlag], [ACMealDealFlag], [ACMultiPrd], [ACMultiMfg], [ACFSISameWeek], [ACDigitalSameWeek], [ACCouponSameWeek], [ACAdBlockCount], [ACBrandEquityFlag], [ACBrandFamily], [ACPrivateBrand], [ACProductsFlag], [ACParentAdcId], [ACrepflag], [ACAdImage], [ACAdGrade], [ACPageId], [AdBlockID], [ACBrandFamilyid]
,[RetMktId], [AdDate], [WeekOf], [salestartdate], [saleenddate], [PublishedOn], [receivedDt], [Coupon], [CouponValueD1], [CouponValueD2], [OtherDiscountD1], [OtherDiscountD2], [OtherDiscountD3], [Spend], [UnitDiscountPrice], [ACPatchX])
Select [PageDetailID], [OriginalPageDetailID], [flyerid], [OriginalFlyerID], [page], [pagetype], [OrderValue], [Height], [Width], [PageSpace], [AdvertiserId], [Advertiser], [marketid], [market], [mediaId], [media], [eventId], [Event], [Size], [FirstPageHeight], [FirstPageWidth], [FlyerSpace], [themeid], [theme], [PublicationId], [Publication], [TradeClassId], [tradeclass], [pages], [CouponInd], [RegionId], [Region], [DistrictId], [District], [CountryID], [Country], [LanguageID], [Language], [WeekOfn], [WeekOfi], [AdMonth], [admonthid], [subject], [persona], [SalesTerritory], [SalesTerritoryId], [SalesTerritoryGroup], [SalesTerritoryGroupId], [SalesTerritorySubGroup], [SalesTerritorySubGroupId], [ManufacturerId], [Manufacturer], [MerchandiseCategoryId], [MerchandiseCategory], [MerchandiseSubCatId], [MerchandiseSubCat], [CategoryId], [Category], [Brandid], [brand], [SKUDescription1ID], [SKUDescription1], [SKUDescription2ID], [SKUDescription2], [SKUDescription3ID], [SKUDescription3], [SKUTypeID], [SKUType], [SalePrice1], [SalePrice2], [RegularPrice1], [RegularPrice2], [NorPrice], [RebateAmount], [LowestRebatePrice], [LowestDiscountPrice], [UnitPrice], [Promotions], [Features], [NumberPackage], [CouponValueP1], [CouponValueP2], [RequiredQuantity], [MaximumQuantity], [AdSize], [AdCost], [Illustrated], [SaleStDt], [SaleEndDt], [CouponExpirationDate], [Optional1], [Optional2], [Optional3], [Optional4], [Optional5], [Optional6], [Optional7], [Optional8], [Optional9], [Optional10], [Optional11], [Optional12], [Comments], [ProductTerritoryID], [ProductTerritory], [ProductTerritorySubGroupID], [ProductTerritorySubGroup], [ProductTerritoryGroupID], [ProductTerritoryGroup], [EnteredClient], [CouponExpirationDate1], [CouponExpirationDate2], [OtherDiscountP1], [OtherDiscountP2], [OtherDiscountP3], [Comments1], [OfferDes], [comments2], [comments3], [comments4], [topleftx], [toplefty], [bottomrightx], [bottomrighty], [UnitTypeId], [UnitType], [PkgSizeId], [PkgSize], [MPVPageEvent], [MPVPageEventId], [MPVPageTheme], [MPVPageThemeId], [MPVVariety], [MPVVarietyid], Cast([MPVOrigin] as varchar(4000)) MPVOrigin, [MPVOriginId], [MPVOffer], [MPVOfferId], [MPVOfferType], [MPVOfferTypeId], [MPVSKU], [MPVSKUID], [McUpdatedOn], [MscUpdatedOn], [MfrUpdatedOn], [PtUpdatedOn], [PtgUpdatedOn], [PtsgUpdatedOn], [FeaturesId], [AdType], [Img], [PageTypeId], [TaggedCompany], [DTAdded], [Weight], [MainOffer], [offerid], [AdDay], [AdDayId], [VehicleId], [CreationMonth], [ImageName], [PageName], [FVSystemPage], [FVDisplayPage], [FrontPageInd], [BackPageInd], [AdSalePeriod], [AdSaleWeek], [AdSaleMonth], [AdSaleYear], [MediaDetail], [MediaDetailID], [Channel], [ChannelID], [DisplayMedia], [Source], [DistDt], [AdDist], [AdTypeID], [AdDistID], [City], [State], [ZipCode], [Gender], [DoB], [AgeBracket], [PageStartDt], [PageEndDt], [AC_Volume], [AC_Count], [AC_Form], [ACCOVID19], [ACMustBuy], [ACAdCompBrandId], [ACSegment], [ACNetPriceAfterIncentive], [ACEventName], [ACShowMathFlag], [ACNewItem], [ACAttributeName], [ACLoyaltyFlag], [ACCouponFlag], [ACRebateFlag], [ACLimtedTimeFlag], [ACLinerFlag], [ACMealDealFlag], [ACMultiPrd], [ACMultiMfg], [ACFSISameWeek], [ACDigitalSameWeek], [ACCouponSameWeek], [ACAdBlockCount], [ACBrandEquityFlag], [ACBrandFamily], [ACPrivateBrand], [ACProductsFlag], [ACParentAdcId], [ACrepflag], [ACAdImage], [ACAdGrade], [ACPageId], OriginalPageDetailID [AdBlockID], [ACBrandFamilyid]
,[RetMktId], [AdDate], [WeekOf], [salestartdate], [saleenddate], [PublishedOn], [receivedDt], [Coupon], [CouponValueD1], [CouponValueD2], [OtherDiscountD1], [OtherDiscountD2], [OtherDiscountD3], [Spend], [UnitDiscountPrice], [ACPatchX]
from Mt2SQL00.TPR.DBO.TPRDetailReports
Where PageDetailID Not In (Select X.PageDetailID From TPRDetailReports X)

-- Drop table TPRDisVariety

select Distinct VarietyID, Variety 
Into TPRDisVariety 
from  Mt2SQL00.TPR.DBO.Variety
Order by 1

-- Drop table TPRDisOrigin

select Distinct OriginID, Origin 
Into TPRDisOrigin 
from  Mt2SQL00.TPR.DBO.Origin
Order by 1

-- Drop table TPRDisPageEvent

select Distinct PageEventID, PageEvent 
Into TPRDisPageEvent 
from  Mt2SQL00.TPR.DBO.PageEvent
Order by 1

-- Drop table TPRDisAdvertiserMarket

Select Distinct [TradeclassId], [Tradeclass], [AdvertiserId], [Advertiser], [MarketId], [Market], [RetMktId], [regionId], [Region], [districtId], [District], [CountryId], [Country], [SalesTerritory], [SalesTerritoryId], [SalesTerritoryGroup], [SalesTerritoryGroupId], [SalesTerritorySubGroup], [SalesTerritorySubGroupId], [ChannelID], [Channel], [ACRepflag]
Into TPRDisAdvertiserMarket 
From TPRDetailReports

-- Drop Table TPRDisDateRanges

Select Distinct [AdDate], [WeekOf], [AdMonthId], [AdMonth], [WeekOfi], [WeekOfn], [SaleStartDate], [SaleEndDate]
Into TPRDisDateRanges 
From TPRDetailReports Order by 1

-- Drop Table TPRDisQueryPage

select Distinct [BrandId], [Brand], [ManufacturerId], [Manufacturer], [MerchandiseCategoryId], [MerchandiseCategory], [MerchandiseSubCatId], [MerchandiseSubCat], [CategoryId], [Category], [ProductTerritoryID], [ProductTerritory], [ProductTerritoryGroupID], [ProductTerritoryGroup], [ProductTerritorySubGroupID], [ProductTerritorySubGroup], [SKUDescription1], [SKUDescription2], [SKUDescription3], [SKUType], [ACBrandFamily], [ACBrandFamilyId]
Into TPRDisQueryPage 
From TPRDetailReports

-- Drop Table TPRDisMedia

select Distinct MediaId, Media
Into TPRDisMedia  From TPRDetailReports

-- Drop Table TPRDisMainOffer

select Distinct NULL MainOfferID, MainOffer
Into TPRDisMainOffer  From TPRDetailReports

Insert Into TPRFlyerReports ([OriginalFlyerID], [FlyerID], [AdvertiserId], [Advertiser], [marketid], [market], [RetMktId], [mediaId], [media], [eventId], [event], [themeid], [theme], [PublicationId], [Publication], [TradeClassId], [tradeclass], [AdDate], [WeekOf], [salestartdate], [saleenddate], [pages], [img], [size], [FirstPageHeight], [FirstPageWidth], [FlyerSpace], [CouponInd], [PublishedOn], [RegionId], [Region], [DistrictId], [District], [CountryID], [Country], [LanguageID], [Language], [AdMonth], [AdMonthId], [AdDay], [AdDayId], [SalesTerritory], [SalesTerritoryId], [SalesTerritoryGroup], [SalesTerritoryGroupId], [SalesTerritorySubGroup], [SalesTerritorySubGroupId], 
[subject], [persona], [receivedDt], [AdSalePeriod], [AdSaleWeek], [AdSaleMonth], [AdSaleYear], [WeekOfn], [WeekOfi], [VehicleId], [CreationMonth], [Channel], [ChannelID], [DisplayMedia], [Source], [DistDt], [AdDist], [AdType], [AdTypeID], [AdDistID], [City], [State], [ZipCode], [Gender], [DoB], [AgeBracket], 
[Spend], [ACRepflag], [ACCOVID19])
Select Distinct [OriginalFlyerID], [FlyerID], [AdvertiserId], [Advertiser], [marketid], [market], [RetMktId], [mediaId], [media], [eventId], [event], [themeid], [theme], [PublicationId], [Publication], [TradeClassId], [tradeclass], [AdDate], [WeekOf], [salestartdate], [saleenddate], [pages], [img], [size], [FirstPageHeight], [FirstPageWidth], [FlyerSpace], [CouponInd], [PublishedOn], [RegionId], [Region], [DistrictId], [District], [CountryID], [Country], [LanguageID], [Language], [AdMonth], [AdMonthId], [AdDay], [AdDayId], [SalesTerritory], [SalesTerritoryId], [SalesTerritoryGroup], [SalesTerritoryGroupId], [SalesTerritorySubGroup], [SalesTerritorySubGroupId], 
[subject], [persona], [receivedDt], [AdSalePeriod], [AdSaleWeek], [AdSaleMonth], [AdSaleYear], [WeekOfn], [WeekOfi], [VehicleId], [CreationMonth], [Channel], [ChannelID], [DisplayMedia], [Source], [DistDt], [AdDist], [AdType], [AdTypeID], [AdDistID], [City], [State], [ZipCode], [Gender], [DoB], [AgeBracket], 
[Spend], [ACRepflag], [ACCOVID19]
From TPRDetailReports Where FlyerID Not In (Select X.FlyerID From TPRFlyerReports X)

Insert Into TPRPageReports ([BackPageInd], [Features], [FeaturesId], [FrontPageInd], [FVDisplayPage], [FVSystemPage], [Height], [ImageName], [OrderValue], [Page], [PageEndDt], [PageName], [PageSpace], [PageStartDt], [PageType], [PageTypeId], [Width], [OriginalFlyerID], [FlyerID], [AdvertiserId], [Advertiser], [marketid], [market], [RetMktId], [mediaId], [media], [eventId], [event], [themeid], [theme], [PublicationId], [Publication], [TradeClassId], [tradeclass], [AdDate], [WeekOf], [salestartdate], [saleenddate], [pages], [img], [size], [FirstPageHeight], [FirstPageWidth], [FlyerSpace], [CouponInd], [PublishedOn], [RegionId], [Region], [DistrictId], [District], [CountryID], [Country], [LanguageID], [Language], [AdMonth], [AdMonthId], [AdDay], [AdDayId], [SalesTerritory], [SalesTerritoryId], [SalesTerritoryGroup], [SalesTerritoryGroupId], [SalesTerritorySubGroup], [SalesTerritorySubGroupId], 
[subject], [persona], [receivedDt], [AdSalePeriod], [AdSaleWeek], [AdSaleMonth], [AdSaleYear], [WeekOfn], [WeekOfi], [VehicleId], [CreationMonth], [Channel], [ChannelID], [DisplayMedia], [Source], [DistDt], [AdDist], [AdType], [AdTypeID], [AdDistID], [City], [State], [ZipCode], [Gender], [DoB], [AgeBracket], 
[Spend], [ACRepflag], [ACPageId], [ACCOVID19])
Select Distinct [BackPageInd], [Features], [FeaturesId], [FrontPageInd], [FVDisplayPage], [FVSystemPage], [Height], [ImageName], [OrderValue], [Page], [PageEndDt], [PageName], [PageSpace], [PageStartDt], [PageType], [PageTypeId], [Width], [OriginalFlyerID], [FlyerID], [AdvertiserId], [Advertiser], [marketid], [market], [RetMktId], [mediaId], [media], [eventId], [event], [themeid], [theme], [PublicationId], [Publication], [TradeClassId], [tradeclass], [AdDate], [WeekOf], [salestartdate], [saleenddate], [pages], [img], [size], [FirstPageHeight], [FirstPageWidth], [FlyerSpace], [CouponInd], [PublishedOn], [RegionId], [Region], [DistrictId], [District], [CountryID], [Country], [LanguageID], [Language], [AdMonth], [AdMonthId], [AdDay], [AdDayId], [SalesTerritory], [SalesTerritoryId], [SalesTerritoryGroup], [SalesTerritoryGroupId], [SalesTerritorySubGroup], [SalesTerritorySubGroupId], 
[subject], [persona], [receivedDt], [AdSalePeriod], [AdSaleWeek], [AdSaleMonth], [AdSaleYear], [WeekOfn], [WeekOfi], [VehicleId], 'None' [CreationMonth], [Channel], [ChannelID], [DisplayMedia], [Source], [DistDt], [AdDist], [AdType], [AdTypeID], [AdDistID], [City], [State], [ZipCode], [Gender], [DoB], [AgeBracket], 
[Spend], [ACRepflag], [ACPageId], [ACCOVID19]
From TPRDetailReports Where FlyerID Not In (Select X.FlyerID From TPRPageReports X)


Update TPRDetailReports set AdBlockID = OriginalPageDetailID 
Update TPRFlyerReports Set RetMktID = AdvertiserID + MarketID Where RetmktID = 0
Update TPRPageReports Set RetMktID = AdvertiserID + MarketID Where RetmktID = 0
Update TPRDetailReports Set RetMktID = AdvertiserID + MarketID Where RetmktID = 0
Update TPRDisAdvertiserMarket Set RetMktID = AdvertiserID + MarketID Where RetmktID = 0

Update TPRDetailReports Set FeaturesId = 10758057, Features = 'Weekly Online Ad'
Update TPRPageReports Set FeaturesId = 10758057, Features = 'Weekly Online Ad'


Update TPRDetailReports Set   MediaDetail = MEdia, MediaDetailID = mediaId 

Alter Table TPRDetailReports Add URL varchar(255)

Update TPRDetailReports Set URL =  Comments4  
Update TPRDetailReports  Set CouponValueP1 = RebateAmount 
Update TPRDetailReports  Set RebateAmount = Promotions  

select CouponValueP1, Comments1, Comments2, Comments3, comments4, PageDetailId, OriginalPageDetailID, FlyerID, OriginalFlyerID, Page,  Img,
AdvertiserId, Advertiser, MarketID, Market, RetMktID, MediaID, Media, EventId, Event, ThemeId, Theme, 
TradeClassId , tradeclass, AdDate, WeekOf, salestartdate, saleenddate, Pages, CountryID, Country, AdMonth, admonthid, 
Category, CategoryId, SKUDescription1, SKUDescription2, SKUDescription3, 
RebateAmount, Promotions, OfferDes, MPVVariety, MPVVarietyid, MPVPageEvent, MPVPageEventId, MPVORigin, 
MainOffer from TPRDetailReports Order by PagedetailId desc
 
select admonth , features , * from TPRDetailReports 
 
Alter Table TPRDetailReports Alter Column WeekOfn datetime
Alter Table TPRDetailReports Alter Column AdMonth Varchar(100)
Alter Table TPRDetailReports Alter Column AdDate datetime
Alter table TPRFlyerReports Alter Column AdDate datetime
Alter table TPRPageReports Alter Column AdDate datetime
Alter table TPRDetailReports Alter Column MPVPageEvent Varchar(4000)
Alter table TPRDetailReports Alter Column MPVVariety Varchar(4000)
Alter table TPRDetailReports Alter Column MPVOrigin Varchar(4000)
Alter table TPRDetailReports Alter Column ACPatchX nvarchar(200)

  
   
--select AdDate, SaleStartDate, SaleEndDate, weekof, 
UPDATE A Set 
AdDate = Convert(varchar(10), addate, 101),
WeekOf = dateadd(day,-(datepart(dw,AdDate)-1), AdDate),
WeekOfi = Dateadd(day, 8 - DatePart(weekday,Addate), Addate), 
WeekOfn =  Dateadd(day, -1, Dateadd(day, 8 - DatePart(weekday,Addate), Addate)),
[AdMonthId] = dateadd(dd, (-1 * datepart(dd, AdDate)) + 1, AdDate), 
[AdMonth] = DateName(mm, AdDate) + ' - ' + DateName(yyyy,AdDate) 
From TPRPageReports  A
 
select Comments1, comments2, comments3, comments4, * from TPRDetailReports where vehicleid = '544385'

--pgPepDisComments3
--pgPepDisFeatures
--pgPepDisMainOffer
--pgPepDisOfferType
--pgPepDisOrigin
--pgPepDisPageEvent
--pgPepDisPublication
--pgPepDisUnitType
--pgPepDisVariety
--pgPEPDetailReports

select mpvorigin, mpvvariety, mpvpageevent, * from TPRDetailReports
Alter Table TPRDetailReports Alter Column OriginalPageDetailID 

Update TPRDetailReports set FlyerID = Cast(FlyerID as varchar) + '000' Where FlyerID < 544385000
Update TPRFlyerReports set FlyerID = Cast(FlyerID as varchar) + '000'  Where FlyerID < 544385000
Update TPRPageReports set FlyerID = Cast(FlyerID as varchar) + '000'  Where FlyerID < 544385000


Update TPRDetailReports set OriginalPageDetailID = Cast(OriginalPageDetailID as varchar) + '000000' Where OriginalPageDetailID < 1000000
Update TPRDetailReports set PageDetailID = OriginalFlyerID Where PageDetailID < 1000000


Alter Table TPRDetailReports Alter Column OriginalPageDetailID BigInt

Alter Table TPRDetailReports Alter Column OriginalFlyerID Varchar(50)
Alter Table TPRFlyerReports Alter Column OriginalFlyerID Varchar(50)
Alter Table TPRPageReports Alter Column OriginalFlyerID Varchar(50)
 

Alter Table TPRDetailReports Alter Column OriginalFlyerID Varchar(50)

exec DataSP50Int.[dbo].[FV_GetFlyerPagesAC] @pFlyerId='546353000',@pBaseUrl='',@pConnDBPrefix='[MT2SQL03].[Connection].[dbo].',@pImageSize='s',@pFVCCType='4'

select *from TPRDetailReports





select max(pagedetailid) from MasterACFV..ACFVDetailReports 

select * from tempdb..fved0e9ad7q001detail 