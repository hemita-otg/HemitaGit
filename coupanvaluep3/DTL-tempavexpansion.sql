DECLARE @Flag bit
SELECT @flag=flag FROM MT2SQL00.MasterAdviewData.dbo.MergeDetailLoad where stepname='TempAV Expansion'

if(@flag=0)
begin
update MT2SQL00.MasterAdviewData.dbo.MergeDetailLoad set StepStartTime=getdate() where StepName='TempAV Expansion' 

Use MasterClientCoverage

Exec('IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N''[dbo].[TempAVPageDetailTable]'') AND name = N''IDX_TempAVPageDetailTable_FlyerPDT'')
DROP INDEX [IDX_TempAVPageDetailTable_FlyerPDT] ON [dbo].[TempAVPageDetailTable] WITH ( ONLINE = OFF )')


Exec('CREATE NONCLUSTERED INDEX [IDX_TempAVPageDetailTable_FlyerPDT] ON [dbo].[TempAVPageDetailTable] 
(FlyerId,PageDetailId)')


Exec('IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N''[dbo].[TempAVPageDetailTable]'') AND name = N''IDX_TempAVPageDetailTable_FlyerMfrBrPDT'')
DROP INDEX [IDX_TempAVPageDetailTable_FlyerMfrBrPDT] ON [dbo].[TempAVPageDetailTable] WITH ( ONLINE = OFF )')


Exec('CREATE NONCLUSTERED INDEX [IDX_TempAVPageDetailTable_FlyerMfrBrPDT] ON [dbo].[TempAVPageDetailTable] 
(FlyerId,Manufacturer,Brand,PageDetailId)')


-------------Expansion--------------------------
Exec('if exists (select * from tempdb.dbo.sysobjects where xtype=''u'' and name=''AVExpandedRecords'')
drop table tempdb.[dbo].[AVExpandedRecords]')

 
Exec('select *
into tempdb.dbo.AVExpandedRecords
From  MasterClientCoverage.dbo.tempAVPageDetailTable 
where 1=2')

--EXEC sp_rename 'tempdb.dbo.AVExpandedRecords.PageDetailId', 'OriginalPageDetailId', 'COLUMN'
--


/*
--This is one Time creation, so create in any 00 static DB
if exists (select * from sysobjects where xtype='u' and name='AVExpansionMapping')
Drop Table AVExpansionMapping


CREATE TABLE [AVExpansionMapping](
	[FlyerID] [varchar](11) NOT NULL,
	[Manufacturer] [varchar](100) NULL,
	[Brand] [varchar](100) NULL,
	[OriginalPageDetailId] [varchar](11) NOT NULL,
	[PageDetailId] [int] IDENTITY(1000000000,1) NOT NULL
) ON [PRIMARY]
*/
--1558771

-------Start 1: Fix for Data Entry Mix up--------------

--Take records with Z into ZRecords table
Exec('IF EXISTS(SELECT [Name] FROM tempdb.dbo.SysObjects WHERE xtype = ''U'' AND Name = ''ZRecords'')
Drop table tempdb.dbo.ZRecords')

Exec('select A.*
into tempdb.dbo.ZRecords
from MasterAVData..MasterAVPageDetailTable A
 join MasterAVData..MasterAVChildWebMain B on A.Flyerid=B.FlyerID and B.CTAdCode in
(select CTAdCode from MasterAVData..MasterAVChildWebMain  where flyerid in (select distinct  flyerid from MasterClientCoverage.dbo.TEMPAVPageDetailTable)) 
and PageDetailID  like ''%Z%''')

----Take Non Z records into NonZRecords table
Exec('IF EXISTS(SELECT [Name] FROM tempdb.dbo.SysObjects WHERE xtype = ''U'' AND Name = ''NonZRecords'')
Drop table tempdb.dbo.NonZRecords')

Exec('select A.*
into tempdb.dbo.NonZRecords
from MasterAVData..MasterAVPageDetailTable A
 join MasterAVData..MasterAVChildWebMain B on A.Flyerid=B.FlyerID and B.CTAdCode in
(select CTAdCode from MasterAVData..MasterAVChildWebMain  where flyerid in (select distinct  flyerid from MasterClientCoverage.dbo.TEMPAVPageDetailTable)) 
and PageDetailID not like ''%Z%''')

--Delete Z and NonZ records from MasterAVPDT and MasterAVMPV using both TempTable
Exec('Delete from MasterAVData..MasterAVPageDetailTable where PageDetailId In
(select PageDetailId from tempdb.dbo.ZRecords UNION
select PageDetailId from tempdb.dbo.NonZRecords)')


Exec('Delete from MasterAVData..MasterAVMultiplePageValues where PageDetailId In
(select PageDetailId from tempdb.dbo.ZRecords )')


--Insert Non Z records into TempAVPDT and TempAVMPV
Exec('Insert into MasterClientCoverage.dbo.TEMPAVPageDetailTable
select * from tempdb.dbo.NonZRecords where PageDetailID not in (select PageDetailId from MasterClientCoverage.dbo.TEMPAVPageDetailTable)')

Exec('Insert into MasterClientCoverage.dbo.TEMPAVMultiplePageValues
select B.* from tempdb.dbo.NonZRecords A join MasterAVData..MasterAVMultiplePageValues B
on A.PageDetailId=B.PageDetailId
where B.PageDetailID not in (select PageDetailId from MasterClientCoverage.dbo.TEMPAVMultiplePageValues)')

-------End 1: Fix for Data Entry Mix up--------------


Exec('if exists (select * from tempdb.dbo.sysobjects where xtype=''u'' and name=''tempexpanded'')
drop table tempdb.[dbo].tempexpanded')


Exec('select  X.FlyerID, 
[Page], [ThumbImagePath],[NormalImagePath],[FullImagePath],[ProductImagePath],[MultipleValues],[DTAdded],[Retailer],[TaggedCompany],[Manufacturer],[MerchandiseCategory],[MerchandiseSubCat],[Category],[Brand],[SKUDescription1],[SKUDescription2],[SKUDescription3],[SKUType],[SalePrice1],[SalePrice2],[RegularPrice1],[RegularPrice2],[NORPrice],[RebateAmount],[LowestRebatePrice],[LowestDiscountPrice],[UnitPrice],[Promotions],[PageEvent],[PageTheme],[Features],[NumberPackage],B.[Coupon],[CouponValueD1],[CouponValueD2],[CouponValueP1],[CouponValueP2],[CouponValueP3],[OtherDiscountD1],[OtherDiscountD2],[OtherDiscountD3],[RequiredQuantity],[MaximumQuantity],[AdSize],[AdCost],[Illustrated],[Color],[NoOfColors],[SaleStDt],[SaleEndDt],[CouponExpirationDate],[Optional1],[Optional2],[Optional3],[Optional4],[Optional5],[Optional6],[Optional7],[Optional8],[Optional9],[Optional10],[Optional11],[Optional12],[Comments],[ProductTerritory],[ProductTerritorySubGroup],[ProductTerritoryGroup],[EnteredClient],[CouponExpirationDate1],[CouponExpirationDate2],[OtherDiscountP1],[OtherDiscountP2],[OtherDiscountP3],[comments1],[comments2],[comments3],[comments4],[topleftx],[toplefty],[bottomrightx],[bottomrighty],[McUpdatedOn],[MscUpdatedOn],[MfrUpdatedOn],[PtUpdatedOn],[PtgUpdatedOn],[PtsgUpdatedOn],[ProdImageCreated],[ProdImageCreatedOn],[Origin],[Variety],[UnitType],[PkgSize],[OfferDes],[EntryComments1],[EntryBrand],[RegularUnitPrice],[EntryTaggedCompany],[Weight],[MediaDetail]
,HighDOff,HighRebateAmount,GiftCardD,BuyNumber,GetNumber,HighPOff,ExtraPOff,RequiredNumberOffer,FinansingInterestRate,FinansingMinPurchase,FinansingTermLength,FinansingTermLengthType,HiGiftCard,WasPrice,MSRP
,B.PageDetailId
Into tempdb..tempexpanded
From MasterAVData.dbo.MasterAVChildWebMain A Join MasterClientCoverage.dbo.TempAVPageDetailTable B On A.FlyerID  = B.FlyerId 
Join MasterAVData.dbo.MasterAVChildWebMain X On A.CTAdCode = X.CTAdCode 
Where A.FlyerID <> X.FlyerID and isnull(B.PageDetailID,'''')<>'''' 
and B.PageDetailID Not like ''%Z%''')


-------Start 2: Fix for Data Entry Mix up--------------
--Delete A From tempdb..tempexpanded a where pagedetailid in (select z.originalpagedetailid from MasterMappingTables.dbo.AVExpansionMapping z)
--

Exec('Insert into tempdb..AVExpandedRecords(FlyerID,Page,ThumbImagePath,NormalImagePath,FullImagePath,ProductImagePath,MultipleValues,DTAdded,Retailer,TaggedCompany,Manufacturer,MerchandiseCategory,MerchandiseSubCat,Category,Brand,SKUDescription1,SKUDescription2,SKUDescription3,SKUType,SalePrice1,SalePrice2,RegularPrice1,RegularPrice2,NORPrice,RebateAmount,LowestRebatePrice,LowestDiscountPrice,UnitPrice,Promotions,PageEvent,PageTheme,Features,NumberPackage,Coupon,CouponValueD1,CouponValueD2,CouponValueP1,CouponValueP2,CouponValueP3,OtherDiscountD1,OtherDiscountD2,OtherDiscountD3,RequiredQuantity,MaximumQuantity,AdSize,AdCost,Illustrated,Color,NoOfColors,SaleStDt,SaleEndDt,CouponExpirationDate,Optional1,Optional2,Optional3,Optional4,Optional5,Optional6,Optional7,Optional8,Optional9,Optional10,Optional11,Optional12,Comments,ProductTerritory,ProductTerritorySubGroup,ProductTerritoryGroup,EnteredClient,CouponExpirationDate1,CouponExpirationDate2,OtherDiscountP1,OtherDiscountP2,OtherDiscountP3,comments1,comments2,comments3,comments4,topleftx,toplefty,bottomrightx,bottomrighty,McUpdatedOn,MscUpdatedOn,MfrUpdatedOn,PtUpdatedOn,PtgUpdatedOn,PtsgUpdatedOn,ProdImageCreated,ProdImageCreatedOn,Origin,Variety,UnitType,PkgSize,OfferDes,EntryComments1,EntryBrand,RegularUnitPrice,EntryTaggedCompany,Weight,MediaDetail
,HighDOff,HighRebateAmount,GiftCardD,BuyNumber,GetNumber,HighPOff,ExtraPOff,RequiredNumberOffer,FinansingInterestRate,FinansingMinPurchase,FinansingTermLength,FinansingTermLengthType,HiGiftCard,WasPrice,MSRP
,PageDetailId)
select B.*
From Tempdb..tempexpanded  B join MasterMappingTables.dbo.AVExpansionMapping Map on B.FlyerId=Map.FlyerId and  B.PageDetailId=Map.OriginalPageDetailId and  B.Manufacturer=Map.Manufacturer and  B.Brand=Map.Brand ')


Exec('Insert into tempdb..AVExpandedRecords(FlyerID,Page,ThumbImagePath,NormalImagePath,FullImagePath,ProductImagePath,MultipleValues,DTAdded,Retailer,TaggedCompany,Manufacturer,MerchandiseCategory,MerchandiseSubCat,Category,Brand,SKUDescription1,SKUDescription2,SKUDescription3,SKUType,SalePrice1,SalePrice2,RegularPrice1,RegularPrice2,NORPrice,RebateAmount,LowestRebatePrice,LowestDiscountPrice,UnitPrice,Promotions,PageEvent,PageTheme,Features,NumberPackage,Coupon,CouponValueD1,CouponValueD2,CouponValueP1,CouponValueP2,CouponValueP3,OtherDiscountD1,OtherDiscountD2,OtherDiscountD3,RequiredQuantity,MaximumQuantity,AdSize,AdCost,Illustrated,Color,NoOfColors,SaleStDt,SaleEndDt,CouponExpirationDate,Optional1,Optional2,Optional3,Optional4,Optional5,Optional6,Optional7,Optional8,Optional9,Optional10,Optional11,Optional12,Comments,ProductTerritory,ProductTerritorySubGroup,ProductTerritoryGroup,EnteredClient,CouponExpirationDate1,CouponExpirationDate2,OtherDiscountP1,OtherDiscountP2,OtherDiscountP3,comments1,comments2,comments3,comments4,topleftx,toplefty,bottomrightx,bottomrighty,McUpdatedOn,MscUpdatedOn,MfrUpdatedOn,PtUpdatedOn,PtgUpdatedOn,PtsgUpdatedOn,ProdImageCreated,ProdImageCreatedOn,Origin,Variety,UnitType,PkgSize,OfferDes,EntryComments1,EntryBrand,RegularUnitPrice,EntryTaggedCompany,Weight,MediaDetail
,HighDOff,HighRebateAmount,GiftCardD,BuyNumber,GetNumber,HighPOff,ExtraPOff,RequiredNumberOffer,FinansingInterestRate,FinansingMinPurchase,FinansingTermLength,FinansingTermLengthType,HiGiftCard,WasPrice,MSRP
,PageDetailId)
OUTPUT INSERTED.FlyerId, INSERTED.Manufacturer, INSERTED.Brand, INSERTED.PageDetailId INTO MasterMappingTables.dbo.AVExpansionMapping(FlyerId,Manufacturer,Brand, OriginalPageDetailId)
select B.*
From Tempdb..tempexpanded B left join MasterMappingTables.dbo.AVExpansionMapping Map on B.FlyerId=Map.FlyerId and  B.PageDetailId=Map.OriginalPageDetailId and  B.Manufacturer=Map.Manufacturer and  B.Brand=Map.Brand 
where Map.OriginalPageDetailId Is NULL')


-------End 2: Fix for Data Entry Mix up--------------

Exec('Insert into TempAVPageDetailTable
 select B.FlyerID, [Page], 
left(Map.PageDetailId,7)+''Z''+right(Map.PageDetailId,3) as PageDetailID
,[ThumbImagePath],[NormalImagePath],[FullImagePath],[ProductImagePath],[MultipleValues],[DTAdded],[Retailer],[TaggedCompany],B.[Manufacturer],[MerchandiseCategory],[MerchandiseSubCat],[Category],B.[Brand],[SKUDescription1],[SKUDescription2],[SKUDescription3],[SKUType],[SalePrice1],[SalePrice2],[RegularPrice1],[RegularPrice2],[NORPrice],[RebateAmount],[LowestRebatePrice],[LowestDiscountPrice],[UnitPrice],[Promotions],[PageEvent],[PageTheme],[Features],[NumberPackage],B.[Coupon],[CouponValueD1],[CouponValueD2],[CouponValueP1],[CouponValueP2],[CouponValueP3],[OtherDiscountD1],[OtherDiscountD2],[OtherDiscountD3],[RequiredQuantity],[MaximumQuantity],[AdSize],[AdCost],[Illustrated],[Color],[NoOfColors],[SaleStDt],[SaleEndDt],[CouponExpirationDate],[Optional1],[Optional2],[Optional3],[Optional4],[Optional5],[Optional6],[Optional7],[Optional8],[Optional9],[Optional10],[Optional11],[Optional12],[Comments],[ProductTerritory],[ProductTerritorySubGroup],[ProductTerritoryGroup],[EnteredClient],[CouponExpirationDate1],[CouponExpirationDate2],[OtherDiscountP1],[OtherDiscountP2],[OtherDiscountP3],[comments1],[comments2],[comments3],[comments4],[topleftx],[toplefty],[bottomrightx],[bottomrighty],[McUpdatedOn],[MscUpdatedOn],[MfrUpdatedOn],[PtUpdatedOn],[PtgUpdatedOn],[PtsgUpdatedOn],[ProdImageCreated],[ProdImageCreatedOn],[Origin],[Variety],[UnitType],[PkgSize],[OfferDes],[EntryComments1],[EntryBrand],[RegularUnitPrice],[EntryTaggedCompany],[Weight],[MediaDetail]
,HighDOff,HighRebateAmount,GiftCardD,BuyNumber,GetNumber,HighPOff,ExtraPOff,RequiredNumberOffer,FinansingInterestRate,FinansingMinPurchase,FinansingTermLength,FinansingTermLengthType,HiGiftCard,WasPrice,MSRP,
Cast(replace(B.Flyerid,'' '','''') as varchar) + cast(replace(B.page,'' '','''') as varchar) + cast(replace(abs(B.topleftx),'' '','''') as varchar) + cast(replace(abs(B.toplefty),'' '','''') as varchar)
From tempdb.dbo.AVExpandedRecords B
Join MasterMappingTables.dbo.AVExpansionMapping MAP on B.FlyerId=Map.FlyerId and  B.PageDetailId=Map.OriginalPageDetailId and  B.Manufacturer=Map.Manufacturer and  B.Brand=Map.Brand 
where-- B.PageDetailID Not in (select PageDetailId from MasterClientCoverage..TempAVPageDetailTable) and
B.PageDetailID Not like ''%Z%''')


--Below insert is taken care in MasterAVUpdates step in Can trigger pkg
-- Insert into MasterAVData..MasterAVPageDetailTable
-- select B.FlyerID, [Page], 
--left(Map.PageDetailId,7)+'Z'+right(Map.PageDetailId,3) as PageDetailID
--,[ThumbImagePath],[NormalImagePath],[FullImagePath],[ProductImagePath],[MultipleValues],[DTAdded],[Retailer],[TaggedCompany],B.[Manufacturer],[MerchandiseCategory],[MerchandiseSubCat],[Category],B.[Brand],[SKUDescription1],[SKUDescription2],[SKUDescription3],[SKUType],[SalePrice1],[SalePrice2],[RegularPrice1],[RegularPrice2],[NORPrice],[RebateAmount],[LowestRebatePrice],[LowestDiscountPrice],[UnitPrice],[Promotions],[PageEvent],[PageTheme],[Features],[NumberPackage],B.[Coupon],[CouponValueD1],[CouponValueD2],[CouponValueP1],[CouponValueP2],[CouponValueP3],[OtherDiscountD1],[OtherDiscountD2],[OtherDiscountD3],[RequiredQuantity],[MaximumQuantity],[AdSize],[AdCost],[Illustrated],[Color],[NoOfColors],[SaleStDt],[SaleEndDt],[CouponExpirationDate],[Optional1],[Optional2],[Optional3],[Optional4],[Optional5],[Optional6],[Optional7],[Optional8],[Optional9],[Optional10],[Optional11],[Optional12],[Comments],[ProductTerritory],[ProductTerritorySubGroup],[ProductTerritoryGroup],[EnteredClient],[CouponExpirationDate1],[CouponExpirationDate2],[OtherDiscountP1],[OtherDiscountP2],[OtherDiscountP3],[comments1],[comments2],[comments3],[comments4],[topleftx],[toplefty],[bottomrightx],[bottomrighty],[McUpdatedOn],[MscUpdatedOn],[MfrUpdatedOn],[PtUpdatedOn],[PtgUpdatedOn],[PtsgUpdatedOn],[ProdImageCreated],[ProdImageCreatedOn],[Origin],[Variety],[UnitType],[PkgSize],[OfferDes],[EntryComments1],[EntryBrand],[RegularUnitPrice],[EntryTaggedCompany],[Weight],[MediaDetail]
--From tempdb.dbo.AVExpandedRecords B
--Join MasterMappingTables.dbo.AVExpansionMapping MAP on B.FlyerId=Map.FlyerId and  B.PageDetailId=Map.OriginalPageDetailId and  B.Manufacturer=Map.Manufacturer and  B.Brand=Map.Brand 
--where --B.PageDetailID Not in (select PageDetailId from MasterAVData..MasterAVPageDetailTable) and
--B.PageDetailID Not like '%Z%'

update MT2SQL00.MasterAdviewData.dbo.MergeDetailLoad set flag=1,StepEndTime=getdate() where StepName='TempAV Expansion'

end

