
CREATE     PROCEDURE [dbo].[USP_Department_Delete]
(
    @DepartmentId INT,
    @ModifiedBy INT
)
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Department
    SET IsActive=0,
        ModifiedBy=@ModifiedBy,
        ModifiedOn=GETDATE()
    WHERE DepartmentId=@DepartmentId;
END
