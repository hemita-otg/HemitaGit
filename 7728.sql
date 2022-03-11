select distinct clientname,HomePageLink,FieldName,DisplayName,DisplaySeq from 
vw_QvfcFields a
join vw_MerchandiseCategory b
on a.CategoryCodeId=b.CategoryCodeId
join vw_catinfo c
on a.CategoryCodeId=c.CategoryCodeId
where a.CategoryCodeid  in (5938,7222,9366,9367,9359,5943,8335,9387,8327,9381,7089,9368,9362,5932,7223,9374,9370,9386,9364)
and FieldName in ('origin','variety')
--and RealCategory like '%wine%'
and FVCCType in (2,4,6)
order by 1,2
