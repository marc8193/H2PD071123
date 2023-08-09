DECLARE @navn VARCHAR(32), 
@cpr VARCHAR(32), 
@alder INT, 
@hold VARCHAR(32), 
@vaerge INT, 
@kontakt VARCHAR(32),
@personId INT;

SET @navn = 'Jens Jensen';
SET @cpr  = '111111-1111';
SET @alder = 80;

SET @hold = 'hold1';
SET @vaerge = 0;
SET @kontakt = 1;

IF NOT EXISTS (SELECT * FROM person WHERE person.cpr = @cpr)
    BEGIN
    INSERT INTO person (cpr, navn, alder) VALUES (@cpr, @navn, @alder);
    SET @personId = (SELECT person.personId FROM person WHERE person.cpr = @cpr);
    INSERT INTO elev   (person, hold, værge, kontaktlærer) VALUES (@personId, @hold, @vaerge, @kontakt);
    END