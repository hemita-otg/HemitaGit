-- MasterFSI
use masteradviewdata
Declare @SQL varchar(8000)
Declare @SelectClause varchar(8000)
Declare @WhereClause varchar(2000)
Declare @MFRJoin varchar(2000)
Declare @FeaturesJoin varchar(2000)
Declare @PDTIDIntJoin varchar(2000)
declare @systemname varchar(50)
declare @crlf as varchar(2)
set @crlf = char(13) + char(10)

set @SelectClause = 'PDT.[FlyerID], PDT.[Page], PDT.[PageDetailID], 
cast(null as varchar(100)) as [ThumbImagePath], 
Case when isnull(PDT.NormalImagePath,'''')=''UnSized''  then  ''UnSized'' else ''Full'' end as [NormalImagePath],
cast(null as varchar(100)) as [FullImagePath], 
cast(null as varchar(100)) as [ProductImagePath], 
[MultipleValues], 
convert(smalldatetime,convert(varchar(10),[DTAdded], 101)) as DTAdded, 
cast(null as varchar(100)) as [Retailer], 
case when ru.flyerid is not null
	then
		case when pdt.[TaggedCompany] = ''C'' then ''B''
			when pdt.[TaggedCompany] = ''D'' then ''C''
			else pdt.[TaggedCompany]
		end
     else pdt.[TaggedCompany]
end as [TaggedCompany], 
IsNULL(MF.Manufacturer,''Other'') As [Manufacturer], [MerchandiseCategory], [MerchandiseSubCat], PDT.[Category], 
Case when MF.PL = 0 then PDT.[Brand] else MF.PLBrand end As Brand, 
[SKUDescription1], [SKUDescription2], [SKUDescription3], 
[SKUType], [SalePrice1], [SalePrice2], [RegularPrice1], [RegularPrice2], [NORPrice], [RebateAmount], [LowestRebatePrice], [LowestDiscountPrice], [UnitPrice], 
[Promotions], [PageEvent], [PageTheme], IsNull(vp.[FVDisplayValue],pdt.[Features]) as [Features], [NumberPackage], PDT.[Coupon], [CouponValueD1], [CouponValueD2], [CouponValueP1], [CouponValueP2], [CouponValueP3], 
[OtherDiscountD1], [OtherDiscountD2], [OtherDiscountD3], [RequiredQuantity], [MaximumQuantity], cast(null as int) as [AdSize], cast(null as int) as [AdCost], cast(null as bit) as [Illustrated], cast(null as bit) as [Color], cast(null as int) as [NoOfColors], 
[SaleStDt], [SaleEndDt], cast(null as smalldatetime) as [CouponExpirationDate], cast(null as varchar(100)) as [Optional1], 
cast(null as varchar(100)) as [Optional2], 
cast(null as varchar(100)) as [Optional3], 
[Optional4], 
cast(null as varchar(100)) as [Optional5], 
cast(null as varchar(100)) as [Optional6], 
cast(null as varchar(200)) as [Optional7], 
cast(null as varchar(200)) as [Optional8], 
cast(null as varchar(100)) as [Optional9], 
cast(null as varchar(100)) as [Optional10], 
cast(null as varchar(100)) as [Optional11], 
cast(null as varchar(100)) as [Optional12], 
[Comments], [ProductTerritory], [ProductTerritorySubGroup], [ProductTerritoryGroup], [EnteredClient], 
[CouponExpirationDate1], [CouponExpirationDate2], [OtherDiscountP1], [OtherDiscountP2], [OtherDiscountP3], [comments1], [comments2], [comments3], 
[comments4], [topleftx], [toplefty], [bottomrightx], [bottomrighty], 
[McUpdatedOn], 
[MscUpdatedOn], 
cast(null as smalldatetime) as [MfrUpdatedOn], 
cast(null as smalldatetime) as [PtUpdatedOn], 
cast(null as smalldatetime) as [PtgUpdatedOn], 
cast(null as smalldatetime) as [PtsgUpdatedOn], 
[ProdImageCreated], 
cast(null as smalldatetime) as [ProdImageCreatedOn], 
[Origin], [Variety], [UnitType], [PkgSize], OfferDes,
PDT.[TaggedCompany] as EntryTaggedCompany,
ws.Score as Weight,
CWM.Media as MediaDetail, Mmap.PageDetailId as PageDetailIDInt '

SET @WhereClause = 'Join MasterAdViewData..AdViewMain CWM  with (nolock) on PDT.FlyerID = CWM.FlyerID and CWM.Active = 1 and PDT.Page <= CWM.Pages
LEFT OUTER JOIN tempdb.dbo.vwWeightScore ws with (nolock) on cwm.retmktid = ws.retmktid and IsNull(vp.[FVDisplayValue],pdt.[Features]) = ws.features and pdt.TaggedCompany = ws.TaggedCompany
WHERE PDT.Category NOT In (''To Be Registered'', ''To Be Assigned'', ''Z - To Be Classified'', ''ZZ - Unsure'', ''ZZ - Untracked'')
And PDT.Brand NOT in (''To Be Registered'', ''To Be Assigned'', ''Z - To Be Classified'', ''ZZ - Unsure'', ''ZZ - Untracked'')'

SET @MFRJoin = ' Left JOIN masteradviewdata..[TEMPManufacturer] MF with (nolock) on pdt.category = MF.category and pdt.brand = MF.brand '

SET @FeaturesJoin = 'Left JOIN MasterAdviewData.dbo.MCAPVehiclePages vp with (nolock) on pdt.flyerid = vp.flyerid and pdt.page = vp.pagenumber '

SET @PDTIDIntJoin = 'Left JOIN MasterAdviewData.dbo.MasterMapPagedetailID Mmap on pdt.PageDetailId = Mmap.OriginalPageDetailId '


if exists (select * from sysobjects where id = object_id(N'[dbo].[TEMPFSIxPageDetailTable]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TEMPFSIxPageDetailTable]

set @SQL = 'SELECT ' + @SelectClause + @crlf + 
	   ' INTO TEMPFSIxPageDetailTable ' + @crlf + 
	   'FROM entrydata..ArcfsientryPageDetailTable pdt with (Nolock)' + @crlf + 
	   @MFRJoin + @crlf + 
	   @FeaturesJoin + @crlf + 
	   @PDTIDIntJoin + @crlf + 
		   'LEFT OUTER JOIN EntryData.dbo.ArcfsientryRollupFlyerIds ru with (nolock) on pdt.flyerid = ru.flyerid' + @crlf + 
	   @WhereClause + @crlf + 
	   ' Option (MAXDOP 1)'
Exec(@SQL)

set @SQL = 'INSERT INTO [TEMPFSIxPageDetailTable]' + @crlf + 
	   ' SELECT ' + @SelectClause + @crlf + 
	   'FROM entrydata..fsientryPageDetailTable pdt with (nolock)' + @crlf + 
	   @MFRJoin + @crlf + 
	   @FeaturesJoin + @crlf + 
	   @PDTIDIntJoin + @crlf + 
		   'LEFT OUTER JOIN EntryData.dbo.fsientryRollupFlyerIds ru with (nolock) on pdt.flyerid = ru.flyerid' + @crlf + 
	   @WhereClause + @crlf + 
	   ' Option (MAXDOP 1)'
Exec(@SQL)


GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[masterfsiMultiplePageValues]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[masterfsiMultiplePageValues]
GO

SELECT MPV.pagedetailid, fieldname, fieldvalue,Mmap.PageDetailId as PageDetailIDInt
INTO [masterfsiMultiplePageValues] 
FROM entrydata..ArcfsiEntryMultiplePageValues MPV
Left JOIN MasterAdviewData.dbo.MasterMapPagedetailID Mmap on MPV.PageDetailId = Mmap.OriginalPageDetailId

INSERT INTO [masterfsiMultiplePageValues](pagedetailid, fieldname, fieldvalue,PageDetailIDInt) 
SELECT MPV.pagedetailid, fieldname, fieldvalue,Mmap.PageDetailId as PageDetailIDInt
FROM entrydata..FsiEntryMultiplePageValues MPV
Left JOIN MasterAdviewData.dbo.MasterMapPagedetailID Mmap on MPV.PageDetailId = Mmap.OriginalPageDetailId
GO

select pagedetailid, fieldname, fieldvalue,PageDetailIdInt, count(*) as count into #tempdupes
from masterfsiMultiplePageValues
group by pagedetailid, fieldname, fieldvalue,PageDetailIdInt
having count(*) > 1
GO
delete p from masterfsiMultiplePageValues p	
join #tempdupes t on t.pagedetailid = p.pagedetailid and t.fieldname = p.fieldname
and t.fieldvalue = p.fieldvalue
GO
insert into masterfsiMultiplePageValues (pagedetailid, fieldname, fieldvalue,PageDetailIdInt)
select distinct pagedetailid, fieldname, fieldvalue,PageDetailIdInt
from #tempdupes
GO
Drop table #tempdupes
GO

ALTER TABLE [dbo].[masterfsiMultiplePageValues] WITH NOCHECK ADD 
	CONSTRAINT [PK_masterfsiMultiplePageValues] PRIMARY KEY  CLUSTERED 
	(
		[PageDetailID],
		[FieldName],
		[FieldValue]
	)  ON [PRIMARY] 
GO

BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO
COMMIT
BEGIN TRANSACTION
CREATE TABLE dbo.Tmp_TEMPFSIxPageDetailTable
	(
 	FlyerID varchar(11) NULL,
	Page varchar(50) NULL,
	PageDetailID varchar(11) NOT NULL,
	ThumbImagePath varchar(100) NULL,
	NormalImagePath varchar(100) NULL,
	FullImagePath varchar(100) NULL,
	ProductImagePath varchar(100) NULL,
	MultipleValues varchar (1) NULL,
	DTAdded datetime NULL,
	Retailer varchar(100) NULL,
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
	PageEvent varchar(37) NULL,
	PageTheme varchar(37) NULL,
	Features varchar(100) NULL,
	NumberPackage int NULL,
	Coupon Numeric(8) NULL,
	CouponValueD1 numeric(18, 2) NULL,
	CouponValueD2 numeric(18, 2) NULL,
	CouponValueP1 int NULL,
	CouponValueP2 int NULL,
	CouponValueP3 int NULL,			--new added
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
	comments1 varchar(255) NULL,
	comments2 varchar(255) NULL,
	comments3 varchar(255) NULL,
	comments4 varchar(255) NULL,
	topleftx int NOT NULL CONSTRAINT DF_TEMPFSIxPageDetailTable_topleftx DEFAULT (0),
	toplefty int NOT NULL CONSTRAINT DF_TEMPFSIxPageDetailTable_toplefty DEFAULT (0),
	bottomrightx int NOT NULL CONSTRAINT DF_TEMPFSIxPageDetailTable_bottomrightx DEFAULT (0),
	bottomrighty int NOT NULL CONSTRAINT DF_TEMPFSIxPageDetailTable_bottomrighty DEFAULT (0),
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
  UnitType varchar(100) null,
  PkgSize decimal(18, 2) NULL,
	OfferDes varchar(255) NULL,
	EntryTaggedCompany varchar(37) NULL,
	Weight decimal(9,6) NULL,
	MediaDetail varchar(100) NULL,
	PageDetailIDInt BigInt
	) ON [PRIMARY]
GO
IF EXISTS(SELECT * FROM dbo.TEMPFSIxPageDetailTable)
	 EXEC('INSERT INTO dbo.Tmp_TEMPFSIxPageDetailTable(FlyerID, Page, PageDetailID, ThumbImagePath, NormalImagePath, FullImagePath, ProductImagePath, MultipleValues, DTAdded, Retailer, TaggedCompany, Manufacturer, MerchandiseCategory, MerchandiseSubCat, Category, Brand, SKUDescription1, SKUDescription2, SKUDescription3, SKUType, SalePrice1, SalePrice2, RegularPrice1, RegularPrice2, NORPrice, RebateAmount, LowestRebatePrice, LowestDiscountPrice, UnitPrice, Promotions, PageEvent, PageTheme, Features, NumberPackage, Coupon, CouponValueD1, CouponValueD2, CouponValueP1, CouponValueP2,CouponValueP3, OtherDiscountD1, OtherDiscountD2, OtherDiscountD3, RequiredQuantity, MaximumQuantity, AdSize, AdCost, Illustrated, Color, NoOfColors, SaleStDt, SaleEndDt, CouponExpirationDate, Optional1, Optional2, Optional3, Optional4, Optional5, Optional6, Optional7, Optional8, Optional9, Optional10, Optional11, Optional12, Comments, ProductTerritory, ProductTerritorySubGroup, ProductTerritoryGroup, EnteredClient, CouponExpirationDate1, CouponExpirationDate2, OtherDiscountP1, OtherDiscountP2, OtherDiscountP3, comments1, comments2, comments3, comments4, topleftx, toplefty, bottomrightx, bottomrighty, McUpdatedOn, MscUpdatedOn, MfrUpdatedOn, PtUpdatedOn, PtgUpdatedOn, PtsgUpdatedOn, ProdImageCreated, ProdImageCreatedOn, Origin, Variety, UnitType, PkgSize, OfferDes, EntryTaggedCompany, Weight, MediaDetail,PageDetailIDInt)
		SELECT FlyerID, Page, PageDetailID, ThumbImagePath, NormalImagePath, FullImagePath, ProductImagePath, MultipleValues, DTAdded, Retailer, TaggedCompany, Manufacturer, MerchandiseCategory, MerchandiseSubCat, Category, Brand, SKUDescription1, SKUDescription2, SKUDescription3, SKUType, CONVERT(numeric(18, 2), SalePrice1), CONVERT(numeric(18, 2), SalePrice2), CONVERT(numeric(18, 2), RegularPrice1), CONVERT(numeric(18, 2), RegularPrice2), CONVERT(numeric(18, 2), NORPrice), CONVERT(numeric(18, 2), RebateAmount), CONVERT(numeric(18, 2), LowestRebatePrice), CONVERT(numeric(18, 2), LowestDiscountPrice), CONVERT(numeric(18, 2), UnitPrice), Promotions, PageEvent, PageTheme, Features, NumberPackage, Coupon, CONVERT(numeric(18, 2), CouponValueD1), CONVERT(numeric(18, 2), CouponValueD2), CouponValueP1, CouponValueP2, CouponValueP3, CONVERT(numeric(18, 2), OtherDiscountD1), CONVERT(numeric(18, 2), OtherDiscountD2), CONVERT(numeric(18, 2), OtherDiscountD3), RequiredQuantity, MaximumQuantity, AdSize, AdCost, Illustrated, Color, NoOfColors, CONVERT(smalldatetime, SaleStDt), CONVERT(smalldatetime, SaleEndDt), CONVERT(smalldatetime, CouponExpirationDate), Optional1, Optional2, Optional3, Optional4, Optional5, Optional6, Optional7, Optional8, Optional9, Optional10, Optional11, Optional12, Comments, ProductTerritory, ProductTerritorySubGroup, ProductTerritoryGroup, EnteredClient, CONVERT(smalldatetime, CouponExpirationDate1), CONVERT(smalldatetime, CouponExpirationDate2), OtherDiscountP1, OtherDiscountP2, OtherDiscountP3, comments1, comments2, comments3, comments4, topleftx, toplefty, bottomrightx, bottomrighty, CONVERT(smalldatetime, McUpdatedOn), CONVERT(smalldatetime, MscUpdatedOn), CONVERT(smalldatetime, MfrUpdatedOn), CONVERT(smalldatetime, PtUpdatedOn), CONVERT(smalldatetime, PtgUpdatedOn), CONVERT(smalldatetime, PtsgUpdatedOn), ProdImageCreated, CONVERT(smalldatetime, ProdImageCreatedOn), Origin, Variety, UnitType, PkgSize, OfferDes, EntryTaggedCompany, Weight, MediaDetail,PageDetailIDInt FROM dbo.TEMPFSIxPageDetailTable TABLOCKX')
GO
DROP TABLE dbo.TEMPFSIxPageDetailTable
GO
EXECUTE sp_rename 'dbo.Tmp_TEMPFSIxPageDetailTable', 'TEMPFSIxPageDetailTable'
GO

CREATE CLUSTERED INDEX DetailIndex ON dbo.TEMPFSIxPageDetailTable (PageDetailID) ON [PRIMARY]
GO

COMMIT

if exists (select * from sysobjects where id = object_id(N'[dbo].[masterfsipagedetailtable]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[masterfsipagedetailtable]
GO

SELECT 
min(FlyerID)as FlyerId, 
min(Page) as Page, 
PageDetailID, 
min(ThumbImagePath)as ThumbImagePath,
min(NormalImagePath)as NormalImagePath,
min(FullImagePath)as FullImagePath,
min(ProductImagePath)as ProductImagePath,
cast(case when Min(MultipleValues) = 0 then 0 when Min(MultipleValues) <> 0 then 1  end as bit) as MultipleValues,
min(DTAdded)as DTAdded,
min(Retailer)as Retailer,
min(TaggedCompany)as TaggedCompany,
min(Manufacturer)as Manufacturer,
min(MerchandiseCategory)as MerchandiseCategory,
min(MerchandiseSubCat)as MerchandiseSubCat,
min(Category)as Category,
min(Brand)as Brand,
min(SKUDescription1)as SKUDescription1,
min(SKUDescription2)as SKUDescription2,
min(SKUDescription3)as SKUDescription3,
min(SKUType)as SKUType,
min(SalePrice1)as SalePrice1,
min(SalePrice2)as SalePrice2,
min(RegularPrice1)as RegularPrice1,
min(RegularPrice2)as RegularPrice2,
min(NORPrice)as NORPrice,
min(RebateAmount)as RebateAmount,
min(LowestRebatePrice)as LowestRebatePrice,
min(LowestDiscountPrice)as LowestDiscountPrice,
min(UnitPrice)as UnitPrice,
min(Promotions)as Promotions,
min(PageEvent)as PageEvent,
min(PageTheme)as PageTheme,
min(Features)as Features,
min(NumberPackage)as NumberPackage,
min(Coupon)as Coupon,
min(CouponValueD1)as CouponValueD1,
min(CouponValueD2)as CouponValueD2,
min(CouponValueP1)as CouponValueP1,
min(CouponValueP2)as CouponValueP2,
min(CouponValueP3)as CouponValueP3,		--new added
min(OtherDiscountD1)as OtherDiscountD1,
min(OtherDiscountD2)as OtherDiscountD2,
min(OtherDiscountD3)as OtherDiscountD3,
min(RequiredQuantity)as RequiredQuantity,
min(MaximumQuantity)as MaximumQuantity,
min(AdSize)as AdSize,
min(AdCost)as AdCost,
min(Illustrated)as Illustrated,
min(Color)as Color,
min(NoOfColors)as NoOfColors,
min(SaleStDt)as SaleStDt,
min(SaleEndDt)as SaleEndDt,
min(CouponExpirationDate)as CouponExpirationDate,
min(Optional1)as Optional1,
min(Optional2)as Optional2,
min(Optional3)as Optional3,
min(Optional4)as Optional4,
cast(case when len(Min(Optional5)) > -1 then '' end as varchar(100)) as Optional5,
cast(case when len(Min(Optional6)) > -1 then '' end as varchar(100)) as Optional6,
min(Optional7)as Optional7,
min(Optional8)as Optional8,
min(Optional9)as Optional9,
min(Optional10)as Optional10, 
min(Optional11)as Optional11,
min(Optional12)as Optional12,
min(Comments)as Comments,
min(ProductTerritory)as ProductTerritory,
min(ProductTerritorySubGroup)as ProductTerritorySubGroup,
min(ProductTerritoryGroup)as ProductTerritoryGroup,
min(EnteredClient)as EnteredClient,
min(CouponExpirationDate1)as CouponExpirationDate1,
min(CouponExpirationDate2)as CouponExpirationDate2,
min(OtherDiscountP1)as OtherDiscountP1,
min(OtherDiscountP2)as OtherDiscountP2,
min(OtherDiscountP3)as OtherDiscountP3,
min(comments1)as comments1,
min(comments2)as comments2,
min(comments3)as comments3,
min(comments4)as comments4,
min(topleftx)as topleftx,
min(toplefty)as toplefty,
min(bottomrightx)as bottomrightx,
min(bottomrighty)as bottomrighty,
min(McUpdatedOn)as McUpdatedOn,
min(MscUpdatedOn)as MscUpdatedOn,
min(MfrUpdatedOn)as MfrUpdatedOn,
min(PtUpdatedOn)as PtUpdatedOn,
min(PtgUpdatedOn)as PtgUpdatedOn,
min(PtsgUpdatedOn)as PtsgUpdatedOn,
min(ProdImageCreated)as ProdImageCreated,
min(ProdImageCreatedOn) as ProdImageCreatedOn,
min(Origin) as Origin,
min(Variety) as Variety,
min(UnitType) as UnitType,
min(PkgSize) as PkgSize,
min(OfferDes) as OfferDes,
min(EntryTaggedCompany)as EntryTaggedCompany,
min(Weight) as Weight,
Min(MediaDetail) as MediaDetail,
Min(PageDetailIdInt) as PageDetailIdInt,
Cast(Cast(replace(min(FlyerID),' ','') as varchar) + cast(replace(min(Page),' ','') as varchar) + cast(replace(abs(min(topleftx)),' ','') as varchar) + cast(replace(abs(min(toplefty)),' ','') as varchar) as numeric(30,0)) as AdBlockID
into masterfsipagedetailtable
from TEMPFSIxPageDetailTable 
group by pagedetailid
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[TEMPFSIxPageDetailTable]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TEMPFSIxPageDetailTable]
GO

ALTER TABLE [dbo].[masterfsipagedetailtable] WITH NOCHECK ADD CONSTRAINT [PK_masterfsipagedetailtable] PRIMARY KEY  CLUSTERED 
	([PageDetailID]	)  ON [PRIMARY] 
GO

 CREATE  INDEX [idxBrandCatMfr] ON [dbo].[masterfsipagedetailtable]([Brand], [Category]) ON [PRIMARY]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[__aBadFSIPageDetailTable]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
Drop table __aBadFSIPageDetailTable
GO

--Select * into __aBadFSIPageDetailTable  From masterfsipagedetailtable 
--    Where Category + '#'+ Brand NOT IN (Select Category + '#'+ Brand From tony..JaTBRModel)
--option(maxdop 1)
--GO

Select pdt.* into __aBadFSIPageDetailTable From masterfsipagedetailtable pdt
 left outer join JATriggers..JaTBRModel t on pdt.category = t.category and pdt.brand =t.brand 
Where t.category is null and t.brand is null and isnull(pdt.category,'') <> '' and isnull(pdt.brand,'') <> ''
option (maxdop 1)
GO




Delete masterfsipagedetailtable
From masterfsipagedetailtable, __aBadFSIPageDetailTable
WHERE ((masterfsipagedetailtable.PageDetailID)=[__aBadFSIPageDetailTable].[pagedetailid])
option(maxdop 1)
GO
--if exists (select * from sysobjects where id = object_id(N'[dbo].[__aBadFSIPrice]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
--Drop table __aBadFSIPrice
--GO

--Select masterfsipagedetailtable.* into __aBadFSIPrice from masterfsipagedetailtable join 
--tony..FSIEntryDisplayCategory on tony..FSIEntryDisplayCategory.category = masterfsipagedetailtable.category 
--and tony..FSIEntryDisplayCategory.MaxAbsolute < masterfsipagedetailtable.saleprice1
--option(maxdop 1)
--GO

--Delete masterfsipagedetailtable 
--from masterfsipagedetailtable, __aBadFSIPrice
--WHERE ((masterfsipagedetailtable.PageDetailID) = [__aBadFSIPrice].[pagedetailid])
--option(maxdop 1)
--GO

Delete from masterfsiMultiplePageValues  Where PageDetailid not in ( Select PageDetailid from MasterFsiPageDetailtable ) 