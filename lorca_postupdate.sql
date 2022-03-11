-----LORCA50
UPDATE lorca50DetailReports SET ProductTerritory = NULL, PtUpdatedOn = NULL,ProductTerritorySubGroup = NULL, PtsgUpdatedOn = NULL

Exec BatchUpdate 'lorca50',0,1

Exec mt_proc_Create_ID_Update 'lorca50DetailReports', 'ProductTerritory'
Exec mt_proc_Create_ID_Update 'lorca50DetailReports', 'ProductTerritorySubGroup'
Exec mt_proc_Create_DisplayTables 'lorca50' 

-----REVCA
UPDATE revcaDetailReports SET ProductTerritory = NULL, PtUpdatedOn = NULL,ProductTerritorySubGroup = NULL, PtsgUpdatedOn = NULL

Exec BatchUpdate 'revca',0,1

Exec mt_proc_Create_ID_Update 'revcaDetailReports', 'ProductTerritory'
Exec mt_proc_Create_ID_Update 'revcaDetailReports', 'ProductTerritorySubGroup'
Exec mt_proc_Create_DisplayTables 'revca'



