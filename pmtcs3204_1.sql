
--update b set Category =RenamedCategory,MerchandiseCategory=a.MerchandiseCategory,MerchandiseSubCat=a.MerchandiseSubCat
select distinct a.category,b.Category,a.RenamedCategory,a.MerchandiseCategory,b.MerchandiseCategory,a.MerchandiseSubCat,b.MerchandiseSubCat
from conversioncontrol..mcupdate a
join sql05..whcaADLDetailReports b
on a.RenamedCategory=b.Category
where a.DatabaseCategory ='whcaadl'
and (a.MerchandiseCategory!=b.MerchandiseCategory or a.MerchandiseSubCat!=b.MerchandiseSubCat)

               
exec mt_proc_Create_ID_Update 'whcaADLDetailReports' ,'MerchandiseCategory'
exec mt_proc_Create_ID_Update 'whcaADLDetailReports' ,'MerchandiseSubCat'
exec mt_proc_Create_ID_Update 'whcaADLDetailReports' ,'Category'


exec mt_proc_Create_DisplayTables_AD ''


