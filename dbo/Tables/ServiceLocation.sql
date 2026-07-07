CREATE TABLE [dbo].[ServiceLocation] (
    [ServiceLocationId]     INT            IDENTITY (1, 1) NOT NULL,
    [ServiceLocationCode]   VARCHAR (20)   NOT NULL,
    [ServiceLocationName]   NVARCHAR (200) NOT NULL,
    [ServiceLocationTypeId] INT            NULL,
    [IsAppointmentRequired] BIT            DEFAULT ((0)) NOT NULL,
    [IsActive]              BIT            DEFAULT ((1)) NOT NULL,
    [Remarks]               NVARCHAR (500) NULL,
    [CreatedBy]             INT            NULL,
    [CreatedOn]             DATETIME2 (7)  DEFAULT (getdate()) NULL,
    [ModifiedBy]            INT            NULL,
    [ModifiedOn]            DATETIME2 (7)  NULL,
    [RowVersion]            ROWVERSION     NOT NULL,
    PRIMARY KEY CLUSTERED ([ServiceLocationId] ASC)
);

