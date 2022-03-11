use masteradviewdata

Declare @SQL varchar(8000)
Declare @SelectClause varchar(8000)
Declare @SelectClause1 varchar(8000)
Declare @SelectClause2 varchar(8000)
Declare @SelectClause3 varchar(8000)
Declare @PD varchar(8000)
Declare @WhereClause varchar(2000)
Declare @MFRJoin varchar(2000)
Declare @FeaturesJoin varchar(2000)
Declare @PDTIDIntJoin varchar(2000)
Declare @RegularPrice varchar(2000)
declare @systemname varchar(50)
declare @crlf as varchar(2)
set @crlf = char(13) + char(10)
declare @extrawhereclause varchar(8000)

set @SelectClause1 = 'PDT.[FlyerID], PDT.[Page], pdt.[PageDetailID], 
cast(null as varchar(100)) as [ThumbImagePath], 
Case when isnull(PDT.NormalImagePath,'''')=''UnSized''  then  ''UnSized'' else ''Full'' end as [NormalImagePath],
cast(null as varchar(100)) as [FullImagePath], 
cast(null as varchar(100)) as [ProductImagePath], 
[MultipleValues], 
convert(smalldatetime,convert(varchar(10),[DTAdded], 101)) as DTAdded, 
cast(null as varchar(37)) as [Retailer], 
case when ru.flyerid is not null
	then
		case when pdt.[TaggedCompany] = ''C'' then ''B''
			when pdt.[TaggedCompany] = ''D'' then ''C''
			else pdt.[TaggedCompany]
		end
     else pdt.[TaggedCompany]
end as [TaggedCompany], 
IsNULL(MF.Manufacturer,''Other'') As [Manufacturer], [MerchandiseCategory], [MerchandiseSubCat], PDT.[Category], 
Case when MF.PL = 1 then MF.PLBrand else PDT.[Brand] end As Brand, 
 cast(null as varchar(37)) as [SKUDescription1], cast(null as varchar(37)) as [SKUDescription2],  cast(null as varchar(37)) as [SKUDescription3], 
[SKUType], [SalePrice1], [SalePrice2], [RegularPrice1],'

set @SelectClause2 = ' [NORPrice], [RebateAmount], [LowestRebatePrice], [LowestDiscountPrice], 
Case When requiredquantity is null Then SalePrice1 Else UnitPrice End As [UnitPrice], 
[Promotions], 
PDT.PageEvent as [PageEvent], 
[PageTheme], IsNull(vp.[FVDisplayValue],pdt.[Features]) as [Features], [NumberPackage], PDT.[Coupon], [CouponValueD1], [CouponValueD2], [CouponValueP1], [CouponValueP2], [CouponValueP3],
[OtherDiscountD1], [OtherDiscountD2], [OtherDiscountD3], [RequiredQuantity], [MaximumQuantity], cast(null as int) as [AdSize], cast(null as int) as [AdCost], cast(null as bit) as [Illustrated], cast(null as bit) as [Color], cast(null as int) as [NoOfColors], 
[SaleStDt], [SaleEndDt], cast(null as smalldatetime) as [CouponExpirationDate], cast(null as varchar(37)) as [Optional1], 
cast(null as varchar(37)) as [Optional2], 
cast(null as varchar(37)) as [Optional3], 
[Optional4], 
cast(null as varchar(37)) as [Optional5], 
cast(null as varchar(37)) as [Optional6], 
cast(null as varchar(37)) as [Optional7], 
cast(null as varchar(37)) as [Optional8], 
cast(null as varchar(37)) as [Optional9], 
cast(null as varchar(37)) as [Optional10], 
cast(null as varchar(37)) as [Optional11], 
cast(null as varchar(37)) as [Optional12], 
[Comments], [ProductTerritory], [ProductTerritorySubGroup], [ProductTerritoryGroup], [EnteredClient], 
[CouponExpirationDate1], [CouponExpirationDate2], [OtherDiscountP1], [OtherDiscountP2], [OtherDiscountP3], '


set @SelectClause3 = '[comments2], [comments3], 
[comments4], [topleftx], [toplefty], [bottomrightx], [bottomrighty], 
[McUpdatedOn], 
[MscUpdatedOn], 
cast(null as smalldatetime) as [MfrUpdatedOn], 
cast(null as smalldatetime) as [PtUpdatedOn], 
cast(null as smalldatetime) as [PtgUpdatedOn], 
cast(null as smalldatetime) as [PtsgUpdatedOn], 
[ProdImageCreated], 
cast(null as smalldatetime) as [ProdImageCreatedOn], 
[Origin], [Variety], 
Case When UnitType in (''TBD'', ''Unspecified'') Then ''unsp'' Else replace(replace([UnitType], char(10), ''''), char(13), '''') End [UnitType],
Case when PkgSize = 0 Then NULL Else PkgSize End as [PkgSize],

Replace(Replace([OfferDes], char(10), ''''), char(13), '''') As [Offerdes], 
Replace(Replace(Comments1, char(10), ''''), char(13), '''') as entrycomments1, 
PDT.[Brand] As EntryBrand,
case when isnull(RequiredQuantity,0) > 0 then RegularPrice1/RequiredQuantity When isnull(RequiredQuantity,0) = 0 then RegularPrice1 Else NULL End AS RegularUnitPrice, 
PDT.[TaggedCompany] as EntryTaggedCompany,
ws.Score as Weight ,
case when F360.FlyerId is null then CWM.Media when IsNull(vp.[FVDisplayValue],pdt.[Features])  = ''Insert Online'' then ''Insert-Digital'' else ''Insert-Paper'' end as MediaDetail, 
cast(NULL as decimal(18,2)) as QtySave, cast(NULL as decimal(18,2)) as PurchaseOf, cast(NULL as decimal(18,2)) as UnitDiscountPrice, cast(NULL as Int) as DiscountType, cast(NULL as Int) as OrMore,
Mmap.PageDetailId as PageDetailIDInt'

SET @WhereClause = 'Join MasterAdViewData..AdViewMain CWM on PDT.FlyerID = CWM.FlyerID and CWM.Active = 1 and CWM.AdDate >= DATEADD(yy, -3, DATEADD(qq, DATEDIFF(qq,0,getdate()), 0)) and PDT.Page <= CWM.Pages
LEFT OUTER JOIN tempdb.dbo.vwWeightScore ws with (nolock) on cwm.retmktid = ws.retmktid and IsNull(vp.[FVDisplayValue],pdt.[Features]) = ws.features and case when ru.flyerid is not null then case when pdt.[TaggedCompany] = ''C'' then ''B'' when pdt.[TaggedCompany] = ''D'' then ''C'' else pdt.[TaggedCompany] end else pdt.[TaggedCompany] end = ws.TaggedCompany
LEFT OUTER JOIN tempdb.dbo.FlyersToCheck360 F360 on F360.FlyerId = CWM.FlyerID
WHERE PDT.Category NOT In (''To Be Registered'', ''To Be Assigned'', ''Z - To Be Classified'', ''ZZ - Unsure'', ''ZZ - Untracked'')
And PDT.Brand NOT in (''To Be Registered'', ''To Be Assigned'', ''Z - To Be Classified'', ''ZZ - Unsure'', ''ZZ - Untracked'') '

SET @MFRJoin = ' Left JOIN masteradviewdata..[TEMPManufacturer] MF on pdt.category = MF.category and pdt.brand = MF.brand '

SET @FeaturesJoin = 'Left JOIN MasterAdviewData.dbo.MCAPVehiclePages vp on pdt.flyerid = vp.flyerid and pdt.page = vp.pagenumber'
SET @PDTIDIntJoin = 'Left JOIN MasterAdviewData.dbo.MasterMapPagedetailID Mmap on pdt.PageDetailId = Mmap.OriginalPageDetailId '
if exists (select * from sysobjects where id = object_id(N'[dbo].[TEMPxPageDetailTable]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TEMPxPageDetailTable]


set @RegularPrice = 'case when isnull(RequiredQuantity,0) > 0 then RegularPrice1/RequiredQuantity When isnull(RequiredQuantity,0) = 0 then RegularPrice1 Else NULL End AS RegularPrice2,' 

set @PD = '[comments1] = Replace(Replace(Comments1, char(10), ''''), char(13), '''') , '
set @SQL = 'SELECT '+ @SelectClause1 + @RegularPrice + @SelectClause2 + @crlf + @PD + @crlf + @SelectClause3 + @crlf +
'INTO TEMPxPageDetailTable 
FROM entrydata..Arc001PageDetailTable PDT 
Join MasterAdViewData..AdViewMain CWM on PDT.FlyerID = CWM.FlyerID ' +  
@MFRJoin + 
@FeaturesJoin + @crlf +
@PDTIDIntJoin + @crlf +  
'LEFT OUTER JOIN tempdb.dbo.vwWeightScore ws with (nolock) on cwm.retmktid = ws.retmktid and IsNull(vp.[FVDisplayValue],pdt.[Features]) = ws.features and pdt.TaggedCompany = ws.TaggedCompany ' + 
'LEFT OUTER JOIN tempdb.dbo.FlyersToCheck360 F360 on F360.FlyerId = CWM.FlyerID ' + 
'LEFT OUTER JOIN EntryData.dbo.MasterRollupFlyerIds ru with (nolock) on pdt.flyerid = ru.flyerid' + @crlf + 
' where 1=2 ' 
Exec(@SQL)


Alter Table TEMPxPageDetailTable alter column comments1 varchar(510)
Alter Table TEMPxPageDetailTable alter column UnitType varchar(50) null
Alter Table TEMPxPageDetailTable alter column PkgSize decimal(18, 2) NULL

--SET @SelectClause = Replace(@SelectClause, '[Manufacturer]', 'IsNULL(MF.Manufacturer,''Other'') As [Manufacturer]')

if object_id('tempdb.dbo.tempxprojectsMasterPDT') is not null
	drop table tempdb.dbo.tempxProjectsMasterPDT
create table tempdb.dbo.tempXProjectsMasterPDT (
	systemname varchar(50),
	run bit,
	startdt datetime,
	enddt datetime, 
	extrawhereclause varchar(8000)
)
--45 out of total 53 live(does not include ArcFSIEntry, arcjacats, ArcjaWeb, FSIEntry, JaBraz, jacats, jahspecats, jahspscats, jaPromo, JaWeb, JaWeb2011) + MT360
--insert into tempdb.dbo.tempXprojectsMasterPDT(systemname, run) values('jaALL',1)
--insert into tempdb.dbo.tempXprojectsMasterPDT(systemname, run) values('jaASM',1)
--insert into tempdb.dbo.tempXprojectsMasterPDT(systemname, run) values('jaMASS',1)
--insert into tempdb.dbo.tempXprojectsMasterPDT(systemname, run) values('JaFR',1)
--insert into tempdb.dbo.tempXprojectsMasterPDT(systemname, run) values('JaEmer',1)
--insert into tempdb.dbo.tempXprojectsMasterPDT(systemname, run) values('arcjafrX',1)
--insert into tempdb.dbo.tempXprojectsMasterPDT(systemname, run) values('JaInet',1)
--insert into tempdb.dbo.tempXprojectsMasterPDT(systemname, run) values('arcJaFR',1)
--insert into tempdb.dbo.tempXprojectsMasterPDT(systemname, run) values('JaSpan',1)
--insert into tempdb.dbo.tempXprojectsMasterPDT(systemname, run) values('JaCAN',1)
--insert into tempdb.dbo.tempXprojectsMasterPDT(systemname, run) values('JaBev',1)
--insert into tempdb.dbo.tempXprojectsMasterPDT(systemname, run) values('arcjacan',1)
--insert into tempdb.dbo.tempXprojectsMasterPDT(systemname, run) values('arcjamass',1)
--insert into tempdb.dbo.tempXprojectsMasterPDT(systemname, run) values('arcjaspan',1)
--insert into tempdb.dbo.tempXprojectsMasterPDT(systemname, run) values('arcjabev',1)
--insert into tempdb.dbo.tempXprojectsMasterPDT(systemname, run) values('arcjaasm',1)
--insert into tempdb.dbo.tempXprojectsMasterPDT(systemname, run) values('arcjaALL',1)
--insert into tempdb.dbo.tempXprojectsMasterPDT(systemname, run) values('jahspe',1)
--insert into tempdb.dbo.tempXprojectsMasterPDT(systemname, run) values('jahsps',1)
--insert into tempdb.dbo.tempXprojectsMasterPDT(systemname, run) values('jafrX',1)
--insert into tempdb.dbo.tempXprojectsMasterPDT(systemname, run) values('arcjahsps',1)
--insert into tempdb.dbo.tempXprojectsMasterPDT(systemname, run) values('arcjahspe',1)
--insert into tempdb.dbo.tempXprojectsMasterPDT(systemname, run) values('jaAlc',1)
--insert into tempdb.dbo.tempXprojectsMasterPDT(systemname, run) values('jaAdams',1)
--insert into tempdb.dbo.tempXprojectsMasterPDT(systemname, run) values('arcjaInet',1)
--insert into tempdb.dbo.tempXprojectsMasterPDT(systemname, run) values('JaALLM',1)
--insert into tempdb.dbo.tempXprojectsMasterPDT(systemname, run) values('jaALLV',1)
--insert into tempdb.dbo.tempXprojectsMasterPDT(systemname, run) values('jafrcan',1)
--insert into tempdb.dbo.tempXprojectsMasterPDT(systemname, run) values('jacanOne',1)
--insert into tempdb.dbo.tempXprojectsMasterPDT(systemname, run) values('jacanOneM',1)
--insert into tempdb.dbo.tempXprojectsMasterPDT(systemname, run) values('jacanOneV',1)
--insert into tempdb.dbo.tempXprojectsMasterPDT(systemname, run) values('JaASHist',1)
--insert into tempdb.dbo.tempXprojectsMasterPDT(systemname, run) values('JaMarkham',1)
--insert into tempdb.dbo.tempXprojectsMasterPDT(systemname, run) values('JamassM',1)
--insert into tempdb.dbo.tempXprojectsMasterPDT(systemname, run) values('JamassV',1)
--insert into tempdb.dbo.tempXprojectsMasterPDT(systemname, run) values('arcJamassM',1)
--insert into tempdb.dbo.tempXprojectsMasterPDT(systemname, run) values('arcJamassV',1)
--insert into tempdb.dbo.tempXprojectsMasterPDT(systemname, run) values('ABMC',1)
--insert into tempdb.dbo.tempXprojectsMasterPDT(systemname, run) values('JaInetCan',1)
--insert into tempdb.dbo.tempXprojectsMasterPDT(systemname, run) values('arcJaInetCan',1)
--insert into tempdb.dbo.tempXprojectsMasterPDT(systemname, run) values('arcjaALLv',1)
--insert into tempdb.dbo.tempXprojectsMasterPDT(systemname, run) values('Manila',1)
--insert into tempdb.dbo.tempXprojectsMasterPDT(systemname, run) values('arcManila',1)
--insert into tempdb.dbo.tempXprojectsMasterPDT(systemname, run) values('JaSocial',1)
--insert into tempdb.dbo.tempXprojectsMasterPDT(systemname, run) values('arcJaSocial',1)
--insert into tempdb.dbo.tempXprojectsMasterPDT(systemname, run) values('arcjaALLM',1)
--insert into tempdb.dbo.tempXprojectsMasterPDT(systemname, run) values('arcjaAlc',1)
--insert into tempdb.dbo.tempXprojectsMasterPDT(systemname, run) values('MT360',1)
--insert into tempdb.dbo.tempXprojectsMasterPDT(systemname, run, extrawhereclause) values('arcjafrv',1,'AND pdt.pagedetailID not in (Select Pagedetailid from masteradviewdata..MassExclusionPageDetailTable with (nolock))')
--insert into tempdb.dbo.tempXprojectsMasterPDT(systemname, run, extrawhereclause) values('jafrv',1,'AND pdt.pagedetailID not in (Select Pagedetailid from masteradviewdata..MassExclusionPageDetailTable with (nolock))')
--insert into tempdb.dbo.tempXprojectsMasterPDT(systemname, run) values('arcJaCanOne',1)
--insert into tempdb.dbo.tempXprojectsMasterPDT(systemname, run) values('arcJaCanOneM',1)
--insert into tempdb.dbo.tempXprojectsMasterPDT(systemname, run) values('arcJaCanOneV',1)
--insert into tempdb.dbo.tempXprojectsMasterPDT(systemname, run) values('USWEBC',1)
--insert into tempdb.dbo.tempXprojectsMasterPDT(systemname, run) values('USCTCMC',1)
--insert into tempdb.dbo.tempXprojectsMasterPDT(systemname, run) values('USCTCVC',1)
--insert into tempdb.dbo.tempXprojectsMasterPDT(systemname, run) values('RepEML',1)
--insert into tempdb.dbo.tempXprojectsMasterPDT(systemname, run) values('DurCons',1)

--insert into tempdb.dbo.tempXprojectsMasterPDT(systemname, run) values('USACMC',1)
--insert into tempdb.dbo.tempXprojectsMasterPDT(systemname, run) values('USACVC',1)
--insert into tempdb.dbo.tempXprojectsMasterPDT(systemname, run) values('ACFVC',1)

insert into tempdb.dbo.tempXprojectsMasterPDT(systemname, run)
Select ProjectName, 1 as Run From EntryData.dbo.vwEntryProjects where MasterPDT=1


Update tempdb.dbo.tempXprojectsMasterPDT Set extrawhereclause='AND pdt.pagedetailID not in (Select Pagedetailid from masteradviewdata..MassExclusionPageDetailTable with (nolock))' Where systemname In ('arcjafrv','jafrv')



declare projects cursor for
select systemname, extrawhereclause
from tempdb.dbo.tempXProjectsMasterPDT
where run = 1
open projects
fetch next from projects into @systemname, @extrawhereclause
while @@fetch_status = 0
begin
	
	if @systemname = 'arcJaCanOneM' or @systemname = 'arcJaCanOneV' or @systemname = 'arcJaCanOne' or @systemname = 'jacanone' or @systemname = 'jacanonem' or @systemname = 'jacanonev' or @systemname = 'jacan' or @systemname = 'arcjacan' or @systemname = 'jafrcan' or @systemname = 'jamarkham' or @systemname = 'jaAShist' or @systemname = 'JaInetCan' or @systemname = 'arcJaInetCan'
	Begin
		--Replace tempmanufacturer table with what we want to use for canada client - @MFRJoin	
		SET @MFRJoin = ' Left JOIN masteradviewdata..[CanOneManufacturer] MF on 
		pdt.category = MF.category and pdt.brand = MF.brand '

		if @systemname = 'arcJaCanOneM' or @systemname = 'arcJaCanOneV' or @systemname = 'arcJaCanOne' or @systemname = 'jacanone' or @systemname = 'jacanonem' or @systemname = 'jacanonev' or @systemname = 'jaMarkham' or @systemname = 'JaInetCan' or @systemname = 'arcJaInetCan'
		Begin

			Set @RegularPrice = '[RegularPrice2], '
	
	                set @PD = '[comments1] = case
			when [comments3] is not null and ltrim(rtrim([comments3])) <> '''' 
			then replace(replace(IsNull([comments3],''''),char(10),''''),char(13),'''') + 
				case when ([comments4] is not null and ltrim(rtrim([comments4])) <> '''') or ([comments1] is not null and ltrim(rtrim([comments1])) <> '''') then '', '' else '''' end
			else ''''
		      end + 
		      case
			when [comments4] is not null and ltrim(rtrim([comments4])) <> '''' 
			then replace(replace(IsNull([comments4],''''),char(10),''''),char(13),'''') + 
				case when ([comments1] is not null and ltrim(rtrim([comments1])) <> '''') then '', '' else '''' end
			else ''''
		      end + 
		      case
			when [comments1] is not null and ltrim(rtrim([comments1])) <> '''' 
			then replace(replace(IsNull([comments1],''''),char(10),''''),char(13),'''')
			else ''''
		      end, '
		End
		Else
		Begin
			set @RegularPrice = 'case when isnull(RequiredQuantity,0) > 0 then RegularPrice1/RequiredQuantity When isnull(RequiredQuantity,0) = 0 then RegularPrice1 Else NULL End AS RegularPrice2,' 
	
			set @PD = '[comments1] = Replace(Replace(Comments1, char(10), ''''), char(13), '''') , '
		End

	End
	Else
	Begin
		SET @MFRJoin = ' Left JOIN masteradviewdata..[TEMPManufacturer] MF on 
		pdt.category = MF.category and pdt.brand = MF.brand '

		set @RegularPrice = 'case when isnull(RequiredQuantity,0) > 0 then RegularPrice1/RequiredQuantity When isnull(RequiredQuantity,0) = 0 then RegularPrice1 Else NULL End AS RegularPrice2,' 

		set @PD = '[comments1] = Replace(Replace(Comments1, char(10), ''''), char(13), '''') , '
	End


		set @SQL = 'INSERT INTO [TEMPxPageDetailTable]' + @crlf + 
		   'SELECT '+ @SelectClause1 + @RegularPrice + @SelectClause2 + @crlf + @PD + @crlf + @SelectClause3 + @crlf +
		   'FROM entrydata..' + @systemname + 'PageDetailTable PDT with (nolock)' + @crlf + 
		   @MFRJoin + @crlf + 
		   @FeaturesJoin + @crlf + 
		   @PDTIDIntJoin + @crlf + 
		   'LEFT OUTER JOIN EntryData.dbo.MasterRollupFlyerIds ru with (nolock) on pdt.flyerid = ru.flyerid' + @crlf + 
		   @WhereClause + @crlf + 
		   IsNull(@extrawhereclause + @crlf,'') + 
		   'Option (MAXDOP 1)'

	update tempdb.dbo.tempXProjectsMasterPDT
	set startdt = getdate()
	where systemname = @systemname

	Exec(@SQL)

	update tempdb.dbo.tempXProjectsMasterPDT
	set enddt = getdate(), run = 0
	where systemname = @systemname


	
	-- Start - update 5 new columns based on XXXPromotionInfoTblUpdate table 
	SET @SQL= 'if object_id(''[EntryData]..' + @systemname + 'PromotionInfoTbl'') is not null
						Update m set 
							QtySave				= CASE WHEN ISNumeric(t.QtySave)=0  THEN cast(NULL as decimal(18,2)) ELSE cast(t.QtySave  as decimal(18,2)) END
							,PurchaseOf			= CASE WHEN ISNumeric( t.PurchaseOf)=0   THEN cast(NULL as decimal(18,2)) ELSE cast(t.PurchaseOf  as decimal(18,2))  END
							,UnitDiscountPrice	= CASE WHEN ISNumeric(t.UnitDiscountPrice)=0   THEN cast(NULL as decimal(18,2)) ELSE cast( t.UnitDiscountPrice  as decimal(18,2))   END
							,DiscountType		= CASE WHEN ISNumeric(t.DiscountType)=0   THEN cast(NULL as Int) ELSE  cast(t.DiscountType  as Int)    END
							,OrMore				= CASE WHEN ISNumeric(t.OrMore)=0  THEN cast(NULL as Int) ELSE cast(t.OrMore  as Int) END
						from masteradviewdata..TEMPxPageDetailTable m join EntryData.dbo.' + @systemname + 'PromotionInfoTbl t on m.pagedetailid=t.pagedetailid'
	Exec ( @SQL) 
	-- End - update 5 new columns based on XXXPromotionInfoTblUpdate table 
	--Start :  update for AC Expansion records
	IF @systemname = 'ACFVC'
	BEGIN
		SET @SQL= 'Update C
			Set QtySave				= CASE WHEN ISNumeric(A.QtySave)=0  THEN cast(NULL as decimal(18,2)) ELSE cast(A.QtySave  as decimal(18,2)) END
							,PurchaseOf			= CASE WHEN ISNumeric( A.PurchaseOf)=0   THEN cast(NULL as decimal(18,2)) ELSE cast(A.PurchaseOf  as decimal(18,2))  END
							,UnitDiscountPrice	= CASE WHEN ISNumeric(A.UnitDiscountPrice)=0   THEN cast(NULL as decimal(18,2)) ELSE cast(A.UnitDiscountPrice  as decimal(18,2))   END
							,DiscountType		= CASE WHEN ISNumeric(A.DiscountType)=0   THEN cast(NULL as Int) ELSE  cast(A.DiscountType  as Int)    END
							,OrMore				= CASE WHEN ISNumeric(A.OrMore)=0  THEN cast(NULL as Int) ELSE cast(A.OrMore  as Int) END
			from EntryData.dbo.USACMCPromotionInfoTbl A
			JOIN MasterMappingTables.dbo.ACFVCDetailMap B ON A.PageDetailId=B.SourcePageDetailId
			JOIN masteradviewdata..TEMPxPageDetailTable C ON B.DestPageDetailId=C.PageDetailId'
		Exec ( @SQL) 
	END
	--End :  update for AC Expansion records
	fetch next from projects into @systemname, @extrawhereclause
end
close projects
deallocate projects

GO

