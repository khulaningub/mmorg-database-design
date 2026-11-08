-- Sample data taken from the project report.

INSERT INTO Player (playerID, playerName, email) VALUES
    (74, 'General Xaba',      'gxaba@gmail.com'),
    (61, 'Zolani Mzilakazi',  'zmzila@gmail.com');

INSERT INTO Account (accountID, playerID, accountName, isBlocked, lastPayDate) VALUES
    (55, 74, 'SpikeNoob', 'No',  '2025-06-02'),
    (30, 61, 'GenZBoy',   'Yes', '2025-05-10');

INSERT INTO Team (teamID, teamName) VALUES
    (1, 'JJK'),
    (2, 'Hero Academia');

INSERT INTO Character (characterID, accountID, teamID, charName, skillLevel) VALUES
    (23, 55, 1, 'Tinjaru', 78),
    (36, 30, 2, 'Deku',    70);

INSERT INTO Item (itemID, itemName, itemDescription) VALUES
    (12, 'Sword',     'Sword to fight cursed spirits.'),
    (16, 'Fire Gear', 'Fire gear to avoid getting burnt by own powers and opponents.');

INSERT INTO Inventory (inventoryID, characterID, itemID, slotNumber, quantity) VALUES
    (3, 23, 12, 5, 1),
    (6, 36, 16, 7, 1);

INSERT INTO ErrorType (errorTypeID, typeName) VALUES
    (14, 'Syntax Error'),
    (16, 'Runtime error');

INSERT INTO Error (errorID, accountID, errorTypeID, description, timestamp) VALUES
    (11, 55, 14, 'Code doesn''t respect the syntax rules a program requires.', '2025-06-06 10:30:00'),
    (9,  30, 16, 'Index 3 is out of bounds (is beyond the length of the array).', '2025-06-07 08:47:33');
