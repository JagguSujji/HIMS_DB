CREATE TABLE [dbo].[ChartType] (
    [ChartTypeId]   INT            IDENTITY (1, 1) NOT NULL,
    [ChartCode]     VARCHAR (20)   NULL,
    [ChartName]     NVARCHAR (100) NULL,
    [Is3DSupported] BIT            NULL,
    [IsActive]      BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([ChartTypeId] ASC)
);

