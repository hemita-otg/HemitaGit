

select distinct RequiredQuantity,saleprice1 from mt2bu2.sql08.dbo.sdpca50detailreports 

 select distinct RequiredQuantity,saleprice1,
	case 
		when (RequiredQuantity is null or saleprice1 is null)
			then 'None'
			else
			cast(RequiredQuantity as varchar(10)) +' for $'+cast (saleprice1 as varchar(10))
			end as newcol
from mt2bu2.sql08.dbo.sdpca50detailreports --where SalePrice1 is null



 select distinct RequiredQuantity,saleprice1,
	case 
		when (RequiredQuantity is null or saleprice1 is null)
			then 'None'
			else
			cast(RequiredQuantity as varchar(10)) +' for $'+cast (saleprice1 as varchar(10))
			end as newcol
from mt2bu2.sql08.dbo.sdpca50detailreports



update mt2bu2.sql08.dbo.sdpca50detailreports set optional1 = 
	case 
		when (RequiredQuantity is null or saleprice1 is null)
			then 'None'
			else
			cast(RequiredQuantity as varchar(10)) +' for $'+cast (saleprice1 as varchar(10))
			end


select distinct optional1 from mt2bu2.sql08.dbo.sdpca50detailreports



 select top 1 RequiredQuantity,saleprice1 from mt2bu2.sql08.dbo.sdpca50detailreports where requiredquantity is not null	
 select top 1 RequiredQuantity,saleprice1 from mt2bu2.sql08.dbo.sdpca50detailreports where ISNULL(RequiredQuantity,0)=0