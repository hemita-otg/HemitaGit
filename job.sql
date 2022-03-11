IF EXISTS (SELECT * FROM TEMPDB..sysobjects WHERE name = 'sonyfranchtitle' and Xtype = 'U')
DROP TABLE TEMPDB..[sonyfranchtitle]
GO

select * INTO TEMPDB..[sonyfranchtitle] from (
Select Distinct category,brand,comments1[Product Description],isnull(ProductTerritory,'')Franchise,isnull(productterritorysubgroup,'')Title
from mt2sql05.SQL05.dbo.scea50DetailReports
union
Select Distinct category,brand,comments1[Product Description],isnull(ProductTerritory,'')Franchise,isnull(productterritorysubgroup,'')Title
from mt2sql01.SQL01.dbo.ea50DetailReports) as tmp
order by 2,1


	Exec MT2SQL00.master.dbo.sp_procExportData
	@subject = 'Sony Franchise & Title Distinct List - <date>'
	, @message = ''
	, @recipients = 'omeka.graham@numerator.com;alexandra.simmons@numerator.com;jessie.fryman@numerator.com'
	, @cc_recipients = 'pratik.makwana@numerator.com;hemita.bhagat@numerator.com'
	, @tabname = 'Sony Franchise & Title'
	, @filename = 'Sony Franchise & Title Distinct List - <date>'
	, @servername = 'MT2SQL14'
	, @dbname = 'sitecontrol'
	, @query = 'select * from tempdb..[sonyfranchtitle]'
	, @exporttype = 'EXCEL'
	, @zip = 'true'
