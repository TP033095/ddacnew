
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 09/03/2016 16:20:32
-- Generated from EDMX file: C:\Users\Henry\Desktop\TP033095-DDAC\TP033095\TP033095\ERD.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [tp033095ddac];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Yards'
CREATE TABLE [dbo].[Yards] (
    [yardId] int IDENTITY(1,1) NOT NULL,
    [yardName] nvarchar(max)  NOT NULL,
    [yardPort] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Shipments'
CREATE TABLE [dbo].[Shipments] (
    [shipmentId] int IDENTITY(1,1) NOT NULL,
    [shipmentType] nvarchar(max)  NOT NULL,
    [shipmentInsuredValue] nvarchar(max)  NOT NULL,
    [shipmentWeight] nvarchar(max)  NOT NULL,
    [shipmentDestination] nvarchar(max)  NOT NULL,
    [shipmentStatus] nvarchar(max)  NOT NULL,
    [Yard_yardId] int  NOT NULL,
    [Customer_customerId] int  NOT NULL,
    [Ship_shipId] int  NOT NULL
);
GO

-- Creating table 'Customers'
CREATE TABLE [dbo].[Customers] (
    [customerId] int IDENTITY(1,1) NOT NULL,
    [customerName] nvarchar(max)  NOT NULL,
    [companyName] nvarchar(max)  NOT NULL,
    [contactNumber] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Fleets'
CREATE TABLE [dbo].[Fleets] (
    [fleetId] int IDENTITY(1,1) NOT NULL,
    [fleetName] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Ships'
CREATE TABLE [dbo].[Ships] (
    [shipId] int IDENTITY(1,1) NOT NULL,
    [shipName] nvarchar(max)  NOT NULL,
    [shipMaxLoad] nvarchar(max)  NOT NULL,
    [Fleet_fleetId] int  NOT NULL
);
GO

-- Creating table 'Schedules'
CREATE TABLE [dbo].[Schedules] (
    [scheduleId] int IDENTITY(1,1) NOT NULL,
    [departureTime] nvarchar(max)  NOT NULL,
    [arrivalTime] nvarchar(max)  NOT NULL,
    [destination] nvarchar(max)  NOT NULL,
    [Ship_shipId] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [yardId] in table 'Yards'
ALTER TABLE [dbo].[Yards]
ADD CONSTRAINT [PK_Yards]
    PRIMARY KEY CLUSTERED ([yardId] ASC);
GO

-- Creating primary key on [shipmentId] in table 'Shipments'
ALTER TABLE [dbo].[Shipments]
ADD CONSTRAINT [PK_Shipments]
    PRIMARY KEY CLUSTERED ([shipmentId] ASC);
GO

-- Creating primary key on [customerId] in table 'Customers'
ALTER TABLE [dbo].[Customers]
ADD CONSTRAINT [PK_Customers]
    PRIMARY KEY CLUSTERED ([customerId] ASC);
GO

-- Creating primary key on [fleetId] in table 'Fleets'
ALTER TABLE [dbo].[Fleets]
ADD CONSTRAINT [PK_Fleets]
    PRIMARY KEY CLUSTERED ([fleetId] ASC);
GO

-- Creating primary key on [shipId] in table 'Ships'
ALTER TABLE [dbo].[Ships]
ADD CONSTRAINT [PK_Ships]
    PRIMARY KEY CLUSTERED ([shipId] ASC);
GO

-- Creating primary key on [scheduleId] in table 'Schedules'
ALTER TABLE [dbo].[Schedules]
ADD CONSTRAINT [PK_Schedules]
    PRIMARY KEY CLUSTERED ([scheduleId] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Yard_yardId] in table 'Shipments'
ALTER TABLE [dbo].[Shipments]
ADD CONSTRAINT [FK_YardShipment]
    FOREIGN KEY ([Yard_yardId])
    REFERENCES [dbo].[Yards]
        ([yardId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_YardShipment'
CREATE INDEX [IX_FK_YardShipment]
ON [dbo].[Shipments]
    ([Yard_yardId]);
GO

-- Creating foreign key on [Customer_customerId] in table 'Shipments'
ALTER TABLE [dbo].[Shipments]
ADD CONSTRAINT [FK_CustomerShipment]
    FOREIGN KEY ([Customer_customerId])
    REFERENCES [dbo].[Customers]
        ([customerId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CustomerShipment'
CREATE INDEX [IX_FK_CustomerShipment]
ON [dbo].[Shipments]
    ([Customer_customerId]);
GO

-- Creating foreign key on [Ship_shipId] in table 'Shipments'
ALTER TABLE [dbo].[Shipments]
ADD CONSTRAINT [FK_ShipShipment]
    FOREIGN KEY ([Ship_shipId])
    REFERENCES [dbo].[Ships]
        ([shipId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ShipShipment'
CREATE INDEX [IX_FK_ShipShipment]
ON [dbo].[Shipments]
    ([Ship_shipId]);
GO

-- Creating foreign key on [Fleet_fleetId] in table 'Ships'
ALTER TABLE [dbo].[Ships]
ADD CONSTRAINT [FK_FleetShip]
    FOREIGN KEY ([Fleet_fleetId])
    REFERENCES [dbo].[Fleets]
        ([fleetId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FleetShip'
CREATE INDEX [IX_FK_FleetShip]
ON [dbo].[Ships]
    ([Fleet_fleetId]);
GO

-- Creating foreign key on [Ship_shipId] in table 'Schedules'
ALTER TABLE [dbo].[Schedules]
ADD CONSTRAINT [FK_ShipSchedule]
    FOREIGN KEY ([Ship_shipId])
    REFERENCES [dbo].[Ships]
        ([shipId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ShipSchedule'
CREATE INDEX [IX_FK_ShipSchedule]
ON [dbo].[Schedules]
    ([Ship_shipId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------