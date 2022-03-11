USE SQL15 
GO
------------------------------- Create DIS Table ------------------------------
DECLARE @pClientCode VARCHAR(20),@pCWMOnly TINYINT = 0,@pIsOffer TINYINT = 0,@pIsEvent TINYINT = 0,@pIsTheme TINYINT = 0

DECLARE #cur CURSOR FOR 
SELECT category, ISNULL(IsDAA, 0), ISNULL(IsOffer, 0), ISNULL(IsEvent, 0), ISNULL(IsTheme, 0) FROM MT2SQL14.SiteControl.dbo.CategoryCode 
WHERE fvcctype = 1 and category IN ('bnCR') ORDER BY id

OPEN #cur
FETCH NEXT FROM #cur INTO @pClientCode,  @pCWMOnly, @pIsOffer, @pIsEvent, @pIsTheme
WHILE @@FETCH_STATUS = 0
BEGIN 
 EXEC [mt_proc_Create_Dis_Tables_CR]  @pClientCode, @pCWMOnly,@pIsOffer  ,@pIsEvent, @pIsTheme, 'MT2SQL14.SiteControl.dbo.', 'MT2SQL15.DataSp50Int.dbo.', 'MT2SQL14.Subscription.dbo.', 'MT2SQL15.SQL15.dbo.', 0
 FETCH NEXT FROM #cur INTO @pClientCode, @pCWMOnly,@pIsOffer  ,@pIsEvent, @pIsTheme
END

CLOSE #cur
DEALLOCATE #cur

GO
--------------------- End of Dis table -------------------------------
