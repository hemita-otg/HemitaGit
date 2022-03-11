-------------------retmkt coverage--------------------

if exists (select 1 from INFORMATION_SCHEMA.TABLES where TABLE_TYPE='BASE TABLE' and TABLE_NAME='pepretmktcoverage')
drop table pepretmktcoverage

select * into pepretmktcoverage from (
select a.clientid,d.clientname,a.category,b.categorycodeid,'Circular'media,
count(distinct b.retmktid) as totalretmktcount
from mt2sql14.sitecontrol.dbo.categorycode a
join mt2sql00.masterclientcoverage.dbo.masterclientcwmpep b on a.id=b.categorycodeid
join (select distinct retmktid from mt2sql00.masterclientcoverage.dbo.retmktpep) c on b.retmktid=c.retmktid and b.mediaid is null
join mt2sql14.subscription.dbo.clientprofile d on a.clientid=d.clientid
where a.fvcctype in (2,4,6) 
group by a.clientid,d.clientname,a.category,b.categorycodeid
union
select a.clientid,d.clientname,a.category,b.categorycodeid,c.media,
count(distinct b.retmktid) as totalretmktcount 
from mt2sql14.sitecontrol.dbo.categorycode a
join mt2sql00.masterclientcoverage.dbo.masterclientcwmpep b on a.id=b.categorycodeid
join mt2sql00.masterclientcoverage.dbo.retmktpep c on b.retmktid=c.retmktid and b.mediaid = c.mediaid
join mt2sql14.subscription.dbo.clientprofile d on a.clientid=d.clientid
where a.fvcctype in (2,4,6) and c.media in ('fsi','Web Promotion','Email Promotion')
group by a.clientid,d.clientname,a.category,b.categorycodeid,c.media) as x
order by clientname 


------------------category coverage count-----------------

if exists (select 1 from INFORMATION_SCHEMA.TABLES where TABLE_TYPE='BASE TABLE' and TABLE_NAME='pepcategorycoverage')
drop table pepcategorycoverage

select a.clientid,d.clientname,a.category,c.categorycodeid,c.mctemplateid,count(c.realcategory) as totalcatcount
into pepcategorycoverage
from mt2sql14.sitecontrol.dbo.categorycode a
join mt2sql14.sitecontrol.dbo.vw_merchandisecategory c on a.id=c.categorycodeid 
join mt2sql14.subscription.dbo.clientprofile d on a.clientid=d.clientid
where a.fvcctype in (2,4,6)
group by a.clientid,d.clientname,a.category,c.categorycodeid,c.mctemplateid
order by clientname

------------email setup---------------
Exec MT2SQL00.master.dbo.sp_procExportData
    @subject= 'Daily PEP Clients RetMkt/Category Coverage Count - <datetime>'
    , @filename= 'Daily PEP Clients Coverage Count - <datetime>'
    , @message = 'Please find attachment containing Coverage Count for PEP Codes :'
    , @recipients = 'vkantawala@markettrack.com'
    , @cc_recipients = 'pmakwana@markettrack.com;krunals@markettrack.com;hbhagat@markettrack.com'
    , @tabname='Retmkt_Coverage;Category_Coverage'
    , @servername = 'MT2DEV0'
    , @dbname = 'apimapractice'
    , @query = 'Select * from pepretmktcoverage;Select * from pepcategorycoverage'
    , @exporttype = 'Excel'

