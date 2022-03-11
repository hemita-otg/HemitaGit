select distinct advertiser,market from cccacDetailReports
where retmktid in (select  distinct new_retmktid  from mt2sql00.masterclientcoverage.dbo.RetMktpep_8306)
order by 1,2


select distinct advertiser,market from cccacDetailReports
where ((advertiser = 'Ace Hardware' and market ='Indianapolis, IN') Or
(advertiser = 'Aldi' and market ='Indianapolis, IN') Or
(advertiser = 'Aldi' and market ='Newark, NJ') Or
(advertiser = 'Bed Bath & Beyond' and market ='Indianapolis, IN') Or
(advertiser = 'Best Buy' and market ='Indianapolis, IN') Or
(advertiser = 'Big Lots' and market ='Newark, NJ') Or
(advertiser = 'Bomgaars' and market ='Denver, CO') Or
(advertiser = 'Cardenas Markets' and market ='Concord, CA') Or
(advertiser = 'Cooper''s Foods' and market ='Minneapolis, MN') Or
(advertiser = 'Cost Plus World Market' and market ='Indianapolis, IN') Or
(advertiser = 'Cost Plus World Market' and market ='Newark, NJ') Or
(advertiser = 'CVS' and market ='Indianapolis, IN') Or
(advertiser = 'CVS' and market ='Newark, NJ') Or
(advertiser = 'Dollar General' and market ='Boulder, CO') Or
(advertiser = 'Dollar Tree' and market ='Chicago, IL') Or
(advertiser = 'Family Dollar' and market ='Chicago, IL') Or
(advertiser = 'Gamestop' and market ='Indianapolis, IN') Or
(advertiser = 'Gamestop' and market ='Newark, NJ') Or
(advertiser = 'Gamestop' and market ='Chicago, IL') Or
(advertiser = 'Giant Eagle' and market ='Indianapolis, IN') Or
(advertiser = 'Hobby Lobby' and market ='Indianapolis, IN') Or
(advertiser = 'Hobby Lobby' and market ='Minneapolis, MN') Or
(advertiser = 'Home Depot' and market ='Chicago, IL') Or
(advertiser = 'Jewel-Osco (NAI)' and market ='Chicago, IL') Or
(advertiser = 'Kings' and market ='Newark, NJ') Or
(advertiser = 'Kmart' and market ='Chicago, IL') Or
(advertiser = 'Kohl''s' and market ='Indianapolis, IN') Or
(advertiser = 'Kroger Central' and market ='Indianapolis, IN') Or
(advertiser = 'Lucky''s Market' and market ='Boulder, CO') Or
(advertiser = 'Macy''s' and market ='Newark, NJ') Or
(advertiser = 'Mariano''s' and market ='Chicago, IL') Or
(advertiser = 'Marsh Supermarkets' and market ='Indianapolis, IN') Or
(advertiser = 'Meijer' and market ='Indianapolis, IN') Or
(advertiser = 'Michaels' and market ='Indianapolis, IN') Or
(advertiser = 'Office Depot' and market ='Philadelphia, PA') Or
(advertiser = 'OfficeMax' and market ='Indianapolis, IN') Or
(advertiser = 'Pet Supplies Plus' and market ='Chicago, IL') Or
(advertiser = 'Petco' and market ='Indianapolis, IN') Or
(advertiser = 'Petco' and market ='Chicago, IL') Or
(advertiser = 'Petsmart' and market ='Indianapolis, IN') Or
(advertiser = 'PriceRite' and market ='Philadelphia, PA') Or
(advertiser = 'RadioShack' and market ='Indianapolis, IN') Or
(advertiser = 'RadioShack' and market ='Newark, NJ') Or
(advertiser = 'RadioShack' and market ='Chicago, IL') Or
(advertiser = 'Raley''s' and market ='Concord, CA') Or
(advertiser = 'Sears' and market ='Newark, NJ') Or
(advertiser = 'ShopRite' and market ='Newark, NJ') Or
(advertiser = 'Sprouts Farmers Market' and market ='Boulder, CO') Or
(advertiser = 'Staples' and market ='Newark, NJ') Or
(advertiser = 'Staples' and market ='Chicago, IL') Or
(advertiser = 'Super Target' and market ='Indianapolis, IN') Or
(advertiser = 'Super Target' and market ='Chicago, IL') Or
(advertiser = 'Target Stores' and market ='Indianapolis, IN') Or
(advertiser = 'Target Stores' and market ='Chicago, IL') Or
(advertiser = 'The Fresh Market' and market ='Indianapolis, IN') Or
(advertiser = 'The Fresh Market' and market ='Newark, NJ') Or
(advertiser = 'Toys - R - Us' and market ='Newark, NJ') Or
(advertiser = 'Tractor Supply Company' and market ='Minneapolis, MN') Or
(advertiser = 'Tractor Supply Company' and market ='Concord, CA') Or
(advertiser = 'Ulta' and market ='Indianapolis, IN') Or
(advertiser = 'Walgreens' and market ='Indianapolis, IN') Or
(advertiser = 'Walgreens' and market ='Newark, NJ') Or
(advertiser = 'Walgreens' and market ='Boulder, CO') Or
(advertiser = 'Walgreens' and market ='Chicago, IL') Or
(advertiser = 'Walmart Neighborhood Market' and market ='Concord, CA') Or
(advertiser = 'Walmart-US' and market ='Indianapolis, IN') Or
(advertiser = 'Walmart-US' and market ='Concord, CA') )
order by 1,2