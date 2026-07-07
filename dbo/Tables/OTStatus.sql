CREATE TABLE [dbo].[OTStatus] (
    [OTStatusId]   INT            IDENTITY (1, 1) NOT NULL,
    [OTStatusCode] VARCHAR (20)   NULL,
    [OTStatusName] NVARCHAR (100) NULL,
    [DisplayColor] VARCHAR (20)   NULL,
    [IsActive]     BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([OTStatusId] ASC)
);

