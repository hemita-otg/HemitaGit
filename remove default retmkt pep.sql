--For removing rep \ default market from the PEP code, follow below steps : 

--1)	Open Job : ACFV Retailer Market Media Data Refresh (MT2SQL13)
--2)	Go to Step 5 ( Insert Missing Values in RetMktPEP_Test Table ) : 
--And update in below script which is at end of the step script

--Insert default market into masterclientcwmpep--
insert into mt2sql00.masterclientcoverage.dbo.masterclientcwmpep (ClientId,CategoryCodeID,acretmktid,RetID,MktID,retmktid,TCID,StartDate)
select distinct a.clientid,a.categorycodeid,d.acretmktid, d.retid, d.mktid,d.retmktid, d.tcid,'2015-01-01 00:00:00.000'--, d.mediaid,d.advertiser, d.market,d.acretmktid,--, company_nm,c.market  
from masterclientcoverage.dbo.masterclientcwmpep  a
join masterclientcoverage.dbo.retmktpep b on a.RetMktID = b.retmktid and a.categorycodeid not in (4730)
join mt2sql13.ACFVINCR.dbo.ad_DefaultMkt c on b.advertiser = c.company_nm
join masterclientcoverage.dbo.retmktpep d on d.advertiser = c.company_nm and d.market = c.market 
left join masterclientcoverage.dbo.masterclientcwmpep e on a.ClientId=e.ClientId and a.CategoryCodeID=e.CategoryCodeID and d.retmktid=e.retmktid and e.mediaid is null
where e.CategoryCodeID IS NULL
--Insert default market into masterclientcwmpep--
            
                --Add categorycode id in highlighted.


--select * from mt2sql13.ACFVINCR.dbo.ad_DefaultMkt