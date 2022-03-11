

select * from CategoryMarkedFull order by FullRunDate desc
where categorycodeid=2137 and Username = 'hbhagat' and fullrundate='2018-05-28 00:00:00'

select * from  mt2sql14.sitecontrol.dbo.mil50skuupdate 


select * from cwuDetailReports

--insert into CategoryMarkedFull
select id,cast(getdate() as Date),'hbhagat' from CategoryCode 
where category in (
'NHLC',
'CWU50',
'BFCb50',
'cwu',
'rndcK',
'pat50',
'wbg50',
'wbgnv',
'twine',
'futb50')
