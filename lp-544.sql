
select distinct a.*,
'https://60.featurevision.com'+VirtualDirectory+'/'+cast(CreationMonth as varchar)+'/'+cast(VehicleID as varchar)+'/Full/'+ImageName+'.jpg' as PageImage 
--into hb_544_1
from hb_lp544 a
Join MasterAdviewData.dbo.AdviewMain B ON A.FLyerId=B.FlyerId
Join MasterAdviewData.dbo.MCAPVehiclePages C ON C.FlyerId=B.FlyerID And A.Page=C.PageNumber
Join MT2SQL14.Connection.dbo.ArrayLocation L ON '/'+cast(C.CreationMonth as varchar)=L.Array