select * from mt2sql14.SiteControl.dbo.vw_catinfo where Category='sffPEP'

update mt2sql14.SiteControl.dbo.categorycode set isfull = 1,cwmfull=1,ispdt=1,clientpdt=1 where category = 'sffPEP' 

exec CreateFlyerReports 'sffPEP','masteracfv..acfvflyerreports',0

exec MasterCustomUpdate 'sffPEP',2,0

exec CreateDetailReports_acfv 'sffPEP','',0

select * from mt2sql14.SiteControl.dbo.vw_MasterSegmentation where category = 'sffPEP' 

exec mt_proc_Html_Call 'sffPEP'

exec MasterCustomUpdate 'sffPEP',1,0

exec MasterSegmentation 'sffPEP',0

exec mt_proc_Create_DisplayTables 'sffPEP'

exec mt_proc_Create_AdBlock 'sffPEP', 0

--use DataSP50Int
--EXEC DataSP50Int..[fv_FillHomePageInsightsManufacturerOfferType] 87,9480, 'MT2SQL14.SiteControl.dbo.', 'MT2SQL14.Subscription.dbo.', 'NJ1-FVPRD-DB00.PEP00.dbo.'
--EXEC DataSP50Int..[fv_FillHomePageInsightsRetailerSOV] 87,9480, 'MT2SQL14.SiteControl.dbo.', 'MT2SQL14.Subscription.dbo.', 'NJ1-FVPRD-DB00.PEP00.dbo.'
--EXEC DataSP50Int.dbo.[fv_FillHomePageInsightsRetailerOfferType] 87, 9480, 'MT2SQL14.SiteControl.dbo.', 'MT2SQL14.Subscription.dbo.', 'NJ1-FVPRD-DB00.PEP00.dbo.'

exec DataSP50Int.dbo.fv_RefreshDefaultQueryTables 'sffPEP'

update mt2sql14.sitecontrol.dbo.categorycode set FD = 1, FDTime = getdate(),isfull=0 where Category = 'sffPEP'


