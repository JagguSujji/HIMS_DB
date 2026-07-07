CREATE TABLE [dbo].[ClaimProcessing] (
    [ClaimProcessId] INT            NOT NULL,
    [ClaimId]        INT            NULL,
    [ProcessedBy]    INT            NULL,
    [Status]         VARCHAR (50)   NULL,
    [Remarks]        NVARCHAR (MAX) NULL,
    PRIMARY KEY CLUSTERED ([ClaimProcessId] ASC)
);

