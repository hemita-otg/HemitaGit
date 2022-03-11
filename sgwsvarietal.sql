select * from sgwswinevaietal 
where variety like '%Zweigelt, Rose%'

select distinct category,isnull(mpvvariety,''),isnull(skudescription1,'')
from mt2sql07.sql07.dbo.swstest50detailreports
where mpvvariety = 'Remole'
order by 1,2,3

select * from mt2sql07.sql07.dbo.swstest50mpvvariety
where variety like '%(Empty); Cabernet Sauvignon%'


select merchandisesubcat,category,isnull(mpvvariety,''),isnull(skudescription1,'')
from  mt2sql07.sql07.dbo.swstest50detailreports
where flyerid=21690818
and merchandisesubcat='wine'


--update sgwswinevaietal set variety='Cabernet Sauvignon' where variety='(Empty); Cabernet Sauvignon' and category='Wine' and skudescription1='Cabernet Sauvignon'
update sgwswinevaietal set variety='Ancestor Red' where variety='Ancestor Red' and category='Wine' and skudescription1='Selected/Assorted'
update sgwswinevaietal set variety='Blend, Red' where variety='Angeli Cuvee; Blend, Red' and category='Wine' and skudescription1='Red'
update sgwswinevaietal set variety='Bella''s Blend' where variety='Bella''s Blend' and category='Wine' and skudescription1='Selected/Assorted'
update sgwswinevaietal set variety='Blancaneaux' where variety='Blancaneaux' and category='Wine' and skudescription1='Selected/Assorted'
update sgwswinevaietal set variety='Bubbles/Rose' where variety='Bubbles; Bubbles/Rose' and category='Wine' and skudescription1='Rose'
update sgwswinevaietal set variety='Chardonnay, Viura &amp' where variety='Chardonnay, Viura &amp; Muscat' and category='Wine' and skudescription1='Selected/Assorted'
update sgwswinevaietal set variety='Chardonnay, Viura &amp' where variety='Chardonnay, Viura &amp; Muscat; Garnacha Crianza; Rose' and category='Wine' and skudescription1='Selected/Assorted'
update sgwswinevaietal set variety='Chardonnay, Viura &amp' where variety='Chardonnay, Viura &amp; Muscat; Garnacha; Rose' and category='Wine' and skudescription1='Selected/Assorted'
update sgwswinevaietal set variety='Chardonnay/Chenin Blanc' where variety='Chardonnay/Chenin Blanc' and category='Wine' and skudescription1='Chardonnay/Chenin Blanc'
