
CREATE     PROCEDURE [dbo].[USP_Ward_Delete]
(
    @WardId INT,
    @ModifiedBy INT
)
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Ward
    SET IsActive=0,
        ModifiedBy=@ModifiedBy,
        ModifiedOn=GETDATE()
    WHERE WardId=@WardId;
END
