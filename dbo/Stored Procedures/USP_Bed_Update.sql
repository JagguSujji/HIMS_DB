

/*****************************************************************************************
BED
******************************************************************************************/

CREATE     PROCEDURE [dbo].[USP_Bed_Update]
(
    @BedId INT,
    @RoomId INT,
    @BedNumber NVARCHAR(50),
    @BedTypeId INT,
    @StatusId INT,
    @ModifiedBy INT
)
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Bed
    SET RoomId=@RoomId,
        BedNumber=@BedNumber,
        BedTypeId=@BedTypeId,
        BedStatusId=@StatusId,
        ModifiedBy=@ModifiedBy,
        ModifiedOn=GETDATE()
    WHERE BedId=@BedId;
END
