

CREATE     PROCEDURE [dbo].[USP_Patient_Search]
(
    @SearchText NVARCHAR(100)
)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT TOP 100
        PatientId,
        UHID,
        FirstName,
        LastName,
        Mobile,
        Email,
        DateOfBirth,
        PatientStatus
    FROM dbo.Patient
    WHERE 
        UHID LIKE '%' + @SearchText + '%'
        OR FirstName LIKE '%' + @SearchText + '%'
        OR LastName LIKE '%' + @SearchText + '%'
        OR Mobile LIKE '%' + @SearchText + '%';

END
