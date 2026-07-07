CREATE TABLE [dbo].[NotificationTemplate] (
    [TemplateId]      BIGINT         IDENTITY (1, 1) NOT NULL,
    [TemplateCode]    NVARCHAR (30)  NOT NULL,
    [TemplateName]    NVARCHAR (150) NOT NULL,
    [ModuleName]      NVARCHAR (100) NOT NULL,
    [Channel]         NVARCHAR (20)  NOT NULL,
    [SubjectTemplate] NVARCHAR (250) NULL,
    [BodyTemplate]    NVARCHAR (MAX) NOT NULL,
    [IsActive]        BIT            CONSTRAINT [DF_NotificationTemplate_IsActive] DEFAULT ((1)) NOT NULL,
    [CreatedOn]       DATETIME2 (7)  CONSTRAINT [DF_NotificationTemplate_CreatedOn] DEFAULT (sysdatetime()) NOT NULL,
    PRIMARY KEY CLUSTERED ([TemplateId] ASC),
    CONSTRAINT [UQ_NotificationTemplate_Code] UNIQUE NONCLUSTERED ([TemplateCode] ASC)
);

