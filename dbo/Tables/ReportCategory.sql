CREATE TABLE [dbo].[ReportCategory] (
    [ReportCategoryId]   INT            IDENTITY (1, 1) NOT NULL,
    [ReportCategoryCode] VARCHAR (20)   NOT NULL,
    [ReportCategoryName] NVARCHAR (100) NOT NULL,
    [Description]        NVARCHAR (500) NULL,
    [DisplayOrder]       INT            NULL,
    [IsActive]           BIT            DEFAULT ((1)) NULL,
    [CreatedOn]          DATETIME2 (7)  DEFAULT (getdate()) NULL,
    PRIMARY KEY CLUSTERED ([ReportCategoryId] ASC),
    UNIQUE NONCLUSTERED ([ReportCategoryCode] ASC)
);

