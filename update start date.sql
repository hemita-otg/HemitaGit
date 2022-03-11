select distinct  clientname,b.category,startdate,a.* from MasterClientCoverage..MasterClientCWMpep a
 join mt2sql14.sitecontrol.dbo.vw_catinfo b 
 on a.categorycodeid=b.categorycodeid
where startdate < '2019-01-01 00:00:00.000'
and b.categorycodeid= 7222
--and b.categorycodeid in (5938,7222,9366,9367,9371,9359,8331,8330,5943,8335,8327,9381,9361,7089,9368,9369,9380,9382,9362,5932,7180,7223,9383,9374,9376,9379,9378,9377,9363,9370,9353,9364,8323,9385,5925,9386)
and b.category not in ('DEBAC','moetPEP','pbcPEP')
order by 1


DEBAC
moetPEP
pbcPEP


select count(1) from krapepdetailreports