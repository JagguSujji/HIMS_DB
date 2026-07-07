CREATE TABLE [dbo].[InstrumentSet] (
    [InstrumentSetId]       INT            IDENTITY (1, 1) NOT NULL,
    [InstrumentSetCode]     VARCHAR (30)   NULL,
    [InstrumentSetName]     NVARCHAR (150) NULL,
    [Description]           NVARCHAR (500) NULL,
    [SterilizationRequired] BIT            DEFAULT ((1)) NULL,
    [IsActive]              BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([InstrumentSetId] ASC)
);

