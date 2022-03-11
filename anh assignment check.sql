--drop table tempdb..anh50temp
 select Distinct a.Category, a.Brand, a.MPVVariety, ISNULL(a.ProductTerritory, '') as [Brand Family(PT)], ISNULL(a.ProductTerritorySubGroup, '') as [SubSegment(PTSG)], isnull(a.productterritorygroup, '') as [Segment(PTG)], isnull(a.Manufacturer, '') as [Parent Company(MFR)], isnull(a.ParentCompany, '') as [Parent Company Group(PC)]
into tempdb..anh50temp from MT2SQL08.SQL08.DBO.anh50DetailReports a with (nolock)


--------Start Krunal ---------------

select * from tempdb..anh50temp a
join mt2sql14.sitecontrol.dbo.anh50productterritory b
on a.Category=b.category and a.Brand = b.Brand and
b.variety=a.mpvVariety
join mt2sql14.sitecontrol.dbo.anhMfrUpdate c
on a.Category=c.category and
a.Brand=c.brand
join mt2sql14.sitecontrol.dbo.anhpcgroupassign d
on a.Category=d.category and
a.Brand=d.brand
Where (a.[Brand Family(PT)] != b.ProductTerritory and
 a.[SubSegment(PTSG)] != b.ProductTerritorySubGroup and
 a.[Segment(PTG)] != b.ProductTerritoryGroup)
 or 
 a.[Parent Company(MFR)] != C.manufacturer
 or 
 a.[Parent Company Group(PC)] != d.parentcompany 