--exec mt_proc_Create_ID_Update 'ronca50detailreports','productterritorysubgroup'
--exec mt_proc_Create_DisplayTables 'ronca50'



select distinct productterritorysubgroup,productterritorysubgroupid from ronca50DetailReports order by 1
select distinct productterritorysubgroup,productterritorysubgroupid from ronca50disquerypage


--update ronca50detailreports set ProductTerritorySubGroup = '' where ProductTerritorySubGroup is null