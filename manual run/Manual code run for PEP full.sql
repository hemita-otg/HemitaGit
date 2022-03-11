select * from mt2sql14.SiteControl.dbo.vw_catinfo where Category='lolPep'

update mt2sql14.SiteControl.dbo.categorycode set isfull = 1,cwmfull=1,ispdt=1,clientpdt=1 where category = 'lolPep' 

exec CreateFlyerReports 'lolPep','masteracfv..acfvflyerreports',0

exec MasterCustomUpdate 'lolPep',2,0

exec CreateDetailReports_acfv 'lolPep','',0

select * from mt2sql14.SiteControl.dbo.vw_MasterSegmentation where category = 'lolPep' 

exec mt_proc_Html_Call 'lolPep'

exec MasterCustomUpdate 'lolPep',1,0

exec MasterSegmentation 'lolPep',0

--exec mt_proc_Create_DisplayTables 'lolPep'

exec mt_proc_Create_AdBlock 'lolPep', 0

IF EXISTS (SELECT * FROM MT2SQL14.SiteControl.DBO.CategoryCode WHERE Category='lolPep' AND IsTPR=1)
	EXECUTE [CustomstepSP_TPR_Data] 'lolPep', 0

--use DataSP50Int
--EXEC DataSP50Int..[fv_FillHomePageInsightsManufacturerOfferType] 87,9479, 'MT2SQL14.SiteControl.dbo.', 'MT2SQL14.Subscription.dbo.', 'NJ1-FVPRD-DB00.PEP00.dbo.'
--EXEC DataSP50Int..[fv_FillHomePageInsightsRetailerSOV] 87,9479, 'MT2SQL14.SiteControl.dbo.', 'MT2SQL14.Subscription.dbo.', 'NJ1-FVPRD-DB00.PEP00.dbo.'
--EXEC DataSP50Int.dbo.[fv_FillHomePageInsightsRetailerOfferType] 87, 9479, 'MT2SQL14.SiteControl.dbo.', 'MT2SQL14.Subscription.dbo.', 'NJ1-FVPRD-DB00.PEP00.dbo.'

exec DataSP50Int.dbo.fv_RefreshDefaultQueryTables 'lolPep'

update mt2sql14.sitecontrol.dbo.categorycode set FD = 1, FDTime = getdate(),isfull=0 where Category = 'lolPep'


