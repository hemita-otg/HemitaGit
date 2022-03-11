select distinct ClientName,HomePageLink,MerchandiseCategory,MerchandiseSubCat,a.Category,RealCategory 
from sitecontrol..vw_MerchandiseCategory a
join sitecontrol..vw_catinfo b
on a.CategoryCodeId=b.CategoryCodeId
Where (b.Category Like '%CA' Or b.Category Like '%CA50' Or b.Category Like '%CAN'Or b.HomePageLink Like '%CAN%')
--FVCCType=3
and a.Category='pool supplies'

