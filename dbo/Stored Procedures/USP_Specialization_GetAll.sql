CREATE     PROCEDURE [dbo].[USP_Specialization_GetAll]


AS
BEGIN


SELECT


SpecializationId,

SpecializationCode,

SpecializationName


FROM Specialization


WHERE IsActive=1;



END
