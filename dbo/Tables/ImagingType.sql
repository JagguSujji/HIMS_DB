CREATE TABLE [dbo].[ImagingType] (
    [ImagingTypeId] INT            IDENTITY (1, 1) NOT NULL,
    [ImagingCode]   VARCHAR (20)   NOT NULL,
    [ImagingName]   NVARCHAR (100) NOT NULL,
    [Description]   NVARCHAR (300) NULL,
    [IsRadiation]   BIT            DEFAULT ((0)) NOT NULL,
    [IsActive]      BIT            DEFAULT ((1)) NOT NULL,
    [CreatedOn]     DATETIME2 (7)  DEFAULT (getdate()) NULL,
    PRIMARY KEY CLUSTERED ([ImagingTypeId] ASC),
    UNIQUE NONCLUSTERED ([ImagingCode] ASC)
);

