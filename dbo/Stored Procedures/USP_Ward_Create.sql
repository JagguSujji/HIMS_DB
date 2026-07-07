CREATE     PROCEDURE [dbo].[USP_Ward_Create]
(
 @WardCode VARCHAR(50),
 @WardName VARCHAR(100),
 @WardTypeId BIGINT,
 @Capacity INT,
 @CreatedBy BIGINT
)

AS
BEGIN


INSERT INTO dbo.Ward
(
WardCode,
WardName,
WardTypeId,
Capacity,
IsActive,
CreatedBy,
CreatedOn
)

VALUES
(
@WardCode,
@WardName,
@WardTypeId,
@Capacity,
1,
@CreatedBy,
GETDATE()
);


END
