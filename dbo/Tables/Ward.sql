CREATE TABLE [dbo].[Ward] (
    [WardId]              INT            IDENTITY (1, 1) NOT NULL,
    [WardCode]            VARCHAR (20)   NOT NULL,
    [WardName]            NVARCHAR (200) NOT NULL,
    [WardTypeId]          INT            NULL,
    [GenderRestrictionId] INT            NULL,
    [Capacity]            INT            NULL,
    [IsActive]            BIT            DEFAULT ((1)) NOT NULL,
    [Remarks]             NVARCHAR (500) NULL,
    [CreatedBy]           INT            NULL,
    [CreatedOn]           DATETIME2 (7)  DEFAULT (getdate()) NULL,
    [ModifiedBy]          INT            NULL,
    [ModifiedOn]          DATETIME2 (7)  NULL,
    [RowVersion]          ROWVERSION     NOT NULL,
    PRIMARY KEY CLUSTERED ([WardId] ASC)
);

