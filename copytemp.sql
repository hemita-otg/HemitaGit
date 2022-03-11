exec mt_proc_cs_CopyQPAndRptTemplate 903,9429,45061,'BlackADLQueryViewTemplate',123,9429,'BlackADLQueryViewTemplate',1
exec mt_proc_cs_CopyQPAndRptTemplate 903,9429,49077,'BlackADLPDTReportTemplate_3244',123,9429,'BlackADLPDTReportTemplate_3244',2
exec mt_proc_cs_CopyQPAndRptTemplate 903,9429,49076,'BlackADLCWMReportTemplate_3244',123,9429,'BlackADLCWMReportTemplate_3244',3

@pSourceClientId INT -- Source Client ID 903
	,@pSourceCatCodeId INT -- Source CategoryCode Id 9429
	,@pSourceTemplateId INT -- Source Template ID 45061
	,@pSourceFormatName VARCHAR(255) -- Source Format Name 'BlackADLQueryViewTemplate'
	,@pDestClientId INT -- Destination Client ID 68
	,@pDestCatCodeId INT -- Destination CategoryCode Id 9429
	,@pDestFormatName VARCHAR(255)  -- Destination Format Name 'BlackADLQueryViewTemplate'
	,@pTemplateType INT -- 1, 2, 3 -- Template Type
	1 for QP
	2 for PDT
	3 for CWM

	select * from vw_QvfcFields where CategoryCodeid=9429 and clientid=68
	select * from vw_ReportFields where CategoryCodeid=9429 and clientid=68

	select * from QueryViewControl where CategoryCodeid=9429 

	ReportFormatControl where CategoryCodeid=9429  and clientid=68

	qp=45061
	 cwm=49076
	 pdt=49077