
select skutype from whcaADLDetailReports


--update SQL05..whcaADLDetailReports
set ProductTerritory = null, ProductTerritoryID=null

/*IF EXISTS (SELECT * FROM Sysobjects WHERE [Name] = 'whcaADLMasterBrandUpdate' and XType = 'U') 
		DROP TABLE whcaADLMasterBrandUpdate

SELECT * INTO whcaADLMasterBrandUpdate FROM mt2sql14.sitecontrol.dbo.whcaADLMasterBrandUpdate
		
UPDATE PDT SET SKUType = T.MasterBrand
		FROM sql05.dbo.whcaADLDetailReports PDT 
		JOIN whcaADLMasterBrandUpdate T
		ON PDT.Category = T.Category and PDT.Brand = T.Brand
		where isnull(PDT.SKUType,'')!=T.MasterBrand
		option (maxdop 1) */


select SKUType from whcaADLDisQueryPage

exec mt_proc_Create_DisplayTables_AD 'whcaADL'


--==================whcaadltest


select SKUType from whcaADLtestDetailReports


select * from whcaADLMasterBrandUpdate


update SQL05..whcaADLTestDetailReports
set ProductTerritory = null, ProductTerritoryID=null

IF EXISTS (SELECT * FROM Sysobjects WHERE [Name] = 'whcaADLMasterBrandUpdate' and XType = 'U') 
		DROP TABLE whcaADLMasterBrandUpdate

SELECT * INTO whcaADLMasterBrandUpdate FROM mt2sql14.sitecontrol.dbo.whcaADLMasterBrandUpdate
		
UPDATE PDT SET SKUType = T.MasterBrand
		FROM sql05.dbo.whcaADLTestDetailReports PDT 
		JOIN whcaADLMasterBrandUpdate T
		ON PDT.Category = T.Category and PDT.Brand = T.Brand
		where isnull(PDT.SKUType,'')!=T.MasterBrand
		option (maxdop 1) 


select distinct SKUType from whcaADLTestDisQueryPage

exec mt_proc_Create_DisplayTables_AD 'whcaADLTest'


	