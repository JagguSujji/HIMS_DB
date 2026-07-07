CREATE TABLE [dbo].[SurgeryPosition] (
    [SurgeryPositionId] INT            IDENTITY (1, 1) NOT NULL,
    [PositionCode]      VARCHAR (20)   NULL,
    [PositionName]      NVARCHAR (100) NULL,
    [IsActive]          BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([SurgeryPositionId] ASC)
);

