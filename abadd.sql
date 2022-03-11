select distinct  b.clientid,b.ClientName from clientdatabases a
join sitecontrol.dbo.vw_catinfo b on a.ClientID=b.ClientID
join ClientProfile c on a.ClientID=b.ClientID
where a.yourweb like '%Black Friday Digital Promotions%' and
 b.IsAdlert=1 and b.clientname not like '%canada%' and a.Status=1 --and b.isinternal=1 

 -- insert into clientdatabases (ClientID,yourweb,ClientCode,AllSequence,AllRow,AllBold,AllColor,AllFont,AllFontSize,AllBackGround,
 HomePageLink,CategoryCodeID,status)
 select  distinct a.ClientID,'Black Friday Digital Promotions',a.ClientCode,11,1,0,'#000000','Tahoma',1,'#C0C0C0','Black Friday Digital Promotions',
 9429,0
  from clientdatabases a
 join sitecontrol.dbo.vw_catinfo b on a.ClientID=b.ClientID
 where b.IsAdlert=1 and b.clientname not like '%canada%' and b.isinternal=0 and a.ClientCode is not null and
  ClientCode not in ('bui','lnvcan') and a.clientid not in (68,94,123)




 --select * into tempdb..clientdatabases from clientdatabases  

 