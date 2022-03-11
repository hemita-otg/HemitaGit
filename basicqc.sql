--flyer
select distinct a.advertiser,a.market from ACFVflyerReports a with (nolock)
join DEBACDisAdLevelCoverage b on a.retmktid=b.retmktid and a.mediaid=b.MediaId
where a.AdDate>='04/01/2018' --and Advertiser like '%rodman%'
order by 1,2



--detail 2243
select distinct a.advertiser,a.market from ACFVdetailReports a with (nolock)
join DEBACDisAdLevelCoverage b on a.retmktid=b.retmktid and a.mediaid=b.MediaId
join DEBACDisQueryPage c on a.categoryid=c.Categoryid
where a.AdDate>='04/01/2018'
order by 1,2