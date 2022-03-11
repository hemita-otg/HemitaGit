-- ANH Weekly Assignment Check
Select Distinct PDT.Category,PDT.Brand,ISNULL(MPV.Variety,'')Variety,ISNULL(PDT.ProductTerritory,'')ProductTerritory,ISNULL(PDT.ProductTerritorySubGroup,'')ProductTerritorySubGroup,
ISNULL(PDT.ProductTerritoryGroup,'')ProductTerritoryGroup,ISNULL(PDT.Manufacturer,'')Manufacturer,ISNULL(PDT.ParentCompany,'')ParentCompany   
From mt2sql08.SQL08.dbo.ANH50DetailReports PDT with (nolock)
Join mt2sql08.SQL08.dbo.ANH50MPVVariety MPV with (nolock)
on PDT.PageDetailID=MPV.PageDetailId 
Order by 1,2,3 


-- MIL Weekly Assignment Check
Select Distinct PDT.Category,PDT.Brand,ISNULL(MPV.Variety,'')Variety,ISNULL(PDT.ProductTerritory,'')ProductTerritory,ISNULL(PDT.ProductTerritorySubGroup,'')ProductTerritorySubGroup,
ISNULL(PDT.ProductTerritoryGroup,'')ProductTerritoryGroup,ISNULL(PDT.Manufacturer,'')Manufacturer,ISNULL(PDT.ParentCompany,'')ParentCompany,ISNULL(Optional1,'')PCG
From mt2sql08.SQL08.dbo.MIL50DetailReports PDT with (nolock)
Join mt2sql08.SQL08.dbo.MIL50MPVVariety MPV with (nolock)
on PDT.PageDetailID=MPV.PageDetailId 
Order by 1,2,3 