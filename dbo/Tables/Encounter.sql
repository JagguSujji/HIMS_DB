CREATE TABLE [dbo].[Encounter] (
    [EncounterId]     BIGINT       IDENTITY (1, 1) NOT NULL,
    [VisitId]         BIGINT       NULL,
    [EncounterType]   VARCHAR (50) NULL,
    [StartTime]       DATETIME     NULL,
    [EndTime]         DATETIME     NULL,
    [ProviderId]      BIGINT       NULL,
    [EncounterStatus] VARCHAR (30) NULL,
    [LocationId]      BIGINT       NULL,
    [NotesSummary]    TEXT         NULL,
    PRIMARY KEY CLUSTERED ([EncounterId] ASC)
);

