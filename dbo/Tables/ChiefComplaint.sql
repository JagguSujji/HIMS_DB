CREATE TABLE [dbo].[ChiefComplaint] (
    [ChiefComplaintId] INT            IDENTITY (1, 1) NOT NULL,
    [ComplaintCode]    VARCHAR (20)   NULL,
    [ComplaintName]    NVARCHAR (200) NULL,
    [Description]      NVARCHAR (500) NULL,
    [DisplayOrder]     INT            DEFAULT ((1)) NULL,
    [IsActive]         BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([ChiefComplaintId] ASC),
    UNIQUE NONCLUSTERED ([ComplaintCode] ASC)
);

