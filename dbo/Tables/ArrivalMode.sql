CREATE TABLE [dbo].[ArrivalMode] (
    [ArrivalModeId]   INT            IDENTITY (1, 1) NOT NULL,
    [ArrivalModeCode] VARCHAR (20)   NULL,
    [ArrivalModeName] NVARCHAR (100) NULL,
    [IsActive]        BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([ArrivalModeId] ASC)
);

