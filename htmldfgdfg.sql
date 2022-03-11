
 select * from mt2sql14.sitecontrol.dbo.vw_Catinfo where Clientname like '%beech%' and FVCCType in (2,4)

select * from MasterClientCoverage..MasterClientCWMPEP  where CategoryCodeID = 4811 and retmktid in (select retmktid from MasterClientCoverage..retmktpep where
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

select * from mt2sql17.sql17.dbo.bnutacdisquerypage

 --insert into MasterClientCoverage..MasterClientCWMPEP (ClientId, CategoryCodeID,ACRetMktid,RetID,mktid,retmktid,mediaid,TCID, StartDate)
select 1245,7007,ACRetMktid,RetID,mktid,retmktid,mediaid,TCID,'2015-01-01 00:00:00.000'  from MasterClientCoverage..retmktpep where
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

--insert into MasterClientCoverage..MasterClientCWMPEP (ClientId, CategoryCodeID, ACRetMktid,RetID,mktid,retmktid,mediaid,TCID, StartDate)
select 1216,5887, ACRetMktid,RetID,mktid,retmktid,mediaid,TCID,'2015-01-01 00:00:00.000' from MasterClientCoverage..retmktpep where Advertiser in  ('Safeway NOC','Safeway DEN','Safeway EAS','Safeway POR','Safeway SEA','Safeway SOW')
and media = 'web Promotion'

--insert into MasterClientCoverage..MasterClientCWMPEP (ClientId, CategoryCodeID, ACRetMktid,RetID,mktid,retmktid,mediaid,TCID, StartDate)
select 1216,5887, ACRetMktid,RetID,mktid,retmktid,mediaid,TCID,'2015-01-01 00:00:00.000' from MasterClientCoverage..retmktpep where Advertiser in  ('Amazon.com','Bed Bath & Beyond','Best Buy','Costco Wholesale','CVS','Home Depot','JC Penney','Kmart','Kohl''s','Kroger CIN','Lowe''s Home Improvement','Macy''s','Menards','Rite Aid','Sam''s Club','Sears','Target Stores','Toys - R - Us','Walgreens','Walmart-US')
and media = 'email Promotion'

select * from MasterClientCoverage..MasterClientCWMPEP  where CategoryCodeID = 4803 and retmktid in (
select retmktid from MasterClientCoverage..retmktpep where Advertiser in  ('Safeway NOC','Safeway DEN','Safeway EAS','Safeway POR','Safeway SEA','Safeway SOW')
and media = 'web Promotion') and mediaid in (
select mediaid from MasterClientCoverage..retmktpep where Advertiser in  ('Safeway NOC','Safeway DEN','Safeway EAS','Safeway POR','Safeway SEA','Safeway SOW')
and media = 'web Promotion')