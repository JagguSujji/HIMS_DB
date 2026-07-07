CREATE     PROCEDURE [dbo].[USP_Bed_UpdateStatus]

(
 @BedId BIGINT,
 @BedStatusId BIGINT,
 @IsOccupied BIT
)

AS
BEGIN


UPDATE dbo.Bed

SET

BedStatusId=@BedStatusId,
IsOccupied=@IsOccupied

WHERE BedId=@BedId;


END
