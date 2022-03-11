select * from MasterAdviewData..MasterPageDetailTable with (nolock)
where (flyerid = 6651168 and PageDetailID  = '1178415M296') or
(flyerid = 6718268 and PageDetailID  = '0062430M512' )




select a.pagedetailid,b.Advertiser,* from MasterAdviewData..MasterPageDetailTable a
join MasterAdviewData..AdviewMain b 
on a.FlyerId=b.FlyerID
where brand = 'Cover Girl Lashblast The SuperSizer'