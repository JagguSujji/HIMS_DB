CREATE TABLE [dbo].[Manufacturer] (
    [ManufacturerId]   INT            IDENTITY (1, 1) NOT NULL,
    [ManufacturerCode] VARCHAR (20)   NULL,
    [ManufacturerName] NVARCHAR (200) NULL,
    [Phone]            VARCHAR (30)   NULL,
    [Email]            VARCHAR (100)  NULL,
    [IsActive]         BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([ManufacturerId] ASC)
);

