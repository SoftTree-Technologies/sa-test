CREATE TYPE [dbo].[longstring] FROM [varchar](63) NOT NULL
GO

GRANT REFERENCES ON TYPE::[dbo].[longstring] TO [public] AS [dbo]
GO

