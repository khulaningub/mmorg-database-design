-- Example queries to try after loading schema.sql and sample_data.sql

-- 1. Each player with their accounts and whether the account is blocked
SELECT p.playerName, a.accountName, a.isBlocked
FROM Player p
JOIN Account a ON a.playerID = p.playerID;

-- 2. Characters with their team and skill level, strongest first
SELECT c.charName, t.teamName, c.skillLevel
FROM Character c
JOIN Team t ON t.teamID = c.teamID
ORDER BY c.skillLevel DESC;

-- 3. What each character is carrying
SELECT c.charName, i.itemName, inv.slotNumber, inv.quantity
FROM Inventory inv
JOIN Character c ON c.characterID = inv.characterID
JOIN Item i      ON i.itemID = inv.itemID;

-- 4. Error log with the account and error type
SELECT e.timestamp, a.accountName, et.typeName, e.description
FROM Error e
JOIN Account a    ON a.accountID = e.accountID
JOIN ErrorType et ON et.errorTypeID = e.errorTypeID
ORDER BY e.timestamp DESC;

-- 5. Number of errors per account
SELECT a.accountName, COUNT(e.errorID) AS totalErrors
FROM Account a
LEFT JOIN Error e ON e.accountID = a.accountID
GROUP BY a.accountName;
