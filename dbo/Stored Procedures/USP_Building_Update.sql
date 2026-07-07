

/*****************************************************************************************
BUILDING
******************************************************************************************/

CREATE     PROCEDURE [dbo].[USP_Building_Update]
(
    @BuildingId INT,
    @BuildingCode NVARCHAR(50),
    @BuildingName NVARCHAR(200),
    @BranchId INT,
    @ModifiedBy INT
)
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Building
    SET BuildingCode=@BuildingCode,
        BuildingName=@BuildingName,
        BranchId=@BranchId,
        ModifiedBy=@ModifiedBy,
        ModifiedOn=GETDATE()
    WHERE BuildingId=@BuildingId;
END
