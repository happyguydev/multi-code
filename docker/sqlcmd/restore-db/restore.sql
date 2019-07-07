-- database name
:setvar DatabaseName MultiCodeLW

-- backup database file name without ".bak"
:setvar BackupDatabaseFileName MultiCodeLW_base

-- database file name in the database's file system
:setvar DBFileName trw

PRINT 'RESTORING the database'
GO

USE [master]

IF EXISTS(select * from sys.databases where name='$(DatabaseName)')
BEGIN
	ALTER DATABASE $(DatabaseName) SET SINGLE_USER WITH ROLLBACK IMMEDIATE

	DROP DATABASE  $(DatabaseName)
END

RESTORE DATABASE $(DatabaseName)
  FROM DISK = '/var/opt/mssql/backup/$(BackupDatabaseFileName).bak' WITH  FILE = 1,
  MOVE '$(DBFileName)' TO '/var/opt/mssql/data/$(DatabaseName).mdf',
  MOVE '$(DBFileName)_Log' TO '/var/opt/mssql/data/$(DatabaseName)_Log.ldf',
  NOUNLOAD, STATS = 5
GO

ALTER DATABASE $(DatabaseName) SET MULTI_USER
GO

:setvar gitBaseFolder '/opt/sql' -- path to sql git base folder
