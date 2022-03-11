select customstep,* from mt2sql14.sitecontrol.dbo.categorycode where category = 'lo'

select * from mt2sql14.sitecontrol.dbo.vw_catinfo where clientname like '%the wi%'
select bust,* from mt2sql14.sitecontrol.dbo.categorycode where id=4622

select * from mt2sql14.sitecontrol.dbo.vw_MasterCustomStep where Id in (2684) 
select * from mt2sql14.sitecontrol.dbo.vw_mastersegmentation where Id in (2684)

--clientserver='mt2sql13' and 
--fieldname = 'tradeclass' and descrip='update'

select * from mt2sql14.sitecontrol.dbo.mastercustomupdate where categoryid = 9450
--------------------------------------------------------------
--to insert if new code is not available----------------------
select * from mt2sql14.sitecontrol.dbo.MasterCustomStep where CategoryCodeId=9520

--insert into mt2sql14.sitecontrol.dbo.MasterCustomStep(CategoryCodeId,CustomStepArchive) values(9520,0)
select * from  mt2sql14.sitecontrol.dbo.MasterCustomStepSPDetail where SPName='CustomStepSP_labca' 
--insert into mt2sql14.sitecontrol.dbo.MasterCustomStepSPDetail(SPName) values('CustomStepSP_labca')

select * from mt2sql14.sitecontrol.dbo.MasterCustomStepDetail where  csid=1348

--insert into mt2sql14.sitecontrol.dbo.MasterCustomStepDetail(CSID,FieldId,SQLTaskId,SPID,processorder) values(1361,16,10,242,1)
--insert into mt2sql14.sitecontrol.dbo.MasterCustomStepDetail(CSID,FieldId,SQLTaskId,SPID,processorder) values(1362,78,8,243,1)
--insert into mt2sql14.sitecontrol.dbo.MasterCustomStepDetail(CSID,FieldId,SQLTaskId,SPID,processorder) values(1362,141,10,243,1)

Select * from mt2sql14.ArchiveSub.dbo.MasterCustomStepDetail Where CSID=1324 

select * from mt2sql14.sitecontrol.dbo.Code --insert/update/delete id

Select * from mt2sql14.sitecontrol.dbo.MasterFields Where FieldName like '%skuty%' --field name to update

select distinct sqltaskid,descrip from mt2sql14.sitecontrol.dbo.vw_MasterCustomStep

--update mt2sql14.sitecontrol.dbo.categorycode set customstep=1  where category = 'milpepiri'
select distinct spname,* from mt2sql14.sitecontrol.dbo.vw_MasterCustomStep where fieldname like '%skuty%'