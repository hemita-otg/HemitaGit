--update d 
--set capturedt=m.CaptureDt,captureurl=m.url
--from SQL11..prdweb50DetailReports d
--join MCAPVehiclePages m
--on d.VehicleId= m.VehicleId
--and d.FlyerId = m.FlyerId
--and d.Page=m.PageNumber
--where (m.URL is not null or m.CaptureDt is not null)
--and (d.capturedt is null and d.captureurl is null)

--alter table SQL11..prdweb50DetailReports
----add CaptureDt	datetime
--add CaptureURL	varchar(2000)


--select distinct capturedt,captureurl
--from SQL11..prdweb50DetailReports
--where captureurl like '%172%'

CREATE PROCEDURE [dbo].[CustomStepSP_prdweb50] 
(
@Category varchar(50),
@Flag int,
@IsDebug int = 0
)
AS
Begin

Declare @Alt NVARCHAR(max)
Declare @SQL NVARCHAR(max)
------------------------------------------------------------------------------------------------------------
If @Category='prdweb50' and @Flag=1
Begin
	
	Set @Alt='if not exists (Select top 1 * from information_schema.columns where table_name = '''+@Category+'DetailReports'' and column_name = ''CaptureURL'')
Alter table '+@Category+'FlyerReports Add [CaptureURL] varchar(2000)'
IF @IsDebug=1
		Print @Alt
	Else
		Exec (@Alt)
Set @Alt='if not exists (Select top 1 * from information_schema.columns where table_name = '''+@Category+'DetailReports'' and column_name = ''CaptureDt'')
Alter table '+@Category+'PageReports Add [CaptureDt] DateTime'
IF @IsDebug=1
		Print @Alt
	Else
		Exec (@Alt)


Set @SQL='update d 
				  set capturedt=m.CaptureDt,captureurl=m.url
				  from SQL11..'+@Category+'DetailReports d
				  join MCAPVehiclePages m
				  on d.VehicleId= m.VehicleId
				  and d.FlyerId = m.FlyerId
				  and d.Page=m.PageNumber
				  where (m.URL is not null or m.CaptureDt is not null)
				  and (d.capturedt is null and d.captureurl is null)'
IF @IsDebug=1
		Print @SQL
	Else
		Exec (@SQL)


end
end


