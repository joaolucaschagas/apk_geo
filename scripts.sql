-- Tabela Devices
CREATE TABLE Devices (
    id_device INTEGER PRIMARY KEY AUTOINCREMENT,
    hostname TEXT NOT NULL,
    ip_address TEXT NOT NULL
);
-- Tabela Locations
CREATE TABLE Locations (
    id_location INTEGER PRIMARY KEY AUTOINCREMENT,
    id_device INTEGER NOT NULL,
    latitude REAL NOT NULL,
    longitude REAL NOT NULL,
    datetime_captured TEXT NOT NULL,
    ping_status TEXT,
    saved_local INTEGER NOT NULL DEFAULT 0,
    FOREIGN KEY (id_device) REFERENCES Devices (id_device)
);
-- Tabela SyncLogs
CREATE TABLE SyncLogs (
    id_sync INTEGER PRIMARY KEY AUTOINCREMENT,
    id_device INTEGER NOT NULL,
    datetime_synced TEXT NOT NULL,
    status TEXT NOT NULL,
    num_records_synced INTEGER DEFAULT 0,
    FOREIGN KEY (id_device) REFERENCES Devices (id_device)
);
