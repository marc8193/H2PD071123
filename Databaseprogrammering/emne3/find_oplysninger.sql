DECLARE @contactType VARCHAR(25), @holdlokale VARCHAR(25);

SET @contactType = 'mobil';
SET @holdlokale = 'B109';

SELECT navn, vej, husnummer, postnummer, vej, value as mobiltelefon
FROM person
  LEFT JOIN kontaktinfo
    ON kontaktinfo.person = person.personId
	AND kontaktinfo.contactType = @contactType
  LEFT JOIN adresse
    ON adresse.person = person.personId
  LEFT JOIN elev
    ON elev.person = person.personId
  LEFT JOIN hold
    ON hold.hold = elev.hold
  WHERE hold.holdlokale = @holdlokale