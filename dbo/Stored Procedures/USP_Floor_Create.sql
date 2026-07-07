CREATE     PROCEDURE [dbo].[USP_Floor_Create]
(
 @BuildingId BIGINT,
 @FloorCode VARCHAR(50),
 @FloorNumber INT,
 @FloorName VARCHAR(100),
 @CreatedBy BIGINT
)

AS
BEGIN


INSERT INTO dbo.Floor
(
BuildingId,
FloorCode,
FloorNumber,
FloorName,
IsActive,
CreatedBy,
CreatedOn
)

VALUES
(
@BuildingId,
@FloorCode,
@FloorNumber,
@FloorName,
1,
@CreatedBy,
GETDATE()
);


END
