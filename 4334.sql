

--insert into mt2sql00.masterclientcoverage.dbo.masterclientcwmpep(clientid,categorycodeid,acretmktid,retid,mktid,retmktid,tcid,startdate)
select distinct b.clientid,B.CategoryCodeID,C.Advertiser,'Eugene, OR' Market
from masterclientcwmpep a
join mt2sql14.sitecontrol.dbo.vw_catinfo b 
on a.CategoryCodeID=b.categorycodeid
join retmktpep c
on c.retmktid=a.retmktid and a.mediaid=c.mediaid
where b.fvcctype in (2,4,6) and (CWMFull=1 or ClientPDT=1)
and b.CategoryCodeID in (4620,4793,4802,4804,4818,5901,7020,7021,7032,7067,7076,7124,7129,7153,7169,7174,7270)
--and b.category in ('firPeP','fblPEP','gskPEP','HALPEP','HPHPEP','kelPEP','ltrPEP','ACFVO','ACFVT','FRDataPeP','acfvm','PepPep','PGOPEP','rbPEP','sffPEP')
and c.advertiser in ('Albertson''s - IMW (SVU)','Albertsons NW','Bed Bath & Beyond','Best Buy','Big Lots','Cost Plus World Market','Costco Wholesale','Dollar General','Dollar Tree','Fred Meyer Stores','Gamestop','Home Depot','JC Penney','JoAnn Fabric and Craft Stores','Kohl''s','Lowe''s Home Improvement','Macy''s','Market of Choice','Michaels','Napa Auto Parts','Office Depot','OfficeMax','O''Reilly Auto Parts','Petco','Petsmart','RadioShack','Ray''s Food Place','Rite Aid','Safeway POR','Safeway Stores','Sears','Select Markets','Shopko Stores','Staples','Super Target','Target Stores','Toys - R - Us','Walgreens','Walmart Neighborhood Market','Walmart-US')
order by 1,2

select distinct advertiser,acretmktid,retid,mktid,retmktid,tcid
from retmktpep
where advertiser in ('Albertson''s - IMW (SVU)','Albertsons NW','Bed Bath & Beyond','Best Buy','Big Lots','Cost Plus World Market','Costco Wholesale','Dollar General','Dollar Tree','Fred Meyer Stores','Gamestop','Home Depot','JC Penney','JoAnn Fabric and Craft Stores','Kohl''s','Lowe''s Home Improvement','Macy''s','Market of Choice','Michaels','Napa Auto Parts','Office Depot','OfficeMax','O''Reilly Auto Parts','Petco','Petsmart','RadioShack','Ray''s Food Place','Rite Aid','Safeway POR','Safeway Stores','Sears','Select Markets','Shopko Stores','Staples','Super Target','Target Stores','Toys - R - Us','Walgreens','Walmart Neighborhood Market','Walmart-US')
and Market = 'Eugene, OR' and Media='circular'
