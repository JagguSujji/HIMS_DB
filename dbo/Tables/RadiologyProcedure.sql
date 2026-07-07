CREATE TABLE [dbo].[RadiologyProcedure] (
    [RadiologyProcedureId] BIGINT         IDENTITY (1, 1) NOT NULL,
    [ProcedureCode]        VARCHAR (30)   NULL,
    [ProcedureName]        NVARCHAR (200) NULL,
    [ImagingTypeId]        INT            NULL,
    [BodyPartId]           INT            NULL,
    [ContrastTypeId]       INT            NULL,
    [EstimatedDuration]    INT            NULL,
    [IsActive]             BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([RadiologyProcedureId] ASC),
    FOREIGN KEY ([BodyPartId]) REFERENCES [dbo].[BodyPart] ([BodyPartId]),
    FOREIGN KEY ([ContrastTypeId]) REFERENCES [dbo].[ContrastType] ([ContrastTypeId]),
    FOREIGN KEY ([ImagingTypeId]) REFERENCES [dbo].[ImagingType] ([ImagingTypeId])
);

