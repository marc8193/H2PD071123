CREATE PROCEDURE opretElev(@cpr VARCHAR(32), @navn VARCHAR(32), @alder INT, @hold VARCHAR(32), @vaerge INT, @kontakt VARCHAR(32))
AS
BEGIN
    IF NOT EXISTS (SELECT * FROM person WHERE person.cpr = @cpr)
    BEGIN
    INSERT INTO person (cpr, navn, alder) VALUES (@cpr, @navn, @alder);
    DECLARE @personId INT;
    SET @personId = (SELECT person.personId FROM person WHERE person.cpr = @cpr);
    INSERT INTO elev   (person, hold, værge, kontaktlærer) VALUES (@personId, @hold, @vaerge, @kontakt);
    END
END