


CREATE     PROCEDURE [dbo].[USP_PayrollComponent_Create]
(
 @ComponentCode VARCHAR(50),
 @ComponentName VARCHAR(100),
 @PayrollComponentTypeId INT,
 @IsTaxable BIT
)
AS
BEGIN

INSERT INTO PayrollComponent
(
ComponentCode,
ComponentName,
PayrollComponentTypeId,
IsTaxable,
IsActive
)

VALUES
(
@ComponentCode,
@ComponentName,
@PayrollComponentTypeId,
@IsTaxable,
1
)

END
