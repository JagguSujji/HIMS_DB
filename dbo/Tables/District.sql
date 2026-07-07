CREATE TABLE [dbo].[District] (
    [DistrictId]   INT           IDENTITY (1, 1) NOT NULL,
    [StateId]      INT           NOT NULL,
    [DistrictName] VARCHAR (100) NOT NULL,
    [IsActive]     BIT           DEFAULT ((1)) NOT NULL,
    [CreatedOn]    DATETIME      DEFAULT (getdate()) NOT NULL,
    PRIMARY KEY CLUSTERED ([DistrictId] ASC),
    FOREIGN KEY ([StateId]) REFERENCES [dbo].[State] ([StateId])
);

