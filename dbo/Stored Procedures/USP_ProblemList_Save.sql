


/*******************************************************
 6. Save Patient Problem List
*******************************************************/
CREATE     PROCEDURE [dbo].[USP_ProblemList_Save]
(
    @ProblemId INT=NULL,
    @PatientId INT,
    @ICDCode VARCHAR(50),
    @ProblemName VARCHAR(200),
    @Status VARCHAR(50),
    @OnsetDate DATE
)
AS
BEGIN
    SET NOCOUNT ON;


    IF EXISTS
    (
        SELECT 1 
        FROM dbo.ProblemList
        WHERE ProblemId=@ProblemId
    )
    BEGIN

        UPDATE dbo.ProblemList
        SET
            ICDCode=@ICDCode,
            ProblemName=@ProblemName,
            Status=@Status,
            OnsetDate=@OnsetDate
        WHERE ProblemId=@ProblemId;

    END
    ELSE
    BEGIN

        INSERT INTO dbo.ProblemList
        (
            PatientId,
            ICDCode,
            ProblemName,
            Status,
            OnsetDate
        )
        VALUES
        (
            @PatientId,
            @ICDCode,
            @ProblemName,
            @Status,
            @OnsetDate
        );

    END
END
