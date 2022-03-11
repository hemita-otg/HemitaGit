select * from mt2sql14.sitecontrol.dbo.categorycode where category like '%hknpep%'

--update mt2sql14.sitecontrol.dbo.categorycode set fullsourcecode='MasterACFV..ACFV' where category like 'icipep'

--update mt2sql14.sitecontrol.dbo.categorycode set ispdt=1,cwmfull=1,clientpdt=1 where category = 'wlmadltpep'             ---for full

--update mt2sql14.sitecontrol.dbo.categorycode set clientpdt=1 where category = 'nwPep'            ---for basic

select * from mt2sql14.sitecontrol.dbo.vw_Catinfo where clientname like '%proct%' and FVCCType in (2,4)

-------------retmkt coverage check----------------


select distinct advertiser,market from mt2sql00.masterclientcoverage.dbo.masterclientcwmpep a 
join mt2sql00.masterclientcoverage.dbo.retmktpep b 
on a.retmktid=b.retmktid and a.mediaid is null
where --a.categorycodeid=7035 and
((b.advertiser like '%harve%' and b.market like '%nash%')) order by b.advertiser


--delete from  mt2sql00.masterclientcoverage.dbo.masterclientcwmpep where clientid =601 and categorycodeid =  5893 and retmktid in (5032,7767,8235)

select * from mt2sql00.masterclientcoverage.dbo.masterclientcwmpep where retmktid in 
(select distinct retmktid from mt2sql00.masterclientcoverage.dbo.retmktpep where
(advertiser like '%save%' and market like '%sacra%'))

select * from mt2sql00.masterclientcoverage.dbo.retmktpep where (advertiser like '%save%' and market like '%sacra%')

 
-----------inserting data-------------------
--------insert into mt2sql00.masterclientcoverage.dbo.masterclientcwmpep( clientid,categorycodeid,acretmktid,retid,mktid,retmktid,tcid,startdate)
select distinct 95,4803,acretmktid,retid,mktid,retmktid,tcid,'2015-01-01 00:00:00.000' from mt2sql00.masterclientcoverage.dbo.retmktpep where 
(advertiser = 'Adams Super Food Stores' and market ='Hartford, CT') 
---------------------------------------------
 
SELECT * FROM archivesub..Categorycode where category like '%%'

select * from mt2sql14.sitecontrol.dbo.vw_merchandisecategory where categorycodeid = 5906

select distinct merchandisecategory,merchandisesubcat,category 
from mt2sql14.sitecontrol.dbo.tempmodelpep 
where category like '%refr%' 
order by category

select * from Subscription..clientprofile where clientname like '%nike%'

select * from mt2sql00.masterbeval.dbo.masterbevaldetailreports where category = 'Beer Alternatives'

select * from mt2sql01.conversioncontrol.dbo.databasecategory where category like '%fsiadcvspep%' 
----------------retmkt / category check in table-------------

-------category coverage check ---------------
select *  from mt2sql14.sitecontrol.dbo.merchandisecategorytemplatesdetail
where mctemplateid=(select distinct mctemplateid 
from mt2sql14.sitecontrol.dbo.merchandisecategorycontrol 
where categorycodeid = (select distinct id from mt2sql14.sitecontrol.dbo.categorycode where category = 'pbiPeP'))

--update mt2sql14.sitecontrol.dbo.merchandisecategorytemplatesdetail  set [set]=0, exclude = 0 where  mctemplateid=3614 

--insert into mt2sql14.sitecontrol.dbo.merchandisecategorytemplatesdetail (mctemplateid,merchandisecategory,merchandisesubcat,category,realcategory,[set],[exclude])
 values(4740,'Grocery','Wine/Sparkling','Wine-Dessert','Wine-Dessert',0,0)


--insert into mt2sql14.sitecontrol.dbo.merchandisecategorytemplatesdetail (mctemplateid,merchandisecategory,merchandisesubcat,category,realcategory) 
select distinct 3663,merchandisecategory, merchandisesubcat,category,category 
from mt2sql14.sitecontrol.dbo.tempmodelpep 
where category like ('%wine%')


--insert into mt2sql14.sitecontrol.dbo.merchandisecategorytemplatesdetail
select 4773,b.merchandisecategory, b.merchandisesubcat,b.category,b.category,0,0,NUll,NUll,NUll,NUll from mt2sql00.tempdb.dbo.accatcoverage a join mt2sql00.master.dbo.acfvcategory b
on --a.Merchandisecategory = b.Merchandisecategory and
 --a.merchandisesubcat = b.merchandisesubcat and 
 a.category = b.category

