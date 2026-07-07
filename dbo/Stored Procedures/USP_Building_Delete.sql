
CREATE     PROCEDURE [dbo].[USP_Building_Delete]
(
    @BuildingId INT,
    @ModifiedBy INT
)
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Building
    SET IsActive=0,
        ModifiedBy=@ModifiedBy,
        ModifiedOn=GETDATE()
    WHERE BuildingId=@BuildingId;
END
