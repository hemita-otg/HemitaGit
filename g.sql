select max(addate) from 
pngca50DetailReports


select * from ConversionControl..ConversionCategory
where databasecategory like '%jcp%'
order by 1 desc


select count(1) from JCPd50DetailReports --11939631
select count(1) from jcpads 

--update mt2sql01.conversioncontrol.dbo.ConversionCategory
--set conversiondone=0,run=1
--where DatabaseCategory = 'JCPAds' 

select conversiondone,run,FTPStatus ,* from mt2sql09.conversioncontrol.dbo.ConversionCategory where DatabaseCategory like '%jcp%' 