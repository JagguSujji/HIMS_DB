CREATE     PROCEDURE [dbo].[USP_DiscountType_GetAll]


AS
BEGIN


SELECT


DiscountTypeId,

DiscountTypeCode,

DiscountTypeName,

IsPercentage,

IsApprovalRequired


FROM DiscountType


WHERE IsActive=1;



END
