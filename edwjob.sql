IF EXISTS (SELECT * FROM TEMPDB..sysobjects WHERE name = 'edwrenamedcats' and Xtype = 'U')
DROP TABLE TEMPDB..[edwrenamedcats]
GO


Select Distinct category,brand,Comments3[Product Description],unittype [Product Size]
INTO TEMPDB..[edwrenamedcats] 
from [NJ1-FVPRD-DB00].PEP00.dbo.edwDetailReports where category in ('After Shave/Pre-Shave','Razors','Ethnic Shave Cream/Gel')
order by 2,1


	Exec MT2SQL00.master.dbo.sp_procExportData
	@subject = 'Edgewell USA Category Distinct renaming List - <date>'
	, @message = ''
	--, @recipients = 'omeka.graham@numerator.com;alexandra.simmons@numerator.com;jessie.fryman@numerator.com'
	--, @cc_recipients = 'pratik.makwana@numerator.com;hemita.bhagat@numerator.com'
	, @recipients = 'hemita.bhagat@numerator.com'
	, @tabname = 'Edgewell Category Renaming'
	, @filename = 'Edgewell Category Renaming Distinct List - <date>'
	, @servername = 'MT2SQL14'
	, @dbname = 'sitecontrol'
	, @query = 'select * from tempdb..[edwrenamedcats]'
	, @exporttype = 'EXCEL'
	, @zip = 'true'
