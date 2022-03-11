DECLARE @Flag bit
SELECT @flag=flag FROM MT2SQL00.MasterAdviewData.dbo.MergeDetailLoad where stepname='ACFVC reinsert missing For FRDay'

if(@flag=0)
begin
update MT2SQL00.MasterAdviewData.dbo.MergeDetailLoad set StepStartTime=getdate() where StepName='ACFVC reinsert missing For FRDay' 

use tempdb

--If DATEPART(dw,getdate())=7
If ((datename(dw,getdate()) = 'Sunday' AND DATEPART(HOUR, getdate()) < 12) or (datename(dw,getdate()) = 'Saturday' AND DATEPART(HOUR, getdate()) > 12)) 
Begin

	 --================START:Sync ACFVParentChildCopy Table======================--
		declare @prevdt datetime
 
		select @prevdt = value
		from MasterAdviewdata.dbo.static
		where field = 'MT2-ACExpPullDt'

		if object_id('tempdb.dbo.#ACFVParentChildCopyLog') is not null
			drop table #ACFVParentChildCopyLog
		select *
		into #ACFVParentChildCopyLog
		from mt3sql1.mcaplog.dbo.ACFVParentChildCopyLog
		where logtimestamp >= @prevdt

		if object_id('tempdb.dbo.#deletes') is not null
			drop table #deletes

		select *
		into #deletes
		from #ACFVParentChildCopyLog
		where logdmloperation = 'D'

		delete l
		from #deletes d
		join #ACFVParentChildCopyLog l on d.parent_adc_i = l.parent_adc_i and d.Parent_VehicleID = l.Parent_VehicleID and d.Parent_Flyerid = l.Parent_Flyerid  and d.Parent_Page = l.Parent_Page and d.child_adc_i = l.child_adc_i and d.child_vehicleid = l.child_vehicleid  and d.Child_Flyerid = l.Child_Flyerid  and d.Child_Page = l.Child_Page
		where l.logdmloperation = 'D'

		if object_id('tempdb.dbo.#inserts') is not null
			drop table #inserts

		select distinct l.*
		into #inserts
		from #deletes d
		join #ACFVParentChildCopyLog l on  d.parent_adc_i = l.parent_adc_i and d.Parent_VehicleID = l.Parent_VehicleID and d.Parent_Flyerid = l.Parent_Flyerid  and d.Parent_Page = l.Parent_Page and d.child_adc_i = l.child_adc_i and d.child_vehicleid = l.child_vehicleid  and d.Child_Flyerid = l.Child_Flyerid  and d.Child_Page = l.Child_Page
		where l.logdmloperation = 'I'

		delete i
		from #inserts i
		join #deletes d on d.parent_adc_i = i.parent_adc_i and d.Parent_VehicleID = i.Parent_VehicleID and d.Parent_Flyerid = i.Parent_Flyerid  and d.Parent_Page = i.Parent_Page and d.child_adc_i = i.child_adc_i and d.child_vehicleid = i.child_vehicleid  and d.Child_Flyerid = i.Child_Flyerid  and d.Child_Page = i.Child_Page
		where i.logtimestamp < d.logtimestamp

		delete d
		from #inserts i
		join #deletes d on d.parent_adc_i = i.parent_adc_i and d.Parent_VehicleID = i.Parent_VehicleID and d.Parent_Flyerid = i.Parent_Flyerid  and d.Parent_Page = i.Parent_Page and d.child_adc_i = i.child_adc_i and d.child_vehicleid = i.child_vehicleid  and d.Child_Flyerid = i.Child_Flyerid  and d.Child_Page = i.Child_Page
		where i.logtimestamp > d.logtimestamp

		insert into #ACFVParentChildCopyLog
		select *
		from #inserts

		insert into #ACFVParentChildCopyLog
		select *
		from #deletes

		insert into MasterAdviewData.dbo.ACFVParentChildCopy(parent_adc_i,Parent_VehicleID,Parent_FlyerId,Parent_Page, child_adc_i, child_vehicleid,Child_Flyerid,Child_Page)
		select distinct i.parent_adc_i,i.Parent_VehicleID,i.Parent_FlyerId,i.Parent_Page, i.child_adc_i, i.child_vehicleid,i.Child_Flyerid,i.Child_Page
		from #ACFVParentChildCopyLog i
		left outer join MasterAdviewData.dbo.ACFVParentChildCopy e with (nolock) on e.parent_adc_i = i.parent_adc_i and e.Parent_VehicleID = i.Parent_VehicleID and e.Parent_Flyerid = i.Parent_Flyerid  and e.Parent_Page = i.Parent_Page and e.child_adc_i = i.child_adc_i and e.child_vehicleid = i.child_vehicleid  and e.Child_Flyerid = i.Child_Flyerid  and e.Child_Page = i.Child_Page
		where i.logdmloperation = 'I'
		and e.parent_adc_i is null
	--================END:Sync ACFVParentChildCopy Table======================--

	if object_id('tempdb.dbo.#ACFVCprojects') is not null
		drop table #ACFVCprojects
	create table #ACFVCprojects (
		project varchar(50)
	)
	insert into #ACFVCprojects(project) values('USACMC')
	insert into #ACFVCprojects(project) values('USACVC')
	
 	
	declare @project as varchar(50)
	declare @sql as nvarchar(4000)
	declare @crlf as char(2)
	set @crlf = char(13) + char(10)
	declare @bExecute as bit
	set @bExecute = 0
	

	--Checks Paster Entry data to see if anything needs to be re-Expanded.
	-- For use in Triggers
	-- Could happen if a Destination Vehicle is not exported from MCAP to MTIDE in time
	
	IF EXISTS(SELECT name FROM sysobjects WHERE name = N'ACFVCExpandLoad' AND xtype='U')
		DROP TABLE ACFVCExpandLoad
	IF EXISTS(SELECT name FROM sysobjects WHERE name = N'ACFVCSourcePDT' AND xtype='U')
		DROP TABLE ACFVCSourcePDT
	IF EXISTS(SELECT name FROM sysobjects WHERE name = N'ACFVCSourceMPV' AND xtype='U')
		DROP TABLE ACFVCSourceMPV
	IF EXISTS(SELECT name FROM sysobjects WHERE name = N'ACFVCSourceMAP' AND xtype='U')
		DROP TABLE ACFVCSourceMAP
	IF EXISTS(SELECT name FROM sysobjects WHERE name = N'ACFVCSourceMAP_MPV' AND xtype='U')
		DROP TABLE ACFVCSourceMAP_MPV
	IF EXISTS(SELECT name FROM sysobjects WHERE name = N'ACFVCMissingMap' AND xtype='U')
		DROP TABLE ACFVCMissingMap


	Exec('select Distinct Parent_adc_i  as SourcePageDetailID , Child_VehicleID  ,Child_Flyerid as DestFlyerId,Parent_Page,Child_Page --distinct M.FlyerId as SourceFlyerId ,R.FlyerId as DestFlyerID
	into tempdb.dbo.ACFVCExpandLoad 
	From MasterAdviewData.dbo.ACFVParentChildCopy   A
	Left Join MasterAdviewData.dbo.AdviewMain B On cast(A.Child_Flyerid as varchar)=B.FlyerID
	Where ISNULL(Child_FlyerId,0)<>0 AND ISNULL(B.Active,1)=1  AND ISNULL(B.Addate,getdate())>=dateadd(day,-10,getdate())')


	----=========Start: Added For AI records=====================--
	--Insert into tempdb.dbo.ACFVCExpandLoad 
	--Select Distinct replace(SourcePageDetailID,'AC','AI') as SourcePageDetailID , Child_VehicleID  ,DestFlyerId,Parent_Page, Child_Page
	--From tempdb.dbo.ACFVCExpandLoad 
	--Where replace(SourcePageDetailID,'AC','AI') In (Select PageDetailID From EntryData.dbo.ACFVCAIRecords)
	--AND  replace(SourcePageDetailID,'AC','AI')  Not In (Select SourcePageDetailId From tempdb.dbo.ACFVCExpandLoad )

	----=========End: Added For AI records=====================--

	--- Expansion for BaseCatGrpPDT-----
	Exec('Insert Into  tempdb.dbo.ACFVCExpandLoad
	select Distinct B.BasePDT,A.Child_VehicleId,A.DestFlyerId,A.Parent_Page,ISNULL(A.Child_Page,A.Parent_Page) 
	From tempdb.dbo.ACFVCExpandLoad A Join  EntryData.dbo.USACBasePDT_Master  B On A.SourcePageDetailId=B.BaseCatGrpPDT
	Where B.BasePDT Not In (Select SourcePageDetailID From tempdb.dbo.ACFVCExpandLoad)  AND ISNULL(B.BasePDT,'''')<>'''' AND B.BasePDT<>B.BaseCatGrpPDT
	AND ISNULL(B.BasePDTFlyerID,'''')=ISNULL(B.BaseCatGrpPDTFlyerID,'''')')

	--- Expansion for BasePDT-----
	Exec('Insert Into  tempdb.dbo.ACFVCExpandLoad
	select Distinct B.PageDetailId,A.Child_VehicleId,A.DestFlyerId ,A.Parent_Page,A.Child_Page
	From tempdb.dbo.ACFVCExpandLoad A 
	join EntryData.dbo.USACBasePDT_Master B On A.SourcePageDetailId=B.BasePDT
	Where B.PageDetailID Not In (Select SourcePageDetailID From tempdb.dbo.ACFVCExpandLoad) AND B.BasePDT<>B.PageDetailId
	AND ISNULL(B.BasePDTFlyerID,'''')=ISNULL(B.FlyerID,'''')')

	-- Expansion For PDTID To BaseCatGrpPDT --
	Exec('Insert Into  tempdb.dbo.ACFVCExpandLoad
	select Distinct B.PageDetailId,A.Child_VehicleId,A.DestFlyerId,A.Parent_Page,ISNULL(A.Child_Page,A.Parent_Page) 
	From tempdb.dbo.ACFVCExpandLoad A Join  EntryData.dbo.USACBasePDT_Master  B On A.SourcePageDetailId=B.BaseCatGrpPDT
	Where B.PageDetailId Not In (Select SourcePageDetailID From tempdb.dbo.ACFVCExpandLoad)  AND ISNULL(B.PageDetailId,'''')<>'''' 
	AND ISNULL(B.BasePDT,'''')='''' AND B.PageDetailId<>B.BaseCatGrpPDT
	AND ISNULL(B.FlyerID,'''')=ISNULL(B.BaseCatGrpPDTFlyerID,'''')')

	Exec('CREATE INDEX idxSourcePageDetailIDDestFlyerID ON tempdb.dbo.ACFVCExpandLoad (SourcePageDetailID, DestFlyerID,Parent_Page)')
	
	--Look at all Master/Version PDTIds
	--'+@project+', jaallv
	if object_id('ACFVCSourcePDT') is not null
		drop table ACFVCSourcePDT
	create table ACFVCSourcePDT (
		project varchar(50),
		PageDetailId varchar(15),
		Page Int
	)

	if object_id('ACFVCSourceMPV') is not null
		drop table ACFVCSourceMPV
	create table ACFVCSourceMPV (
		project varchar(50),
		PageDetailId varchar(15),
		FieldName varchar(50),
		FIeldValue varchar(100),
		Page Int
	)

	declare ACFVCprojects cursor for 
	select distinct project
	from #ACFVCprojects
	open ACFVCprojects
	fetch next from ACFVCprojects into @project
	while @@fetch_status = 0
	begin
		print '-- ' + master.dbo.fnFormatDateTime(getdate(),'%Y-%m-%d %X') + ': starting getting ACFVCSourcePDT for ' + @project
		set @sql = 'insert into ACFVCSourcePDT(Project, PageDetailId,Page)'+@crlf+
							 'select distinct '''+@project+''',PDT.PageDetailId,PDT.Page'+@crlf+
							 'from EntryData.dbo.'+@project+'PageDetailTable PDT'+@crlf+
							 '--left Join MasterAdViewData..AdViewMain CWM on PDT.FlyerId = CWM.FlyerId and CWM.AdDate >= DATEADD(yy, -3, DATEADD(qq, DATEDIFF(qq,0,getdate()), 0))'+@crlf+
							 'inner join ACFVCExpandLoad Ex on PDT.PageDetailID = Ex.SourcePageDetailID AND PDT.Page=Ex.Parent_Page'
		exec sp_executesql @sql
		print '-- ' + master.dbo.fnFormatDateTime(getdate(),'%Y-%m-%d %X') + ': finished getting ACFVCSourcePDT for ' + @project

		print '-- ' + master.dbo.fnFormatDateTime(getdate(),'%Y-%m-%d %X') + ': starting getting ACFVCSourceMPV for ' + @project
		set @sql = 'insert into ACFVCSourceMPV(Project, PageDetailId, Fieldname, FieldValue,Page)'+@crlf+
							 'select distinct '''+@project+''',MPV.PageDetailId, MPV.FieldName, MPV.FieldValue,PDT.Page'+@crlf+
							 'from EntryData.dbo.'+@project+'MultiplePageValues MPV'+@crlf+
							 'left join EntryData.dbo.'+@project+'PageDetailTable PDT on MPV.PageDetailId = PDT.PageDetailId'+@crlf+
							 'inner join ACFVCExpandLoad Ex on PDT.PageDetailID = Ex.SourcePageDetailID  AND PDT.Page=Ex.Parent_Page'+@crlf+
							 '--left join MasterAdViewData..AdViewMain CWM on PDT.FlyerId = CWM.FlyerId and CWM.AdDate >= DATEADD(yy, -3, DATEADD(qq, DATEDIFF(qq,0,getdate()), 0))'
							 
		exec sp_executesql @sql
		print '-- ' + master.dbo.fnFormatDateTime(getdate(),'%Y-%m-%d %X') + ': finished getting ACFVCSourceMPV for ' + @project

		fetch next from ACFVCprojects into @project
	end
	close ACFVCprojects
	deallocate ACFVCprojects
	
	Create index idxFlyerIdPage on ACFVCSourcePDT( Project, PageDetailId,Page)
	
	--Join up with what expansion should be for PDT
	select distinct pdt.project, PDT.PageDetailId, E.DestFlyerId,E.Parent_Page,E.Child_Page
	into ACFVCSourceMAP 
	from ACFVCSourcePDT PDT
	inner join ACFVCExpandLoad E on E.SourcePageDetailID = PDT.PageDetailID AND E.Parent_Page = PDT.Page
	option( maxdop 1)
	
	----Join up with what expansion should be for MPV
	select distinct MPV.project, MPV.PageDetailId, E.DestFlyerId
	Into tempdb.dbo.ACFVCSourceMAP_MPV
	from ACFVCSourceMPV MPV
	inner join ACFVCExpandLoad E on E.SourcePageDetailID = MPV.PageDetailID 
	option( maxdop 1)

	Create index idxPageDetailIdDestFlyerId on ACFVCSourceMAP(PageDetailId, DestFlyerId, Project,Parent_Page)
	
	insert into  tempdb.dbo.ACFVCSourceMAP (project,PageDetailId,DestFlyerId)
	select s.project,s.PageDetailId,s.DestFlyerId
	from tempdb.dbo.ACFVCSourceMAP_MPV  S where PageDetailId NOT IN (Select PageDetailId from tempdb.dbo.ACFVCSourceMAP)

	--Looking for Source PDTId that has not been expanded to the right number of Flyers.
	
	select distinct ACFVCSourceMAP.Project, ACFVCSourceMAP.PageDetailId  
	Into ACFVCMissingMap
	from ACFVCSourceMAP
	left outer join MasterMappingTables.dbo.ACFVCDetailMap MAP on MAP.SourcePageDetailId = ACFVCSourceMAP.PageDetailId and MAP.DestFlyerId = ACFVCSourceMAP.DestFlyerId  and MAP.Child_Page = ACFVCSourceMAP.Child_Page
	where MAP.DestPageDetailId is null
	option( maxdop 1)
	
	Create index idxProjectPDT on ACFVCMissingMap(Project, PageDetailId)
	
	--Take those Master/Version PDT IDs 
	declare ACFVCprojects cursor for 
	select distinct project
	from #ACFVCprojects
	open ACFVCprojects
	fetch next from ACFVCprojects into @project
	while @@fetch_status = 0
	begin
		print '-- ' + master.dbo.fnFormatDateTime(getdate(),'%Y-%m-%d %X') + ': starting reinserting trigger data for ' + @project
		
		set @sql = 'if object_id(''tempdb.dbo.MissingACFVCTriggers'') is not null'+@crlf+
							 '	drop table tempdb.dbo.MissingACFVCTriggers'
		exec sp_executesql @sql
	
		set @sql = 'Select distinct  PDT.[FlyerId], PDT.[Page] ,PDT.[PageDetailId] ,PDT.[ThumbImagePath] ,PDT.[NormalImagePath] ,PDT.[FullImagePath] ,PDT.[ProductImagePath] ,PDT.[MultipleValues] ,PDT.[DTAdded]
					,PDT.[Retailer] ,PDT.[TaggedCompany] ,PDT.[Manufacturer] ,PDT.[MerchandiseCategory] ,PDT.[MerchandiseSubCat] ,PDT.[Category] ,PDT.[Brand] ,PDT.[SKUDescription1]
					,PDT.[SKUDescription2] ,PDT.[SKUDescription3] ,PDT.[SKUType] ,PDT.[SalePrice1] ,PDT.[SalePrice2] ,PDT.[RegularPrice1] ,PDT.[RegularPrice2] ,PDT.[NORPrice] ,PDT.[RebateAmount]
					,PDT.[LowestRebatePrice] ,PDT.[LowestDiscountPrice] ,PDT.[UnitPrice] ,PDT.[Promotions] ,PDT.[PageEvent] ,PDT.[PageTheme] ,PDT.[Features] ,PDT.[NumberPackage] ,PDT.[Coupon]
					,PDT.[CouponValueD1] ,PDT.[CouponValueD2] ,PDT.[CouponValueP1] ,PDT.[CouponValueP2],PDT.[CouponValueP3] ,PDT.[OtherDiscountD1] ,PDT.[OtherDiscountD2] ,PDT.[OtherDiscountD3] ,PDT.[RequiredQuantity]
					,PDT.[MaximumQuantity] ,PDT.[AdSize] ,PDT.[AdCost] ,PDT.[Illustrated] ,PDT.[Color] ,PDT.[NoOfColors] ,PDT.[SaleStDt] ,PDT.[SaleEndDt] ,PDT.[CouponExpirationDate] ,PDT.[Optional1]
					,PDT.[Optional2] ,PDT.[Optional3] ,PDT.[Optional4] ,PDT.[Optional5] ,PDT.[Optional6] ,PDT.[Optional7] ,PDT.[Optional8] ,PDT.[Optional9] ,PDT.[Optional10] ,PDT.[Optional11]
					,PDT.[Optional12] ,PDT.[Comments] ,PDT.[ProductTerritory] ,PDT.[ProductTerritorySubGroup] ,PDT.[ProductTerritoryGroup] ,PDT.[EnteredClient] ,PDT.[CouponExpirationDate1]
					,PDT.[CouponExpirationDate2] ,PDT.[OtherDiscountP1] ,PDT.[OtherDiscountP2] ,PDT.[OtherDiscountP3] ,PDT.[comments1] ,PDT.[comments2] ,PDT.[comments3] ,PDT.[comments4]
					,PDT.[topleftx] ,PDT.[toplefty] ,PDT.[bottomrightx] ,PDT.[bottomrighty] ,PDT.[McUpdatedOn] ,PDT.[MscUpdatedOn] ,PDT.[MfrUpdatedOn] ,PDT.[PtUpdatedOn] ,PDT.[PtgUpdatedOn]
					,PDT.[PtsgUpdatedOn] ,PDT.[ProdImageCreated] ,PDT.[ProdImageCreatedOn] ,PDT.[Origin] ,PDT.[Variety] ,PDT.[UnitType] ,PDT.[PkgSize] ,PDT.[Offerdes],PDT.BrandId,PDT.CategoryId
					'+@crlf+
							 'into tempdb.dbo.MissingACFVCTriggers'+@crlf+
							 'from EntryData.dbo.'+@project+'PageDetailTable PDT '+@crlf+
							 'inner join ACFVCMissingMap on ACFVCMissingMap.PageDetailId = PDT.PageDetailId and project = '''+@project+''''
		exec sp_executesql @sql
		
		
		set @sql = 'Create index idxPDT on tempdb.dbo.MissingACFVCTriggers(PageDetailId)'
		exec sp_executesql @sql
		
		set @sql = 'delete m'+@crlf+
							 'from ReInsertMissing.dbo.'+@project+'pagedetailtableupdate n'+@crlf+
							 'join tempdb.dbo.MissingACFVCTriggers m on n.PageDetailId = m.PageDetailId'
		exec sp_executesql @sql
		
		set @sql = 'insert into ReInsertMissing.dbo.'+@project+'pagedetailtabledelete(PageDetailId,DTAdded)'+@crlf+
							 'select PageDetailId,getdate()'+@crlf+
							 'from tempdb.dbo.MissingACFVCTriggers'

		exec sp_executesql @sql
		
		set @sql = 'insert into ReInsertMissing.dbo.'+@project+'pagedetailtableupdate(FlyerId,Page,PageDetailId,ThumbImagePath,NormalImagePath,FullImagePath,ProductImagePath,MultipleValues,DTAdded,Retailer,TaggedCompany,Manufacturer,MerchandiseCategory,MerchandiseSubCat,Category,Brand,SKUDescription1,SKUDescription2,SKUDescription3,SKUType,SalePrice1,SalePrice2,RegularPrice1,RegularPrice2,NORPrice,RebateAmount,LowestRebatePrice,LowestDiscountPrice,UnitPrice,Promotions,PageEvent,PageTheme,Features,NumberPackage,Coupon,CouponValueD1,CouponValueD2,CouponValueP1,CouponValueP2,CouponValueP3,OtherDiscountD1,OtherDiscountD2,OtherDiscountD3,RequiredQuantity,MaximumQuantity,AdSize,AdCost,Illustrated,Color,NoOfColors,SaleStDt,SaleEndDt,CouponExpirationDate,Optional1,Optional2,Optional3,Optional4,Optional5,Optional6,Optional7,Optional8,Optional9,Optional10,Optional11,Optional12,Comments,ProductTerritory,ProductTerritorySubGroup,ProductTerritoryGroup,EnteredClient,CouponExpirationDate1,CouponExpirationDate2,OtherDiscountP1,OtherDiscountP2,OtherDiscountP3,comments1,comments2,comments3,comments4,topleftx,toplefty,bottomrightx,bottomrighty,McUpdatedOn,MscUpdatedOn,MfrUpdatedOn,PtUpdatedOn,PtgUpdatedOn,PtsgUpdatedOn,ProdImageCreated,ProdImageCreatedOn,Origin,Variety,UnitType,PkgSize,Offerdes,BrandId,CategoryId,updatedt)'+@crlf+
							 'select FlyerId,Page,PageDetailId,ThumbImagePath,NormalImagePath,FullImagePath,ProductImagePath,MultipleValues,DTAdded,Retailer,TaggedCompany,Manufacturer,MerchandiseCategory,MerchandiseSubCat,Category,Brand,SKUDescription1,SKUDescription2,SKUDescription3,SKUType,SalePrice1,SalePrice2,RegularPrice1,RegularPrice2,NORPrice,RebateAmount,LowestRebatePrice,LowestDiscountPrice,UnitPrice,Promotions,PageEvent,PageTheme,Features,NumberPackage,Coupon,CouponValueD1,CouponValueD2,CouponValueP1,CouponValueP2,CouponValueP3,OtherDiscountD1,OtherDiscountD2,OtherDiscountD3,RequiredQuantity,MaximumQuantity,AdSize,AdCost,Illustrated,Color,NoOfColors,SaleStDt,SaleEndDt,CouponExpirationDate,Optional1,Optional2,Optional3,Optional4,Optional5,Optional6,Optional7,Optional8,Optional9,Optional10,Optional11,Optional12,Comments,ProductTerritory,ProductTerritorySubGroup,ProductTerritoryGroup,EnteredClient,CouponExpirationDate1,CouponExpirationDate2,OtherDiscountP1,OtherDiscountP2,OtherDiscountP3,comments1,comments2,comments3,comments4,topleftx,toplefty,bottomrightx,bottomrighty,McUpdatedOn,MscUpdatedOn,MfrUpdatedOn,PtUpdatedOn,PtgUpdatedOn,PtsgUpdatedOn,ProdImageCreated,ProdImageCreatedOn,Origin,Variety,UnitType,PkgSize,Offerdes,BrandId,CategoryId, getdate() '+@crlf+
							 'from tempdb.dbo.MissingACFVCTriggers'
		exec sp_executesql @sql

		print '-- ' + master.dbo.fnFormatDateTime(getdate(),'%Y-%m-%d %X') + ': finished reinserting trigger data for ' + @project
		print '-- ' + master.dbo.fnFormatDateTime(getdate(),'%Y-%m-%d %X') + ': starting reinserting trigger MPV data for ' + @project
		
		set @sql = 'if object_id(''tempdb.dbo.MissingACFVCTriggersMPV'') is not null'+@crlf+
							 '	drop table tempdb.dbo.MissingACFVCTriggersMPV'
		exec sp_executesql @sql
	
		set @sql = 'Select distinct MPV.*'+@crlf+
							 'into tempdb.dbo.MissingACFVCTriggersMPV'+@crlf+
							 'from EntryData.dbo.'+@project+'MultiplePageValues MPV '+@crlf+
							 'inner join ACFVCMissingMap on ACFVCMissingMap.PageDetailId = MPV.PageDetailId and project = '''+@project+''''
		exec sp_executesql @sql
		
		
		set @sql = 'Create index idxMPV on tempdb.dbo.MissingACFVCTriggersMPV(PageDetailId)'
		exec sp_executesql @sql
		
		set @sql = 'delete m'+@crlf+
							 'from ReInsertMissing.dbo.'+@project+'MultiplePageValuesupdate n'+@crlf+
							 'join tempdb.dbo.MissingACFVCTriggersMPV m on n.PageDetailId = m.PageDetailId'
		exec sp_executesql @sql

		set @sql = 'insert into ReInsertMissing.dbo.'+@project+'MultiplePageValuesdelete(PageDetailId,FieldName,FieldValue,DTAdded)'+@crlf+
							'select PageDetailId,FieldName,FieldValue,getdate()'+@crlf+
							'from tempdb.dbo.MissingACFVCTriggersMPV'

		exec sp_executesql @sql
	
		set @sql = 'insert into ReInsertMissing.dbo.'+@project+'MultiplePageValuesupdate'+@crlf+
							 'select PageDetailId,FieldName,FieldValue,getdate() as DTAdded'+@crlf+
							 'from tempdb.dbo.MissingACFVCTriggersMPV'
		exec sp_executesql @sql
		print '-- ' + master.dbo.fnFormatDateTime(getdate(),'%Y-%m-%d %X') + ': finished reinserting trigger MPV data for ' + @project
		fetch next from ACFVCprojects into @project
	end
	close ACFVCprojects
	deallocate ACFVCprojects

end

update MT2SQL00.MasterAdviewData.dbo.MergeDetailLoad set flag=1,StepEndTime=getdate() where StepName='ACFVC reinsert missing For FRDay'

end

