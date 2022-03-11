--DECLARE @path SELECT CAST( LEFT( files, PATINDEX('%File(s)%', files) - 1) AS int)
--DECLARE @result INT
--SET @path = '\\mediatrack.net\fvdata\SQL\Scripts\Hemita\Gallo Assignments\gallo.xlsx'
--EXEC master.dbo.xp_fileexist @path, @result OUTPUT
--SELECT @result


DECLARE @cmd nvarchar(500)
declare @filename varchar(500)
DECLARE @path  varchar(500)

set @path = '"\\mediatrack.net\fvdata\SQL\Scripts\Hemita\Gallo Assignments\"'
SET @cmd = 'dir '+@path+ ' /b'
drop table #DirOutput
CREATE TABLE #DirOutput(
     files varchar(max))

INSERT INTO #DirOutput
EXEC master.dbo.xp_cmdshell @cmd

SELECT *
FROM #DirOutput
WHERE files LIKE '%gallo current assignment%'

print @filename