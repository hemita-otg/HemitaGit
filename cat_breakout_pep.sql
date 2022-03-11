



--create table tempdb..tempmerchcat 
--(MCTemplateID int,MerchandiseCategory varchar (max),MerchandiseSubCat varchar (max),Category varchar (max),RealCategory varchar (max),[set] int,[exclude] int)




--create table Beefadd (Beef varchar(max))


DECLARE 
    @product_name VARCHAR(MAX)
    
DECLARE cursor_product CURSOR
FOR SELECT 
       Beef
    FROM 
        tempdb..Beefadd
 
OPEN cursor_product
 
FETCH NEXT FROM cursor_product INTO 
    @product_name
  
 
WHILE @@FETCH_STATUS = 0
    BEGIN
        PRINT @product_name
        FETCH NEXT FROM cursor_product INTO 
            @product_name

--insert into tempdb..tempmerchcat 
Select MCTemplateID, MerchandiseCategory, MerchandiseSubCat, @product_name [Category], @product_name [RealCategory],0[set],0[exclude]    
from SiteControl..vw_MerchandiseCategory C
Join SiteControl..vw_catinfo CC
On C.CategoryCodeId=CC.CategoryCodeId 
Where FVCCType in (2,4,6)
and RealCategory='beef'

        
    END;
 
CLOSE cursor_product;
 
DEALLOCATE cursor_product;


select * from  tempdb..tempmerchcat 







--Select  MCTemplateID, MerchandiseCategory, MerchandiseSubCat, 'Chicken-Breast' [Category], 'Chicken-Breast'[RealCategory],0[set],0[exclude]    
--from SiteControl..vw_MerchandiseCategory C
--Join SiteControl..vw_catinfo CC
--On C.CategoryCodeId=CC.CategoryCodeId 
--Where FVCCType in (2,4,6)
--and RealCategory='Chicken'
