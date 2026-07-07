

/*****************************************************************************************
DEPARTMENT
******************************************************************************************/

CREATE     PROCEDURE [dbo].[USP_Department_Update]
(
    @DepartmentId INT,
    @DepartmentCode NVARCHAR(50),
    @DepartmentName NVARCHAR(200),
    @DepartmentTypeId INT,
    @ModifiedBy INT
)
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Department
    SET DepartmentCode=@DepartmentCode,
        DepartmentName=@DepartmentName,
        DepartmentTypeId=@DepartmentTypeId,
        ModifiedBy=@ModifiedBy,
        ModifiedOn=GETDATE()
    WHERE DepartmentId=@DepartmentId;
END
