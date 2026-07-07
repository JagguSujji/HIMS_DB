CREATE     PROCEDURE [dbo].[USP_Bed_Create]
(
 @RoomId BIGINT,
 @BedCode VARCHAR(50),
 @BedNumber VARCHAR(50),
 @BedTypeId BIGINT,
 @FloorId BIGINT,
 @CreatedBy BIGINT
)

AS
BEGIN


INSERT INTO dbo.Bed
(
RoomId,
BedCode,
BedNumber,
BedTypeId,
BedStatusId,
IsOccupied,
IsActive,
FloorId,
CreatedBy,
CreatedOn
)

VALUES
(
@RoomId,
@BedCode,
@BedNumber,
@BedTypeId,
1,
0,
1,
@FloorId,
@CreatedBy,
GETDATE()
);


END
