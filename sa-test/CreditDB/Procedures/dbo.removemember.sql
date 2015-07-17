SET ANSI_NULLS OFF
GO

SET QUOTED_IDENTIFIER OFF
GO


/****** Object:  Stored Procedure dbo.removemember    Script Date: 10/13/99 6:38:03 PM ******/


CREATE PROCEDURE removemember
    @member_no    numeric_id
AS 
    DELETE member
      WHERE member_no = @member_no

    IF @@error != 0
       RETURN (-99)
    ELSE
       RETURN 0

GO

