CREATE TABLE [dbo].[RadiologyReportTemplate] (
    [ReportTemplateId] BIGINT         IDENTITY (1, 1) NOT NULL,
    [TemplateCode]     VARCHAR (30)   NULL,
    [TemplateName]     NVARCHAR (200) NULL,
    [ImagingTypeId]    INT            NULL,
    [BodyPartId]       INT            NULL,
    [TemplateText]     NVARCHAR (MAX) NULL,
    [IsActive]         BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([ReportTemplateId] ASC),
    FOREIGN KEY ([BodyPartId]) REFERENCES [dbo].[BodyPart] ([BodyPartId]),
    FOREIGN KEY ([ImagingTypeId]) REFERENCES [dbo].[ImagingType] ([ImagingTypeId])
);

