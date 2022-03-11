
select distinct spname from mt2sql14.sitecontrol.dbo.vw_mastercustomstep where clientserver = 'mt2sql07'

--delete from  mt2sql14.sitecontrol.dbo.MasterCustomStepDetail where csdid=586

SELECT DISTINCT
       o.name AS Object_Name,
       o.type_desc
  FROM MT2SQL07.SQL07.sys.sql_modules m
       INNER JOIN
       MT2SQL07.SQL07.sys.objects o
         ON m.object_id = o.object_id
WHERE 
(m.definition Like '%AdCost%' OR
m.definition Like '%AdDistID%' OR
m.definition Like '%BackPageInd%' OR
m.definition Like '%Country%' OR
m.definition Like '%CountryID%' OR
m.definition Like '%CouponExpirationDate%' OR
m.definition Like '%CouponExpirationDate1%' OR
m.definition Like '%CouponExpirationDate2%' OR
m.definition Like '%CouponInd%' OR
m.definition Like '%CreationMonth%' OR
m.definition Like '%DisplayMedia%' OR
m.definition Like '%EnteredClient%' OR
m.definition Like '%FirstPageHeight%' OR
m.definition Like '%FirstPageWidth%' OR
m.definition Like '%FlyerSpace%' OR
m.definition Like '%Height%' OR
m.definition Like '%Illustrated%' OR
m.definition Like '%ImageName%' OR
m.definition Like '%LANGUAGE%' OR
m.definition Like '%LanguageID%' OR
m.definition Like '%MPVPageTheme%' OR
m.definition Like '%MPVPageThemeId%' OR
m.definition Like '%OfferId%' OR
m.definition Like '%OrderValue%' OR
m.definition Like '%OtherDiscountP2%' OR
m.definition Like '%PageName%' OR
m.definition Like '%PageSpace%' OR
m.definition Like '%PageType%' OR
m.definition Like '%PageTypeId%' OR
m.definition Like '%Persona%' OR
m.definition Like '%PkgSizeId%' OR
m.definition Like '%SaleEndDt%' OR
m.definition Like '%SKUDescription1ID%' OR
m.definition Like '%SKUDescription2ID%' OR
m.definition Like '%SKUDescription3ID%' OR
m.definition Like '%SKUTypeID%' OR
m.definition Like '%Spend%' OR
m.definition Like '%UnitTypeId%' OR
m.definition Like '%Width%' OR
m.definition Like '%Coupon%' )
AND o.name like 'CustomStepSP_%'

