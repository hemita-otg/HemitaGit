
-----Normal
--Exec CreateClientCWMtable_50 'wlm50', '', 0
--Exec CustomStepSP_Wlm 'wlm50',2

--Exec CreateClienttables_50_PdtIdInt 'wlm50', '', 0
--Exec CustomStepSP_Wlm 'wlm50',2

--Exec MasterSegmentation 'wlm50',0


select * from Mt2sql14.SiteControl.dbo.CategoryCode_NF_MT2 where category  in ('ahld50','ahls50')
select * from Mt2sql14.SiteControl.dbo.CategoryCode where category  in ('cwu') 

----BevAl

--EXECUTE Createflyerreports 'ymkt', '', 0

--EXECUTE CreateDetailreports 'ymkt', '', 0


--ClientID, CategoryCodeId,'[MT2SQL14].SiteControl.dbo.','[MT2SQL14].Subscription.dbo.','ClientServer.ClientDB.dbo.'
--EXEC DataSP50Int.dbo.fv_FillHomePageTableData  286,2119,'[MT2SQL14].SiteControl.dbo.','[MT2SQL14].Subscription.dbo.','MT2SQL04.SQL04.dbo.'


