select distinct category,brand,manufacturer,productterritory,mpvorigin from mt2sql07.sql07.dbo.cwudetailreports where category = 'Wine' and brand = 'Annabella 5' and manufacturer = 'NAPA WINE CO' and productterritory = 'SUPER PREMIUM $11.00 - $14.99'


select * from mt2sql14.sitecontrol.dbo.vw_catinfo where clientname like '%b&g%'

select * from mt2sql13.masteracfv.dbo.acfvdetailreports
                                                
SELECT column_name FROM mt2sql13.masteracfv.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'acfvdetailreports'
 
select * from mt2dev0.apimapractice.information_schema.columns where TABLE_NAME='acretmkt'

use ApimaPractice
select * from  acretmkt where Retailer like '%safew%' order by 1,2