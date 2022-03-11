select flyerid from TempFlyerReports
group by flyerid
having count(flyerid)>1


select * from masterclientcoverage..EPAAABBDMFlyerReports
where originalflyerid = 20524325

select * from AdviewMain
where flyerid = 20524325


select * from masterclientcoverage..EPAAABBDMFlyerReports
where originalflyerid = 20524325





RT INTO TempFlyerReports (OriginalFlyerID,FlyerID,AdvertiserId,Advertiser,marketid,market,RetMktId,mediaId,media,eventId,event,themeid,theme,PublicationId,Publication,TradeClassId,tradeclass,AdDate,WeekOf,salestartdate,saleenddate,pages,img,size,PublishedOn,RegionId,Region,DistrictId,District,AdMonth,AdMonthId,AdDay,SalesTerritory,SalesTerritoryId,SalesTerritoryGroup,SalesTerritoryGroupId,SalesTerritorySubGroup,SalesTerritorySubGroupId,TcUpdatedOn,DistUpdatedOn,RegionUpdatedOn,StUpdatedOn,StgUpdatedOn,StsgUpdatedOn,RetId,MktId,subject,receivedDt,AdSalePeriod,AdSaleWeek,AdSaleMonth,AdSaleYear,WeekOfn,WeekOfi,VehicleId,Channel,ChannelID,Source,DistDt,AdDist,AdType,AdTypeID,City,State,ZipCode,Gender,DoB,AgeBracket,AVTCID,AdDayId) 
SELECT OriginalFlyerID,S.FlyerID,isNull(S.AdvertiserId,0),S.Advertiser,isNull(S.marketid,0),S.market,S.RetMktId,isNull(S.mediaId,0),S.media,isNull(S.eventId,0),S.event,isNull(S.themeid,0),S.theme,isNull(S.PublicationId,0),S.Publication,isNull(S.TradeClassId,0),S.tradeclass,S.AdDate,S.WeekOf,S.salestartdate,S.saleenddate,S.pages,S.img,S.size,S.PublishedOn,isNull(S.RegionId,0),S.Region,isNull(S.DistrictId,0),S.District,CAST(DATENAME(month, AdDate) + ' - ' + CAST(datepart(yyyy, AdDate) as varchar) as varchar(100)) AdMonth,CAST(CAST(datepart(month, AdDate) as varchar) + '/1/' + CAST(datepart(year, AdDate) as varchar) as datetime) AdMonthId,CAST(datename(weekday, AdDate) as varchar(50)) AdDay,S.SalesTerritory,isNull(S.SalesTerritoryId,0),S.SalesTerritoryGroup,isNull(S.SalesTerritoryGroupId,0),S.SalesTerritorySubGroup,isNull(S.SalesTerritorySubGroupId,0),S.TcUpdatedOn,S.DistUpdatedOn,S.RegionUpdatedOn,S.StUpdatedOn,S.StgUpdatedOn,S.StsgUpdatedOn,S.RetId,S.MktId,S.subject,S.receivedDt,S.AdSalePeriod,S.AdSaleWeek,S.AdSaleMonth,S.AdSaleYear,S.WeekOfn,S.WeekOfi,S.VehicleId,S.Channel,isNull(S.ChannelID,0),S.Source,S.DistDt,S.AdDist,S.AdType,isNull(S.AdTypeID,0),S.City,S.State,S.ZipCode,S.Gender,S.DoB,S.AgeBracket,S.AVTCID,CAST(datepart(dw, AdDate) as varchar(50)) AdDayId FROM 
											MasterAdviewData.dbo.MasterFlyerReports S    WHERE RetMktId IN (SELECT 
																	FieldValue 
																FROM 
																	MasterClientCoverage..ClientCWMException 
																WHERE
																	CategoryCodeID = 2274 AND  
																	FieldID = 153 AND 
																	IsNull(StartDate,'') = 'Apr  1 2015 12:00AM' AND
																	IsNull(EndDate,'') = 'Jan  1 1900 12:00AM'
																) AND 
											AdDate BETWEEN '04/01/2015' AND 
															'06/12/2018'
															and flyerid= 20524325


