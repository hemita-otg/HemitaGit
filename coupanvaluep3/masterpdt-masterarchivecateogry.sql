Use MasterAdViewData
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[masterarchivecategory]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[masterarchivecategory]
GO

CREATE TABLE [dbo].[masterarchivecategory] (
	[FlyerID] [varchar] (11) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Page] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[PageDetailID] [varchar] (11) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[ThumbImagePath] [varchar] (75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[NormalImagePath] [varchar] (75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[FullImagePath] [varchar] (75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ProductImagePath] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[MultipleValues] [bit] NULL ,
	[DTAdded] [datetime] NULL ,
	[Retailer] [varchar] (37) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Market] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[AdDate] [datetime] NULL ,
	[TaggedCompany] [varchar] (37) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Manufacturer] [varchar] (37) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[MerchandiseCategory] [varchar] (37) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[MerchandiseSubCat] [varchar] (37) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Category] [varchar] (37) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Brand] [varchar] (37) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[SKUDescription1] [varchar] (37) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[SKUDescription2] [varchar] (37) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[SKUDescription3] [varchar] (37) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[SKUType] [varchar] (37) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[SalePrice1] [decimal](18, 2) NULL ,
	[SalePrice2] [decimal](18, 2) NULL ,
	[RegularPrice1] [decimal](18, 2) NULL ,
	[RegularPrice2] [decimal](18, 2) NULL ,
	[NORPrice] [decimal](18, 2) NULL ,
	[RebateAmount] [decimal](18, 2) NULL ,
	[LowestRebatePrice] [decimal](18, 2) NULL ,
	[LowestDiscountPrice] [decimal](18, 2) NULL ,
	[UnitPrice] [decimal](18, 2) NULL ,
	[Promotions] [varchar] (37) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[PageEvent] [varchar] (37) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[PageTheme] [varchar] (37) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Features] [varchar] (37) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[NumberPackage] [int] NULL ,
	[Coupon] [bit] NULL ,
	[CouponValueD1] [decimal](18, 2) NULL ,
	[CouponValueD2] [decimal](18, 2) NULL ,
	[CouponValueP1] [int] NULL ,
	[CouponValueP2] [int] NULL ,
	[CouponValueP3] [int] NULL ,	--new added
	[OtherDiscountD1] [decimal](18, 2) NULL ,
	[OtherDiscountD2] [decimal](18, 2) NULL ,
	[OtherDiscountD3] [decimal](18, 2) NULL ,
	[RequiredQuantity] [int] NULL ,
	[MaximumQuantity] [int] NULL ,
	[AdSize] [int] NULL ,
	[AdCost] [int] NULL ,
	[Illustrated] [bit] NULL ,
	[Color] [bit] NULL ,
	[NoOfColors] [int] NULL ,
	[SaleStDt] [smalldatetime] NULL ,
	[SaleEndDt] [smalldatetime] NULL ,
	[CouponExpirationDate] [smalldatetime] NULL ,
	[Optional1] [varchar] (37) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Optional2] [datetime] NULL ,
	[Optional3] [varchar] (37) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Optional4] [datetime] NULL ,
	[Optional5] [varchar] (37) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Optional6] [datetime] NULL ,
	[Optional7] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Optional8] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Optional9] [varchar] (37) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Optional10] [varchar] (37) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Optional11] [varchar] (37) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Optional12] [varchar] (37) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Comments] [bit] NULL ,
	[ProductTerritory] [varchar] (37) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ProductTerritorySubGroup] [varchar] (37) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ProductTerritoryGroup] [varchar] (37) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[EnteredClient] [bit] NULL ,
	[CouponExpirationDate1] [smalldatetime] NULL ,
	[CouponExpirationDate2] [smalldatetime] NULL ,
	[OtherDiscountP1] [int] NULL ,
	[OtherDiscountP2] [int] NULL ,
	[OtherDiscountP3] [int] NULL ,
	[comments1] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[comments2] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[comments3] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[comments4] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[topleftx] [int] NOT NULL ,
	[toplefty] [int] NOT NULL ,
	[bottomrightx] [int] NOT NULL ,
	[bottomrighty] [int] NOT NULL ,
	[McUpdatedOn] [smalldatetime] NULL ,
	[MscUpdatedOn] [smalldatetime] NULL ,
	[MfrUpdatedOn] [smalldatetime] NULL ,
	[PtUpdatedOn] [smalldatetime] NULL ,
	[PtgUpdatedOn] [smalldatetime] NULL ,
	[PtsgUpdatedOn] [smalldatetime] NULL ,
	[ProdImageCreated] [bit] NULL ,
	[ProdImageCreatedOn] [smalldatetime] NULL ,
	[LockStatus] [bit] NOT NULL ,
	[BaseCatGrpPDT] [varchar] (11) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[OtherMerchCat] [varchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[CategoryGroup] [varchar] (37) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[MissingCatGroups] [varchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[NoOfCats] [int] NULL ,
	[NoOfBrands] [int] NULL ,
	[NoOfPrices] [int] NULL ,
	[RemainingCategories] [varchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[BasePDT] [varchar] (11) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[SelectedCategories] [varchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[RejectedCategories] [varchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[MissingCategories] [varchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Priority] [int] NULL ,
	[Origin] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Variety] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[UnitType] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[PkgSize] [decimal](18, 0) NULL ,
	[OfferDes] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[masterarchivecategory] WITH NOCHECK ADD 
	CONSTRAINT [PK_masterarchivecategory] PRIMARY KEY  CLUSTERED 
	(
		[PageDetailID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

--Start : Cursor for Insert into MasterArchiveCategory
Declare @SQL varchar(8000)
Declare @crlf as varchar(2)
set @crlf = char(13) + char(10)
declare @systemname as varchar(100)


if object_id('tempdb.dbo.tempMasterArchiveCategoryInsert') is not null
	drop table tempdb.dbo.tempMasterArchiveCategoryInsert
create table tempdb.dbo.tempMasterArchiveCategoryInsert (
	systemname varchar(50)
)

--insert into tempdb.dbo.tempMasterArchiveCategoryInsert(systemname) values('arcjaALL')
--insert into tempdb.dbo.tempMasterArchiveCategoryInsert(systemname) values('arcjaasm')
--insert into tempdb.dbo.tempMasterArchiveCategoryInsert(systemname) values('arcjabev')
--insert into tempdb.dbo.tempMasterArchiveCategoryInsert(systemname) values('arcjacan')
--insert into tempdb.dbo.tempMasterArchiveCategoryInsert(systemname) values('arcjafr')
--insert into tempdb.dbo.tempMasterArchiveCategoryInsert(systemname) values('arcjafrX')
--insert into tempdb.dbo.tempMasterArchiveCategoryInsert(systemname) values('arcjahspe')
--insert into tempdb.dbo.tempMasterArchiveCategoryInsert(systemname) values('arcjahsps')
--insert into tempdb.dbo.tempMasterArchiveCategoryInsert(systemname) values('arcjaInet')
--insert into tempdb.dbo.tempMasterArchiveCategoryInsert(systemname) values('arcjamass')
--insert into tempdb.dbo.tempMasterArchiveCategoryInsert(systemname) values('arcjaspan')
--insert into tempdb.dbo.tempMasterArchiveCategoryInsert(systemname) values('jaAlc')
--insert into tempdb.dbo.tempMasterArchiveCategoryInsert(systemname) values('jaAdams')
--insert into tempdb.dbo.tempMasterArchiveCategoryInsert(systemname) values('jaAlcM')
--insert into tempdb.dbo.tempMasterArchiveCategoryInsert(systemname) values('jaAlcV')
--insert into tempdb.dbo.tempMasterArchiveCategoryInsert(systemname) values('jaALL')
--insert into tempdb.dbo.tempMasterArchiveCategoryInsert(systemname) values('JaALLM')
--insert into tempdb.dbo.tempMasterArchiveCategoryInsert(systemname) values('jaALLV')
--insert into tempdb.dbo.tempMasterArchiveCategoryInsert(systemname) values('jaASM')
--insert into tempdb.dbo.tempMasterArchiveCategoryInsert(systemname) values('JaBev')
--insert into tempdb.dbo.tempMasterArchiveCategoryInsert(systemname) values('JaCAN')
--insert into tempdb.dbo.tempMasterArchiveCategoryInsert(systemname) values('jaEmer')
--insert into tempdb.dbo.tempMasterArchiveCategoryInsert(systemname) values('jaFR')
--insert into tempdb.dbo.tempMasterArchiveCategoryInsert(systemname) values('jafrv')
--insert into tempdb.dbo.tempMasterArchiveCategoryInsert(systemname) values('jafrX')
--insert into tempdb.dbo.tempMasterArchiveCategoryInsert(systemname) values('jahspe')
--insert into tempdb.dbo.tempMasterArchiveCategoryInsert(systemname) values('jahsps')
--insert into tempdb.dbo.tempMasterArchiveCategoryInsert(systemname) values('JaInet')
--insert into tempdb.dbo.tempMasterArchiveCategoryInsert(systemname) values('jaMASS')
--insert into tempdb.dbo.tempMasterArchiveCategoryInsert(systemname) values('jaSpan')
--insert into tempdb.dbo.tempMasterArchiveCategoryInsert(systemname) values('jafrcan')
--insert into tempdb.dbo.tempMasterArchiveCategoryInsert(systemname) values('jacanOne')
--insert into tempdb.dbo.tempMasterArchiveCategoryInsert(systemname) values('jacanOneM')
--insert into tempdb.dbo.tempMasterArchiveCategoryInsert(systemname) values('jacanOneV')
--insert into tempdb.dbo.tempMasterArchiveCategoryInsert(systemname) values('jaMarkham')
--insert into tempdb.dbo.tempMasterArchiveCategoryInsert(systemname) values('jaASHist')
--insert into tempdb.dbo.tempMasterArchiveCategoryInsert(systemname) values('jaMassM')
--insert into tempdb.dbo.tempMasterArchiveCategoryInsert(systemname) values('jaMassV')
--insert into tempdb.dbo.tempMasterArchiveCategoryInsert(systemname) values('arcjaMassM')
--insert into tempdb.dbo.tempMasterArchiveCategoryInsert(systemname) values('arcjaMassV')
--insert into tempdb.dbo.tempMasterArchiveCategoryInsert(systemname) values('jaInetCan')
--insert into tempdb.dbo.tempMasterArchiveCategoryInsert(systemname) values('arcjaInetCan')
--insert into tempdb.dbo.tempMasterArchiveCategoryInsert(systemname) values('jaSocial')
--insert into tempdb.dbo.tempMasterArchiveCategoryInsert(systemname) values('arcjaSocial')
--insert into tempdb.dbo.tempMasterArchiveCategoryInsert(systemname) values('Manila')
--insert into tempdb.dbo.tempMasterArchiveCategoryInsert(systemname) values('arcManila')
--insert into tempdb.dbo.tempMasterArchiveCategoryInsert(systemname) values('arcjafrv')
--insert into tempdb.dbo.tempMasterArchiveCategoryInsert(systemname) values('arcjaALLv')
--insert into tempdb.dbo.tempMasterArchiveCategoryInsert(systemname) values('arcjaALc')
--insert into tempdb.dbo.tempMasterArchiveCategoryInsert(systemname) values('arcjaCanOne')
--insert into tempdb.dbo.tempMasterArchiveCategoryInsert(systemname) values('arcjaCanOneM')
--insert into tempdb.dbo.tempMasterArchiveCategoryInsert(systemname) values('arcjaCanOneV')
--insert into tempdb.dbo.tempMasterArchiveCategoryInsert(systemname) values('USWEBC')
--insert into tempdb.dbo.tempMasterArchiveCategoryInsert(systemname) values('USCTCMC')
--insert into tempdb.dbo.tempMasterArchiveCategoryInsert(systemname) values('USCTCVC')
--insert into tempdb.dbo.tempMasterArchiveCategoryInsert(systemname) values('MT360')

insert into tempdb.dbo.tempMasterArchiveCategoryInsert(systemname)
Select ProjectName From EntryData.dbo.vwentryprojects Where MasterPDT=1

declare projects cursor for 
select systemname
from tempdb.dbo.tempMasterArchiveCategoryInsert 

open projects
fetch next from projects into @systemname

while @@fetch_status = 0
begin
	BEGIN  
			SET @SQL='If Exists(select name from EntryData..sysobjects where name = ''' + @systemname + 'archivecategorytable'' and xtype = ''U'') 
					BEGIN
					INSERT INTO [masterarchivecategory](FlyerID,Page,PageDetailID,ThumbImagePath,NormalImagePath,FullImagePath,ProductImagePath,MultipleValues,DTAdded,Retailer,Market,AdDate,TaggedCompany,Manufacturer,MerchandiseCategory,MerchandiseSubCat,Category,Brand,SKUDescription1,SKUDescription2,SKUDescription3,SKUType,SalePrice1,SalePrice2,RegularPrice1,RegularPrice2,NORPrice,RebateAmount,LowestRebatePrice,LowestDiscountPrice,UnitPrice,Promotions,PageEvent,PageTheme,Features,NumberPackage,Coupon,CouponValueD1,CouponValueD2,CouponValueP1,CouponValueP2,CouponValueP3,OtherDiscountD1,OtherDiscountD2,OtherDiscountD3,RequiredQuantity,MaximumQuantity,AdSize,AdCost,Illustrated,Color,NoOfColors,SaleStDt,SaleEndDt,CouponExpirationDate,Optional1,Optional2,Optional3,Optional4,Optional5,Optional6,Optional7,Optional8,Optional9,Optional10,Optional11,Optional12,Comments,ProductTerritory,ProductTerritorySubGroup,ProductTerritoryGroup,EnteredClient,CouponExpirationDate1,CouponExpirationDate2,OtherDiscountP1,OtherDiscountP2,OtherDiscountP3,comments1,comments2,comments3,comments4,topleftx,toplefty,bottomrightx,bottomrighty,McUpdatedOn,MscUpdatedOn,MfrUpdatedOn,PtUpdatedOn,PtgUpdatedOn,PtsgUpdatedOn,ProdImageCreated,ProdImageCreatedOn,LockStatus,BaseCatGrpPDT,OtherMerchCat,CategoryGroup,MissingCatGroups,NoOfCats,NoOfBrands,NoOfPrices,RemainingCategories,BasePDT,SelectedCategories,RejectedCategories,MissingCategories,Priority,Origin,Variety,UnitType,PkgSize,OfferDes) '+@crlf+
						'SELECT FlyerID,Page,PageDetailID,ThumbImagePath,NormalImagePath,FullImagePath,ProductImagePath,MultipleValues,DTAdded,Retailer,Market,AdDate,TaggedCompany,Manufacturer,MerchandiseCategory,MerchandiseSubCat,Category,Brand,SKUDescription1,SKUDescription2,SKUDescription3,SKUType,SalePrice1,SalePrice2,RegularPrice1,RegularPrice2,NORPrice,RebateAmount,LowestRebatePrice,LowestDiscountPrice,UnitPrice,Promotions,PageEvent,PageTheme,Features,NumberPackage,Coupon,CouponValueD1,CouponValueD2,CouponValueP1,CouponValueP2,CouponValueP3,OtherDiscountD1,OtherDiscountD2,OtherDiscountD3,RequiredQuantity,MaximumQuantity,AdSize,AdCost,Illustrated,Color,NoOfColors,SaleStDt,SaleEndDt,CouponExpirationDate,Optional1,Optional2,Optional3,Optional4,Optional5,Optional6,Optional7,Optional8,Optional9,Optional10,Optional11,Optional12,Comments,ProductTerritory,ProductTerritorySubGroup,ProductTerritoryGroup,EnteredClient,CouponExpirationDate1,CouponExpirationDate2,OtherDiscountP1,OtherDiscountP2,OtherDiscountP3,comments1,comments2,comments3,comments4,topleftx,toplefty,bottomrightx,bottomrighty,McUpdatedOn,MscUpdatedOn,MfrUpdatedOn,PtUpdatedOn,PtgUpdatedOn,PtsgUpdatedOn,ProdImageCreated,ProdImageCreatedOn,LockStatus,BaseCatGrpPDT,OtherMerchCat,CategoryGroup,MissingCatGroups,NoOfCats,NoOfBrands,NoOfPrices,RemainingCategories,BasePDT,SelectedCategories,RejectedCategories,MissingCategories,Priority,Origin,Variety,UnitType,PkgSize,OfferDes '+@crlf+
						'FROM Entrydata..' + @systemname + 'archivecategorytable where pagedetailid not in (select pagedetailid from masterarchivecategory) '+@crlf+
						'option(maxdop 1)
					END	 '
			Print(@sql)	
			Exec(@sql)	
			
	END
	
	fetch next from projects into @systemname
end
close projects
deallocate projects

Drop table tempdb.dbo.tempMasterArchiveCategoryInsert
--End : Cursor for Insert into MasterArchiveCategory


