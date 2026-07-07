CREATE TABLE [dbo].[BedStatusLog] (
    [BedStatusLogId] BIGINT         IDENTITY (1, 1) NOT NULL,
    [BedId]          INT            NOT NULL,
    [BedTypeId]      INT            NULL,
    [BedStatusId]    INT            NOT NULL,
    [StatusFrom]     DATETIME2 (7)  NOT NULL,
    [StatusTo]       DATETIME2 (7)  NULL,
    [Remarks]        NVARCHAR (300) NULL,
    [CreatedOn]      DATETIME2 (7)  DEFAULT (getdate()) NULL,
    PRIMARY KEY CLUSTERED ([BedStatusLogId] ASC)
);

