select * from vw_catinfo where clientname like '%digit%'
select distinct * from categorycode where category='pngca50'
select MasterCategoryCodeId50,* from Subscription..ClientProfile where clientid=1282

select * from UserHomePageLinkAccess where CategoryCodeID=9423


update categorycode set bust=1,bustg=1,bustsg =1 where category='milpep'

select * from clientprofile where clientname like '%Lenovo ANZ Australia%'

select distinct fv40,clientname,clientid
--update vwclient set fv40=null 
from vwclient 
where  clientid in  (884 )
order by 3
--Select distinct  c.ClientName --u.fv40, c.fv40, c.*  
--from vwClient  c with (nolock) 
--inner join vwuser u with (nolock) On c.clientid  = u.clientid and c.fv40 is null and u.FV40 is null and [type] = 1
--Order by  1
update vwUser set fv40=46  where  vwuser where clientid in (9996) and DefaultEmailAddress like '%kelly.chiappone@numerator.com%' and DefaultEmailAddress
not in ('robert.fellowes@numerator.com','shalini.weerasinghe@numerator.com') order by defaultemailaddress
group by fv40,type,SiteAccess
--and clientid not in (285,208,746,1396)
--and type=1 and fv40!=68
--and type=1-- and DefaultEmailAddress like '%mithi%'

select distinct fv40,SiteAccess,Type,DefaultEmailAddress from vwUser 
where  clientid=(884) and DefaultEmailAddress like '%support%'
order by 2,1
and fv40=68

select distinct fv40 from vwuser where clientid=999



select * from ClientProfile where ClientID=46
 

select distinct clientid,fv40,SiteAccess from vwuser 
where ClientID in(999,979 )
 order by 2

 

update vwUser set fv40=null where  clientid in (979 )
order by 2,1
--and DefaultEmailAddress like '%promo%'
order by 2

--update vwuser set siteaccess=1 where  clientid in (1108)

update vwuser set SiteAccess=2  where  clientid in (1033)  and DefaultEmailAddress like '%hemita%'
update vwuser set fv40=null where  clientid in  ()  and 
--and fv40=68
--and DefaultEmailAddress  in ('stefanie.kahn@numerator.com')

--===== fpor pop-up msg

--new popup message

--update DashboardCustomMessage
--set SequenceId = SequenceId + 1
--WHERE   ClientId  = XXX

--insert into DashboardCustomMessage (ClientId,	MessageText,	IsEnable,	SequenceId,	FvSiteVersion)
Values( 860,	'<div style="margin:10px;" align="left" valign="middle"><span style="font-weight:bold;">Announcement!</span><span><br /><br />Numerator is launching an updated, more intuitive user interface that delivers an enhanced search functionality and simpler navigation between report modules. The new platform is <a href="https://promotionsintel.numerator.com" target="_blank" style="text-decoration: underline;">available to all users here</a>. Please feel free to start using it today. You will receive additional information via email with training information.</td></tr></table>',	1	,1,	1)

--update excel limits


select * from subscription..vwuser where defaultemailaddress like '%support%'

select distinct a.clientid,userid from vwUser a
join sitecontrol..vw_catinfo b
on a.clientid=b.clientid
where DefaultEmailAddress like '%support%'
and (FVCCType=1 or clientserver = 'mt2sql15') 
and status=1 

set MaxSingleFileXlsRecordsDownload = 100000

promointelsupport@numerator.com


--update userControl
 set MaxSingleFileXLSRecordsEmail = 10000
    ,MaxSingleFileXlsRecordsDownload = 100000
	,TotalXLSCwmRecords = 0
	,TotalXLSPDTRecords = 0
	,TotalXLSSumPDTRecords = 0	
	--select * from usercontrol
	where ()

