
CREATE PROCEDURE RECURSE_ASSEMBLIES_INTO_PARTS() 
LANGUAGE SQLSCRIPT AS 
	new_count    integer  := 1;
BEGIN
DELETE FROM "T3";

INSERT INTO "T3" 
	SELECT ID_CAR, '' AS PARENT_ID, ID_PARTS AS PARTS_ELEM, 0 AS LEVEL, 'd' as S_STAT
	FROM t1
	WHERE t1.RECEP_UNIT != 'REVOZ'	;



END;

CALL RECURSE_ASSEMBLIES_INTO_PARTS ();

DROP PROCEDURE RECURSE_ASSEMBLIES_INTO_PARTS;

SELECT * FROM T3;