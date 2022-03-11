
WITH cte AS (
    SELECT 
        Manufacturer, 
        Category, 
		Brand,
      
        ROW_NUMBER() OVER (
            PARTITION BY 
                Manufacturer, 
                Category, 
                Brand
            ORDER BY 
                Manufacturer, 
                Category, 
                Brand
        ) row_num
     FROM 
        ANHPEPManufacturer
)
delete  FROM cte
WHERE row_num > 1