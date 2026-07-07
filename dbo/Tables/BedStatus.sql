CREATE TABLE [dbo].[BedStatus] (
    [BedStatusId] INT            IDENTITY (1, 1) NOT NULL,
    [StatusCode]  VARCHAR (20)   NOT NULL,
    [StatusName]  NVARCHAR (100) NOT NULL,
    [Description] NVARCHAR (300) NULL,
    [IsActive]    BIT            DEFAULT ((1)) NOT NULL,
    [CreatedOn]   DATETIME2 (7)  DEFAULT (getdate()) NULL,
    PRIMARY KEY CLUSTERED ([BedStatusId] ASC),
    UNIQUE NONCLUSTERED ([StatusCode] ASC)
);

