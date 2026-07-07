/*****************************************************************************************
HOSPITAL
******************************************************************************************/

CREATE     PROCEDURE [dbo].[USP_Hospital_Update]
(
    @HospitalId INT,
    @HospitalCode NVARCHAR(50),
    @HospitalName NVARCHAR(200),
    @Phone NVARCHAR(30),
    @Email NVARCHAR(150),
    @Address NVARCHAR(500),
    @ModifiedBy INT
)
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Hospital
    SET HospitalCode=@HospitalCode,
        HospitalName=@HospitalName,
        --Phone=@Phone,
        --Email=@Email,
        --Address=@Address,
        ModifiedBy=@ModifiedBy,
        ModifiedOn=GETDATE()
    WHERE HospitalId=@HospitalId;
END
