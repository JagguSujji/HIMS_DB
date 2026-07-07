CREATE TABLE [dbo].[DrugReservation] (
    [ReservationId]    BIGINT          IDENTITY (1, 1) NOT NULL,
    [DrugId]           BIGINT          NOT NULL,
    [StoreId]          BIGINT          NOT NULL,
    [ReservedQuantity] DECIMAL (18, 2) NOT NULL,
    [ReferenceType]    NVARCHAR (50)   NOT NULL,
    [ReferenceId]      BIGINT          NOT NULL,
    [Status]           NVARCHAR (30)   DEFAULT ('ACTIVE') NOT NULL,
    [ReservedOn]       DATETIME2 (7)   DEFAULT (sysdatetime()) NOT NULL,
    PRIMARY KEY CLUSTERED ([ReservationId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_DrugReservation_Drug]
    ON [dbo].[DrugReservation]([DrugId] ASC);

