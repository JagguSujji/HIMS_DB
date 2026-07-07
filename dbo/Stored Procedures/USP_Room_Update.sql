

/*****************************************************************************************
ROOM
******************************************************************************************/

CREATE     PROCEDURE [dbo].[USP_Room_Update]
(
    @RoomId INT,
    @FloorId INT,
    @RoomCode NVARCHAR(50),
    @RoomNumber NVARCHAR(20),
    @RoomName NVARCHAR(200),
    @RoomTypeId INT,
    @Capacity INT,
    @ChargePerDay DECIMAL(18,2),
    @IsIsolationRoom BIT,
    @Remarks NVARCHAR(500),
    @ModifiedBy INT
)
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Room
    SET FloorId=@FloorId,
        RoomCode=@RoomCode,
        RoomNumber=@RoomNumber,
        RoomName=@RoomName,
        RoomTypeId=@RoomTypeId,
        Capacity=@Capacity,
        ChargePerDay=@ChargePerDay,
        IsIsolationRoom=@IsIsolationRoom,
        Remarks=@Remarks,
        ModifiedBy=@ModifiedBy,
        ModifiedOn=GETDATE()
    WHERE RoomId=@RoomId;
END
