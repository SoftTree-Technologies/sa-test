SET ANSI_NULLS OFF
GO

SET QUOTED_IDENTIFIER OFF
GO


/****** Object:  View dbo.overdue    Script Date: 10/13/99 6:38:01 PM ******/



CREATE VIEW overdue
AS
    SELECT *
    FROM statement_wide
    WHERE due_dt < GETDATE()

GO

