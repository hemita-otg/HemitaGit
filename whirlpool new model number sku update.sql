Update pdt Set SKUDescription3 = T.SKUDescription3
From whcaADLTestDetailReports pdt
Join MT2SQL14.SiteControl.dbo.whcaADLModelNoUpdate T
On ltrim(rtrim(pdt.SKUDescription2)) = ltrim(rtrim(T.ModelNumber)) and replace(replace (ltrim(rtrim(PDT.comments1)),'  ',' '),'  ',' ') = replace (ltrim(rtrim(T.comments1)),'  ',' ') 
where (pdt.category in ('PAIRS - TOP LOAD','PAIRS - FRONT LOAD','HE - PAIRS - TOP LOAD','CAN - BUNDLES','BUNDLES')
or pdt.merchandisesubcat in ('REFRIGERATORS','DISHWASHERS','RANGES/STOVES'))
and isnull(T.SKUDescription3,'')<>''
and isnull(T.SKUDescription3,'')<>isnull(pdt.SKUDescription3,'')


Update pdt Set SKUDescription3 = pdt.SKUDescription2
From whcaADLTestDetailReports pdt
where (pdt.category not in ('PAIRS - TOP LOAD','PAIRS - FRONT LOAD','HE - PAIRS - TOP LOAD','CAN - BUNDLES','BUNDLES')
and pdt.merchandisesubcat not in ('REFRIGERATORS','DISHWASHERS','RANGES/STOVES'))
and isnull(pdt.SKUDescription3,'')=''


exec mt_proc_Create_DisplayTables_AD 'whcaADLTest'

--===========for checking - it should be  0 records==========


--Insert into MT2SQL14.SiteControl.dbo.whcaADLModelNoUpdate
select distinct pdt.SKUDescription2 as ModelNumber,pdt.comments1, PDT.SKUDescription3,'Y'
    from mt2sql05.sql05.dbo.whcaADLTestdetailreports pdt
	left join MT2SQL14.SiteControl.dbo.whcaADLModelNoUpdate T
	on ltrim(rtrim(pdt.SKUDescription2)) = ltrim(rtrim(T.ModelNumber))
	and replace(replace (ltrim(rtrim(PDT.comments1)),'  ',' '),'  ',' ')  = replace (ltrim(rtrim(T.comments1)),'  ',' ') 
	where (pdt.category in ('PAIRS - TOP LOAD','PAIRS - FRONT LOAD','HE - PAIRS - TOP LOAD','CAN - BUNDLES','BUNDLES')
	or pdt.merchandisesubcat in ('REFRIGERATORS','DISHWASHERS','RANGES/STOVES'))
    and T.ModelNumber is null
	order by 1,2,3

--update pdt set SKUDescription3='DW80K7050UG'
	select * 
	from mt2sql05.sql05.dbo.whcaADLTestdetailreports pdt
	left join MT2SQL14.SiteControl.dbo.whcaADLModelNoUpdate T
	on ltrim(rtrim(pdt.SKUDescription2)) = ltrim(rtrim(T.ModelNumber))
	and replace (ltrim(rtrim(PDT.comments1)),'  ',' ') = replace (ltrim(rtrim(T.comments1)),'  ',' ') 
	where (pdt.category in ('PAIRS - TOP LOAD','PAIRS - FRONT LOAD','HE - PAIRS - TOP LOAD','CAN - BUNDLES','BUNDLES')
	or pdt.merchandisesubcat in ('REFRIGERATORS','DISHWASHERS','RANGES/STOVES'))
    and t.modelnumber= '?DW80K7050UG'


--Update SQL05..whcaADLTestDetailReports Set Skudescription2 =
--Replace(Skudescription2,SubString(Skudescription2,PATINDEX('%[^a-zA-Z0-9 ]%',Skudescription2),1),'')
--Where PATINDEX('%[^a-zA-Z0-9 ]%', Skudescription2)>0
--and (category in ('PAIRS - TOP LOAD','PAIRS - FRONT LOAD','HE - PAIRS - TOP LOAD','CAN - BUNDLES','BUNDLES')
--or merchandisesubcat in ('REFRIGERATORS','DISHWASHERS','RANGES/STOVES'))



--select *,len(comments1),
--ROW_NUMBER() over (partition by replace(comments1,char(9),'') order by modelnumber,comments1,skudescription3,reviewed) 
--from MT2SQL14.SiteControl.dbo.whcaADLModelNoUpdate
--where ModelNumber='LSE5613ST'
--and Comments1 like '%Element%w/LDP6797ST/LFXC24726S%'

--select * from (
--select *,
--ROW_NUMBER() over (partition by category,brand order by category,brand) rn 
--from MT2SQL14.SiteControl.dbo.whcaADLModelNoUpdate) x
--where rn>1


--select difference ('6.3cu ft True Convection 5 Element Smooth Top s.tl w/LDP6797ST/LFXC24726S','6.3cu ft True Convection 5 Element Smooth Top s.tl w/LDP6797ST/LFXC24726S')


--SELECT *
--   FROM   MT2SQL14.SiteControl.dbo.whcaADLModelNoUpdate t1
--   CROSS APPLY fnSplit(t1.comments1, ' ') t2
--   WHERE CHARINDEX(t2.Data, t1.comments1) > 0
--   and ModelNumber='LSE5613ST'
--and Comments1 like '%Element%w/LDP6797ST/LFXC24726S%' ;
