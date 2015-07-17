SET ANSI_NULLS OFF
GO

SET QUOTED_IDENTIFIER OFF
GO


/****** Object:  Stored Procedure dbo.removeregion    Script Date: 10/13/99 6:38:02 PM ******/


CREATE PROCEDURE removeregion
    @region_no    numeric_id
AS 
    DELETE region
      WHERE region_no = @region_no

    IF @@error != 0
       RETURN (-99)
    ELSE
       RETURN 0

GO

