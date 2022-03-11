USE [SQL06]
GO
/****** Object:  StoredProcedure [dbo].[CustomstepSP_TPREXP]    Script Date: 10/4/2021 6:59:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[CustomstepSP_TPREXP]
(
@Category varchar(50),
@Flag int,
@IsDebug int = 0
)
AS
Begin

Declare @SQL NVARCHAR(max)
Declare @vchrControDbPrefix varchar(50)
SET @vchrControDbPrefix = dbo.mtfunc_GetDatabasePrefix('Control')

IF @Category='TPREXP' and @Flag=2
Begin

--FLYER REPORTS INSERT STATEMENT

SET @SQL='INSERT INTO '+@CATEGORY+'FlyerReports ([OriginalFlyerID],[FlyerID],[AdvertiserId],[Advertiser],[marketid],[market],[RetMktId],[mediaId],[media],[eventId],[event],[themeid],[theme],[PublicationId],[Publication],
[TradeClassId],[tradeclass],[AdDate],[WeekOf],[salestartdate],[saleenddate],[pages],[img],[size],[FirstPageHeight],[FirstPageWidth],[FlyerSpace],[CouponInd],[PublishedOn],[RegionId],[Region],
[DistrictId],[District],[CountryID],[Country],[LanguageID],[Language],[AdMonth],[AdMonthId],[AdDay],[AdDayId],[SalesTerritory],[SalesTerritoryId],[SalesTerritoryGroup],[SalesTerritoryGroupId],
[SalesTerritorySubGroup],[SalesTerritorySubGroupId],[subject],[persona],[receivedDt],[AdSalePeriod],[AdSaleWeek],[AdSaleMonth],[AdSaleYear],[WeekOfn],[WeekOfi],[VehicleId],[CreationMonth],
[Channel],[ChannelID],[DisplayMedia],[Source],[DistDt],[AdDist],[AdType],[AdTypeID],[AdDistID],[Spend],[ACRepflag],[ACCovid19])
SELECT [OriginalFlyerID],[FlyerID],[AdvertiserId],[Advertiser],[marketid],[market],[RetMktId],[mediaId],[media],[eventId],[event],[themeid],[theme],[PublicationId],[Publication],
[TradeClassId],[tradeclass],[AdDate],[WeekOf],[salestartdate],[saleenddate],[pages],[img],[size],[FirstPageHeight],[FirstPageWidth],[FlyerSpace],[CouponInd],[PublishedOn],[RegionId],[Region],
[DistrictId],[District],[CountryID],[Country],[LanguageID],[Language],[AdMonth],[AdMonthId],[AdDay],[AdDayId],[SalesTerritory],[SalesTerritoryId],[SalesTerritoryGroup],[SalesTerritoryGroupId],
[SalesTerritorySubGroup],[SalesTerritorySubGroupId],[subject],[persona],[receivedDt],[AdSalePeriod],[AdSaleWeek],[AdSaleMonth],[AdSaleYear],[WeekOfn],[WeekOfi],[VehicleId],[CreationMonth],
[Channel],[ChannelID],[DisplayMedia],[Source],[DistDt],[AdDist],[AdType],[AdTypeID],[AdDistID],[Spend],[ACRepflag],[ACCovid19]
FROM MT2SQL00.TPR.DBO.MasterTPRFlyerReports X WITH (NOLOCK) 
WHERE X.[FlyerID] NOT IN (SELECT Y.[FlyerID] FROM '+@CATEGORY+'FlyerReports Y WITH (NOLOCK) WHERE MEDIAID = 13652002)'
If @IsDebug = 1
		Print @SQL
	Else
		Exec (@SQL)


SET @SQL='TRUNCATE TABLE '+@CATEGORY+'DisMedia'

SET @SQL='INSERT INTO '+@CATEGORY+'DisMedia SELECT DISTINCT MediaId, Media FROM '+@CATEGORY+'FlyerReports WITH (NOLOCK) '


SET @SQL='TRUNCATE TABLE '+@CATEGORY+'DisAdvertiserMarket' 
If @IsDebug = 1
		Print @SQL
	Else
		Exec (@SQL)

SET @SQL='INSERT INTO '+@CATEGORY+'DisAdvertiserMarket
SELECT DISTINCT [TradeclassId], [Tradeclass], [AdvertiserId], [Advertiser], [MarketId], [Market], [RetMktId], [regionId], ISNULL([Region], '''') [Region], [districtId], 
ISNULL([District], '''') [District], [CountryId], [Country], ISNULL([SalesTerritory], '''') [SalesTerritory], [SalesTerritoryId], ISNULL([SalesTerritoryGroup], '''') [SalesTerritoryGroup], [SalesTerritoryGroupId], 
ISNULL([SalesTerritorySubGroup], '''') [SalesTerritorySubGroup], [SalesTerritorySubGroupId], [ChannelID], ISNULL([Channel], '''') [Channel], [ACRepflag]
FROM '+@CATEGORY+'FlyerReports WITH (NOLOCK)'
If @IsDebug = 1
		Print @SQL
	Else
		Exec (@SQL)


SET @SQL='INSERT INTO '+@CATEGORY+'PageReports([FlyerID],[OriginalFlyerID],[Page],[BackPageInd],[Features],[FeaturesId],[FrontPageInd],[FVDisplayPage],[FVSystemPage],[Height],[ImageName],[OrderValue],
[PageName],[PageSpace],[PageType],[PageTypeId],[Width],[AdvertiserId],[Advertiser],[marketid],[market],[RetMktId],[mediaId],[media],[eventId],[event],[themeid],[theme],[PublicationId],[Publication],
[TradeClassId],[tradeclass],[AdDate],[WeekOf],[salestartdate],[saleenddate],[pages],[img],[size],[FirstPageHeight],[FirstPageWidth],[FlyerSpace],[CouponInd],[PublishedOn],[RegionId],[Region],
[DistrictId],[District],[CountryID],[Country],[LanguageID],[Language],[AdMonth],[AdMonthId],[AdDay],[AdDayId],[SalesTerritory],[SalesTerritoryId],[SalesTerritoryGroup],
[SalesTerritoryGroupId],[SalesTerritorySubGroup],[SalesTerritorySubGroupId],[subject],[persona],[receivedDt],[AdSalePeriod],[AdSaleWeek],[AdSaleMonth],[AdSaleYear],[WeekOfn],[WeekOfi],[VehicleId],
[CreationMonth],[Channel],[ChannelID],[DisplayMedia],[Source],[DistDt],[AdDist],[AdType],[AdTypeID],[AdDistID],[ACPageID])
SELECT [FlyerID],[OriginalFlyerID],[Page],[BackPageInd],[Features],[FeaturesId],[FrontPageInd],[FVDisplayPage],[FVSystemPage],[Height],[ImageName],[OrderValue],
[PageName],[PageSpace],[PageType],[PageTypeId],[Width],[AdvertiserId],[Advertiser],[marketid],[market],[RetMktId],[mediaId],[media],[eventId],[event],[themeid],[theme],[PublicationId],[Publication],
[TradeClassId],[tradeclass],[AdDate],[WeekOf],[salestartdate],[saleenddate],[pages],[img],[size],[FirstPageHeight],[FirstPageWidth],[FlyerSpace],[CouponInd],[PublishedOn],[RegionId],[Region],
[DistrictId],[District],[CountryID],[Country],[LanguageID],[Language],[AdMonth],[AdMonthId],[AdDay],[AdDayId],[SalesTerritory],[SalesTerritoryId],[SalesTerritoryGroup],
[SalesTerritoryGroupId],[SalesTerritorySubGroup],[SalesTerritorySubGroupId],[subject],[persona], [receivedDt],[AdSalePeriod],[AdSaleWeek],[AdSaleMonth],[AdSaleYear],[WeekOfn],[WeekOfi],[VehicleId],
[CreationMonth],[Channel],[ChannelID],[DisplayMedia],[Source],[DistDt],[AdDist],[AdType],[AdTypeID],[AdDistID],''''[ACPageID]
FROM  MT2SQL00.TPR.DBO.MasterTPRPageReports X WITH (NOLOCK) 
WHERE  X.[FlyerID] NOT IN (SELECT Y.[FlyerID] FROM '+@CATEGORY+'PageReports Y WITH (NOLOCK) WHERE MEDIAID = 13652002)'
If @IsDebug = 1
		Print @SQL
	Else
		Exec (@SQL)

End

IF @Category='TPREXP' and @Flag=1
Begin

--DETAIL REPORTS INSERT STATEMENT

SET @SQL='INSERT INTO '+@CATEGORY+'DetailReports ([PageDetailID], [OriginalPageDetailID], [FlyerId], [OriginalFlyerID], [Page], [PageType], [OrderValue], [Height], [Width], [PageSpace], [AdvertiserId], [Advertiser], [marketid], [market], [RetMktId], [mediaId], [media], [eventId], [event], [Size], [FirstPageHeight], [FirstPageWidth], [FlyerSpace], [themeid], [theme], [PublicationId], [Publication], [TradeClassId], [tradeclass], [AdDate], [WeekOf], [salestartdate], [saleenddate], [Pages], [CouponInd], [PublishedOn], [RegionId], [Region], [DistrictId], [District], [CountryID], [Country], [LanguageID], [Language], [WeekOfn], [WeekOfi], [AdMonth], [AdMonthId], [subject], [persona], [receivedDt], [SalesTerritory], [SalesTerritoryId], [SalesTerritoryGroup], [SalesTerritoryGroupId], [SalesTerritorySubGroup], [SalesTerritorySubGroupId], [ManufacturerId], [Manufacturer], [MerchandiseCategoryId], [MerchandiseCategory], [MerchandiseSubCatId], [MerchandiseSubCat], [CategoryId], [Category], [BrandId], [Brand], [SKUDescription1ID], [SKUDescription1], [SKUDescription2ID], [SKUDescription2], [SKUDescription3ID], [SKUDescription3], [SKUTypeID], [SKUType], [SalePrice1], [SalePrice2], [RegularPrice1], [RegularPrice2], [NorPrice], [RebateAmount], [LowestRebatePrice], [LowestDiscountPrice], [UnitPrice], [Promotions], [Features], [NumberPackage], [Coupon], [CouponValueD1], [CouponValueD2], [CouponValueP1], [CouponValueP2], [OtherDiscountD1], [OtherDiscountD2], [OtherDiscountD3], [RequiredQuantity], [MaximumQuantity], [AdSize], [AdCost], [Illustrated], [SaleStDt], [SaleEndDt], [CouponExpirationDate], [Optional1], [Optional2], [Optional3], [Optional4], [Optional5], [Optional6], [Optional7], [Optional8], [Optional9], [Optional10], [Optional11], [Optional12], [Comments], [ProductTerritoryID], [ProductTerritory], [ProductTerritorySubGroupID], [ProductTerritorySubGroup], [ProductTerritoryGroupID], [ProductTerritoryGroup], [EnteredClient], [CouponExpirationDate1], [CouponExpirationDate2], [OtherDiscountP1], [OtherDiscountP2], [OtherDiscountP3], [Comments1], [OfferDes], [comments2], [comments3], [comments4], [topleftx], [toplefty], [bottomrightx], [bottomrighty], [UnitTypeId], [UnitType], [PkgSizeId], [PkgSize], [MPVPageEvent], [MPVPageEventId], [MPVPageTheme], [MPVPageThemeId], [MPVVariety], [MPVVarietyId], [MPVOrigin], [MPVOriginId], [MPVOffer], [MPVOfferId], [MPVOfferType], [MPVOfferTypeId], [MPVSKU], [MPVSKUID], [McUpdatedOn], [MscUpdatedOn], [MfrUpdatedOn], [PtUpdatedOn], [PtgUpdatedOn], [PtsgUpdatedOn], [FeaturesId], [AdType], [Img], [PageTypeId], [TaggedCompany], [DTAdded], [Weight], [MainOffer], [MainOfferId], [AdDay], [AdDayId], [VehicleId], [CreationMonth], [ImageName], [PageName], [FVSystemPage], [FVDisplayPage], [FrontPageInd], [BackPageInd], [AdSalePeriod], [AdSaleWeek], [AdSaleMonth], [AdSaleYear], [MediaDetail], [MediaDetailID], [Channel], [ChannelID], [DisplayMedia], [Source], [DistDt], [AdDist], [AdTypeID], [AdDistID], [Spend], [UnitDiscountPrice], [AC_Volume], [AC_Count], [AC_Form], [ACCOVID19], [ACMustBuy], [ACAdCompBrandId], [ACSegment], [ACNetPriceAfterIncentive], [ACEventName], [ACShowMathFlag], [ACNewItem], [ACAttributeName], [ACLoyaltyFlag], [ACCouponFlag], [ACRebateFlag], [ACLimtedTimeFlag], [ACLinerFlag], [ACMealDealFlag], [ACMultiPrd], [ACMultiMfg], [ACFSISameWeek], [ACDigitalSameWeek], [ACCouponSameWeek], [ACAdBlockCount], [ACBrandEquityFlag], [ACBrandFamily], [ACPrivateBrand], [ACProductsFlag], [ACParentAdcId], [ACPatchX], [ACrepflag], [ACAdImage], [ACAdGrade], [ACPageId], [AdBlockID], [ACBrandFamilyid])
SELECT X.[PageDetailID], X.[OriginalPageDetailID], X.[FlyerId], X.[OriginalFlyerID], [Page], [PageType], [OrderValue], [Height], [Width], [PageSpace], [AdvertiserId], [Advertiser], [marketid], [market], [RetMktId], [mediaId], [media], [eventId], [event], [Size], [FirstPageHeight], [FirstPageWidth], [FlyerSpace], [themeid], [theme], [PublicationId], [Publication], [TradeClassId], [tradeclass], [AdDate], [WeekOf], [salestartdate], [saleenddate], [Pages], [CouponInd], [PublishedOn], [RegionId], [Region], [DistrictId], [District], [CountryID], [Country], [LanguageID], [Language], [WeekOfn], [WeekOfi], [AdMonth], [AdMonthId], [subject], [persona], [receivedDt], [SalesTerritory], [SalesTerritoryId], [SalesTerritoryGroup], [SalesTerritoryGroupId], [SalesTerritorySubGroup], [SalesTerritorySubGroupId], [ManufacturerId], [Manufacturer], [MerchandiseCategoryId], [MerchandiseCategory], [MerchandiseSubCatId], [MerchandiseSubCat], [CategoryId], [Category], [BrandId], [Brand], [SKUDescription1ID], [SKUDescription1], [SKUDescription2ID], [SKUDescription2], [SKUDescription3ID], [SKUDescription3], [SKUTypeID], [SKUType], [SalePrice1], [SalePrice2], [RegularPrice1], [RegularPrice2], [NorPrice], [RebateAmount], [LowestRebatePrice], [LowestDiscountPrice], [UnitPrice], [Promotions], [Features], [NumberPackage], [Coupon], [CouponValueD1], [CouponValueD2], [CouponValueP1], [CouponValueP2], [OtherDiscountD1], [OtherDiscountD2], [OtherDiscountD3], [RequiredQuantity], [MaximumQuantity], [AdSize], [AdCost], [Illustrated], [SaleStDt], [SaleEndDt], [CouponExpirationDate], [Optional1], [Optional2], [Optional3], [Optional4], [Optional5], [Optional6], [Optional7], [Optional8], [Optional9], [Optional10], [Optional11], [Optional12], [Comments], [ProductTerritoryID], [ProductTerritory], [ProductTerritorySubGroupID], [ProductTerritorySubGroup], [ProductTerritoryGroupID], [ProductTerritoryGroup], [EnteredClient], [CouponExpirationDate1], [CouponExpirationDate2], [OtherDiscountP1], [OtherDiscountP2], [OtherDiscountP3], [Comments1], [OfferDes], [comments2], [comments3], [comments4], [topleftx], [toplefty], [bottomrightx], [bottomrighty], [UnitTypeId], [UnitType], [PkgSizeId], [PkgSize], [MPVPageEvent], [MPVPageEventId], [MPVPageTheme], [MPVPageThemeId], [MPVVariety], [MPVVarietyId], [MPVOrigin], [MPVOriginId], [MPVOffer], [MPVOfferId], [MPVOfferType], [MPVOfferTypeId], [MPVSKU], [MPVSKUID], [McUpdatedOn], [MscUpdatedOn], [MfrUpdatedOn], [PtUpdatedOn], [PtgUpdatedOn], [PtsgUpdatedOn], [FeaturesId], [AdType], [Img], [PageTypeId], [TaggedCompany], [DTAdded], [Weight], [MainOffer], [MainOfferId], [AdDay], [AdDayId], [VehicleId], [CreationMonth], [ImageName], [PageName], [FVSystemPage], [FVDisplayPage], [FrontPageInd], [BackPageInd], [AdSalePeriod], [AdSaleWeek], [AdSaleMonth], [AdSaleYear], [MediaDetail], [MediaDetailID], [Channel], [ChannelID], [DisplayMedia], [Source], [DistDt], [AdDist], [AdTypeID], [AdDistID], [Spend], [UnitDiscountPrice], [AC_Volume], [AC_Count], [AC_Form], [ACCOVID19], [ACMustBuy], [ACAdCompBrandId], [ACSegment], [ACNetPriceAfterIncentive], [ACEventName], [ACShowMathFlag], [ACNewItem], [ACAttributeName], [ACLoyaltyFlag], [ACCouponFlag], [ACRebateFlag], [ACLimtedTimeFlag], [ACLinerFlag], [ACMealDealFlag], [ACMultiPrd], [ACMultiMfg], [ACFSISameWeek], [ACDigitalSameWeek], [ACCouponSameWeek], [ACAdBlockCount], [ACBrandEquityFlag], [ACBrandFamily], [ACPrivateBrand], [ACProductsFlag], [ACParentAdcId], [ACPatchX], [ACrepflag], [ACAdImage], [ACAdGrade], [ACPageId], [AdBlockID], [ACBrandFamilyid]
FROM MT2SQL00.TPR.DBO.MasterTPRDetailReports X WITH (NOLOCK) 
JOIN (SELECT DISTINCT ProductDetailID FROM MT2SQL00.TPR.DBO.TPR_rawdata_Capture_v2 Z WITH (NOLOCK) WHERE Z.IsProcessed > 0) ZZ ON X.[OriginalPageDetailID] = ZZ.[ProductDetailID]
WHERE X.CategoryID IN (18,22,30,93,99,103,125,219,247,315,438,511,628,673,891,974,1032,1163,1659,1660,1672,1673,1846,2945,74494,1028989,1116927,1116936,1117006,10303009,10303016,10303017,10303021,10303023,10303054,10303090,10303129,10303149,10303150,10303192,10303201,10303202,10303203,10303204,10303205,10303206,10303208,10303209,10303210,10303251,10303297,10303306,10303314,10303315,10303379,10303400,10303401,10303412,10303419,10303452,10303483,10303484,10303485,10303486,10303487,10303498,10303501,10303502,10303530,10303531,10303532,10303533,10303534,10303536,10303537,10303554,10303562,10303577,10303584,10303585,10303664,10303701,10303733,11651096,11651098,11651099,11651100,11651101,11651102,11651103,11651104,11651105,11651629)
AND X.PageDetailID NOT IN (SELECT Y.PageDetailID FROM  '+@CATEGORY+'DetailReports Y WITH (NOLOCK) WHERE MEDIAID = 13652002)'
If @IsDebug = 1
		Print @SQL
	Else
		Exec (@SQL)


SET @SQL='TRUNCATE TABLE '+@CATEGORY+'DisQueryPage'
If @IsDebug = 1
		Print @SQL
	Else
		Exec (@SQL)

SET @SQL='INSERT INTO '+@CATEGORY+'DisQueryPage
SELECT DISTINCT [BrandId], [Brand], [ManufacturerId], [Manufacturer], [MerchandiseCategoryId], [MerchandiseCategory], [MerchandiseSubCatId], [MerchandiseSubCat], [CategoryId], [Category], [ProductTerritoryID], 
ISNULL([ProductTerritory], '''') [ProductTerritory], [ProductTerritoryGroupID], ISNULL([ProductTerritoryGroup], '''') [ProductTerritoryGroup], [ProductTerritorySubGroupID], 
ISNULL([ProductTerritorySubGroup], '''') [ProductTerritorySubGroup], [SKUDescription1], [SKUDescription1ID], [SKUDescription2], [SKUDescription2ID], [SKUDescription3], [SKUDescription3ID], [SKUType], [SKUTypeID], [ACBrandFamily], [ACBrandFamilyId]
FROM '+@CATEGORY+'DetailReports WITH (NOLOCK)'
If @IsDebug = 1
		Print @SQL
	Else
		Exec (@SQL)

End 

End