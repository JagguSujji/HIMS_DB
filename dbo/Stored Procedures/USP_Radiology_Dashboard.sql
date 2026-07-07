


--------------------------------------------------------------
-- 3. Radiology Dashboard
--------------------------------------------------------------

CREATE     PROCEDURE [dbo].[USP_Radiology_Dashboard]
AS
BEGIN

    SET NOCOUNT ON;


    SELECT

    (
        SELECT COUNT(*)
        FROM dbo.RadiologyOrder
        WHERE CAST(OrderDate AS DATE)=CAST(GETDATE() AS DATE)

    ) AS TodayOrders,


    (
        SELECT COUNT(*)
        FROM dbo.RadiologyWorklist
        WHERE Status='Pending'

    ) AS PendingStudies,


    (
        SELECT COUNT(*)
        FROM dbo.RadiologyWorklist
        WHERE Status='Completed'

    ) AS CompletedStudies,


    (
        SELECT COUNT(*)
        FROM dbo.RadiologyResult

    ) AS TotalReports,


    (
        SELECT COUNT(*)
        FROM dbo.RadiologyImageStorage

    ) AS ImagesStored;


END
