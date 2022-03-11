select distinct PkgSize, UnitType, mpvVariety, mpvOrigin, comments1 from gal50DetailReports
where category in ('Beer','Beer Alternatives','Blended Whisky','Brandy','Canadian Whisky','Cordials & Liqueurs','Dessert Wines','Gin','Rum','Scotch Whisky','Sparkling Wines','Spirit Cocktails','Straight Bourbon Whiskey','Tequila','Vodka','Wine')
--and originalpagedetailid in (select pagedetailid from masterclientcoverage..TempJAPageDetailTable)

select distinct PkgSize, UnitType, mpvVariety, comments1 from dmfCAN50DetailReports
where category in (select category from MasterClientCoverage..JaAllDisplayCategory)
--and originalpagedetailid in (select pagedetailid from masterclientcoverage..TempJAPageDetailTable)


select distinct category,PkgSize, UnitType, mpvVariety,MPVOrigin, comments1 from pfcaDetailReports
where merchandisesubcat='produce'
and originalpagedetailid in (select pagedetailid from masterclientcoverage..TempJAPageDetailTable)

select * from masterclientcoverage..TempJAPageDetailTable
where category in ('Beer','Beer Alternatives','Blended Whisky','Brandy','Canadian Whisky','Cordials & Liqueurs','Dessert Wines','Gin','Rum','Scotch Whisky','Sparkling Wines','Spirit Cocktails','Straight Bourbon Whiskey','Tequila','Vodka','Wine')


select distinct merchandisesubcat,category from dmfCAN50DetailReports

select * from MasterClientCoverage..JaAllDisplayCategory

select distinct merchandisecategory,merchandisesubcat,category from scica50disquerypage

