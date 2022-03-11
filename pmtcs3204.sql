use sql05



select distinct Category from whcaADLDetailReports order by 1
where Category in ('CHOPPERS'
,'HE - DRYERS - FRONT LOAD'
,'HE-WASHERS/DRYERS-OTHER'
,'WARMER DRAWERS'
,'WASHER/DRYERS -ALL INONE'
)


select  distinct MerchandiseCategory,MerchandiseSubCat,Category from whcaADLDetailReports
where Category= 'BEVERAGE DISPENSERS'


/*
update whcaADLDetailReports set Category = 'WARMER DRAWERS' where category = 'CAN - WARMER DRAWERS'
update whcaADLDetailReports set Category = 'BUNDLES' where category = 'CAN - BUNDLES'
update whcaADLDetailReports set Category = 'HE - DRYERS - FRONT LOAD' where category = 'CAN - HE - DRYERS - FRONT LOAD'
update whcaADLDetailReports set Category = 'HE-WASHERS/DRYERS-OTHER' where category = 'CAN - HE-WASHERS/DRYERS-OTHER'
update whcaADLDetailReports set Category = 'WASHER/DRYERS -ALL INONE' where category = 'CAN - WASHER/DRYERS -ALL INONE'
*/



exec mt_proc_Create_ID_Update 'whcaADLDetailReprorts','Category'
exec mt_proc_Create_ID_Update 'whcaADLDetailReports','Merchandisesubcat'
exec mt_proc_Create_ID_Update 'whcaADLDetailReports','MerchandiseCategory'



exec mt_proc_Create_DisplayTables_AD 'whcaADL'