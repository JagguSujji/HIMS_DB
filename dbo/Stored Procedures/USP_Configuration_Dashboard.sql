CREATE     PROCEDURE [dbo].[USP_Configuration_Dashboard]


AS
BEGIN


SELECT

(SELECT COUNT(*) FROM SystemConfiguration)
Configurations,


(SELECT COUNT(*) FROM NumberSeriesGenerator)
NumberSeries,


(SELECT COUNT(*) FROM ApprovalLevel)
ApprovalLevels,


(SELECT COUNT(*) FROM WorkflowStatus)
WorkflowStatuses;


END
