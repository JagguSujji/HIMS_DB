CREATE TABLE [dbo].[SurgeryCategory] (
    [SurgeryCategoryId]   INT            IDENTITY (1, 1) NOT NULL,
    [SurgeryCategoryCode] VARCHAR (20)   NOT NULL,
    [SurgeryCategoryName] NVARCHAR (100) NOT NULL,
    [Description]         NVARCHAR (300) NULL,
    [IsActive]            BIT            DEFAULT ((1)) NULL,
    [CreatedOn]           DATETIME2 (7)  DEFAULT (getdate()) NULL,
    PRIMARY KEY CLUSTERED ([SurgeryCategoryId] ASC),
    UNIQUE NONCLUSTERED ([SurgeryCategoryCode] ASC)
);

