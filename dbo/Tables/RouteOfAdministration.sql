CREATE TABLE [dbo].[RouteOfAdministration] (
    [RouteOfAdministrationId] INT            IDENTITY (1, 1) NOT NULL,
    [RouteCode]               VARCHAR (20)   NULL,
    [RouteName]               NVARCHAR (100) NULL,
    [IsActive]                BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([RouteOfAdministrationId] ASC)
);

