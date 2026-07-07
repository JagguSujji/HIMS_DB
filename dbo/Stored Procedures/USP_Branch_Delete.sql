
CREATE     PROCEDURE [dbo].[USP_Branch_Delete]
(
    @BranchId INT,
    @ModifiedBy INT
)
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Branch
    SET IsActive=0,
        ModifiedBy=@ModifiedBy,
        ModifiedOn=GETDATE()
    WHERE BranchId=@BranchId;
END
