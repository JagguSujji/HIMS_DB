
CREATE     PROCEDURE [dbo].[USP_Room_Delete]
(
    @RoomId INT,
    @ModifiedBy INT
)
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Room
    SET IsActive=0,
        ModifiedBy=@ModifiedBy,
        ModifiedOn=GETDATE()
    WHERE RoomId=@RoomId;
END
