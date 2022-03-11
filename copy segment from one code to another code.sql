use Subscription

--select * into tempdb..SavedCustomDataUpdates_021114 from SavedCustomDataUpdates
--select * into tempdb..SavedCustomDataUpdatesDetail_021114 from SavedCustomDataUpdatesDetail

Select * from MT2SQL14.SiteControl.dbo.CategoryCode where Category in ('scea50','gameADL')
--                ClientID    CategoryID    Category
--Source            305          2440       scea50
--Destination       1409          8324       gameADL

select * from MT2SQL14.Subscription.dbo.MasterCustomDataUpdateGroup where ClientID in(305,1409)
--Source        : 1728
--Destination    : 1745

--Source
SELECT * FROM MT2SQL14.Subscription.dbo.CustomDataUpdateControl where CustomDataUpdateGroupId = 1728
SELECT * FROM MT2SQL14.Subscription.dbo.SavedCustomDataUpdates where  CustomDataUpdateGroupId = 1728 
order by SequenceNo

--Destination
select * FROM MT2SQL14.Subscription.dbo.CustomDataUpdateControl where CustomDataUpdateGroupId=1745
select * FROM MT2SQL14.Subscription.dbo.SavedCustomDataUpdates where CustomDataUpdateGroupId = 1745
order by SequenceNo

SELECT * FROM MT2SQL14.Subscription.dbo.vwUser where ClientID = 1409 and DefaultEmailAddress = 'promointelsupport@numerator.com'
--UserID : 2701635

------------------------------------------------------------------------------------------------------------------------------------
--                ClientID    CategoryCodeID    UserID
--Soure:		  305            2440
--Destination:    1409            8324           2701635

DECLARE @lCustomDataUpdateId INT, @lUpdateValue VARCHAR(100), @lSequenceNo INT, @lActiveFlag TINYINT, @lControlValueFlag TINYINT, @lNewCustomDataUpdateId INT

DECLARE curSCDU CURSOR FOR
SELECT CustomDataUpdateId, UpdateValue, SequenceNo, ActiveFlag, ControlValueFlag from MT2SQL14.Subscription.dbo.SavedCustomDataUpdates where CustomDataUpdateGroupId = 1728
order by UpdateValue

OPEN curSCDU

FETCH NEXT FROM curSCDU
INTO @lCustomDataUpdateId, @lUpdateValue, @lSequenceNo, @lActiveFlag, @lControlValueFlag

WHILE @@FETCH_STATUS = 0
BEGIN
    INSERT INTO MT2SQL14.Subscription.dbo.SavedCustomDataUpdates(UpdateValue, SequenceNo, ActiveFlag, ClientId, CategoryCodeId, UserId, CreateDt, CustomDataUpdateGroupId, ControlValueFlag)
    SELECT @lUpdateValue, @lSequenceNo, @lActiveFlag, 1409, 8324, 2701635, GETDATE(), 1745, @lControlValueFlag
    
    SELECT @lNewCustomDataUpdateId = SCOPE_IDENTITY()
    
    INSERT INTO MT2SQL14.Subscription.dbo.SavedCustomDataUpdatesDetail
    SELECT @lNewCustomDataUpdateId, SessionIdName, SessionIdValue FROM MT2SQL14.Subscription.dbo.SavedCustomDataUpdatesDetail WHERE CustomDataUpdateId =  @lCustomDataUpdateId
    
    --SELECT * FROM MT2SQL14.Subscription.dbo.SavedCustomDataUpdatesDetail WHERE CustomDataUpdateId =@lCustomDataUpdateId
    FETCH NEXT FROM curSCDU
    INTO @lCustomDataUpdateId, @lUpdateValue, @lSequenceNo, @lActiveFlag, @lControlValueFlag    
END
CLOSE curSCDU
DEALLOCATE curSCDU