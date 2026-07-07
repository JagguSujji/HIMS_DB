CREATE TABLE [dbo].[PreAuthorizationType] (
    [PreAuthorizationTypeId] INT            IDENTITY (1, 1) NOT NULL,
    [PreAuthorizationCode]   VARCHAR (20)   NULL,
    [PreAuthorizationName]   NVARCHAR (100) NULL,
    [IsEmergency]            BIT            NULL,
    [IsActive]               BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([PreAuthorizationTypeId] ASC)
);

