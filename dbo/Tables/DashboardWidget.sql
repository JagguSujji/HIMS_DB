CREATE TABLE [dbo].[DashboardWidget] (
    [DashboardWidgetId] INT            IDENTITY (1, 1) NOT NULL,
    [WidgetCode]        VARCHAR (20)   NULL,
    [WidgetName]        NVARCHAR (100) NULL,
    [IconClass]         VARCHAR (100)  NULL,
    [DefaultWidth]      INT            NULL,
    [DefaultHeight]     INT            NULL,
    [IsActive]          BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([DashboardWidgetId] ASC)
);

