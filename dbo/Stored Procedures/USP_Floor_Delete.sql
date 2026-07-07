
CREATE     PROCEDURE [dbo].[USP_Floor_Delete]
(
    @FloorId INT,
    @ModifiedBy INT
)
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Floor
    SET IsActive=0,
        ModifiedBy=@ModifiedBy,
        ModifiedOn=GETDATE()
    WHERE FloorId=@FloorId;
END
