
--update b set MerchandiseCategory=a.MerchandiseCategory,MerchandiseSubCat=a.MerchandiseSubCat
select distinct a.MerchandiseCategory,b.MerchandiseCategory,a.MerchandiseSubCat,b.MerchandiseSubCat,a.category,b.Category
from conversioncontrol..mcupdate a
join sql01..actadl50DetailReports b
on a.Category=b.Category
where a.DatabaseCategory ='actadl50'
and (a.MerchandiseCategory!=b.MerchandiseCategory or a.MerchandiseSubCat!=b.MerchandiseSubCat)

               
exec mt_proc_Create_ID_Update 'actadl50DetailReports' ,'MerchandiseCategory'
exec mt_proc_Create_ID_Update 'actadl50DetailReports' ,'MerchandiseSubCat'
exec mt_proc_Create_ID_Update 'actadl50DetailReports' ,'Category'


exec mt_proc_Create_DisplayTables_AD 'actadl50'


