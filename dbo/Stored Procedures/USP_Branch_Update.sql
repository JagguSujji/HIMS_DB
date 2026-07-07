

/*****************************************************************************************
BRANCH
******************************************************************************************/

CREATE     PROCEDURE [dbo].[USP_Branch_Update]
(
    @BranchId INT,
    @BranchCode NVARCHAR(50),
    @BranchName NVARCHAR(200),
    @HospitalId INT,
    @Phone NVARCHAR(30),
    @Email NVARCHAR(150),
    @Address NVARCHAR(500),
    @ModifiedBy INT
)
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Branch
    SET HospitalId=@HospitalId,
        BranchCode=@BranchCode,
        BranchName=@BranchName,
        --Phone=@Phone,
        --Email=@Email,
        --Address=@Address,
        ModifiedBy=@ModifiedBy,
        ModifiedOn=GETDATE()
    WHERE BranchId=@BranchId;
END
