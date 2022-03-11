Select Distinct MerchandiseSubCat,Category,Brand,Comments1,Manufacturer,SKUDescription2,SKUDescription3,ProductTerritoryGroup 
from SQL09..hasADLDetailReports 
Where MerchandiseSubCat='TOYS' 

Alter table SQL09..hasADLDetailReports  Alter Column Manufacturer Varchar(50)
Alter table SQL09..hasADLDetailReports  Alter Column ProductTerritory Varchar(50)
Alter table SQL09..hasADLDetailReports  Alter Column ProductTerritorySubGroup Varchar(50)
Alter table SQL09..hasADLDetailReports  Alter Column ProductTerritoryGroup Varchar(50)

Update PDT 
Set Manufacturer = T.Manufacturer_Trademark, ProductTerritory=T.SKU2_Trademark_Owner, 
ProductTerritorySubGroup=T.SKU3_Parent_Company, ProductTerritoryGroup=T.ProductTerritoryGroup_Manufacturer
From SQL09..hasADLDetailReports PDT
Join MT2SQL14.SiteControl.dbo.hasADLToysDurable T
On T.MerchandiseSubCat=PDT.MerchandiseSubCat
And T.Category=PDT.Category
And T.Brand=PDT.Brand
And T.Comments1=PDT.Comments1


Exec mt_proc_Create_ID_Update 'hasADLDetailReports', 'Manufacturer'
Exec mt_proc_Create_ID_Update 'hasADLDetailReports', 'ProductTerritory'
Exec mt_proc_Create_ID_Update 'hasADLDetailReports', 'ProductTerritorySubGroup'
Exec mt_proc_Create_ID_Update 'hasADLDetailReports', 'ProductTerritoryGroup'

Exec mt_proc_Create_DisplayTables_AD 'hasADL'