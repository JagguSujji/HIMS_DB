CREATE     PROCEDURE [dbo].[USP_Lab_NormalRange_Get]


(
 @LabTestId BIGINT,
 @GenderId BIGINT,
 @Age INT
)

AS
BEGIN


SELECT


MinimumValue,

MaximumValue,

ResultUnitId


FROM dbo.NormalRange


WHERE

LabTestId=@LabTestId


AND GenderId=@GenderId


AND @Age BETWEEN AgeFrom AND AgeTo;



END
