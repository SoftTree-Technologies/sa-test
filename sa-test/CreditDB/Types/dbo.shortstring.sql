CREATE TYPE [dbo].[shortstring] FROM [varchar](15) NOT NULL
GO

GRANT REFERENCES ON TYPE::[dbo].[shortstring] TO [public] AS [dbo]
GO

