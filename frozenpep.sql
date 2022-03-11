select top 1 * from mt2sql14.sitecontrol.dbo.merchandisecategorytemplatesdetail where category = 'Frozen Prepared Food'

select distinct  a.categorycodeid,a.mctemplateid,a.merchandisecategory,a.merchandisesubcat,a.category,b.category,b.clientname from mt2sql14.sitecontrol.dbo.vw_merchandisecategory  a
join 
mt2sql14.sitecontrol.dbo.vw_catinfo b
on a.categorycodeid=b.categorycodeid
where a.category like 'Frozen Prepared Food'
and fvcctype in (2,4,6)


select count(*) from mt2sql14.sitecontrol.dbo.merchandisecategorytemplatesdetail where mctemplateid = 3460 --1081
select count(*) from mt2sql14.sitecontrol.dbo.merchandisecategorytemplatesdetail where mctemplateid = 3505 --1060
select count(*) from mt2sql14.sitecontrol.dbo.merchandisecategorytemplatesdetail where mctemplateid = 3614 --1102
select count(*) from mt2sql14.sitecontrol.dbo.merchandisecategorytemplatesdetail where mctemplateid = 3620 --1107
select count(*) from mt2sql14.sitecontrol.dbo.merchandisecategorytemplatesdetail where mctemplateid = 3625 --68


Select * from mt2sql14.Sitecontrol.dbo.vw_MasterSegmentation 
Where FieldName = 'Category' 


Select * from mt2sql14.Sitecontrol.dbo.vw_MasterSegmentation 
Where FieldName = 'Category' and id in (4620,4640,4647,4652,4670,4672,4698,4705,4713,4714,4730,4733,4735,4743,4749,4752,4753,4759,4767,4769,4770,4772,4780,4794,4796,4803,4804,4807,4821,4823,4825,4827,4828,4836,4840,5846,5848,5851,5855,5870,5872,5876,5879,5887,5893,5896,5897,5899,5905,5906,5912,5914,5921,5940,5946,5955,5959,5965,5971,5974,5977,5984,5987,5988,7000,7007,7014,7019,7020,7021,7049,7050,7052,7067,7082,7084,7101,7105,7107,7114,7115,7118,7133)


