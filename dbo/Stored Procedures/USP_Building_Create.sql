CREATE     PROCEDURE [dbo].[USP_Building_Create]
(
 @BranchId BIGINT,
 @BuildingCode VARCHAR(50),
 @BuildingName VARCHAR(100),
 @NumberOfFloors INT,
 @Description VARCHAR(500),
 @CreatedBy BIGINT
)

AS
BEGIN


INSERT INTO dbo.Building
(
BranchId,
BuildingCode,
BuildingName,
NumberOfFloors,
Description,
IsActive,
CreatedBy,
CreatedOn
)

VALUES
(
@BranchId,
@BuildingCode,
@BuildingName,
@NumberOfFloors,
@Description,
1,
@CreatedBy,
GETDATE()
);


END
