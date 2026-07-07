CREATE TABLE [dbo].[ExternalSystemRegistry] (
    [SystemId]   BIGINT         IDENTITY (1, 1) NOT NULL,
    [SystemName] NVARCHAR (200) NULL,
    [BaseUrl]    NVARCHAR (500) NULL,
    [ApiKey]     NVARCHAR (200) NULL,
    [IsActive]   BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([SystemId] ASC)
);

