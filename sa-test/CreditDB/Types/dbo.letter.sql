CREATE TYPE [dbo].[letter] FROM [char](1) NOT NULL
GO

GRANT REFERENCES ON TYPE::[dbo].[letter] TO [public] AS [dbo]
GO

