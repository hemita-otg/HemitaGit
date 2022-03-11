

select distinct aa.clientid,aa.clientname,cc.category,cc.clientfullrundate from mt2sql14.sitecontrol.dbo.categorycode cc
join mt2sql14.subscription.dbo.clientprofile aa
on aa.clientid=cc.clientid
where cc.fullsourcecode like '%MasterBevAl..MasterBevAl%' order by 4 

--update mt2sql14.sitecontrol.dbo.categorycode set isfull=1 where category in ('wbgnv','cwu')


--Update Mt2SQL14.SiteControl.dbo.CategoryCode Set Cwmfull = 1,  IsPdt = 1, ClientPdt = 1
Where Category in  ('GENCA50T','GEN50FLX','GENCA50') 