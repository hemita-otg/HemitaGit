--Connect Mt2sql00.master

--Drop table tempdb..acretmkt
create table tempdb..acretmkt (
Retailer varchar(100),
Market varchar(100))
Go

Select * from mt2sql00.tempdb.dbo.acretmkt
--="insert into tempdb..acretmkt values ('"&a2&"','"&b2&"')"

--Drop table tempdb..accatcoverage
create table tempdb..accatcoverage (
MerchandiseCategory varchar(100),
MerchandiseSubCat varchar(100),
Category varchar(100)
)
Go

select * from mt2sql00.tempdb.dbo.accatcoverage
--="insert into tempdb..accatcoverage values ('"&A2&"','"&B2&"','"&C2&"')"

--select * from tempdb..acretmktmaster
--select * from tempdb..accatmaster

select * from mt2sql14.sitecontrol.dbo.vw_Catinfo where Clientname like '%pacific%' and FVCCType in (2,4)

--exec [dbo].[AC_Coverages] 5875,1

-----sql00 exception-----------
select * from mt2sql13.masterclientcoverage.dbo.MasterClientCWMPEP where CategoryCodeID=5863
--insert into mt2sql13.masterclientcoverage.dbo.MasterClientCWMPEP  (clientid, CategoryCodeID, ACretmktid, StartDate, retmktid)
select 882, 5859,ACRetmktid,'2015-01-01 00:00:00.000',Retmktid from MasterMappingTables..REtMKTpep where retailer = 'Metropolitan City Market' 

select * from mt2sql14.sitecontrol.dbo.MerchandiseCategoryControl where CategoryCodeID = 5862
select * from mt2sql14.sitecontrol.dbo.MerchandiseCategoryTemplatesDetail where MCTemplateID =3526 
---Check wether any retmkt data need to be pulled---------------------------
select * from robin.[ACFV].[dbo].[ACFVRetMktImport] where new_F=1


---Robin Categorycodetable-----------------
select * from robin.acfv.dbo.categorycodetable where mt2_categorycode='ddh'
--insert into robin.acfv.dbo.categorycodetable 
select category as mt2_categorycode, ID as mt2_categoryid,0 as IncrRun,1 as FullRun,1 as NewClientRun,getdate(),getdate() from mt2sql14.sitecontrol.dbo.categorycode where category='dtzPep'

----Find out retailer market coverage for specific client---------------------

select Distinct retailer_i, company_nm, city_i, City_nm, state_i, state_c, Concat(Convert(varchar(20),retailer_i),Convert(varchar(20),city_i)) as fieldvalue

--insert into robin.[ACFV].[dbo].[ACFVRetMktImport]
select distinct rb.* from robin.[ACFV].[dbo].[ACFVRetMktImport] rb
join Masteracfv..Full_RETMKT A
on Concat(Convert(varchar(20),a.retailer_i),Convert(varchar(20),a.city_i))=Concat(Convert(varchar(20),rb.retailer_i),Convert(varchar(20),rb.city_i))
join mt2sql00.masterclientcoverage.dbo.MasterClientCWMPEP B
on Concat(Convert(varchar(20),a.retailer_i),Convert(varchar(20),a.city_i))=B.retmktid
join mt2sql14.sitecontrol.dbo.categorycode C
on C.ID=B.CategoryCodeID
where C.FVCCType in (2,4) and (rb.company_nm='Walmart-US' and rb.City_nm='Boston' and rb.state_c='MA')


-------Category coverage--------------------------
select * from mt2sql14.sitecontrol.dbo.MerchandiseCategoryControl where CategoryCodeID = 4700
select * from mt2sql14.sitecontrol.dbo.MerchandiseCategoryTemplatesDetail where MCTemplateID =3427 

--insert into mt2sql14.sitecontrol.dbo.MerchandiseCategoryTemplatesDetail (MCTemplateid, Merchandisecategory, Merchandisesubcat, category, realcategory, [set],[Exclude])
select distinct '3483' as MCTemplateid, merchandisecategory, MerchandiseSubCat, Category, Category as RealCategory, 0 as [Set], 0 as [Exclude] 
from mt2sql00.masteracfv.dbo.acfvDetailreports where category like '%Laxative%' order by 4

--insert into mt2sql00.masterclientcoverage.dbo.MasterClientCWMPEP (Categorycodeid, fieldid, fieldvalue,startdate)
select distinct  '4781' as CategoryCodeid, '153' as fieldid, Concat(Convert(varchar(20),retailer_i),Convert(varchar(20),city_i)) as FieldValue, '2015-01-01 00:00:00.000' as StartDate
,*
from Masteracfv..Full_RETMKT where   (Company_nm like 'costco%' and City_nm in ('Chicago') and state_c='IL')

select distinct Advertiser, market from MasterACFV..ACFVFlyerReports where Advertiser like '%Cost%' and market = 'Chicago, IL'


--------search in MasterClientCWMPEP

select retailer_i, Company_nm, city_i, City_nm, state_i, state_c
from mt2sql00.masterclientcoverage.dbo.MasterClientCWMPEP a
join Masteracfv..Full_RETMKT b
on Concat(Convert(varchar(20),retailer_i),Convert(varchar(20),city_i))=a.retmktid
where a.categorycodeid=4767 and company_nm like '%walmart-us%'

--update mt2sql14.sitecontrol.dbo.Categorycode set ISPDT  = 1 , CLIENTPDT = 1  , CWMFULL  = 1, ISFULL=1 where category='morPep' 

 Select ISPDT, CLIENTPDT, CWMFULL, ISFULL, * from mt2sql14.sitecontrol.dbo.categorycode where category in ('dtzPep'),'ApiPeP','wlmPeP','hlfPeP','cffPeP','isPeP','kikPeP','avbPeP','cbiPeP','lorPeP','droPeP')

 --Loaded RetMkt & Category Coverage and attached is the coverage file for tfmPeP (4772) 
--RetMkt which are not found are highlighted with Yellow color in attached file.

select distinct FR.*
from Robin.ADCEntry.dbo.adCircular c 
Join Robin.ADCEntry.dbo.adCircular_city cc on c.circ_i = cc.circ_i
JOIN Robin.ADCEntry.dbo.city cty (NOLOCK) ON cc.city_i = cty.city_i
Join Robin.adcentry.dbo.city mjr on cty.major_city_i = mjr.city_i
Join MasterACFV..Full_RetMkt FR on c.retailer_i = FR.retailer_i And mjr.city_i = FR.city_i
Where	c.start_dt > '1/1/2015' 