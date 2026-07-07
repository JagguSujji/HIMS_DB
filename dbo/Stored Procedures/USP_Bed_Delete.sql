
CREATE     PROCEDURE [dbo].[USP_Bed_Delete]
(
    @BedId INT,
    @ModifiedBy INT
)
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Bed
    SET IsActive=0,
        ModifiedBy=@ModifiedBy,
        ModifiedOn=GETDATE()
    WHERE BedId=@BedId;
END
