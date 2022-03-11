--run in mt2asql01

truncate table masterclientcoverage.dbo.NotLoadedPDT
truncate table masterclientcoverage.dbo.NotLoadedMPV
truncate table masterclientcoverage.dbo.NotLoadedDeleted

Insert Into masterclientcoverage.dbo.NotLoadedPDT
select * from masterclientcoverage.dbo.TEMPJAPagedetailtable
Where PageDetailID not in (select PageDetailID from masterclientcoverage.dbo.NotLoadedPDT)

Insert Into masterclientcoverage.dbo.NotLoadedMPV
select * from masterclientcoverage.dbo.TEMPJAMultiplePageValues
Where PageDetailID not in (select PageDetailID from masterclientcoverage.dbo.NotLoadedPDT)

Insert Into masterclientcoverage.dbo.NotLoadedDeleted(pagedetailid,AdBlockID)
select pagedetailid,AdBlockID from masterclientcoverage.dbo.TEMPJAPDTDelete 
Where PageDetailID not in (select PageDetailID from masterclientcoverage.dbo.NotLoadedPDT)

--AV
truncate table masterclientcoverage.dbo.NotLoadedAVPDT
truncate table masterclientcoverage.dbo.NotLoadedAVMPV
truncate table masterclientcoverage.dbo.NotLoadedAVDeleted

Insert Into masterclientcoverage.dbo.NotLoadedAVPDT
select * from masterclientcoverage.dbo.TEMPAVPagedetailtable
Where PageDetailID not in (select PageDetailID from masterclientcoverage.dbo.NotLoadedPDT)

Insert Into masterclientcoverage.dbo.NotLoadedAVMPV
select * from masterclientcoverage.dbo.TEMPAVMultiplePageValues
Where PageDetailID not in (select PageDetailID from masterclientcoverage.dbo.NotLoadedPDT)

Insert Into masterclientcoverage.dbo.NotLoadedAVDeleted(pagedetailid,AdBlockId)
select pagedetailid,AdBlockId from masterclientcoverage.dbo.TEMPAVPDTDelete 
Where PageDetailID not in (select PageDetailID from masterclientcoverage.dbo.NotLoadedPDT)

--BevAL
truncate table masterclientcoverage.dbo.NotLoadedBevAlPDT
truncate table masterclientcoverage.dbo.NotLoadedBevAlMPV

Insert Into masterclientcoverage.dbo.NotLoadedBevAlPDT
select * from masterclientcoverage.dbo.TempBevAlPageDetailTable
Where PageDetailID not in (select PageDetailID from masterclientcoverage.dbo.NotLoadedPDT)

Insert Into masterclientcoverage.dbo.NotLoadedBevAlMPV
select * from masterclientcoverage.dbo.TempBevALMultiplePageValues
Where PageDetailID not in (select PageDetailID from masterclientcoverage.dbo.NotLoadedPDT)

Update A Set ProcessDate=getdate() From MT2ASQL01.MasterAdviewData.dbo.MT2AReInsertMissingDate A Where ServerName=@@SERVERNAME