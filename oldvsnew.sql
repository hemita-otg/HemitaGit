Select * from MasterACFV..CategoryCodeRunFlag 
Order by DataCounts  

--Select * into BLbeamPEPAdBlockReports_Original from BLbeamPEPAdBlockReports 

--Update CategoryCodetable set isfull=0 Where category='BLbeamPEP'

Exec mt_proc_Create_AdBlock 'BLbeamPEP',0 -- OLD

Select Count(1) from BLbeamPEPAdBlockReports_Original

Exec mt_proc_Create_AdBlock_XML_1 'BLbeamPEP',0 -- NEW

Select Count(1) from BLbeamPEPAdBlockReports


Select * from BLbeamPEPAdBlockReports Where adblockid=2475192403 
Select * from BLbeamPEPAdBlockReports_Original Where  adblockid=2475192403 