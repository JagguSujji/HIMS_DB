


--------------------------------------------------------------
-- 6. Create Radiology Procedure Master
--------------------------------------------------------------

CREATE     PROCEDURE [dbo].[USP_RadiologyProcedure_Create]
(
    @ProcedureCode VARCHAR(50),
    @ProcedureName VARCHAR(200),
    @ImagingTypeId INT,
    @BodyPartId INT,
    @ContrastTypeId INT=NULL,
    @EstimatedDuration INT
)
AS
BEGIN
    SET NOCOUNT ON;


    INSERT INTO dbo.RadiologyProcedure
    (
        ProcedureCode,
        ProcedureName,
        ImagingTypeId,
        BodyPartId,
        ContrastTypeId,
        EstimatedDuration,
        IsActive
    )
    VALUES
    (
        @ProcedureCode,
        @ProcedureName,
        @ImagingTypeId,
        @BodyPartId,
        @ContrastTypeId,
        @EstimatedDuration,
        1
    );


    SELECT SCOPE_IDENTITY() AS RadiologyProcedureId;

END
