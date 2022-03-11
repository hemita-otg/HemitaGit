select distinct clientname,homepagelink,advertiser,market from MasterClientCWMPEP a
join mt2sql14.sitecontrol.dbo.vw_catinfo b
on a.CategoryCodeID=b.categorycodeid
join retmktpep c
on a.retmktid=c.retmktid
where a.retid=12042803
and clientpdt=1
order by 1,2
