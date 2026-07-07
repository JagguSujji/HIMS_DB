


/*******************************************************
 8. Get Chief Complaint Master
*******************************************************/
CREATE     PROCEDURE [dbo].[USP_ChiefComplaint_GetAll]
AS
BEGIN

    SELECT
        ChiefComplaintId,
        ComplaintCode,
        ComplaintName,
        Description,
        DisplayOrder
    FROM dbo.ChiefComplaint
    WHERE IsActive=1
    ORDER BY DisplayOrder;

END
