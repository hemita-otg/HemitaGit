Select Distinct * 
--into tempdb..tempquery
from SavedQueries A with(nolock) 
join SavedQueriesDetail B with(nolock) 
on A.QueryID=B.QueryID 
join sitecontrol.dbo.vw_catinfo X
on A.CategoryCodeId=X.CategoryCodeId
join Subscription.dbo.vwUser C
on A.UserId=C.UserID
where A.CategoryCodeId in (3130,2907,2908,2975,2950,3198)
--and C.SiteAccess=1 
--and C.[Type]=1 
and B.SessionIDName='display14' 
--and( B.SessionIDValue like '%495%' or B.SessionIDValue like '%518%' or B.SessionIDValue like '%595%' )
--and A.starttime >= '05/02/2018' and A.endtime <= '05/02/2019'
order by 1,2,3,4,5

select * from SiteControl..MasterFields
where FieldName like '%comments3%'


select * from SavedQueriesDetail a
join SavedQueries b
on A.QueryID=B.QueryID 
join sitecontrol.dbo.vw_catinfo c
on b.CategoryCodeId=c.CategoryCodeId
where (sessionidvalue like '%Algae Oil%'
or sessionidvalue like '%Avocado Oil%'
or sessionidvalue like '%Basting Oil%'
or sessionidvalue like '%Coconut Oil%'
or sessionidvalue like '%Cooking Oil%'
or sessionidvalue like '%Dipping Oil%'
or sessionidvalue like '%Grapeseed Oil%'
or sessionidvalue like '%MCT Oil%'
or sessionidvalue like '%Oil-Bulk%'
or sessionidvalue like '%Oive Oil%'
or sessionidvalue like '%Olive Oil%'
or sessionidvalue like '%Pomace Oil%'
or sessionidvalue like '%Safflower Oil%'
or sessionidvalue like '%Sesame Oil%'
or sessionidvalue like '%SunCoco Oil%'
or sessionidvalue like '%Truffle Oil%'
or sessionidvalue like '%Walnut Oil%')
and ((clientname ='ACH Food Companies' and homepagelink ='Detail Data (PEP)') or
(clientname ='Acosta' and homepagelink ='Detail Data (PEP)') or
(clientname ='Advantage Sales & Marketing' and homepagelink ='Detail Data (PEP)') or
(clientname ='Ahold' and homepagelink ='Detail Data (PEP)') or
(clientname ='Allegiance Retail Services' and homepagelink ='Detail Data (PEP)') or
(clientname ='Alliance Sales & Marketing' and homepagelink ='Detail Data (PEP)') or
(clientname ='Apex Marketing & Sales' and homepagelink ='Detail Data') or
(clientname ='AWG' and homepagelink ='Detail Data (PEP)') or
(clientname ='B&G Foods' and homepagelink ='Detail Data (PEP)') or
(clientname ='Beacon United' and homepagelink ='Detail Data (PEP)') or
(clientname ='Big Lots Stores, Inc' and homepagelink ='Detail Data (PEP)') or
(clientname ='Bimbo Bakeries USA' and homepagelink ='Detail Data (PEP)') or
(clientname ='Bozzuto''s' and homepagelink ='Detail Data (PEP)') or
(clientname ='C&S Wholesale Grocers' and homepagelink ='Detail Data (PEP)') or
(clientname ='Campbell Soup' and homepagelink ='Detail Data (PEP)') or
(clientname ='Coborn' and homepagelink ='Detail Data (PEP)') or
(clientname ='ConAgra Foods' and homepagelink ='Detail Data (PEP)') or
(clientname ='Crossmark' and homepagelink ='Detail Data (PEP)') or
(clientname ='CVS' and homepagelink ='Detail Data (PEP)') or
(clientname ='Dare Foods US and Canada' and homepagelink ='Detail Data (PEP)') or
(clientname ='Del Monte' and homepagelink ='Detail Data (PEP)') or
(clientname ='Empire Marketing' and homepagelink ='Detail Data (PEP)') or
(clientname ='Family Dollar' and homepagelink ='Detail Data (PEP)') or
(clientname ='Family Dollar' and homepagelink ='Price Pulse') or
(clientname ='Ferrero USA' and homepagelink ='Detail Data (PEP)') or
(clientname ='Firestone' and homepagelink ='Detail Data (PEP)') or
(clientname ='Flowers Food' and homepagelink ='Detail Data (PEP)') or
(clientname ='Fresh Thyme' and homepagelink ='Detail Data (PEP)') or
(clientname ='General Mills' and homepagelink ='Detail Data (PEP)') or
(clientname ='Giant Eagle' and homepagelink ='Detail Data (PEP)') or
(clientname ='Hormel' and homepagelink ='Detail Data (PEP)') or
(clientname ='Impact Group' and homepagelink ='Detail Data (PEP)') or
(clientname ='Kellogg Company' and homepagelink ='Detail Data (PEP)') or
(clientname ='Key Food' and homepagelink ='Detail Data (PEP)') or
(clientname ='Kikkoman Sales USA' and homepagelink ='Detail Data (PEP)') or
(clientname ='KKM' and homepagelink ='Detail Data') or
(clientname ='Lidl' and homepagelink ='Detail Data (PEP)') or
(clientname ='Lindt' and homepagelink ='Detail Data (PEP)') or
(clientname ='Lucky''s Market' and homepagelink ='Detail Data (PEP)') or
(clientname ='Mars Wrigley Confectionery U.S.' and homepagelink ='Detail Data (PEP)') or
(clientname ='McCormick & Co' and homepagelink ='Detail Data (PEP)') or
(clientname ='Meijer' and homepagelink ='Detail Data (PEP)') or
(clientname ='Mizkan America' and homepagelink ='Detail Data (PEP)') or
(clientname ='Nature''s Way' and homepagelink ='Detail Data (PEP)') or
(clientname ='Numerator - Cover to Cover & Black Friday' and homepagelink ='Cover-To-Cover Consumables (PEP)') or
(clientname ='Numerator - PEP Manufacturer' and homepagelink ='Detail Data (PEP) - ACFVM') or
(clientname ='Numerator - PEP Research' and homepagelink ='MTA Research') or
(clientname ='Numerator - PEP Retailer' and homepagelink ='Detail Data (PEP) - ACFVR') or
(clientname ='Office Depot Inc.' and homepagelink ='Detail Data - Break Room Categories (PEP)') or
(clientname ='Pinnacle Foods' and homepagelink ='Detail Data (PEP)') or
(clientname ='Pompeian, Inc.' and homepagelink ='Detail Data (PEP)') or
(clientname ='Premio Foods' and homepagelink ='Detail Data (PEP)') or
(clientname ='Price Chopper' and homepagelink ='Detail Data (PEP)') or
(clientname ='RecorGroup' and homepagelink ='Detail Data (PEP)') or
(clientname ='Rite-Aid' and homepagelink ='Detail Data (PEP)') or
(clientname ='Roundys' and homepagelink ='Detail Data (PEP)') or
(clientname ='Save A Lot' and homepagelink ='Detail Data (PEP)') or
(clientname ='Save Mart Supermarkets' and homepagelink ='Detail Data (PEP)') or
(clientname ='Schnuck Markets' and homepagelink ='Detail Data (PEP)') or
(clientname ='Southeastern Grocers' and homepagelink ='Detail Data (PEP)') or
(clientname ='Sprouts Farmers Market' and homepagelink ='Detail Data (PEP)') or
(clientname ='Staples' and homepagelink ='Detail Data (PEP)') or
(clientname ='Supervalu' and homepagelink ='Detail Data (PEP)') or
(clientname ='TABS Group' and homepagelink ='Detail Data (PEP)') or
(clientname ='Target' and homepagelink ='Frequency & Discretionary (PEP)') or
(clientname ='Target' and homepagelink ='Price Pulse') or
(clientname ='The Fresh Market' and homepagelink ='Detail Data (PEP)') or
(clientname ='The J.M. Smucker Company' and homepagelink ='Detail Data (PEP)') or
(clientname ='The Moscoe Group' and homepagelink ='Detail Data (PEP)') or
(clientname ='Times Supermarket' and homepagelink ='Detail Data (PEP)') or
(clientname ='Topco Associates' and homepagelink ='Detail Data (PEP)') or
(clientname ='Tree Top' and homepagelink ='Detail Data (PEP)') or
(clientname ='Unilever US' and homepagelink ='Detail Data (PEP)') or
(clientname ='UTZ Quality Foods' and homepagelink ='Detail Data (PEP)') or
(clientname ='Valassis Communications, Inc' and homepagelink ='Detail Data (PEP)') or
(clientname ='Wakefern' and homepagelink ='Detail Data (PEP)') or
(clientname ='Walgreens' and homepagelink ='Detail Data (PEP)') or
(clientname ='Walmart' and homepagelink ='FSI Detail Data (PEP)') or
(clientname ='Walmart' and homepagelink ='US Consumables (PEP)') or
(clientname ='Weis Markets' and homepagelink ='Detail Data (PEP)') or
(clientname ='Welch''s' and homepagelink ='Detail Data') or
(clientname ='Whole Foods' and homepagelink ='Detail Data (PEP)'))



select * from sitecontrol.dbo.vw_catinfo
where ClientName like '%nestle%'