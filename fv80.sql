use Subscription
select  clientname,FV40,* from ClientProfile where clientname in (
select distinct clientname from sitecontrol..vw_catinfo where   clientname like '%acost%' )

use Subscription
select distinct FV40 from vwUser where clientid in (
select distinct clientid from sitecontrol..vw_catinfo where   clientname like '%acost%' )

--select * from ArchiveSub..clientprofile where clientname like '%art van%'

update vwUser set fv40=68 from vwUser where ClientID in (781
,511
,1175
,499
,20
,556
,1265
,95
,98
,303
,1264
,457
,1112
,1188
,1133
,1345
,1330
,543
,1351
,558
,1368
,1037
,1156
,811
,1217
,1246
,1233
,1395
,30
,471
,1193
,306
,501
,1024
,681
,1305
,728
,1427
,1352
,639
,401
,459
,1234
,607
,1183
,711
,1337
,1374
,311
,1285
,1299
,1061
,301
,163
,1251
,1029
,1325
,804
,338
,1236
,1080
,1176
,1404
,440
,554
,883)


update  ClientProfile set fv40=null where clientid in (781
,511
,1175
,499
,20
,556
,1265
,95
,98
,303
,1264
,457
,1112
,1188
,1133
,1345
,1330
,543
,1351
,558
,1368
,1037
,1156
,811
,1217
,1246
,1233
,1395
,30
,471
,1193
,306
,501
,1024
,681
,1305
,728
,1427
,1352
,639
,401
,459
,1234
,607
,1183
,711
,1337
,1374
,311
,1285
,1299
,1061
,301
,163
,1251
,1029
,1325
,804
,338
,1236
,1080
,1176
,1404
,440
,554
,883
)


select distinct fv40,ClientID from vwuser where ClientID in (781
,511
,1175
,499
,20
,556
,1265
,95
,98
,303
,1264
,457
,1112
,1188
,1133
,1345
,1330
,543
,1351
,558
,1368
,1037
,1156
,811
,1217
,1246
,1233
,1395
,30
,471
,1193
,306
,501
,1024
,681
,1305
,728
,1427
,1352
,639
,401
,459
,1234
,607
,1183
,711
,1337
,1374
,311
,1285
,1299
,1061
,301
,163
,1251
,1029
,1325
,804
,338
,1236
,1080
,1176
,1404
,440
,554
,883
) and fv40=44

select fv40, * from vwuser  where clientid=781
select fv40, MasterCategoryCodeID50, IsActiveClient ,  * from clientprofile where clientid=781
update vwclient set mastercategorycodeid50 = 3182 where clientid = 781
select * from clientdatabases where clientid = 781

select * from sitecontrol..categorycode where clientid = 781