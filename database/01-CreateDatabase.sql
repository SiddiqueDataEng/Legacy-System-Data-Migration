/*
 * Legacy System Data Migration
 * Project #61 - Complete Database Implementation
 * SQL Server 2008/2012
 * Technology: SSIS, MSSQL
 * Created: 2011
 */

USE master;
GO

IF EXISTS (SELECT name FROM sys.databases WHERE name = 'MigrationDB')
BEGIN
    ALTER DATABASE MigrationDB SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE MigrationDB;
END
GO

CREATE DATABASE MigrationDB
ON PRIMARY
(
    NAME = 'MigrationDB_Data',
    FILENAME = 'C:\SQLData\MigrationDB_Data.mdf',
    SIZE = 100MB,
    MAXSIZE = 5GB,
    FILEGROWTH = 10MB
)
LOG ON
(
    NAME = 'MigrationDB_Log',
    FILENAME = 'C:\SQLData\MigrationDB_Log.ldf',
    SIZE = 50MB,
    MAXSIZE = 1GB,
    FILEGROWTH = 5MB
);
GO

ALTER DATABASE MigrationDB SET RECOVERY SIMPLE;
ALTER DATABASE MigrationDB SET AUTO_UPDATE_STATISTICS ON;
GO

USE MigrationDB;
GO

PRINT 'Database MigrationDB created successfully';
PRINT 'Project: Legacy System Data Migration';
PRINT 'Description: Access/flat files to MSSQL migration';
GO
