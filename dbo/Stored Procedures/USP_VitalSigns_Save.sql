


/*--------------------------------------------------------
 Vital Signs Save
--------------------------------------------------------*/
CREATE     PROCEDURE [dbo].[USP_VitalSigns_Save]
(
 @PatientId INT,
 @EncounterId INT,
 @VitalTypeId INT,
 @Value VARCHAR(100),
 @UnitOfMeasureId INT,
 @RecordedBy INT,
 @Remarks NVARCHAR(500)
)
AS
BEGIN

INSERT INTO VitalSigns
(
 PatientId,
 EncounterId,
 VitalTypeId,
 Value,
 UnitOfMeasureId,
 RecordedOn,
 RecordedBy,
 Remarks
)
VALUES
(
 @PatientId,
 @EncounterId,
 @VitalTypeId,
 @Value,
 @UnitOfMeasureId,
 GETDATE(),
 @RecordedBy,
 @Remarks
);


SELECT SCOPE_IDENTITY() VitalSignId;

END
