CREATE TYPE [dbo].[normstring] FROM [varchar](31) NOT NULL
GO

GRANT REFERENCES ON TYPE::[dbo].[normstring] TO [public] AS [dbo]
GO

