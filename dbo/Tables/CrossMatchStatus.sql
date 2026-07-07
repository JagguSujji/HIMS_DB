CREATE TABLE [dbo].[CrossMatchStatus] (
    [CrossMatchStatusId]   INT            IDENTITY (1, 1) NOT NULL,
    [CrossMatchStatusCode] VARCHAR (20)   NULL,
    [CrossMatchStatusName] NVARCHAR (100) NULL,
    [IsCompatible]         BIT            NULL,
    [IsActive]             BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([CrossMatchStatusId] ASC)
);

