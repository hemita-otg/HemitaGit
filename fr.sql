use FlashReport

select* from SiteControl..vw_catinfo where ClientName like '%young%'

select* from FRRetMkt where clientid = 660

select * from FRRetMktPEP where clientid = 660

select MasterCategoryCodeId50,* from subscription..clientprofile where clientname like '%young%'

660    Youngs Market    2348    ymkt
660    Youngs Market    5992    ymktPeP


select * 
from FlashReport..ClientValues
where clientid=660


--detail- 0- imageonly-2 reports

select * 
from FlashReport..FRRetMkt
where clientid=660



