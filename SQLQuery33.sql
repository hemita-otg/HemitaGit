select distinct merchandisecategory,merchandisesubcat,category from mt2sql13.masteracfv.dbo.acfvdetailreports 
where category in 
('Everyday Packaged Non-Chocolate Candy','Seasonal King Size Candy','Seasonal Large/Giant Candy','Seasonal Multi Pack Candy','Seasonal Novelty Candy','Seasonal Packaged Chocolate Candy','Seasonal Packaged Non-Chocolate Candy','Seasonal Presentation Boxes Candy','Seasonal Single Serve Candy','Seasonal Snack Size, Fun Size Candy')