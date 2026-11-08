-- MMORPG Account Management Database
-- Schema implemented from the 3NF design in docs/report.
-- Written in standard SQL; tested with SQLite.

PRAGMA foreign_keys = ON;  -- SQLite only: enforce foreign keys. Remove for MySQL/PostgreSQL.

CREATE TABLE Player (
    playerID    INTEGER      PRIMARY KEY,
    playerName  VARCHAR(100) NOT NULL,
    email       VARCHAR(150) NOT NULL UNIQUE
);

CREATE TABLE Account (
    accountID    INTEGER      PRIMARY KEY,
    playerID     INTEGER      NOT NULL,
    accountName  VARCHAR(50)  NOT NULL UNIQUE,
    isBlocked    VARCHAR(3)   NOT NULL DEFAULT 'No' CHECK (isBlocked IN ('Yes', 'No')),
    lastPayDate  DATE,
    FOREIGN KEY (playerID) REFERENCES Player (playerID)
);

CREATE TABLE Team (
    teamID    INTEGER      PRIMARY KEY,
    teamName  VARCHAR(50)  NOT NULL
);

CREATE TABLE Character (
    characterID  INTEGER      PRIMARY KEY,
    accountID    INTEGER      NOT NULL,
    teamID       INTEGER      NOT NULL,
    charName     VARCHAR(50)  NOT NULL,
    skillLevel   INTEGER      CHECK (skillLevel BETWEEN 0 AND 100),  -- percentage
    FOREIGN KEY (accountID) REFERENCES Account (accountID),
    FOREIGN KEY (teamID)    REFERENCES Team (teamID)
);

CREATE TABLE Item (
    itemID           INTEGER      PRIMARY KEY,
    itemName         VARCHAR(50)  NOT NULL,
    itemDescription  VARCHAR(255)
);

CREATE TABLE Inventory (
    inventoryID  INTEGER  PRIMARY KEY,
    characterID  INTEGER  NOT NULL,
    itemID       INTEGER  NOT NULL,
    slotNumber   INTEGER  CHECK (slotNumber BETWEEN 1 AND 8),  -- business rule: up to 8 slots
    quantity     INTEGER  NOT NULL DEFAULT 1 CHECK (quantity > 0),
    FOREIGN KEY (characterID) REFERENCES Character (characterID),
    FOREIGN KEY (itemID)      REFERENCES Item (itemID),
    UNIQUE (characterID, slotNumber)  -- one item per slot
);

CREATE TABLE ErrorType (
    errorTypeID  INTEGER      PRIMARY KEY,
    typeName     VARCHAR(50)  NOT NULL
);

CREATE TABLE Error (
    errorID      INTEGER       PRIMARY KEY,
    accountID    INTEGER       NOT NULL,
    errorTypeID  INTEGER       NOT NULL,
    description  VARCHAR(255),
    timestamp    TIMESTAMP     NOT NULL,
    FOREIGN KEY (accountID)   REFERENCES Account (accountID),
    FOREIGN KEY (errorTypeID) REFERENCES ErrorType (errorTypeID)
);
