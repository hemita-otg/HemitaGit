---MT1SQL01------------------------------------------------------
\\mt1ftp1\ftp\AdviewEntryData

use MasterData

update adlerttofv
set rerun =1 
--select * from adlerttofv
 where DatabaseCategory in 
('bfspADLA','WbADL')

----JOBS---------------------

Extract FV Data - Client Exports 1
Extract FV Data - Client Exports 2

----JOBS---------------------

---MT2SQL01------------------------------------------------------
\\Mt2ftp1\ftp\Chicago\ADlertToFVConversion

Job : ADlert-FV - Sequencial Processing