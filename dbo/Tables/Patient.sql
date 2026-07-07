CREATE TABLE [dbo].[Patient] (
    [PatientId]                BIGINT         IDENTITY (1, 1) NOT NULL,
    [UHID]                     VARCHAR (50)   NULL,
    [FirstName]                NVARCHAR (100) NULL,
    [LastName]                 NVARCHAR (100) NULL,
    [GenderId]                 INT            NULL,
    [DateOfBirth]              DATE           NULL,
    [Mobile]                   VARCHAR (20)   NULL,
    [IsActive]                 BIT            DEFAULT ((1)) NULL,
    [BloodGroupId]             INT            NULL,
    [MaritalStatusId]          INT            NULL,
    [NationalityId]            INT            NULL,
    [PreferredLanguageId]      INT            NULL,
    [PatientStatus]            NVARCHAR (30)  DEFAULT ('ACTIVE') NULL,
    [Email]                    VARCHAR (150)  NULL,
    [Address]                  TEXT           NULL,
    [EmergencyContactRelation] VARCHAR (50)   NULL,
    [RegistrationDate]         DATETIME       DEFAULT (getdate()) NULL,
    [IsDeceased]               BIT            DEFAULT ((0)) NULL,
    PRIMARY KEY CLUSTERED ([PatientId] ASC)
);

