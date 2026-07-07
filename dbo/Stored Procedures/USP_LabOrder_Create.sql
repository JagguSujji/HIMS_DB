


/*******************************************************
 4. Create Lab Order
*******************************************************/
CREATE     PROCEDURE [dbo].[USP_LabOrder_Create]
(
 @PatientId INT,
 @DoctorId INT,
 @OrderPriority VARCHAR(50),
 @ClinicalNotes VARCHAR(MAX)
)
AS
BEGIN


INSERT INTO dbo.LabOrder
(
 PatientId,
 OrderDate,
 DoctorId,
 OrderPriority,
 ClinicalNotes
)
VALUES
(
 @PatientId,
 GETDATE(),
 @DoctorId,
 @OrderPriority,
 @ClinicalNotes
);


SELECT SCOPE_IDENTITY() LabOrderId;

END
