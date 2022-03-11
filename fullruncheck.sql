select * from mt2sql13.MasterACFV.dbo.categorycoderunflag where codestatus = 1 and isfull = 1
--and htmlrun = 1 --and clientrun = 2

select distinct c.category,c.clientid,f.* from mt2sql14.sitecontrol.dbo.categorymarkedfull f
join mt2sql14.sitecontrol.dbo.categorycode c 
on f.categorycodeid=c.id
order by fullrundate desc


select id from mt2sql14.sitecontrol.dbo.Categorycode where category in ('NHLC','ymkt','moet50','hbc','SWStest50','CWU50','bcrFTP50','BFCb50','cwu','rnno','bmi','rndcK','pat50','rndct','wbg50','wbgnv','twine','futb50','dga50')
select * from mt2sql14.sitecontrol.dbo.categorymarkedfull order by fullrundate desc where category in ('NHLC','ymkt','moet50','hbc','SWStest50','CWU50','bcrFTP50','BFCb50','cwu','rnno','bmi','rndcK','pat50','rndct','wbg50','wbgnv','twine','futb50','dga50')

--insert into mt2sql14.sitecontrol.dbo.categorymarkedfull 
select distinct id,'2018-04-03 00:00:00.000','hbhagat'from mt2sql14.sitecontrol.dbo.Categorycode where category in ('NHLC','ymkt','moet50','hbc','SWStest50','CWU50','bcrFTP50','BFCb50','cwu','rnno','bmi','rndcK','pat50','rndct','wbg50','wbgnv','twine','futb50','dga50')