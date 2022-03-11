select distinct Brand,Manufacturer,ManufacturerId from chaADLDetailReports
where Brand in ('Liftmaster','Chamberlain') and ManufacturerId!=8245
order by 1,2

--update chaADLDetailReports set Manufacturer = 'Chamberlain',ManufacturerId=8245
where Brand in ('Liftmaster','Chamberlain') and ManufacturerId!=8245



---------PMTCS-1507-------------------
        IF @DBCategory in('chaADL')
        BEGIN
            SET @sql = 'Update ' + @ConversionDataDb + '.dbo.chaADLDetailReports set Manufacturer = ''Chamberlain'',ManufacturerId=8245
where Brand in (''Liftmaster'',''Chamberlain'') and ManufacturerId!=8245

            
            Exec ' + @ConversionDataDb + '.dbo.mt_proc_Create_DisplayTables_AD ''chaADL'''

            Exec(@sql)
        END
        ---------PMTCS-1507-------------------

