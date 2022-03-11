--Ret-Mkt Coverage for Durable Code on MT2SQL14
Select  Distinct CP.ClientId,CP.ClientName,AD.DatabaseCategory as CategoryCode,B.Descrip as Retailer,C.Descrip as Market 
from MT1SQL02.IADlertADmin.dbo.CLRetMkt A
Join MT1SQL02.IADlertADmin.dbo.Rets B
on A.RetId=B.RetId
Join MT1SQL02.IADlertADmin.dbo.Mkts C
on A.MktId=c.MktId 
Join MT1SQL01.MasterData.dbo.ADlertToFV AD
on A.ClientID=AD.ClientID
join MT2SqL14.SiteControl.dbo.CategoryCode CC
on AD.DatabaseCategory=CC.Category
join MT2SqL14.Subscription.dbo.ClientProfile CP
on CC.ClientID=CP.ClientID
 where AD.[Enabled]=1
 and IsAdlert=1 and CC.Category='hbca'
 order by 1,2,3,4,5

--Category Coverage for Durable Code on MT2SQL14
Select CP.ClientId,CP.ClientName,B.DatabaseCategory as CategoryCode,E.Descrip as MerchandiseCategory,D.Descrip as MerchandiseSubCat,C.Descrip as Category
from mt1sql01.master.dbo.vwRemoteAdminServerClientSubCatAll A 
join mt1sql01.masterdata.dbo.ADlertToFV B
on A.ClientID=B.ClientID 
join mt1sql01.masterdata.dbo.subcats C
on A.SubCatId=C.SubCatId 
join mt1sql01.masterdata.dbo.cats D
on C.CatId=D.CatId 
join mt1sql01.masterdata.dbo.grps E
on D.GrpId=E.GrpId
join MT2SqL14.SiteControl.dbo.CategoryCode CC
on B.DatabaseCategory=CC.Category
join MT2SqL14.Subscription.dbo.ClientProfile CP
on CC.ClientID=CP.ClientID
where B.[Enabled]=1 
and IsAdlert=1 and CC.Category='hbca'
order by 1



