use masteradviewdata

BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO
COMMIT
if exists (select * from sysobjects where id = object_id(N'[dbo].[TTmp_TEMPxPageDetailtable]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TTmp_TEMPxPageDetailtable]
GO
CREATE TABLE dbo.TTmp_TEMPxPageDetailtable
	(
 	FlyerID varchar(11) NULL,
	Page int NULL,
	PageDetailID varchar(11) NOT NULL,
	ThumbImagePath varchar(100) NULL,
	NormalImagePath varchar(100) NULL,
	FullImagePath varchar(100) NULL,
	ProductImagePath varchar(100) NULL,
	MultipleValues varchar (1) NULL,
	DTAdded datetime NULL,
	Retailer varchar(37) NULL,
	TaggedCompany varchar(37) NULL,
	Manufacturer varchar(100) NULL,
	MerchandiseCategory varchar(100) NULL,
	MerchandiseSubCat varchar(100) NULL,
	Category varchar(100) NULL,
	Brand varchar(100) NULL,
	SKUDescription1 varchar(100) NULL,
	SKUDescription2 varchar(100) NULL,
	SKUDescription3 varchar(100) NULL,
	SKUType varchar(100) NULL,
	SalePrice1 numeric(18, 2) NULL,
	SalePrice2 numeric(18, 2) NULL,
	RegularPrice1 numeric(18, 2) NULL,
	RegularPrice2 numeric(18, 2) NULL,
	NORPrice numeric(18, 2) NULL,
	RebateAmount numeric(18, 2) NULL,
	LowestRebatePrice numeric(18, 2) NULL,
	LowestDiscountPrice numeric(18, 2) NULL,
	UnitPrice numeric(18, 2) NULL,
	Promotions varchar(100) NULL,
	PageEvent varchar(100) NULL,
	PageTheme varchar(100) NULL,
	Features varchar(100) NULL,
	NumberPackage int NULL,
	Coupon Numeric(8) NULL,
	CouponValueD1 numeric(18, 2) NULL,
	CouponValueD2 numeric(18, 2) NULL,
	CouponValueP1 int NULL,
	CouponValueP2 int NULL,
	CouponValueP3 int NULL,		--new added
	OtherDiscountD1 numeric(18, 2) NULL,
	OtherDiscountD2 numeric(18, 2) NULL,
	OtherDiscountD3 numeric(18, 2) NULL,
	RequiredQuantity int NULL,
	MaximumQuantity int NULL,
	AdSize int NULL,
	AdCost int NULL,
	Illustrated Numeric(8) NULL,
	Color Numeric(8) NULL,
	NoOfColors int NULL,
	SaleStDt smalldatetime NULL,
	SaleEndDt smalldatetime NULL,
	CouponExpirationDate smalldatetime NULL,
	Optional1 varchar(100) NULL,
	Optional2 varchar(100) NULL,
	Optional3 varchar(100) NULL,
	Optional4 varchar(100) NULL,
	Optional5 varchar(100) NULL,
	Optional6 varchar(100) NULL,
	Optional7 varchar(200) NULL,
	Optional8 varchar(200) NULL,
	Optional9 varchar(100) NULL,
	Optional10 varchar(100) NULL,
	Optional11 varchar(100) NULL,
	Optional12 varchar(100) NULL,
	Comments Numeric(8) NULL,
	ProductTerritory varchar(100) NULL,
	ProductTerritorySubGroup varchar(100) NULL,
	ProductTerritoryGroup varchar(100) NULL,
	EnteredClient Numeric(8) NULL,
	CouponExpirationDate1 smalldatetime NULL,
	CouponExpirationDate2 smalldatetime NULL,
	OtherDiscountP1 int NULL,
	OtherDiscountP2 int NULL,
	OtherDiscountP3 int NULL,
	comments1 varchar(510) NULL,
	comments2 varchar(255) NULL,
	comments3 varchar(255) NULL,
	comments4 varchar(255) NULL,
	topleftx int NOT NULL CONSTRAINT DF_TTEMPxPageDetailtable_topleftx DEFAULT (0),
	toplefty int NOT NULL CONSTRAINT DF_TTEMPxPageDetailtable_toplefty DEFAULT (0),
	bottomrightx int NOT NULL CONSTRAINT DF_TTEMPxPageDetailtable_bottomrightx DEFAULT (0),
	bottomrighty int NOT NULL CONSTRAINT DF_TTEMPxPageDetailtable_bottomrighty DEFAULT (0),
	McUpdatedOn smalldatetime NULL,
	MscUpdatedOn smalldatetime NULL,
	MfrUpdatedOn smalldatetime NULL,
	PtUpdatedOn smalldatetime NULL,
	PtgUpdatedOn smalldatetime NULL,
	PtsgUpdatedOn smalldatetime NULL,
	ProdImageCreated Numeric(8) NULL,
	ProdImageCreatedOn smalldatetime NULL,
  Origin varchar(50) null,
  Variety varchar(100) null,
  UnitType varchar(50) null,
  PkgSize decimal(18, 2) NULL,
	Offerdes varchar(255) NULL,
	entrycomments1 varchar(512) NULL,
	EntryBrand varchar(100) NULL,
	RegularUnitPrice numeric(18,2) NULL,
	EntryTaggedCompany varchar(37) NULL,
	Weight decimal(9,6) NULL,
	MediaDetail varchar(100) NULL,
	QtySave	 decimal(18,2) NULL, 
	PurchaseOf	 decimal(18,2) NULL, 
	UnitDiscountPrice	 decimal(18,2) NULL, 
	DiscountType	Int NULL, 
	OrMore	Int NULL,
	PageDetailIdInt BigInt
	) ON [PRIMARY]
GO

IF EXISTS(SELECT * FROM dbo.TEMPxPageDetailtable)
	 EXEC('INSERT INTO dbo.TTmp_TEMPxPageDetailtable(FlyerID, Page, PageDetailID, ThumbImagePath, NormalImagePath, FullImagePath, ProductImagePath, MultipleValues, DTAdded, Retailer, TaggedCompany, Manufacturer, MerchandiseCategory, MerchandiseSubCat, Category, Brand, SKUDescription1, SKUDescription2, SKUDescription3, SKUType, SalePrice1, SalePrice2, RegularPrice1, RegularPrice2, NORPrice, RebateAmount, LowestRebatePrice, LowestDiscountPrice, UnitPrice, Promotions, PageEvent, PageTheme, Features, NumberPackage, Coupon, CouponValueD1, CouponValueD2, CouponValueP1, CouponValueP2, CouponValueP3, OtherDiscountD1, OtherDiscountD2, OtherDiscountD3, RequiredQuantity, MaximumQuantity, AdSize, AdCost, Illustrated, Color, NoOfColors, SaleStDt, SaleEndDt, CouponExpirationDate, Optional1, Optional2, Optional3, Optional4, Optional5, Optional6, Optional7, Optional8, Optional9, Optional10, Optional11, Optional12, Comments, ProductTerritory, ProductTerritorySubGroup, ProductTerritoryGroup, EnteredClient, CouponExpirationDate1, CouponExpirationDate2, OtherDiscountP1, OtherDiscountP2, OtherDiscountP3, comments1, comments2, comments3, comments4, topleftx, toplefty, bottomrightx, bottomrighty, McUpdatedOn, MscUpdatedOn, MfrUpdatedOn, PtUpdatedOn, PtgUpdatedOn, PtsgUpdatedOn, ProdImageCreated, ProdImageCreatedOn, Origin, Variety, UnitType, PkgSize, Offerdes, entrycomments1, EntryBrand, RegularUnitPrice, EntryTaggedCompany, Weight, MediaDetail, QtySave, PurchaseOf, UnitDiscountPrice, DiscountType, OrMore,PageDetailIDInt)
		SELECT FlyerID, Page, PageDetailID, ThumbImagePath, NormalImagePath, FullImagePath, ProductImagePath, MultipleValues, DTAdded, Retailer, TaggedCompany, Manufacturer, MerchandiseCategory, MerchandiseSubCat, Category, Brand, SKUDescription1, SKUDescription2, SKUDescription3, SKUType, CONVERT(numeric(18, 2), SalePrice1), CONVERT(numeric(18, 2), SalePrice2), CONVERT(numeric(18, 2), RegularPrice1), CONVERT(numeric(18, 2), RegularPrice2), CONVERT(numeric(18, 2), NORPrice), CONVERT(numeric(18, 2), RebateAmount), CONVERT(numeric(18, 2), LowestRebatePrice), CONVERT(numeric(18, 2), LowestDiscountPrice), CONVERT(numeric(18, 2), UnitPrice), Promotions, PageEvent, PageTheme, Features, NumberPackage, Coupon, CONVERT(numeric(18, 2), CouponValueD1), CONVERT(numeric(18, 2), CouponValueD2), CouponValueP1, CouponValueP2, CouponValueP3, CONVERT(numeric(18, 2), OtherDiscountD1), CONVERT(numeric(18, 2), OtherDiscountD2), CONVERT(numeric(18, 2), OtherDiscountD3), RequiredQuantity, MaximumQuantity, AdSize, AdCost, Illustrated, Color, NoOfColors, CONVERT(smalldatetime, SaleStDt), CONVERT(smalldatetime, SaleEndDt), CONVERT(smalldatetime, CouponExpirationDate), Optional1, Optional2, Optional3, Optional4, Optional5, Optional6, Optional7, Optional8, Optional9, Optional10, Optional11, Optional12, Comments, ProductTerritory, ProductTerritorySubGroup, ProductTerritoryGroup, EnteredClient, CONVERT(smalldatetime, CouponExpirationDate1), CONVERT(smalldatetime, CouponExpirationDate2), OtherDiscountP1, OtherDiscountP2, OtherDiscountP3, comments1, comments2, comments3, comments4, topleftx, toplefty, bottomrightx, bottomrighty, CONVERT(smalldatetime, McUpdatedOn), CONVERT(smalldatetime, MscUpdatedOn), CONVERT(smalldatetime, MfrUpdatedOn), CONVERT(smalldatetime, PtUpdatedOn), CONVERT(smalldatetime, PtgUpdatedOn), CONVERT(smalldatetime, PtsgUpdatedOn), ProdImageCreated, CONVERT(smalldatetime, ProdImageCreatedOn), Origin, Variety, UnitType, PkgSize, OfferDes, entrycomments1, EntryBrand, RegularUnitPrice, EntryTaggedCompany, Weight, MediaDetail, QtySave, PurchaseOf, UnitDiscountPrice, DiscountType, OrMore,PageDetailIDInt FROM dbo.TEMPxPageDetailtable TABLOCKX')
GO
DROP TABLE dbo.TEMPxPageDetailtable
GO
EXECUTE sp_rename 'dbo.TTmp_TEMPxPageDetailtable', 'TEMPxPageDetailtable'
GO
