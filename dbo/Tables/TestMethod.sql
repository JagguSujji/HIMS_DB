CREATE TABLE [dbo].[TestMethod] (
    [TestMethodId] INT            IDENTITY (1, 1) NOT NULL,
    [MethodCode]   VARCHAR (20)   NULL,
    [MethodName]   NVARCHAR (100) NULL,
    [IsActive]     BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([TestMethodId] ASC)
);

