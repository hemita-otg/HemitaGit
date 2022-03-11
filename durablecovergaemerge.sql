select distinct MerchandiseCategory,MerchandiseSubCat,Category,year(addate) as AdYear,'Circular' as media,COUNT(PageDetailID) as #ofrecords
 from ADR50DetailReports --where category in (select categoryname from tempdb..durablecats)
 group by MerchandiseCategory,MerchandiseSubCat,Category,year(addate),media
 union all
 select distinct MerchandiseCategory,MerchandiseSubCat,Category,year(addate) as AdYear,'Email Promotion' as media,COUNT(PageDetailID) as #ofrecords
 from emla50DetailReports
 group by MerchandiseCategory,MerchandiseSubCat,Category,year(addate),media
 union all
 select distinct MerchandiseCategory,MerchandiseSubCat,Category,year(addate) as AdYear,'Web Promotion' as media,COUNT(PageDetailID) as #ofrecords
 from wbadlDetailReports
 group by MerchandiseCategory,MerchandiseSubCat,Category,year(addate),media
 order by 1,2,3



