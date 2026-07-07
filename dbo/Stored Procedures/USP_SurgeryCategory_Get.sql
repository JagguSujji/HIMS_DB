CREATE     PROCEDURE [dbo].[USP_SurgeryCategory_Get]

AS
BEGIN

SELECT

SurgeryCategoryId,
SurgeryCategoryCode,
SurgeryCategoryName

FROM dbo.SurgeryCategory

WHERE IsActive=1;

END
