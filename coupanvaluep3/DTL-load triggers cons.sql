DECLARE @Flag bit
SELECT @flag=flag FROM MT2SQL00.MasterAdviewData.dbo.MergeDetailLoad where stepname='Load Triggers(Cons)'

if(@flag=0)
begin
	Use entrydata

	update MT2SQL00.MasterAdviewData.dbo.MergeDetailLoad set StepStartTime=getdate() where StepName='Load Triggers(Cons)' 

	declare @JATriggers varchar(50)
	set @JATriggers = 'JATriggers'
	declare @projectname varchar(50)
	declare @tablename varchar(255)
	declare @rows int
	declare @sql nvarchar(4000)
	declare @crlf char(2)
	set @crlf = char(13)+char(10)
	declare triggers cursor for
	select distinct ep.projectname
	from entrydata..vwEntryProjects ep
	where ep.projectname not in ('arc001','arc002','arc003','arc004','ja009','arcjafrX','DurCons')
	open triggers
	fetch next from triggers into @projectname
	while @@fetch_status = 0
	begin
		set @sql = 'if exists (select top 1 * from sysobjects where name = '''+@projectname+'PageDetailTable'') and exists (select top 1 * from '+@JATriggers+'.dbo.sysobjects where name = '''+@projectname+'PageDetailTableUpdate'') and exists (select top 1 * from '+@JATriggers+'.dbo.sysobjects where name = '''+@projectname+'PageDetailTableDelete'')'+@crlf+
			   'begin'+@crlf+
			   '	Delete '+@projectname+'PagedetailTable from '+@projectname+'PageDetailTable join '+@JATriggers+'.dbo.'+@projectname+'PageDetailTableDelete on ('+@projectname+'PageDetailTable.PageDetailId = '+@JATriggers+'.dbo.'+@projectname+'PageDetailTableDelete.PageDetailId)'+@crlf+
			   '	Delete '+@projectname+'PagedetailTable from '+@projectname+'PageDetailTable join '+@JATriggers+'.dbo.'+@projectname+'PageDetailTableUpdate on ('+@projectname+'PageDetailTable.PageDetailId = '+@JATriggers+'.dbo.'+@projectname+'PageDetailTableUpdate.PageDetailId)'+@crlf+
			   '	Insert into '+@projectname+'PageDetailTable 
					select distinct [FlyerId] ,[Page] , [PageDetailID] ,[ThumbImagePath] ,[NormalImagePath]  ,[FullImagePath] ,[ProductImagePath] ,[MultipleValues] ,[DTAdded] ,[Retailer]    ,[TaggedCompany] ,[Manufacturer] ,[MerchandiseCategory] ,[MerchandiseSubCat] ,[Category] ,[Brand] ,[SKUDescription1] ,	[SKUDescription2] ,[SKUDescription3]  ,[SKUType] , [SalePrice1] ,[SalePrice2] ,[RegularPrice1]
					,[RegularPrice2] ,[NORPrice] ,[RebateAmount] , [LowestRebatePrice] ,[LowestDiscountPrice]  ,[UnitPrice] , [Promotions] ,[PageEvent] ,[PageTheme] , [Features] ,[NumberPackage] ,[Coupon] ,[CouponValueD1] ,[CouponValueD2] ,[CouponValueP1] ,[CouponValueP2],[CouponValueP3] ,[OtherDiscountD1] ,[OtherDiscountD2] ,[OtherDiscountD3] ,[RequiredQuantity] ,[MaximumQuantity] ,[AdSize] ,[AdCost]
					,[Illustrated]  ,[Color] ,[NoOfColors] ,[SaleStDt] ,[SaleEndDt] ,[CouponExpirationDate] ,[Optional1] ,[Optional2] ,[Optional3] ,[Optional4] ,[Optional5] ,[Optional6]
     				,[Optional7] ,[Optional8] ,[Optional9] ,[Optional10] ,[Optional11] ,[Optional12] ,[Comments] ,[ProductTerritory] ,[ProductTerritorySubGroup] ,[ProductTerritoryGroup]  ,[EnteredClient] ,[CouponExpirationDate1] ,[CouponExpirationDate2] ,[OtherDiscountP1] ,[OtherDiscountP2] ,[OtherDiscountP3] ,[comments1],[comments2]
     				,[comments3] ,[comments4] ,[topleftx] ,[toplefty] ,[bottomrightx] ,[bottomrighty] ,[McUpdatedOn] , [MscUpdatedOn] ,[MfrUpdatedOn] ,[PtUpdatedOn] ,[PtgUpdatedOn]   ,[PtsgUpdatedOn] ,[ProdImageCreated] ,[ProdImageCreatedOn] ,[Origin] ,[Variety] ,[UnitType] ,[PkgSize] ,[Offerdes],BrandID,CategoryID 
			from '+@JATriggers+'.dbo.'+@projectname+'PageDetailTableUpdate'+@crlf+
			   'end'
		print @sql
		exec sp_executesql @sql

		set @sql = 'if exists (select top 1 * from sysobjects where name = '''+@projectname+'MultiplePageValues'') and exists (select top 1 * from '+@JATriggers+'.dbo.sysobjects where name = '''+@projectname+'MultiplePageValuesUpdate'') and exists (select top 1 * from '+@JATriggers+'.dbo.sysobjects where name = '''+@projectname+'MultiplePageValuesDelete'')'+@crlf+
			   'begin'+@crlf+
			   '	Delete '+@projectname+'MultiplePageValues from '+@projectname+'MultiplePageValues join '+@JATriggers+'.dbo.'+@projectname+'MultiplePageValuesDelete on ('+@projectname+'MultiplePageValues.PageDetailId = '+@JATriggers+'.dbo.'+@projectname+'MultiplePageValuesDelete.PageDetailId
					and '+@projectname+'MultiplePageValues.fieldname = '+@JATriggers+'.dbo.'+@projectname+'MultiplePageValuesDelete.fieldname and '+@projectname+'MultiplePageValues.fieldvalue = '+@JATriggers+'.dbo.'+@projectname+'MultiplePageValuesDelete.fieldvalue )'+@crlf+
			   '	Delete '+@projectname+'MultiplePageValues from '+@projectname+'MultiplePageValues join '+@JATriggers+'.dbo.'+@projectname+'MultiplePageValuesUpdate on ('+@projectname+'MultiplePageValues.PageDetailId = '+@JATriggers+'.dbo.'+@projectname+'MultiplePageValuesUpdate.PageDetailId
					and '+@projectname+'MultiplePageValues.fieldname = '+@JATriggers+'.dbo.'+@projectname+'MultiplePageValuesUpdate.fieldname and '+@projectname+'MultiplePageValues.fieldvalue = '+@JATriggers+'.dbo.'+@projectname+'MultiplePageValuesUpdate.fieldvalue)'+@crlf+
			   '	Insert into '+@projectname+'MultiplePageValues(pagedetailid, fieldname, fieldvalue) select distinct pagedetailid, fieldname, fieldvalue from '+@JATriggers+'.dbo.'+@projectname+'MultiplePageValuesUpdate'+@crlf+
			   'end'
		print @sql	   
		exec sp_executesql @sql

		set @sql = 'if exists (select top 1 * from sysobjects where name = '''+@projectname+'ArchiveCategoryTable'') and exists (select top 1 * from '+@JATriggers+'.dbo.sysobjects where name = '''+@projectname+'ArchiveCategoryTableUpdate'') and exists (select top 1 * from '+@JATriggers+'.dbo.sysobjects where name = '''+@projectname+'ArchiveCategoryTableDelete'')'+@crlf+
			   'begin'+@crlf+
			   '	Delete '+@projectname+'ArchiveCategoryTable from '+@projectname+'ArchiveCategoryTable join '+@JATriggers+'.dbo.'+@projectname+'ArchiveCategoryTableDelete on ('+@projectname+'ArchiveCategoryTable.PageDetailId = '+@JATriggers+'.dbo.'+@projectname+'ArchiveCategoryTableDelete.PageDetailId)'+@crlf+
			   '	Delete '+@projectname+'ArchiveCategoryTable from '+@projectname+'ArchiveCategoryTable join '+@JATriggers+'.dbo. '+@projectname+'ArchiveCategoryTableUpdate on ('+@projectname+'ArchiveCategoryTable.PageDetailId = '+@JATriggers+'.dbo.'+@projectname+'ArchiveCategoryTableUpdate.PageDetailId)'+@crlf+
			   '	Insert into  '+@projectname+'ArchiveCategoryTable 
					 select  [FlyerID],[Page] ,[PageDetailID] ,[ThumbImagePath] ,[NormalImagePath] ,[FullImagePath] ,[ProductImagePath] ,[MultipleValues] ,[DTAdded] ,[Retailer]  ,[Market] ,[AdDate] ,[TaggedCompany] ,[Manufacturer] ,[MerchandiseCategory] ,
					 [MerchandiseSubCat] ,[Category]  , [Brand] ,[SKUDescription1]   ,[SKUDescription2]   ,[SKUDescription3]  ,[SKUType] ,[SalePrice1] ,[SalePrice2] ,[RegularPrice1] ,[RegularPrice2] ,[NORPrice] ,[RebateAmount] ,[LowestRebatePrice] ,[LowestDiscountPrice] ,[UnitPrice] ,[Promotions] ,[PageEvent] ,
					 [PageTheme] ,[Features] , [NumberPackage] ,[Coupon] ,[CouponValueD1] ,[CouponValueD2] ,[CouponValueP1] ,[CouponValueP2],[CouponValueP3] ,[OtherDiscountD1] ,[OtherDiscountD2] ,[OtherDiscountD3] ,[RequiredQuantity]
					,[MaximumQuantity] ,[AdSize] ,[AdCost] ,[Illustrated] ,[Color] ,[NoOfColors] ,[SaleStDt] ,[SaleEndDt] ,[CouponExpirationDate] ,[Optional1] ,[Optional2]  ,[Optional3] ,[Optional4] ,[Optional5] ,[Optional6] ,
					[Optional7] ,[Optional8] ,[Optional9] ,[Optional10] ,[Optional11] ,[Optional12] ,[Comments]  ,[ProductTerritory] ,[ProductTerritorySubGroup] ,[ProductTerritoryGroup] ,[EnteredClient] ,[CouponExpirationDate1] ,
					[CouponExpirationDate2]  ,[OtherDiscountP1] ,[OtherDiscountP2] ,[OtherDiscountP3] ,[comments1] ,[comments2] ,[comments3] , [comments4]  ,[topleftx] ,[toplefty]  ,[bottomrightx] ,[bottomrighty] ,[McUpdatedOn] ,
					[MscUpdatedOn] ,[MfrUpdatedOn] ,[PtUpdatedOn] ,[PtgUpdatedOn] , [PtsgUpdatedOn] ,[ProdImageCreated] ,[ProdImageCreatedOn] ,[LockStatus] ,[BaseCatGrpPDT] ,[OtherMerchCat] ,[CategoryGroup] ,[MissingCatGroups] ,[NoOfCats] ,[NoOfBrands] ,[NoOfPrices]
					,[RemainingCategories] ,[BasePDT] ,[SelectedCategories] ,[RejectedCategories] ,[MissingCategories] ,[Priority] ,[Origin] ,[Variety] ,[UnitType]
					 ,[PkgSize] ,[OfferDes] from '+@JATriggers+'.dbo.'+@projectname+'ArchiveCategoryTableUpdate'+@crlf+
			   'end'
		print @sql	   
		exec sp_executesql @sql

		set @sql = 'if exists (select top 1 * from sysobjects where name = '''+@projectname+'PromotionInfoTbl'') and exists (select top 1 * from '+@JATriggers+'.dbo.sysobjects where name = '''+@projectname+'PromotionInfoTblUpdate'') and exists (select top 1 * from '+@JATriggers+'.dbo.sysobjects where name = '''+@projectname+'PromotionInfoTblDelete'')'+@crlf+
			   'begin'+@crlf+
			   '	Delete '+@projectname+'PromotionInfoTbl from '+@projectname+'PromotionInfoTbl join '+@JATriggers+'.dbo.'+@projectname+'PromotionInfoTblDelete on ('+@projectname+'PromotionInfoTbl.PageDetailId = '+@JATriggers+'.dbo.'+@projectname+'PromotionInfoTblDelete.PageDetailId)'+@crlf+
			   '	Delete '+@projectname+'PromotionInfoTbl from '+@projectname+'PromotionInfoTbl join '+@JATriggers+'.dbo.'+@projectname+'PromotionInfoTblUpdate on ('+@projectname+'PromotionInfoTbl.PageDetailId = '+@JATriggers+'.dbo.'+@projectname+'PromotionInfoTblUpdate.PageDetailId)'+@crlf+
			   '	Insert into '+@projectname+'PromotionInfoTbl (PromoInfoID, PagedetailID, Promotion, FieldName, FieldValue, QtySave, PurchaseOf, UnitDiscountPrice, DiscountType, OrMore)
					select distinct [PromoInfoID], [PagedetailID], [Promotion], [FieldName], [FieldValue], [QtySave], [PurchaseOf], [UnitDiscountPrice], [DiscountType], [OrMore] 
			from '+@JATriggers+'.dbo.'+@projectname+'PromotionInfoTblUpdate'+@crlf+
			   'end'
		print @sql
		exec sp_executesql @sql

		fetch next from triggers into @projectname
	end
	close triggers
	deallocate triggers


	--AVD Project Deletes and Inserts
	Delete PDT from EntryData.dbo.AVDPageDetailTable PDT 
	Join JATriggers.dbo.AVDPageDetailTableUpdate U
	on PDT.PagedetailID = U.PagedetailID 

	Delete PDT from EntryData.dbo.AVDPageDetailTable PDT 
	Join JATriggers.dbo.AVDPageDetailTableDelete D
	on PDT.PagedetailID = D.PagedetailID 

	Insert Into EntryData.dbo.AVDPageDetailTable
	Select Distinct 
	AdDate,BaseCatGrpPDT,BasePDT,bottomrightx,bottomrighty,Brand,Category,CategoryGroup,CatId,BrandId,SubcatId,SelectedSubcats,RemainingSubcats,Color,Comments,comments1,comments2,comments3,comments4
,Coupon,CouponValueD1,CouponValueD2,CouponValueP1,CouponValueP2,CouponValueP3,Descriptionnumber,DTAdded,EnteredClient,Features,FlyerId,ForADlertOnly,FullImagePath,Height,Illustrated,LockStatus,LowestDiscountPrice
,Market,MissingCategories,MissingCatGroups,Model#,MultipleValues,NoOfBrands,NoOfCats,NoOfPrices,NormalImagePath,NORPrice,NumberPackage,Optional1,Optional10,Optional11,Optional12,Optional2,Optional3
,Optional4,Optional5,Optional6,Optional7,Optional8,Optional9,OtherDiscountD1,OtherDiscountD2,OtherMerchCat,Page,PageDetailID,PageEvent,PageTheme,Pct,Priority,ProdImageCreated,ProductImagePath,Promotions
,RegularPrice1,RegularPrice2,RejectedCategories,RemainingCategories,RequiredQuantity,Retailer,Review,SalePrice1,SalePrice2,SelectedCategories,SentToADlertInd,SKUDescription1,SKUDescription2,SKUDescription3
,SKUType,Status,TaggedCompany,ThumbImagePath,topleftx,toplefty,UnitPrice,Width,MSRP,BundleSourcePageDetailId,CropID
	 from JATriggers.dbo.AVDPageDetailTableUpdate

	Delete MPV from EntryData.dbo.AVDMultiplePageValues MPV 
	Join JATriggers.dbo.AVDMultiplePageValuesUpdate U
	on MPV.PagedetailID = U.PagedetailID and MPV.FieldName = U.FieldName and MPV.FieldValue = U.FieldValue 

	Delete MPV from EntryData.dbo.AVDMultiplePageValues MPV 
	Join JATriggers.dbo.AVDMultiplePageValuesDelete D
	on MPV.PagedetailID = D.PagedetailID and MPV.FieldName = D.FieldName and MPV.FieldValue = D.FieldValue 

	Insert Into EntryData.dbo.AVDMultiplePageValues
	Select Distinct PageDetailID,FieldName,FieldValue
	from JATriggers.dbo.AVDMultiplePageValuesUpdate

	Delete FP from EntryData.dbo.AVDFeatureProduct FP
	Join JATriggers.dbo.AVDFeatureProductUpdate U
	on FP.PagedetailID = U.PagedetailID and FP.MadCode = U.MadCode 

	Delete FP from EntryData.dbo.AVDFeatureProduct FP 
	Join JATriggers.dbo.AVDFeatureProductDelete D
	on FP.PagedetailID = D.PagedetailID and FP.MadCode = D.MadCode 

	Insert Into EntryData.dbo.AVDFeatureProduct	
	Select Distinct PagedetailId,MadCode,Picture,AdvertisedNumber
	from JATriggers.dbo.AVDFeatureProductUpdate

	
	if exists (select top 1 * from sysobjects where name = 'MeasuredSpaceRecords') and exists (select top 1 * From JATriggers.dbo.sysobjects where name = 'MeasuredSpaceRecordsDelete') and exists (select top 1 * From JATriggers.dbo.sysobjects where name = 'MeasuredSpaceRecordsUpdate')
	begin
		Delete MeasuredSpaceRecords from MeasuredSpaceRecords join JATriggers.dbo.MeasuredSpaceRecordsDelete on (MeasuredSpaceRecords.MeasuredSpaceId= JATriggers.dbo.MeasuredSpaceRecordsDelete.MeasuredSpaceId)
	
		Delete MeasuredSpaceRecords from MeasuredSpaceRecords join JATriggers.dbo. MeasuredSpaceRecordsUpdate on (MeasuredSpaceRecords.MeasuredSpaceId= JATriggers.dbo.MeasuredSpaceRecordsUpdate.MeasuredSpaceId)
	
		Insert into  MeasuredSpaceRecords select * from JATriggers.dbo.MeasuredSpaceRecordsUpdate 
	end

	use coverageanalysis
	if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[jainprocesscounts]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
	drop table [dbo].[jainprocesscounts]

	select flyerid,categorygroup,cast('' as varchar(50)) AS category, count,projectname,retailer,market,retmktid into jaInprocessCounts  from  JATriggers.dbo.MasterCatAssignFlyeridCount
	insert into jaInprocessCounts select * from  JATriggers.dbo.MasterDetailEntryFlyeridCount

	use masterclientcoverage

	insert into UpdateManufacturer select * from JATriggers.dbo.UpdateManufacturer
	insert into MasterUpdateManufacturer select * from JATriggers.dbo.UpdateManufacturer

	insert into jacanOneUpdateManufacturer select * from JATriggers.dbo.jacanOneUpdateManufacturer
	insert into MasterCanoneUpdateManufacturer select * from JATriggers.dbo.jacanOneUpdateManufacturer



	update MT2SQL00.MasterAdviewData.dbo.MergeDetailLoad set flag=1,StepEndTime=getdate() where StepName='Load Triggers(Cons)'
end