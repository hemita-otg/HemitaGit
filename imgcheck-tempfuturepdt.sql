select distinct flyerid,addate from DigitalCompareCheck where ENTRYPDT !=0 and masterpdt=0
--or ((ENTRYPDT-MasterPDT)>10)
order by addate desc 

select * from masterclientcoverage..tempjapagedetailtable where flyerid = 25206651 (daily trigger data)
select * from masterclientcoverage..tempfuturepdt  where flyerid = 25206651 (prod image pending records)
select * from masteradviewdata..masterpagedetailtable  where flyerid = '25206651' (master data)


select * from MasterClientCoverage..tempjapagedetailtable where prodimagecreated!=1



select  * from masterclientcoverage..tempfuturepdt 
where flyerid in (select distinct flyerid 
	from DigitalCompareCheck where ENTRYPDT !=0 and masterpdt=0 or ((ENTRYPDT-MasterPDT)>10))
