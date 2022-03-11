alter PROCEDURE [dbo].[CustomStepSP_pgpep] 
(
@Category varchar(50),
@Flag int,
@IsDebug int = 0
)
AS
Begin
--exec [CustomStepSP_pgpep] 'pgpep',1,1
Declare @SQL NVARCHAR(max)


If @category = 'pgpep' and @Flag=1
Begin

	Set @SQL='update '+@@SERVERNAME+'.'+(right(@@SERVERNAME,4))+'.dbo.'+@category+'flyerreports set adtype = ''Primary Circular'' where adtype in (''Paper Circular'',''Electronic Circular'')'
	if @IsDebug=1
		Print @SQL
	else
		Exec (@SQL)

	Set @SQL='update '+@@SERVERNAME+'.'+(right(@@SERVERNAME,4))+'.dbo.'+@category+'pagereports set adtype = ''Primary Circular'' where adtype in (''Paper Circular'',''Electronic Circular'')'
	if @IsDebug=1
		Print @SQL
	else
		Exec (@SQL)


end
end

