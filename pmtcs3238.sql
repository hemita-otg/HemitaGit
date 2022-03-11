Select Distinct M.* from MasterAdviewData..AdviewMain C
Join MasterBevALDetailReports M
on C.FlyerIdInt = M.FlyerId
Where Advertiser like '%AJs%' and Publication like '%Arizona%'
and year(addate) in (2018,2017)



Select * from MasterBevALDetailReports M
Join SQL07..SWStest50FlyerReports C
on C.FlyerId = M.FlyerId
Where Advertiser like '%AJs%' and Publication='Arizona Republic'
and year(addate) in (2018,2017)