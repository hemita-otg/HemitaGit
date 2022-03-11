USE [master]
GO
/****** Object:  StoredProcedure [dbo].[pepsp_delete]    Script Date: 1/22/2020 2:11:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

alter procedure [dbo].[pepsp_delete]
(
@flyerid int,
@IsDebug int = 1
)
as
begin
declare @sqlf nvarchar (max)
,@sqlp nvarchar (max)
,@sqld nvarchar (max)
,@sql1 nvarchar (max)
,@sql11 nvarchar (max)
,@sql111 nvarchar (max)
,@sql2 nvarchar (max)
,@sql22 nvarchar (max)
,@sql222 nvarchar (max)
,@sql3 nvarchar (max)
,@sql33 nvarchar (max)
,@sql333 nvarchar (max)
,@sql4 nvarchar (max)
,@sql44 nvarchar (max)
,@sql444 nvarchar (max)
,@sql5 nvarchar (max)
,@sql55 nvarchar (max)
,@sql555 nvarchar (max)
,@category varchar(max)
,@clientserver varchar(max)

set @category=''

set @sql1=' delete from acfvflyerreports
where flyerid in ('+cast (@flyerid as varchar (max))+')  '
set @sql11=' delete from acfvpagereports
where flyerid in ('+cast (@flyerid as varchar (max))+')  '
set @sql111=' delete from acfvdetailreports
where flyerid in ('+cast (@flyerid as varchar (max))+')  '


set @sql2=' delete from acfvflyerreports
where flyerid in  ('+cast (@flyerid as varchar (max))+')  '
set @sql22=' delete from acfvpagereports
where flyerid in  ('+cast (@flyerid as varchar (max))+')  '
set @sql222=' delete from acfvdetailreports
where flyerid in  ('+cast (@flyerid as varchar (max))+')  '


set @sql3=' delete from acfvflyerreports
where flyerid in  ('+cast (@flyerid as varchar (max))+')  '
set @sql33=' delete from acfvpagereports
where flyerid in  ('+cast (@flyerid as varchar (max))+')  '
set @sql333=' delete from acfvdetailreports
where flyerid in  ('+cast (@flyerid as varchar (max))+')  '


set @sql4=' delete from acfvflyerreports
where flyerid in  ('+cast (@flyerid as varchar (max))+')  '
set @sql44=' delete from acfvpagereports
where flyerid in  ('+cast (@flyerid as varchar (max))+')  '
set @sql444=' delete from acfvdetailreports
where flyerid in  ('+cast (@flyerid as varchar (max))+')  '


set @sql5=' delete from acfvflyerreports
where flyerid in  ('+cast (@flyerid as varchar (max))+')  '
set @sql55=' delete from acfvpagereports
where flyerid in  ('+cast (@flyerid as varchar (max))+')  '
set @sql555=' delete from acfvdetailreports
where flyerid in  ('+cast (@flyerid as varchar (max))+')  '



if @IsDebug=1
begin
	print ('exec mt2sql03.sql03.dbo.sp_executesql N'''+@sql1)+''''
	print ('exec mt2sql06.masteracfv.dbo.sp_executesql N'''+@sql2)+''''
	print ('exec mt2sql13.masteracfv.dbo.sp_executesql N'''+@sql3)+''''
	print ('exec mt2sql16.sql16.dbo.sp_executesql N'''+@sql4)+''''
	print ('exec mt2sql17.sql17.dbo.sp_executesql N'''+@sql5)+''''

	print ('exec mt2sql03.sql03.dbo.sp_executesql N'''+@sql11)+''''
	print ('exec mt2sql06.masteracfv.dbo.sp_executesql N'''+@sql22)+''''
	print ('exec mt2sql13.masteracfv.dbo.sp_executesql N'''+@sql33)+''''
	print ('exec mt2sql16.sql16.dbo.sp_executesql N'''+@sql44)+''''
	print ('exec mt2sql17.sql17.dbo.sp_executesql N'''+@sql55)+''''

	print ('exec mt2sql03.sql03.dbo.sp_executesql N'''+@sql111)+''''
	print ('exec mt2sql06.masteracfv.dbo.sp_executesql N'''+@sql222)+''''
	print ('exec mt2sql13.masteracfv.dbo.sp_executesql N'''+@sql333)+''''
	print ('exec mt2sql16.sql16.dbo.sp_executesql N'''+@sql444)+''''
	print ('exec mt2sql17.sql17.dbo.sp_executesql N'''+@sql555)+''''

	end
else
begin
	exec mt2sql03.sql03.dbo.sp_executesql @sql1
	exec mt2sql06.masteracfv.dbo.sp_executesql @sql2
	exec mt2sql13.masteracfv.dbo.sp_executesql @sql3
	exec mt2sql16.sql16.dbo.sp_executesql @sql4
	exec mt2sql17.sql17.dbo.sp_executesql @sql5

	exec mt2sql03.sql03.dbo.sp_executesql @sql11
	exec mt2sql06.masteracfv.dbo.sp_executesql @sql22
	exec mt2sql13.masteracfv.dbo.sp_executesql @sql33
	exec mt2sql16.sql16.dbo.sp_executesql @sql44
	exec mt2sql17.sql17.dbo.sp_executesql @sql55

	exec mt2sql03.sql03.dbo.sp_executesql @sql111
	exec mt2sql06.masteracfv.dbo.sp_executesql @sql222
	exec mt2sql13.masteracfv.dbo.sp_executesql @sql333
	exec mt2sql16.sql16.dbo.sp_executesql @sql444
	exec mt2sql17.sql17.dbo.sp_executesql @sql555
End

select distinct category,clientserver 
into #catcodetable
from mt2sql14.sitecontrol.dbo.vw_catinfo 
where clientserver in ('mt2sql06','mt2sql13') and (clientpdt=1 or cwmfull=1 or ispdt=1) and fvcctype in (2,4,6) order by 1 


declare curRMC cursor for
select category,clientserver from #catcodetable order by 1
open curRMC

fetch next from curRMC
into @category,@clientserver

while @@fetch_Status = 0
begin 

print (@category+' started')

set @sqlf='if exists(select * from '+@clientserver+'.'+right(@clientserver,5)+'.dbo.sysobjects where name ='''''+@category+'flyerreports'''') 
delete from '+@clientserver+'.'+right(@clientserver,5)+'.dbo.'+@category+'flyerreports where flyerid in ('+cast (@flyerid as varchar (max))+') '


set @sqlp='if exists(select * from '+@clientserver+'.'+right(@clientserver,5)+'.dbo.sysobjects where name ='''''+@category+'pagereports'''') 
delete from '+@clientserver+'.'+right(@clientserver,5)+'.dbo.'+@category+'pagereports where flyerid in ('+cast (@flyerid as varchar (max))+') '


set @sqld='if exists(select * from '+@clientserver+'.'+right(@clientserver,5)+'.dbo.sysobjects where name ='''''+@category+'detailreports'''') 
delete from '+@clientserver+'.'+right(@clientserver,5)+'.dbo.'+@category+'detailreports where flyerid in ('+cast (@flyerid as varchar (max))+') '


IF @clientserver = 'MT2SQL13'
	if @IsDebug=1
	begin	 
		print ('exec mt2sql13.masteracfv.dbo.sp_executesql N'''+@sqlf)+''''
		print ('exec mt2sql13.masteracfv.dbo.sp_executesql N'''+@sqlp)+''''
		print ('exec mt2sql13.masteracfv.dbo.sp_executesql N'''+@sqld)+''''
	end
else 
	begin
	  exec MT2SQL13.SQL13.dbo.sp_executesql @sqlf
	  exec MT2SQL13.SQL13.dbo.sp_executesql @sqlp
	  exec MT2SQL13.SQL13.dbo.sp_executesql @sqld
	 end

Else  IF @clientserver = 'MT2SQL06'
	if @IsDebug=1
begin	 
print ('exec mt2sql06.masteracfv.dbo.sp_executesql N'''+@sqlf)+''''
print ('exec mt2sql06.masteracfv.dbo.sp_executesql N'''+@sqlp)+''''
print ('exec mt2sql06.masteracfv.dbo.sp_executesql N'''+@sqld)+''''
end
else 
	begin
	  exec MT2SQL06.SQL06.dbo.sp_executesql @sqlf
	  exec MT2SQL06.SQL06.dbo.sp_executesql @sqlp
	  exec MT2SQL06.SQL06.dbo.sp_executesql @sqld
	 end

print (@category+' ended')


fetch next from curRMC
into @category,@clientserver

END                       
close curRMC
deallocate curRMC


end


--exec pepsp_delete '3030568'