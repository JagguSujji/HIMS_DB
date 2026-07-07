CREATE TABLE [dbo].[EpisodeOfCare] (
    [EpisodeId]       BIGINT       IDENTITY (1, 1) NOT NULL,
    [PatientId]       BIGINT       NOT NULL,
    [StartDate]       DATETIME     NOT NULL,
    [EndDate]         DATETIME     NULL,
    [EpisodeType]     VARCHAR (50) NULL,
    [PrimaryDoctorId] BIGINT       NULL,
    [Status]          VARCHAR (30) NULL,
    [CreatedOn]       DATETIME     DEFAULT (getdate()) NULL,
    PRIMARY KEY CLUSTERED ([EpisodeId] ASC)
);

