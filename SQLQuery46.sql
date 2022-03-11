select * from ACFVDetailReports
where
category in ('Baking Ingredients', 'Baking Mixes', 'Gravies', 'Sauces&Mixes', 'Marinades', 'Soup - Dry/Mixes') and brand like '%McCormick%'
and media = 'circular' and advertiser like '%kroger%' 
and year(addate) in (2017,2018)
order by 1,2


select  addate, weekof, advertiser, market, Comments3, manufacturer, category, media from sql16..acfvdetailreports where originalpagedetailid in 
(225625662,225627645,225627849,225627887,221753518,221748323,221748487,221748571,220297971,220292123)
and advertiser in ('Dollar General Market', 'Dollar General') and market in ('Chicago, IL','Orlando, FL')
order by addate desc 


select * from TFPEPdetailreports