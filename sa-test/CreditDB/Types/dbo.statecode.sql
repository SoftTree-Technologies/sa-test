CREATE TYPE [dbo].[statecode] FROM [char](2) NOT NULL
GO

GRANT REFERENCES ON TYPE::[dbo].[statecode] TO [public] AS [dbo]
GO

