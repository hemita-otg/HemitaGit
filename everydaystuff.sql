select * from CategoryMarkedFull order by 1 desc


--insert into CategoryMarkedFull 
select categorycodeid,GETDATE(),'hbhagat'
from vw_catinfo 
where category in ()


select * from sitecontrol..vw_catinfo where clientname like '%glax%' and Status=1 and YourWeb like '%beval%'
select * from sitecontrol..vw_catinfo where category like '%conca%' and status=1 order by 1,2

select * from MasterCanProductTerritory
--update categorycode set fullsourcecode='MasterACFV..ACFV',partialsourcecode='ACFVINCR..tempacfv' where id in (9479,9480)

select * from categorycode where clientid=87 and id in (9479,9480) and ClientTableName like '%detail%'

select * from categorycode where category in ('sprca50')
select * from ArchiveSub..categorycode where category in ('sprca50')

--update CategoryCode set incradrun=0 where id=9482

--update categorycode set clientid=1136
where id = 9482

select * from vw_catinfo where category like '%lo%'

select * from sitecontrol..tablenames where CategoryCodeID= 4459 and MasterTableName like '%tra%'

select distinct ClientName,HomePageLink,clientid,CategoryCodeid,category 
from vw_catinfo where ClientServer = 'mt2sql09' and status=1 and IsAdlert=1

--update Subscription..vwClient set isactiveclient=0 where clientid=79
select FVVer,* from sitecontrol..vw_catinfo where category  like 'testpgpep%'
,9392
,9395)

update htmlqpversion set version='v81'

--update vw_catinfo set status=0 where categorycodeid=9427

--and FVCCType not in (2,4,6)

select distinct userid from UserHomePageLinkAccess order by 1

select distinct * from SiteControl..vw_catinfo where Category='prsPEP'

select * from UserHomePageLinkAccess  where userid=54771

select * from Subscription..vwUser where clientid=177 and defaultemailaddress like '%hemita.bhagat%'

select MasterCategoryCodeID50,* from Subscription..ClientProfile where clientname like  '%bacard%' 

select fv40,* from Subscription..ClientProfile where ClientID = 177
select * from Subscription..vwUser where DefaultEmailAddress like '%hemita%' and clientid=87

select * from Subscription..UserMyFVLinks where LinkRefId=2443476
--delete from Subscription..UserMyFVLinks where LinkRefId=2443476

--update Subscription..ClientProfile set MasterCategoryCodeID50= 9366  where clientid = 343
update categorycode set isfull=1,clientrun=1 where category='dgbPEP'

--update Subscription..ClientProfile set IsActiveClient=0  where clientid =1282
--select * from archivesub..ClientProfile
 where clientname like '%north%'

 select * from ArchiveSub..CategoryCode where category in ()
select * from CategoryCode where clientid=177

select * from CategoryCode
--update CategoryCode set clientrun=0 where id =7229

select * from ArchiveSub..ClientProfile where clientname like '%gla%'
select * from sitecontrol..CategoryMarkedFull where categorycodeid in 
(select CategoryCodeId,* from vw_catinfo where Category in ('KCPEP'))
order by FullRunDate desc

select * from Sitecontrol..CategoryCode_DataFeed where CategoryCodeid = 7050

select * from TableNames where CategoryCodeid=7278 and ClientTableName like '%productterritory%'

select  MasterCategoryCodeId,MasterCategoryCodeID50,* from subscription..clientprofile where ClientID = 87

select distinct fieldname,DisplayName,b.categorycodeid,b.Category,b.ClientServer 
from vw_QvfcFields a join vw_catinfo b on a.CategoryCodeId= b.CategoryCodeId
where displayname = 'incentives' and FVCCType in (2,4,6)

select * from Subscription..ClientProfile where clientid=1355

select * from vw_QvfcFields where categorycodeid=7049 and DisplayName like '%incentive%' and DisplaySeq is not null
select * from vw_Reportfields where categorycodeid=7049 and DisplayName like '%incentive%' and DisplaySeq is not null

select * from MasterFields where FieldName like '%promotion%'order by 2

--===========users-----------------

select distinct firstname,lastname,defaultemailaddress 
from subscriptions..vwUser
where FirstName = 'kelly'
order by 1,2,3

---------fr check -------

select * from FlashReportLog..ClientValuesLog

select * from FlashReport..FRRetMktpep
where ClientID= 1373

----------custom update check---------

select a.ClientName,a.Category,c.homepagelink,b.DisplayName,a.FieldName,a.FieldType,a.ProcessingStage,a.Descrip
from mt2sql14.sitecontrol.dbo.vw_MasterCustomStep a
join  vw_QvfcFields b
on a.ID=b.CategoryCodeId and a.FieldID=b.FieldId
join vw_catinfo c
on a.ID=c.CategoryCodeId
where c.Category= 'kraca50'

----------segment check---------

select a.ClientName,a.Category,c.homepagelink,b.DisplayName
from mt2sql14.sitecontrol.dbo.vw_mastersegmentation a
join  vw_QvfcFields b
on a.ID=b.CategoryCodeId and a.FieldID=b.FieldId
join vw_catinfo c
on a.ID=c.CategoryCodeId
where c.Category= 'whopep'


--==============category & masterfileds check==============

select * from CategoryFields
where CategoryCodeID in (7028)
and FieldID =4

select distinct b.Category,ClientServer from TableNames a
join vw_catinfo b 
on a.CategoryCodeID = b.CategoryCodeId
where ClientTableName like '%mastercan%' and (b.ClientPDT=1 )
order by ClientServer

where CategoryCodeID in ('mas')
and tableid=4

select * from MasterFields 
where  FieldName='DropInPrintInd'


--Insert into tbl_lookup_category(CategoryType,CategoryValue,CreatedOn,CategoryCodeid)
select distinct *
from tbl_lookup_category
where CategoryCodeid = 7249
order by ID

select * from DropInPrintDatabases

select distinct *
from vw_ReportFields a
join vw_catinfo b 
on a.CategoryCodeId=b.CategoryCodeId
where FieldName like '%division%' and FVCCType in (2,4)

select * from sitecontrol..vw_catinfo 
where Category like '%beva%'

select * from clientdatabases where clientid=781

select * from vw_MerchandiseCategory where Categorycodeid=7180

Select Category from MT2SQL14.SiteControl.dbo.CategoryCode_NF_MT2 where category='bar50'

select * from mt2sql00.masterclientcoverage.dbo.masterclientcwmpep 
where categorycodeid in (select 
categorycodeid from mt2sql13.MasterACFV.dbo.ad_DefaultMktExceptionCategoryCode )
and startdate='2015-01-01 00:00:00.000'

select * from vw_QvfcFields a
join vw_catinfo b
on a.CategoryCodeId=b.CategoryCodeId
where FVCCType in (2,4)
and FieldName='district'

--update Subscription..ClientProfile set IsActiveClient=1  where clientid=878

--update vwuser set LastPwdChanged = getdate() where clientid in (601) and ISNULL(LastPwdChanged, GetDate() - 100) < Getdate() - 90

select * from FlashReport..FRRetMktpep where clientid=46 and retmktid=285