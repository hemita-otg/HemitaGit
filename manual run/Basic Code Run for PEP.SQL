
Select * from mt2sql14.sitecontrol.dbo.vw_catinfo Where category = 'clo'

Update mt2sql14.sitecontrol.dbo.categorycode 
set isfull = 1,Ispdt=0,CWMFull=NULL,ClientPDT=1 where category = 'clo' And fvcctype = 2
--update mt2sql14.sitecontrol.dbo.categorycode set dbcreatedon=dbcreatedon-1  where category = 'clo' And fvcctype = 2

EXEC dbo.mt_proc_Create_DisQueryTables 'clo',0,1,0,0,0
										
EXECUTE dbo.mt_proc_Html_Call 'clo'
						
EXECUTE dbo.mt_proc_Create_AdBlockReportsTables 'clo',0

insert into mt2sql14.Subscription.dbo.HTMLQueryPageChange values('clo')

--EXEC DataSP50Int..[fv_FillHomePageInsightsManufacturerOfferType] 1108,9445, 'MT2SQL14.SiteControl.dbo.', 'MT2SQL14.Subscription.dbo.', 'mt2sql17.sql17.dbo.'
	
--EXEC DataSP50Int..[fv_FillHomePageInsightsRetailerSOV] 1108,9445, 'MT2SQL14.SiteControl.dbo.', 'MT2SQL14.Subscription.dbo.', 'mt2sql17.sql17.dbo.'

--EXEC DataSP50Int.dbo.[fv_FillHomePageInsightsRetailerOfferType] 1108,9445, 'MT2SQL14.SiteControl.dbo.', 'MT2SQL14.Subscription.dbo.', 'mt2sql17.sql17.dbo.'

Update mt2sql14.sitecontrol.dbo.categorycode set FD = 1,FDTIME=Getdate() where category = 'clo' And fvcctype = 2