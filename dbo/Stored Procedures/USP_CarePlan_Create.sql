


/*--------------------------------------------------------
 Treatment Plan Create
--------------------------------------------------------*/
CREATE     PROCEDURE [dbo].[USP_CarePlan_Create]
(
 @PatientId INT,
 @EncounterId INT,
 @PlanName VARCHAR(200),
 @CreatedBy INT
)
AS
BEGIN

INSERT INTO CarePlan
(
 PatientId,
 EncounterId,
 PlanName,
 CreatedOn,
 CreatedBy
)
VALUES
(
 @PatientId,
 @EncounterId,
 @PlanName,
 GETDATE(),
 @CreatedBy
);


SELECT SCOPE_IDENTITY() CarePlanId;

END
