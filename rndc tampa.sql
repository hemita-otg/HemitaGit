Select Distinct PDT.MerchandiseCategory [Category Group], PDT.MerchandiseSubCat [Category], PDT.Category ClientSubCategory, BEV.Category RealSubCategory, 
PDT.Brand ClientBrand, BEV.Brand RealBrand,
ISNULL(PDT.Manufacturer,'') Supplier, ISNULL(PDT.ProductTerritory,'') Distributer  
From SQL07..rntaDetailReports PDT
Join MasterBevAL..MasterBevALDetailReports BEV
On PDT.PageDetailID = BEV.PageDetailID 
Order by PDT.Category,PDT.Brand