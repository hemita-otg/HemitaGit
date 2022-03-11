Select Distinct clientid, CategoryCodeID, P.acretmktid, P.RetId, P.MktID, P.RetMktID, P.mediaid, P.tcid,R.Advertiser,R.Market,R.Media,
D.acretmktid, D.RetId, P.MktID, D.RetMktID, P.mediaid, P.tcid,D.Advertiser,D.Market,D.Media
from MasterClientCoverage..MasterClientCWMPEP P
Join MasterClientCoverage..retmktpep R
On P.retmktid = R.retmktid 
Left Join MasterClientCoverage..retmktpep D
On R.MktID = D.mktid and R.mediaid = D.mediaid  
Where R.Advertiser='fsi' and r.market = 'Cleveland, OH' and p.mediaid is null



Select Distinct clientid, CategoryCodeID, P.acretmktid, P.RetId, P.MktID, P.RetMktID, P.mediaid, P.tcid,R.Advertiser,R.Market,R.Media,
D.acretmktid, D.RetId, P.MktID, D.RetMktID, P.mediaid, P.tcid,D.Advertiser,D.Market,D.Media
from MasterClientCoverage..MasterClientCWMPEP P
Join MasterClientCoverage..retmktpep R
On P.retmktid = R.retmktid 
Left Join MasterClientCoverage..retmktpep D
On R.MktID = D.mktid and R.mediaid = D.mediaid  
Where R.Advertiser='fsi' and r.market = 'Cleveland, OH' and p.mediaid=1