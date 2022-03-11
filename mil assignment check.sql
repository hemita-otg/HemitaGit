
------------------------------------------------------------------------------------------------------
--drop table tempdb..mil50temp

select Distinct 
a.Category, a.Brand, 
case  
 When a.MPVvariety like ('%;%') 
  Then SUBSTRING(a.MPVVariety,1,charindex(';',a.mpvvariety,1)-1)
 Else MPVVariety
 End as Variety, 
ISNULL(a.ProductTerritory, '') as [Brand Family(PT)], ISNULL(a.ProductTerritorySubGroup, '') as [Segment(PTSG)], isnull(a.productterritorygroup, '') as [Worth Classification(PTG)], isnull(a.Manufacturer, '') as [Brewer(MFR)], isnull(a.ParentCompany, '') as [Brewer Group(PC)], isnull(a.Optional1, '') as [Top Brewer(PCG)]
into tempdb..mil50temp from MT2SQL08.SQL08.DBO.MiL50DetailReports a


------start----Krunal----------------
select * from tempdb..mil50temp a
join mt2sql14.sitecontrol.dbo.mil50productterritory b
on a.Category=b.category and a.brand = b.brand and
b.variety=a.Variety
join mt2sql14.sitecontrol.dbo.MILMfrUpdate c
on a.Category=c.category and
a.Brand=c.brand
join mt2sql14.sitecontrol.dbo.milpcgroupassign d
on a.Category=d.category and
a.Brand=d.brand
where (a.[Brand Family(PT)]!=b.ProductTerritory and
 a.[Segment(PTSG)]!=b.ProductTerritorySubGroup and
 a.[Worth Classification(PTG)]!=b.ProductTerritoryGroup)
 or( 
 a.[Brewer(MFR)]!=C.manufacturer)
 or
 (a.[Brewer Group(PC)]!=d.parentcompany and
 a.[Top Brewer(PCG)]!=d.parentcompanygroup)
----------End-----------