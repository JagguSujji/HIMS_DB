
CREATE     PROCEDURE [dbo].[USP_Hospital_Delete]
(
    @HospitalId INT,
    @ModifiedBy INT
)
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Hospital
    SET IsActive=0,
        ModifiedBy=@ModifiedBy,
        ModifiedOn=GETDATE()
    WHERE HospitalId=@HospitalId;
END
