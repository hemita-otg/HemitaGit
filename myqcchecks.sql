
select * from mt2sql14.sitecontrol.dbo.vw_catinfo where categorycodeid = 4767  --and fvcctype in (2,4)


select *  from mt2sql14.sitecontrol.dbo.vw_merchandisecategory
where mctemplateid=3492


select distinct advertiser,market,media  from mt2sql13.masteracfv.dbo.acfvdetailreports with (nolock)
where retmktid in(1835,8678) and
category in ('Bath Scales','Breath Freshener/Mints/Gums','Dental Floss','Denture Accessories','Denture Adhesives','Denture Cleanser','Implements&Accessories','Mouthwash/Rinse','Oral Analgesics/Medications','Tooth Whitener/Polish','Toothbrushes','Toothpaste')


select * from mt2sql14.sitecontrol.dbo.categorycode where clientid =1033


select distinct retmktid from  mt2sql00.masterclientcoverage.dbo.retmktpep where
(
(advertiser = 'CashSaver' and market ='Oklahoma City, OK') or
(advertiser = 'SavMor' and market ='Asheville, NC')
)


select * from mt2sql16.sql16.dbo.comPEPdisadvertisermarket where advertiser = 'El Rancho' and market = 'Phoenix, AZ'

select * from mt2sql13.sql13.dbo.walPePdisquerypage 

--update mt2sql14.sitecontrol.dbo.categorycode set cwmfull = 1 where category = 'adrddPEP'

select distinct category from mt2sql16.sql16.dbo.acfvdetailreports where advertiser = 'El Rancho' and market = 'Phoenix, AZ' 
and category in ('Mangos','Pre-Cut Fruit') 

select * from mt2sql00.masterclientcoverage.dbo.retmktpep where
advertiser = 'Sam''s Club' and market = 'Chicago, IL' and media = 'Circular'


select distinct advertiser,market from mt2sql13.sql13.dbo.parpepdisadvertisermarket

