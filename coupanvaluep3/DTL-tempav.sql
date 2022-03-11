
DECLARE @Flag bit
SELECT @flag=flag FROM MT2SQL00.MasterAdviewData.dbo.MergeDetailLoad where StepName='TempAV' 

if(@flag=0)
begin
	
update MT2SQL00.MasterAdviewData.dbo.MergeDetailLoad set StepStartTime=getdate() where StepName='TempAV' 

	use masterclientcoverage


if not exists (select * from [tempdb].[dbo].sysobjects where id = object_id(N'[tempdb].[dbo].[canflyerids]'))
Begin
	select Flyerid Into tempdb..CanFlyerIDs 
	from masteradviewdata.dbo.adviewmain 
	where retmktid in (select a.RetmktID
		from masterclientcoverage.dbo.masterentrycwm a 
		join masterclientcoverage.dbo.entryproject b on a.entryprojectid = b.entryprojectid 
		where b.entryprojectid in (10, 25, 26, 27, 28, 29,36))
	and addate>= '1/1/2008'
End


if exists (select * from sysobjects where id = object_id(N'[dbo].[TEMPAVxPageDetailTable]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TEMPAVxPageDetailTable]

CREATE TABLE dbo.TEMPAVxPageDetailtable (
            FlyerID varchar(11) NULL,
            Page int NULL,
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
            Promotions varchar(37) NULL,
            PageEvent varchar(37) NULL,
            PageTheme varchar(37) NULL,
            Features varchar(100) NULL,
            NumberPackage int NULL,
            Coupon Numeric(8) NULL,
            CouponValueD1 numeric(18, 2) NULL,
            CouponValueD2 numeric(18, 2) NULL,
            CouponValueP1 int NULL,
            CouponValueP2 int NULL,
			CouponValueP3 int NULL,
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
            topleftx int NOT NULL,
            toplefty int NOT NULL,
            bottomrightx int NOT NULL ,
            bottomrighty int NOT NULL,
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
	    OfferDes varchar(255) null,
	    EntryComments1 varchar(255) null,
            EntryBrand varchar(100) NULL,
            RegularUnitPrice numeric(18, 2) NULL,
            EntryTaggedCompany varchar(37) NULL,
            Weight decimal(9,6) NULL,
	    MediaDetail varchar(100) NULL,			
HighDOff numeric(18, 2) NULL,
HighRebateAmount numeric(18, 2) NULL,
GiftCardD numeric(18, 2) NULL,
BuyNumber int null,
GetNumber int null,
HighPOff  int null,
ExtraPOff int null,
RequiredNumberOffer int null,
FinansingInterestRate numeric(18, 2) NULL,
FinansingMinPurchase numeric(18, 2) NULL,
FinansingTermLength int null,
FinansingTermLengthType varchar(100) NULL,
HiGiftCard numeric(18, 2) NULL,
WasPrice numeric(18, 2) NULL,
MSRP smallmoney NULL
            ) ON [PRIMARY]


if object_id('tempdb.dbo.TEMPAVXProjectsPDTTriggers') is not null
	drop table tempdb.dbo.TEMPAVXProjectsPDTTriggers
create table tempdb.dbo.TEMPAVXProjectsPDTTriggers (
	systemname varchar(50),
	run bit,
	startdt datetime,
	enddt datetime
)

insert into tempdb.dbo.TEMPAVXProjectsPDTTriggers(systemname, run) values('AVC',1)
insert into tempdb.dbo.TEMPAVXProjectsPDTTriggers(systemname, run) values('AVDFull',1)

Declare @crlf as varchar(2)
set @crlf = char(13) + char(10)
declare @systemname as varchar(50)
Declare @SQL varchar(8000)
Declare @SelectClauseCon varchar(8000)
Declare @SelectClauseDur varchar(8000)

SET @SelectClauseCon=' PDT.FlyerId,[Page],PageDetailID,ThumbImagePath,NormalImagePath,FullImagePath,ProductImagePath,MultipleValues,DTAdded,Retailer,TaggedCompany,Manufacturer,MerchandiseCategory,MerchandiseSubCat,Category,Brand,SKUDescription1,SKUDescription2,SKUDescription3,SKUType,SalePrice1,SalePrice2,RegularPrice1,RegularPrice2,NORPrice,RebateAmount,LowestRebatePrice,LowestDiscountPrice,UnitPrice,Promotions,PageEvent,PageTheme,Features,NumberPackage,PDT.Coupon,CouponValueD1,CouponValueD2,CouponValueP1,CouponValueP2,CouponValueP3,OtherDiscountD1,OtherDiscountD2,OtherDiscountD3,RequiredQuantity,MaximumQuantity,AdSize,AdCost,Illustrated,Color,NoOfColors,SaleStDt,SaleEndDt,CouponExpirationDate,Optional1,Optional2,Optional3,Optional4,Optional5,Optional6,Optional7,Optional8,Optional9,Optional10,Optional11,Optional12,Comments,ProductTerritory,ProductTerritorySubGroup,ProductTerritoryGroup,EnteredClient,CouponExpirationDate1,CouponExpirationDate2,OtherDiscountP1,OtherDiscountP2,OtherDiscountP3,comments1,comments2,comments3,comments4,topleftx,toplefty,bottomrightx,bottomrighty,McUpdatedOn,MscUpdatedOn,MfrUpdatedOn,PtUpdatedOn,PtgUpdatedOn,PtsgUpdatedOn,ProdImageCreated,ProdImageCreatedOn,Origin,Variety,UnitType,PkgSize,Offerdes, comments1 as entrycomments1, Brand as EntryBrand, Null as RegularUnitPrice, Null as EntryTaggedCompany, Null as Weight, Null as MediaDetail,Null as HighDOff,Null as HighRebateAmount,Null as GiftCardD,Null as BuyNumber,Null as GetNumber,Null as HighPOff,Null as ExtraPOff,Null as RequiredNumberOffer,Null as FinansingInterestRate,Null as FinansingMinPurchase,Null as FinansingTermLength,Null as FinansingTermLengthType,Null as HiGiftCard,Null as WasPrice, NULL as MSRP '
SET @SelectClauseDur=' PDT.FlyerId,[Page],PageDetailID,ThumbImagePath,NormalImagePath,FullImagePath,ProductImagePath,MultipleValues,DTAdded,Retailer,TaggedCompany,Manufacturer,MerchandiseCategory,MerchandiseSubCat,Category,Brand,SKUDescription1,SKUDescription2,SKUDescription3,SKUType,SalePrice1,SalePrice2,RegularPrice1,RegularPrice2,NORPrice,RebateAmount,LowestRebatePrice,LowestDiscountPrice,UnitPrice,Promotions,PageEvent,PageTheme,Features,NumberPackage,PDT.Coupon,CouponValueD1,CouponValueD2,CouponValueP1,CouponValueP2,CouponValueP3,OtherDiscountD1,OtherDiscountD2,OtherDiscountD3,RequiredQuantity,MaximumQuantity,AdSize,AdCost,Illustrated,Color,NoOfColors,SaleStDt,SaleEndDt,CouponExpirationDate,Optional1,Optional2,Optional3,Optional4,Optional5,Optional6,Optional7,Optional8,Optional9,Optional10,Optional11,Optional12,Comments,ProductTerritory,ProductTerritorySubGroup,ProductTerritoryGroup,EnteredClient,CouponExpirationDate1,CouponExpirationDate2,OtherDiscountP1,OtherDiscountP2,OtherDiscountP3,comments1,comments2,comments3,comments4,topleftx,toplefty,bottomrightx,bottomrighty,McUpdatedOn,MscUpdatedOn,MfrUpdatedOn,PtUpdatedOn,PtgUpdatedOn,PtsgUpdatedOn,ProdImageCreated,ProdImageCreatedOn,Origin,Variety,UnitType,PkgSize,Offerdes, comments1 as entrycomments1, Brand as EntryBrand, Null as RegularUnitPrice, Null as EntryTaggedCompany, Null as Weight, Null as MediaDetail,HighDOff,HighRebateAmount,GiftCardD,BuyNumber,GetNumber,HighPOff,ExtraPOff,RequiredNumberOffer,FinansingInterestRate,FinansingMinPurchase,FinansingTermLength,FinansingTermLengthType,HiGiftCard,WasPrice, MSRP   '



declare projects cursor for 
select systemname
from tempdb.dbo.TEMPAVXProjectsPDTTriggers
where run = 1
open projects
fetch next from projects into @systemname
while @@fetch_status = 0
begin

	--set @SQL = 'INSERT INTO [TEMPAVxPageDetailTable]' + @crlf + 
	--	  'SELECT ' + @SelectClause + 
	--	   'FROM JAtriggers.dbo.' + @systemname + 'PageDetailTableUpdate PDT with (nolock)' + @crlf + 
	--	   'LEFT OUTER JOIN MasterAVData.dbo.MasterAVChildWebMain CWM with (nolock) on pdt.flyerid = cwm.flyerid'+@crlf+
	--	   'Option (MAXDOP 1)'


IF @systemname='AVC'
BEGIN
	 set @SQL = 'INSERT INTO [TEMPAVxPageDetailTable]' + @crlf + 
     'SELECT ' + @SelectClauseCon + 
     'FROM JAtriggers.dbo.' + @systemname + 'PageDetailTableUpdate PDT with (nolock)' + @crlf + 
     'LEFT OUTER JOIN MasterAVData.dbo.MasterAVChildWebMain CWM with (nolock) on pdt.flyerid = cwm.flyerid'+@crlf+
     'Option (MAXDOP 1)'
END
ELSE
BEGIN
	set @SQL = 'INSERT INTO [TEMPAVxPageDetailTable]' + @crlf + 
     'SELECT ' + @SelectClauseDur + 
     'FROM JAtriggers.dbo.' + @systemname + 'PageDetailTableUpdate PDT with (nolock)' + @crlf + 
     'LEFT OUTER JOIN MasterAVData.dbo.MasterAVChildWebMain CWM with (nolock) on pdt.flyerid = cwm.flyerid'+@crlf+
     'Option (MAXDOP 1)'
END



	update tempdb.dbo.TEMPAVXProjectsPDTTriggers
	set startdt = getdate()
	where systemname = @systemname

	print @sql

	Exec(@SQL)

	update tempdb.dbo.TEMPAVXProjectsPDTTriggers
	set enddt = getdate(), run = 0
	where systemname = @systemname

	fetch next from projects into @systemname
end
close projects
deallocate projects



if exists (select * from sysobjects where id = object_id(N'[dbo].[TEMPAVMultiplePageValues]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TEMPAVMultiplePageValues]

SELECT pagedetailid, fieldname, fieldvalue INTO TEMPAVMultiplePageValues FROM JAtriggers.dbo.AVCMultiplePageValuesUpdate
INSERT INTO TEMPAVMultiplePageValues Select pagedetailid, fieldname, fieldvalue FROM JAtriggers.dbo.AVDFullMultiplePageValuesUpdate



if exists (select * from sysobjects where id = object_id(N'[dbo].[TEMPAVMultiplePageValuesDelete]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TEMPAVMultiplePageValuesDelete]

SELECT pagedetailid, fieldname, fieldvalue INTO TEMPAVMultiplePageValuesDelete FROM JAtriggers.dbo.AVCMultiplePageValuesDelete
INSERT INTO [TEMPAVMultiplePageValuesDelete] SELECT pagedetailid, fieldname, fieldvalue FROM JAtriggers.dbo.AVDFULLMultiplePageValuesDelete



select pagedetailid, fieldname, fieldvalue, count(*) as count into #tempdupes
from TEMPAVMultiplePageValues
group by pagedetailid, fieldname, fieldvalue
having count(*) > 1

delete p from TEMPAVMultiplePageValues p	
join #tempdupes t on t.pagedetailid = p.pagedetailid and t.fieldname = p.fieldname
and t.fieldvalue = p.fieldvalue

insert into TEMPAVMultiplePageValues
select distinct pagedetailid, fieldname, fieldvalue
from #tempdupes

Drop table #tempdupes
 
ALTER TABLE [dbo].[TEMPAVMultiplePageValues] WITH NOCHECK ADD 
	CONSTRAINT [PK_TEMPAVMultiplePageValues] PRIMARY KEY  CLUSTERED 
	(
		[PageDetailID],
		[FieldName],
		[FieldValue]
	)  ON [PRIMARY] 



if exists (select * from sysobjects where id = object_id(N'[dbo].[TEMPAVPDTDelete]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TEMPAVPDTDelete]


SELECT pagedetailid  INTO TEMPAVPDTDelete FROM JAtriggers.dbo.AVCPageDetailTableDelete
--INSERT INTO [TEMPAVPDTDelete] SELECT pagedetailid  FROM JAtriggers.dbo.AVDFULLPageDetailTableDelete
INSERT INTO [TEMPAVPDTDelete](pagedetailid) SELECT pagedetailid  FROM JAtriggers.dbo.AVDFULLPageDetailTableDelete

BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE

COMMIT
BEGIN TRANSACTION
CREATE TABLE dbo.Tmp_TEMPAVxPageDetailtable
            (
            FlyerID varchar(11) NULL,
            Page int  NULL,
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
            Promotions varchar(37) NULL,
            PageEvent varchar(37) NULL,
            PageTheme varchar(37) NULL,
            Features varchar(100) NULL,
            NumberPackage int NULL,
            Coupon Numeric(8) NULL,
            CouponValueD1 numeric(18, 2) NULL,
            CouponValueD2 numeric(18, 2) NULL,
            CouponValueP1 int NULL,
            CouponValueP2 int NULL,
			CouponValueP3 int NULL,
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
            topleftx int NOT NULL CONSTRAINT DF_TEMPAVxPageDetailtable_topleftx DEFAULT (0),
            toplefty int NOT NULL CONSTRAINT DF_TEMPAVxPageDetailtable_toplefty DEFAULT (0),
            bottomrightx int NOT NULL CONSTRAINT DF_TEMPAVxPageDetailtable_bottomrightx DEFAULT (0),
            bottomrighty int NOT NULL CONSTRAINT DF_TEMPAVxPageDetailtable_bottomrighty DEFAULT (0),
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
	    OfferDes varchar(255) null,
	    EntryComments1 varchar(255) null,
            EntryBrand varchar(100) NULL,
            RegularUnitPrice numeric(18, 2) NULL,
            EntryTaggedCompany varchar(37) NULL,
            Weight decimal(9,6) NULL,
	    MediaDetail varchar(100) null,				
HighDOff numeric(18, 2) NULL,
HighRebateAmount numeric(18, 2) NULL,
GiftCardD numeric(18, 2) NULL,
BuyNumber int null,
GetNumber int null,
HighPOff  int null,
ExtraPOff int null,
RequiredNumberOffer int null,
FinansingInterestRate numeric(18, 2) NULL,
FinansingMinPurchase numeric(18, 2) NULL,
FinansingTermLength int null,
FinansingTermLengthType varchar(100) NULL,
HiGiftCard numeric(18, 2) NULL,
WasPrice numeric(18, 2) NULL,
MSRP smallmoney NULL

            ) ON [PRIMARY]



if exists (select * from sysobjects where id = object_id(N'[dbo].[TEMPAVxPageDetailtable]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
	IF EXISTS(SELECT * FROM dbo.TEMPAVxPageDetailtable)
		 EXEC('INSERT INTO dbo.Tmp_TEMPAVxPageDetailtable(FlyerID, Page, PageDetailID, ThumbImagePath, NormalImagePath, FullImagePath, ProductImagePath, MultipleValues, DTAdded, Retailer, TaggedCompany, Manufacturer, MerchandiseCategory, MerchandiseSubCat, Category, Brand, SKUDescription1, SKUDescription2, SKUDescription3, SKUType, SalePrice1, SalePrice2, RegularPrice1, RegularPrice2, NORPrice, RebateAmount, LowestRebatePrice, LowestDiscountPrice, UnitPrice, Promotions, PageEvent, PageTheme, Features, NumberPackage, Coupon, CouponValueD1, CouponValueD2, CouponValueP1, CouponValueP2,CouponValueP3, OtherDiscountD1, OtherDiscountD2, OtherDiscountD3, RequiredQuantity, MaximumQuantity, AdSize, AdCost, Illustrated, Color, NoOfColors, SaleStDt, SaleEndDt, CouponExpirationDate, Optional1, Optional2, Optional3, Optional4, Optional5, Optional6, Optional7, Optional8, Optional9, Optional10, Optional11, Optional12, Comments, ProductTerritory, ProductTerritorySubGroup, ProductTerritoryGroup, EnteredClient, CouponExpirationDate1, CouponExpirationDate2, OtherDiscountP1, OtherDiscountP2, OtherDiscountP3, comments1, comments2, comments3, comments4, topleftx, toplefty, bottomrightx, bottomrighty, McUpdatedOn, MscUpdatedOn, MfrUpdatedOn, PtUpdatedOn, PtgUpdatedOn, PtsgUpdatedOn, ProdImageCreated, ProdImageCreatedOn, Origin, Variety, UnitType, PkgSize, OfferDes, entrycomments1, EntryBrand, RegularUnitPrice, EntryTaggedCompany, Weight, MediaDetail,HighDOff,HighRebateAmount,GiftCardD,BuyNumber,GetNumber,HighPOff,ExtraPOff,RequiredNumberOffer,FinansingInterestRate,FinansingMinPurchase,FinansingTermLength,FinansingTermLengthType,HiGiftCard,WasPrice, MSRP )
			SELECT FlyerID, Page, PageDetailID, ThumbImagePath, NormalImagePath, FullImagePath, ProductImagePath, MultipleValues, DTAdded, Retailer, TaggedCompany, Manufacturer, MerchandiseCategory, MerchandiseSubCat, Category, Brand, SKUDescription1, SKUDescription2, SKUDescription3, SKUType, CONVERT(numeric(18, 2), SalePrice1), CONVERT(numeric(18, 2), SalePrice2), CONVERT(numeric(18, 2), RegularPrice1), CONVERT(numeric(18, 2), RegularPrice2), CONVERT(numeric(18, 2), NORPrice), CONVERT(numeric(18, 2), RebateAmount), CONVERT(numeric(18, 2), LowestRebatePrice), CONVERT(numeric(18, 2), LowestDiscountPrice), CONVERT(numeric(18, 2), UnitPrice), Promotions, PageEvent, PageTheme, Features, NumberPackage, Coupon, CONVERT(numeric(18, 2), CouponValueD1), CONVERT(numeric(18, 2), CouponValueD2), CouponValueP1, CouponValueP2,CouponValueP3, CONVERT(numeric(18, 2), OtherDiscountD1), CONVERT(numeric(18, 2), OtherDiscountD2), CONVERT(numeric(18, 2), OtherDiscountD3), RequiredQuantity, MaximumQuantity, AdSize, AdCost, Illustrated, Color, NoOfColors, CONVERT(smalldatetime, SaleStDt), CONVERT(smalldatetime, SaleEndDt), CONVERT(smalldatetime, CouponExpirationDate), Optional1, Optional2, Optional3, Optional4, Optional5, Optional6, Optional7, Optional8, Optional9, Optional10, Optional11, Optional12, Comments, ProductTerritory, ProductTerritorySubGroup, ProductTerritoryGroup, EnteredClient, CONVERT(smalldatetime, CouponExpirationDate1), CONVERT(smalldatetime, CouponExpirationDate2), OtherDiscountP1, OtherDiscountP2, OtherDiscountP3, comments1, comments2, comments3, comments4, topleftx, toplefty, bottomrightx, bottomrighty, CONVERT(smalldatetime, McUpdatedOn), CONVERT(smalldatetime, MscUpdatedOn), CONVERT(smalldatetime, MfrUpdatedOn), CONVERT(smalldatetime, PtUpdatedOn), CONVERT(smalldatetime, PtgUpdatedOn), CONVERT(smalldatetime, PtsgUpdatedOn), ProdImageCreated, CONVERT(smalldatetime, ProdImageCreatedOn), Origin, Variety, UnitType, PkgSize, OfferDes, entrycomments1, EntryBrand, RegularUnitPrice, EntryTaggedCompany, Weight, MediaDetail,
				HighDOff,HighRebateAmount,GiftCardD,BuyNumber,GetNumber,HighPOff,ExtraPOff,RequiredNumberOffer,FinansingInterestRate,FinansingMinPurchase,FinansingTermLength,FinansingTermLengthType,HiGiftCard,WasPrice, MSRP  
			 FROM dbo.TEMPAVxPageDetailtable TABLOCKX')
	
	DROP TABLE dbo.TEMPAVxPageDetailtable
END

EXECUTE sp_rename 'dbo.Tmp_TEMPAVxPageDetailtable', 'TEMPAVxPageDetailtable'


CREATE CLUSTERED INDEX DetailIndex ON dbo.TEMPAVxPageDetailtable (PageDetailID) ON [PRIMARY]


COMMIT

if exists (select * from sysobjects where id = object_id(N'[dbo].[TEMPAVPageDetailTable]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TEMPAVPageDetailTable]


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
min(CouponValueP3)as CouponValueP3,
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
min(EntryComments1) as EntryComments1,
min(EntryBrand)as EntryBrand, 
min(RegularUnitPrice)as RegularUnitPrice, 
min(EntryTaggedCompany)as EntryTaggedCompany,
min(Weight) as Weight,
min(MediaDetail) as MediaDetail,
min(HighDOff) as HighDOff,
min(HighRebateAmount) as HighRebateAmount,
min(GiftCardD) as GiftCardD,
min(BuyNumber) as BuyNumber,
min(GetNumber) as GetNumber,
min(HighPOff) as HighPOff,
min(ExtraPOff) as ExtraPOff,
min(RequiredNumberOffer) as RequiredNumberOffer,
min(FinansingInterestRate) as FinansingInterestRate,
min(FinansingMinPurchase) as FinansingMinPurchase,
min(FinansingTermLength) as FinansingTermLength,
min(FinansingTermLengthType) as FinansingTermLengthType,
min(HiGiftCard) as HiGiftCard,
min(WasPrice) as WasPrice,
min(MSRP) as MSRP,
Cast(Cast(replace(min(FlyerID),' ','') as varchar) + cast(replace(min(Page),' ','') as varchar) + cast(replace(abs(min(topleftx)),' ','') as varchar) + cast(replace(abs(min(toplefty)),' ','') as varchar) as numeric(30,0)) as AdBlockID
into TEMPAVPageDetailTable
from TEMPAVxPageDetailTable 
group by pagedetailid


if exists (select * from sysobjects where id = object_id(N'[dbo].[TEMPAVxPageDetailTable]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TEMPAVxPageDetailTable]


ALTER TABLE [dbo].[TEMPAVpagedetailtable] WITH NOCHECK ADD CONSTRAINT [PK_TEMPAVpagedetailtable] PRIMARY KEY  CLUSTERED 
	([PageDetailID]	)  ON [PRIMARY] 

 
CREATE  INDEX [idxTEMPAVBrandCatMfr] ON [dbo].[TEMPAVPagedetailtable]([Brand], [Category]) ON [PRIMARY]
 

CREATE INDEX [IX_TEMPAV_FID_CAT_BR] ON [dbo].[TEMPAVPageDetailTable] ([FlyerId],[Category],[Brand]) ON [PRIMARY]



--Update TEMPAVPageDetailTable for US Mfr
Exec('UPDATE TEMPAVPageDetailTable 
SET Manufacturer = MF.Manufacturer
FROM TEMPAVPageDetailTable pdt join 
	(SELECT Manufacturer, Category, Case when PL=0 then Brand Else PLBrand end Brand 
	from MasterAdViewData.DBO.[TEMPManufacturer]) MF 
on pdt.Category = MF.Category and pdt.brand = MF.brand 
where flyerid not in (select flyerid from tempdb..CanFlyerIDs)
option(maxdop 1)')


--Update TEMPAVPageDetailTable for Canada Mfr
Exec('UPDATE TEMPAVPageDetailTable 
SET Manufacturer = MF.Manufacturer
FROM TEMPAVPageDetailTable pdt join 
	(SELECT Manufacturer, Category, Case when PL=0 then Brand Else PLBrand end Brand 
	from MasterAdViewData.DBO.[CanOneManufacturer]) MF 
on pdt.Category = MF.Category and pdt.brand = MF.brand 
where flyerid in (select flyerid from tempdb..CanFlyerIDs)
option(maxdop 1)')


UPDATE TEMPAVPageDetailTable SET Manufacturer = 'Other' WHERE Manufacturer is null



---- Update TEMPAVPageDetailTable Weight
--update pdt
--set pdt.weight = ws.score
--from TEMPAVPageDetailTable pdt
--join masteradviewdata.dbo.adviewmain cwm with (nolock) on cwm.flyerid = pdt.flyerid
--join tempdb.dbo.vwWeightScore ws with (nolock) on cwm.retmktid = ws.retmktid and pdt.features = ws.features and pdt.taggedcompany = ws.taggedcompany
--where pdt.weight is null

---- Update TempFuturePDT PagePosition
--Update P Set Features = FVSystemValue
--from masterclientcoverage.dbo.TEMPAVPageDetailTable P
--inner join masteradviewdata..MCAPVehiclePages M on M.FlyerId = P.FlyerId and M.PageNumber = P.Page
--where isnull(ltrim(rtrim(Features)),'')<>FVSystemValue 
--Option (Maxdop 1)

IF NOT EXISTS(SELECT * FROM MasterClientCoverage.sys.indexes WHERE name = 'IDX_TempAV_AdBlock' AND object_id IN (Select Id From  MasterClientCoverage.dbo.SYSObjects Where Name='TempAVPageDetailTable'))
        CREATE NONCLUSTERED INDEX [IDX_TempAV_AdBlock] ON [MasterClientCoverage].[dbo].[TempAVPageDetailTable] (AdBlockID) INCLUDE ([FlyerId])

update MT2SQL00.MasterAdviewData.dbo.MergeDetailLoad set flag=1,StepEndTime=getdate() where StepName='TempAV' 
end