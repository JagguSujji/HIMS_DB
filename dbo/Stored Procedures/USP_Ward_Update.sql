

/*****************************************************************************************
WARD
******************************************************************************************/

CREATE     PROCEDURE [dbo].[USP_Ward_Update]
(
    @WardId INT,
    @WardCode NVARCHAR(50),
    @WardName NVARCHAR(200),
    @WardTypeId INT,
    @Capacity INT,
    @Remarks NVARCHAR(500),
    @ModifiedBy INT
)
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Ward
    SET WardCode=@WardCode,
        WardName=@WardName,
        WardTypeId=@WardTypeId,
        Capacity=@Capacity,
        Remarks=@Remarks,
        ModifiedBy=@ModifiedBy,
        ModifiedOn=GETDATE()
    WHERE WardId=@WardId;
END
