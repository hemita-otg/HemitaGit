
select * from mt2sql14.sitecontrol.dbo.vw_Catinfo where clientname like '%revlon%' and FVCCType in (2,4)

select distinct  merchandisecategory,merchandisesubcat,category from mt2sql16.sql16.dbo.croPEPdisquerypage 
--where category = 'Juice Boxes (Shelf Stable)'

select advertiser,market from mt2sql17.sql17.dbo.starPePdisadvertisermarket 
where
(advertiser ='Wegmans'and market='Alexandria, VA') 


select  * from mt2sql12.sql12.dbo.adv10detailreports --for cwm level

select * from mt2sql00.sql00.dbo.catcodeflyerreports --for pdt level


select distinct advertiser,market,retmktid from mt2sql00.masterclientcoverage.dbo.retmktpep where 
(advertiser ='cvs y mas'and market='Garden Grove, CA') 

select * from mt2sql13.masteracfv.dbo.acfvflyerreports where advertiser like '%cvs y%' --and market='Garden Grove, CA') 

select * from robin.[ACFV].[dbo].[ACFVRetMktImport] where new_F=1