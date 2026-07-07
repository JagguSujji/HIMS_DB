

/*****************************************************************************************
FLOOR
******************************************************************************************/

CREATE     PROCEDURE [dbo].[USP_Floor_Update]
(
    @FloorId INT,
    @BuildingId INT,
    @FloorName NVARCHAR(100),
    @FloorNumber INT,
    @ModifiedBy INT
)
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Floor
    SET BuildingId=@BuildingId,
        FloorName=@FloorName,
        FloorNumber=@FloorNumber,
        ModifiedBy=@ModifiedBy,
        ModifiedOn=GETDATE()
    WHERE FloorId=@FloorId;
END
