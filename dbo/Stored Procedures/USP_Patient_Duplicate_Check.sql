


CREATE     PROCEDURE [dbo].[USP_Patient_Duplicate_Check]
(
 @Mobile NVARCHAR(20),
 @DOB DATE
)
AS
BEGIN

SELECT *
FROM dbo.Patient
WHERE Mobile=@Mobile
AND DateOfBirth=@DOB;

END
