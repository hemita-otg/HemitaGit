--====================PMTCS-3219========================---------
	If @categorycode IN ('actadl50')
	begin
	IF EXISTS(SELECT * FROM ConversionControl..MCUpdate WHERE DatabaseCategory = @categorycode)
		BEGIN
		
			INSERT INTO ConversionControl..conversionlog(CategoryCode,Details,dttm) values(@categorycode,'Start : actadl50 MCCategory Rename MC Updates',getdate())
			SET @sql  = 'UPDATE '+ @ConversionDataDb + '.dbo.' + @PDTTableName + ' SET 
			MerchandiseCategory = T.MerchandiseCategory, MerchandiseSubCat = T.MerchandiseSubCat
			FROM '+ @ConversionDataDb + '.dbo.' + @PDTTableName + ' PDT JOIN ConversionControl..MCUpdate T
			ON PDT.Category = T.Category  
			WHERE T.DatabaseCategory IN(''' + @categorycode + ''') option (maxdop 1)
			
			EXEC '+ @ConversionDataDb + '.dbo.mt_proc_Create_ID_Update ''' + @PDTTableName + ''' ,''MerchandiseCategory''
			EXEC '+ @ConversionDataDb + '.dbo.mt_proc_Create_ID_Update ''' + @PDTTableName + ''' ,''MerchandiseSubCat''
			EXEC '+ @ConversionDataDb + '.dbo.mt_proc_Create_ID_Update ''' + @PDTTableName + ''' ,''Category''
			'
			--Print @SQL
			Exec(@sql)
			
			INSERT INTO ConversionControl..conversionlog(CategoryCode,Details,dttm) values(@categorycode,'End : actadl50 Rename MC Updates',getdate())			
		END
	end
	--====================PMTCS-3219========================---------