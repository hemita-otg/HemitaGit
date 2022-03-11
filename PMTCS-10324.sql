select distinct retmktid,mediaid from retmktpep 
where Advertiser in ('Bartell Drug'
,'Discount Drug Mart'
,'Lewis Drug'
,'Bi-Mart'
,'Duane Reade')
and media = 'Email Promotion'
order by 1,2



select distinct retmktid,mediaid from retmktpep 
where Advertiser in ('Adams Super Food Stores'
,'Apple Market'
,'Bi Rite Supermarkets'
,'Buehler''s'
,'Cash Wise Foods'
,'Coborn''s'
,'F.W. Albrecht Grocery'
,'Foodland'
,'Fresh Market'
,'H.G. Hills Food Stores'
,'Hen House Market'
,'Karns Foods'
,'King Kullen'
,'Kings'
,'La Fiesta'
,'Marc Glassman'
,'Met Foods'
,'Miners Super One Foods'
,'O''Brien''s Market'
,'Piggly Wiggly (Carolina)'
,'Riesbeck''s Food Markets'
,'Sentry Foods'
,'SHOP ''n SAVE (Pittsburgh)'
,'Sun Fresh'
,'SunMart Foods'
,'VG''s Grocery'
)
and media = 'web Promotion'
order by 1


select distinct clientname,homepagelink,Advertiser,Market,c.media
from MasterClientCWMPEP a
join mt2sql14.sitecontrol.dbo.vw_catinfo b
on a.CategoryCodeID=b.categorycodeid
join retmktpep c
on a.retmktid=c.retmktid and a.mediaid=c.mediaid
where ((c.Advertiser in ('Bartell Drug'
,'Discount Drug Mart'
,'Lewis Drug'
,'Bi-Mart'
,'Duane Reade')
and media = 'Email Promotion')
or (c.Advertiser in ('Adams Super Food Stores'
,'Apple Market'
,'Bi Rite Supermarkets'
,'Buehler''s'
,'Cash Wise Foods'
,'Coborn''s'
,'F.W. Albrecht Grocery'
,'Foodland'
,'Fresh Market'
,'H.G. Hills Food Stores'
,'Hen House Market'
,'Karns Foods'
,'King Kullen'
,'Kings'
,'La Fiesta'
,'Marc Glassman'
,'Met Foods'
,'Miners Super One Foods'
,'O''Brien''s Market'
,'Piggly Wiggly (Carolina)'
,'Riesbeck''s Food Markets'
,'Sentry Foods'
,'SHOP ''n SAVE (Pittsburgh)'
,'Sun Fresh'
,'SunMart Foods'
,'VG''s Grocery')and media = 'web Promotion'))
and status=1 and (ispdt=1 or clientpdt=1 or cwmfull=1) and fvcctype in (2,4,6)





