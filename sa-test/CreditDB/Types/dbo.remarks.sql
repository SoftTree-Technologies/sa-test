CREATE TYPE [dbo].[remarks] FROM [varchar](255) NOT NULL
GO

GRANT REFERENCES ON TYPE::[dbo].[remarks] TO [public] AS [dbo]
GO

