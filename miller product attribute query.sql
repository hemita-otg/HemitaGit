--Update mt2sql14.sitecontrol.dbo.mil50skuupdate set SKudescription1='6', SKudescription2='', SKudescription3='Bottle or Can' where category='Beer' and unittype='(4x)6 Pack Bottle or Can'
--Update mt2sql14.sitecontrol.dbo.mil50skuupdate set SKudescription1='6', SKudescription2='8 - 16 oz', SKudescription3='Bottle or Can' where category='Beer' and unittype='6 Pack 8 - 16 oz Bottle or Can'

select distinct SKUdescription3 from mt2sql14.sitecontrol.dbo.mil50skuupdate  order by SKUdescription3