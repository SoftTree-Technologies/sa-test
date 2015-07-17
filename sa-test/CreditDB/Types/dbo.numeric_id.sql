CREATE TYPE [dbo].[numeric_id] FROM [int] NOT NULL
GO

GRANT REFERENCES ON TYPE::[dbo].[numeric_id] TO [public] AS [dbo]
GO

