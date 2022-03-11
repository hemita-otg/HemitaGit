
 select * from mt2sql14.sitecontrol.dbo.vw_Catinfo where Clientname like '%hallma%' and FVCCType in (2,4)

select * from mt2sql00.MasterClientCoverage.dbo.MasterClientCWMPEP  where CategoryCodeID = 7076 and retmktid in (select retmktid from MasterClientCoverage..retmktpep where
(media = 'fsi' and market='Atlanta, GA') or 
(media = 'fsi' and market='Boston, MA') or 
(media = 'fsi' and market='Chicago, IL') or 
(media = 'fsi' and market='Cleveland, OH') or 
(media = 'fsi' and market='Dallas, TX') or 
(media = 'fsi' and market='Los Angeles, CA') or 
(media = 'fsi' and market='Minneapolis, MN') or 
(media = 'fsi' and market='New York, NY') or 
(media = 'fsi' and market='Philadelphia, PA') or 
(media = 'fsi' and market='Seattle, WA'))


 --insert into MasterClientCoverage..MasterClientCWMPEP (ClientId, CategoryCodeID,ACRetMktid,RetID,mktid,retmktid,mediaid,TCID, StartDate)
select 1278,7076,ACRetMktid,RetID,mktid,retmktid,mediaid,TCID,'2015-01-01 00:00:00.000'  from MasterClientCoverage..retmktpep where
(media = 'fsi' and market='Atlanta, GA') or 
(media = 'fsi' and market='Boston, MA') or 
(media = 'fsi' and market='Chicago, IL') or 
(media = 'fsi' and market='Cleveland, OH') or 
(media = 'fsi' and market='Dallas, TX') or 
(media = 'fsi' and market='Los Angeles, CA') or 
(media = 'fsi' and market='Minneapolis, MN') or 
(media = 'fsi' and market='New York, NY') or 
(media = 'fsi' and market='Philadelphia, PA') or 
(media = 'fsi' and market='Seattle, WA')

--insert into mt2sql00.MasterClientCoverage.dbo.MasterClientCWMPEP (ClientId, CategoryCodeID, ACRetMktid,RetID,mktid,retmktid,mediaid,TCID, StartDate)
select 1278,7076, ACRetMktid,RetID,mktid,retmktid,mediaid,TCID,'2015-01-01 00:00:00.000' from mt2sql00.MasterClientCoverage.dbo.retmktpep where Advertiser in  ('Acme Markets (NAI)','Albertsons IM','Albertsons NW','Albertsons SOC','Albertsons SOU','Albertsons SOW','Aldi','Baker''s Supermarkets','Bashas'' Markets','Best Buy','Big Lots','Big Y Foods','BI-LO','Bi-Mart','BJ''s Wholesale Club','Brookshire Grocery','City Market','Copps','Costco Wholesale','Cub Foods','CVS','D & W Fresh Market','D''Agostino Supermarkets','Demoulas Market Basket','Dierbergs','Dillons','Dollar General','Dollar Tree','Duane Reade','Family Dollar','Family Fare Supermarkets','Farm Fresh','Food 4 Less','Food Lion','Foods Co.','Foodtown','Fred Meyer Stores','Fred''s','Fry''s Food & Drug Stores','Gerbes','Giant Eagle','Giant Food Carlisle','Giant Food Landover','H.E.B.','Hannaford Brothers','Harris Teeter','Harvey''s Supermarkets','Hen House Market','hhgregg','Homeland','Hornbachers Foods','Hy-Vee Food Stores','Ingles Markets','Jay C Stores','Jewel-Osco (NAI)','King Soopers','Kmart','Kroger CIN','Kroger CIN Marketplace','Lowes Foods','Lucky Supermarkets','Market Street United','Marsh Supermarkets','Martin''s Foods','Meijer','Office Depot','Owen''s Market','Pay Less Super Markets','Pick ''n Save','Price Chopper (Golub)','Price Chopper (Kansas City)','Publix Super Markets','Quality Food Centers','RadioShack','Ralphs','Rite Aid','Sam''s Club','Save Mart','Schnucks Markets','Shaw''s Supermarket (NAI)','Shop ''n Save (St. Louis)','Shopko Stores','Shoppers Food & Pharmacy','ShopRite','Smart & Final','Smith''s Food & Drug','Staples','Stater Bros','Stop & Shop','Super 1 Foods','Target Stores','Tops Markets','VG''s Grocery','Walgreens','Walmart-US','Weis Markets','Winn Dixie')
and media = 'web Promotion'

--insert into mt2sql00.MasterClientCoverage.dbo.MasterClientCWMPEP (ClientId, CategoryCodeID, ACRetMktid,RetID,mktid,retmktid,mediaid,TCID, StartDate)
select 1278,7076, ACRetMktid,RetID,mktid,retmktid,mediaid,TCID,'2015-01-01 00:00:00.000' from mt2sql00.MasterClientCoverage.dbo.retmktpep where Advertiser in  ('Aldi','Big Lots','BJ''s Wholesale Club','Costco Wholesale','CVS','Dierbergs','Dillons','Dollar Tree','H.E.B.','Harris Teeter','hhgregg','Kmart','Lucky Supermarkets','Meijer','Office Depot','Reasor''s Foods','Rite Aid','Shaw''s Supermarket (NAI)','Shopko Stores','ShopRite','Staples','Super 1 Foods','Walgreens','Walmart-US','Wegmans','Winn Dixie')
and media = 'email Promotion'

select * from mt2sql00.MasterClientCoverage.dbo.MasterClientCWMPEP  where CategoryCodeID = 7076 and retmktid in (
select retmktid from mt2sql00.MasterClientCoverage.dbo.retmktpep where Advertiser in  ('Aldi','Big Lots','BJ''s Wholesale Club','Costco Wholesale','CVS','Dierbergs','Dillons','Dollar Tree','H.E.B.','Harris Teeter','hhgregg','Kmart','Lucky Supermarkets','Meijer','Office Depot','Reasor''s Foods','Rite Aid','Shaw''s Supermarket (NAI)','Shopko Stores','ShopRite','Staples','Super 1 Foods','Walgreens','Walmart-US','Wegmans')
and media = 'web Promotion') and mediaid in (
select mediaid from mt2sql00.MasterClientCoverage.dbo.retmktpep where Advertiser in  ('Aldi','Big Lots','BJ''s Wholesale Club','Costco Wholesale','CVS','Dierbergs','Dillons','Dollar Tree','H.E.B.','Harris Teeter','hhgregg','Kmart','Lucky Supermarkets','Meijer','Office Depot','Reasor''s Foods','Rite Aid','Shaw''s Supermarket (NAI)','Shopko Stores','ShopRite','Staples','Super 1 Foods','Walgreens','Walmart-US','Wegmans')
and media = 'web Promotion')

