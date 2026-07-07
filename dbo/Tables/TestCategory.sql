CREATE TABLE [dbo].[TestCategory] (
    [TestCategoryId]   INT            IDENTITY (1, 1) NOT NULL,
    [TestCategoryCode] VARCHAR (20)   NULL,
    [TestCategoryName] NVARCHAR (100) NULL,
    [IsActive]         BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([TestCategoryId] ASC)
);

