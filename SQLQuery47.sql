select distinct advertiser,market,ACRepflag,media from acfvflyerreports 
where Advertiser in ('Albertsons SOC','Aldi','BJ''s Wholesale','Costco','CVS','Dollar General','Dollar Tree','Family Dollar','Food Lion','Fred Meyer Stores','Giant Eagle','Giant Food Landover ','H.E.B.','Hannaford Brothers','Harris Teeter','Hy-Vee Food Stores','Jewel-Osco (NAI)','Kroger CIN','Meijer','Publix Super Markets','Rite Aid','Safeway NOC','Save-A-Lot','ShopRite','Stop & Shop','Target Stores','Vons (NAI)','Walgreens','Walmart-US','Wegmans','Whole Foods Market','Winn Dixie')
and ACRepflag=1
order by 1,2



select distinct merchandisecategory,merchandisesubcat,category from ACFVDetailReports