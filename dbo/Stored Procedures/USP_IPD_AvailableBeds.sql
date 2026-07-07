CREATE     PROCEDURE [dbo].[USP_IPD_AvailableBeds]

(
 @RoomTypeId BIGINT=NULL
)

AS
BEGIN


SELECT


B.BedId,

B.BedCode,

B.BedNumber,

R.RoomNumber,

R.RoomName


FROM dbo.Bed B


INNER JOIN dbo.Room R

ON B.RoomId=R.RoomId



WHERE


B.IsOccupied=0

AND B.IsActive=1



AND

(
@RoomTypeId IS NULL

OR R.RoomTypeId=@RoomTypeId
);



END
