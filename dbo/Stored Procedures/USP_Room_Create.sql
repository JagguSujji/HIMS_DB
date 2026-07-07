CREATE     PROCEDURE [dbo].[USP_Room_Create]
(
 @FloorId BIGINT,
 @RoomCode VARCHAR(50),
 @RoomNumber VARCHAR(50),
 @RoomName VARCHAR(100),
 @RoomTypeId BIGINT,
 @Capacity INT,
 @ChargePerDay DECIMAL(18,2),
 @CreatedBy BIGINT
)

AS
BEGIN


INSERT INTO dbo.Room
(
FloorId,
RoomCode,
RoomNumber,
RoomName,
RoomTypeId,
Capacity,
ChargePerDay,
IsActive,
CreatedBy,
CreatedOn
)

VALUES
(
@FloorId,
@RoomCode,
@RoomNumber,
@RoomName,
@RoomTypeId,
@Capacity,
@ChargePerDay,
1,
@CreatedBy,
GETDATE()
);


END
