DECLARE @sql VARCHAR(4000),@categorycode varchar(50)='amdADL'
DECLARE @bitShowMCAPFeaturesInd int
DECLARE @CatCWMTable VARCHAR(500)='amdADLFlyerreports'
DECLARE @CatPDTTable VARCHAR(500)='amdADLDetailreports'
DECLARE @CatPagesTable varchar(500)='amdADLPagereports'

Select @bitShowMCAPFeaturesInd = ISNULL(ShowMCAPFeaturesInd,0) 
From conversioncontrol..conversioncategory 
where DataBaseCategory =  @categorycode 

IF @bitShowMCAPFeaturesInd = 1 and @categorycode = 'amdADL'
	BEGIN
		SET @sql = 'IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = '''+@CatPDTTable+''' AND COLUMN_NAME = ''CaptureDt'')
					ALTER TABLE '+@CatPDTTable+' ADD CaptureDt DateTime ' 
		PRINT @sql      
		--EXEC(@sql)

		SET @sql = 'IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = '''+@CatPDTTable+''' AND COLUMN_NAME = ''CaptureURL'')
					ALTER TABLE '+@CatPDTTable+' ADD CaptureURL Varchar(2000) ' 
		PRINT @sql      
		--EXEC(@sql)

		SET @sql = 'Update PDT set CaptureDt= VP.CaptureDt,CaptureURL= VP.URL
			        from ' + @CatPDTTable + ' PDT
					inner join ' + @CatPagesTable + ' Pages on PDT.TrackNo = Pages.TrackNo and PDT.Page = Pages.PageNo
			        inner join tempdb.dbo.MCAPVehiclePages VP
			        on VP.VehicleID = PDT.Trackno and VP.ImageName = Pages.Image
			        inner join ' + @CatCWMTable + ' CWM on CWM.FlyerId = PDT.FlyerId
					Where (IsNull(PDT.CaptureDt, '''') <> IsNull(VP.CaptureDt, '''')) or (IsNull(PDT.CaptureURL, '''') <> IsNull(VP.URL, ''''))'
		PRINT @sql      
		--EXEC(@sql)
		SET @sql = 'Update PDT set CaptureDt= VP.CaptureDt,CaptureURL= VP.URL 
			        from ' + @CatPDTTable + ' PDT
					inner join ' + @CatPagesTable + ' Pages on PDT.TrackNo = Pages.TrackNo and PDT.Page = Pages.PageNo
		            inner join tempdb.dbo.MCAPVehiclePages VP
		            on VP.VehicleID = (PDT.Trackno - 500000000) and VP.ImageName = Pages.Image
		            inner join ' + @CatCWMTable + ' CWM on CWM.FlyerId = PDT.FlyerId
					Where (IsNull(PDT.CaptureDt, '''') <> IsNull(VP.CaptureDt, '''')) or (IsNull(PDT.CaptureURL, '''') <> IsNull(VP.URL, ''''))'        
		PRINT @sql      
	 -- EXEC(@sql)
			
	END         
		
ELSE IF @bitShowMCAPFeaturesInd = 0 and @categorycode = 'amdADL'
	BEGIN

		SET @sql = 'IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = '''+@CatPDTTable+''' AND COLUMN_NAME = ''CaptureDt'')
					ALTER TABLE '+@CatPDTTable+' ADD CaptureDt DateTime ' 
		PRINT @sql      
		--EXEC(@sql)

		SET @sql = 'IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = '''+@CatPDTTable+''' AND COLUMN_NAME = ''CaptureURL'')
					ALTER TABLE '+@CatPDTTable+' ADD CaptureURL Varchar(2000) ' 
	    PRINT @sql      
		--EXEC(@sql)

			SET @sql = 'Update PDT set CaptureDt= VP.CaptureDt,CaptureURL= VP.URL
						From ' + @CatPDTTable + ' PDT
			            inner join tempdb.dbo.MCAPVehiclePages VP
			            on VP.VehicleID = PDT.Trackno and VP.PageNumber = PDT.Page
			            inner join ' + @CatCWMTable + ' CWM on CWM.FlyerId = PDT.FlyerId
						Where CWM.media =''Website'' and CWM.Market=''Internet''
						And (IsNull(PDT.CaptureDt, '''') <> IsNull(VP.CaptureDt, '''')) or (IsNull(PDT.CaptureURL, '''') <> IsNull(VP.URL, ''''))'
		PRINT @sql      
		--EXEC(@sql)
	END

