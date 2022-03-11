select * from BEACDisAdvertiserMarket --order by 4
where Advertiser in ('Buehler''s','Martin''s','Fresh Encounters','Hollywood Markets','Hugo''s','Riesbeck''s','Village Markets')


----------------------------------------------
select * from iddb..TradeClass
where TradeClass = 'SpartanNash'

--select * from tempdb.dbo.sysobjects where xtype='u' and name like '%buact%'

select * from sitecontrol..buactradeclass
--insert into sql06..buactradeclass values(advertiser,market,tradeclas,,tradeclassid)

select * into tempdb..buactradeclass from buactradeclass


select * 
	from buacflyerreports a
	inner join tempdb..buactradeclass b
	on a.advertiser=b.advertiser and a.market=b.market 


--update d set a.tradeclass=b.tradeclass, tradeclassid=b.tradeclassid
	from buacflyerreports a
	inner join tempdb..buactradeclass b
	on a.advertiser=b.advertiser and a.market=b.market 

	--update d set a.tradeclass=b.tradeclass, tradeclassid=b.tradeclassid
	from buacpagereports a
	inner join tempdb..buactradeclass b
	on a.advertiser=b.advertiser and a.market=b.market 


--exec mt_proc_Create_DisplayTables 'buac',1
