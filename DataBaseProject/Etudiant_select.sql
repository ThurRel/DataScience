set search_path="I_NOTE";
update "TB_ETUDIANT"
	set "VILLE_ETUDIANT"='99840'
WHERE "ID_ETUDIANT" IN ('ET003','ET004');	

select * from "TB_ETUDIANT";

select * from "TB_MATIERE";

update ""
	
SELECT C."ID_ETUDIANT"as "N° Etudiant", "NOM_ETUDIANT" as "Nom étudiant" ,"LB_MATIERE"
AS "Libellé matière", count(1) as "Nombre total " from "TB_ETUDIANT" C INNER JOIN "TB_NOTE" B ON C."ID_ETUDIANT"=B."ID_ETUDIANT"
	INNER JOIN "TB_MATIERE" T ON B."CD_MATIERE"=T."CD_MATIERE" 
	WHERE "LB_MATIERE" IN ('Mathématiques','Base de données') GROUP BY "LB_MATIERE" ;
-- Autre méthode

SELECT
    C."ID_ETUDIANT" AS "N° Etudiant","NOM_ETUDIANT" AS "Nom étudiant",
    T."LB_MATIERE" AS "Libellé matière",COUNT(1) AS "Nombre total"
FROM "TB_ETUDIANT" C  INNER JOIN "TB_NOTE" B ON C."ID_ETUDIANT" = B."ID_ETUDIANT" 
	WHERE B."CD_MATIERE" IN 
	 (SELECT T."CD_MATIERE" FROM "TB_MATIERE" T WHERE  "LB_MATIERE" IN ('Mathématiques','Base de données'))
GROUP BY "ID_ETUDIANT","NOM_ETUDIANT","LB_MATIERE" order by "NOM_ETUDIANT";

-- affichons les autres catégories
SELECT
    C."ID_ETUDIANT" AS "N° Etudiant","NOM_ETUDIANT" AS "Nom étudiant",
    "LB_MATIERE" AS "Libellé matière",COUNT(1) AS "Nombre total"
FROM "TB_ETUDIANT" C
INNER JOIN "TB_NOTE" B ON C."ID_ETUDIANT" = B."ID_ETUDIANT"
INNER JOIN "TB_MATIERE" T ON B."CD_MATIERE" = T."CD_MATIERE"
WHERE "LB_MATIERE"  NOT IN ('Mathématiques', 'Base de données')
GROUP BY C."ID_ETUDIANT", "NOM_ETUDIANT", "LB_MATIERE" order by "LB_MATIERE" asc;

-- l'étudiant avec le Max de note 
SELECT 
    T."ID_ETUDIANT" AS "N° etudiant", 
    T."NOM_ETUDIANT" || ' ' || T."PREN_ETUDIANT" AS "Nom & Prénom",
    MAX(B."DT_NOTE") AS "Max Note"
FROM 
    "TB_ETUDIANT" T where T."ID_ETUDIANT" in ( select B."ID_ETUDIANT" from "TB_NOTE" B )
	GROUP BY 
    T."ID_ETUDIANT", T."NOM_ETUDIANT", T."PREN_ETUDIANT";

SELECT 
    B."ID_ETUDIANT" AS "N° etudiant", 
    T."NOM_ETUDIANT" || ' ' || T."PREN_ETUDIANT" AS "Nom & Prénom",
    Max(B."NB_NOTE") AS "Max Note" FROM  "TB_ETUDIANT" T
INNER JOIN "TB_NOTE" B ON T."ID_ETUDIANT" = B."ID_ETUDIANT"
order by B."NB_NOTE" asc limit 1;

SELECT 
    B."ID_ETUDIANT" AS "N° etudiant", 
    T."NOM_ETUDIANT" || ' ' || T."PREN_ETUDIANT" AS "Nom & Prénom",
    B."NB_NOTE" AS "Min Note"
FROM "TB_ETUDIANT" T
INNER JOIN "TB_NOTE" B ON T."ID_ETUDIANT" = B."ID_ETUDIANT"
WHERE B."NB_NOTE" = (
    SELECT MIN(B2."NB_NOTE")
    FROM "TB_NOTE" B2
)
ORDER BY B."NB_NOTE" ASC
LIMIT 1;

SELECT 
    B."ID_ETUDIANT" AS "N° etudiant", 
    T."NOM_ETUDIANT" || ' ' || T."PREN_ETUDIANT" AS "Nom & Prénom",
    B."NB_NOTE" AS "Max Note"
FROM "TB_ETUDIANT" T
INNER JOIN "TB_NOTE" B ON T."ID_ETUDIANT" = B."ID_ETUDIANT"
WHERE B."NB_NOTE" = (
    SELECT MAX(B2."NB_NOTE")
    FROM "TB_NOTE" B2
)
ORDER BY B."NB_NOTE" ASC
LIMIT 1;

SELECT 
    B."ID_ETUDIANT" AS "N° etudiant", 
    T."NOM_ETUDIANT" || ' ' || T."PREN_ETUDIANT" AS "Nom & Prénom",
    B."NB_NOTE" AS "Min Note"
FROM "TB_ETUDIANT" T
INNER JOIN "TB_NOTE" B ON T."ID_ETUDIANT" = B."ID_ETUDIANT"
WHERE B."NB_NOTE" = (
    SELECT MIN(B2."NB_NOTE")
    FROM "TB_NOTE" B2
)
ORDER BY B."NB_NOTE" ASC
LIMIT 1;

SELECT * FROM "TB_NOTE";

SELECT MAX("NB_NOTE") AS "Max Note", MIN("NB_NOTE") AS "Min Note" FROM "TB_NOTE";

ç


SELECT 
    B."ID_ETUDIANT" AS "N° etudiant", 
    T."NOM_ETUDIANT" || ' ' || T."PREN_ETUDIANT" AS "Nom & Prénom",
    B."NB_NOTE" AS "Max Note"
FROM "TB_ETUDIANT" T
INNER JOIN "TB_NOTE" B ON T."ID_ETUDIANT" = B."ID_ETUDIANT"
WHERE B."NB_NOTE" = (
    SELECT MAX(B2."NB_NOTE")
    FROM "TB_NOTE" B2
)
ORDER BY B."NB_NOTE" ASC
LIMIT 1;

SELECT 
    B."ID_ETUDIANT" AS "N° etudiant", 
    T."NOM_ETUDIANT" || ' ' || T."PREN_ETUDIANT" AS "Nom & Prénom",
    B."NB_NOTE" AS "Min Note"
FROM "TB_ETUDIANT" T
INNER JOIN "TB_NOTE" B ON T."ID_ETUDIANT" = B."ID_ETUDIANT"
WHERE B."NB_NOTE" = (
    SELECT MIN(B2."NB_NOTE")
    FROM "TB_NOTE" B2
)
ORDER BY B."NB_NOTE" ASC
LIMIT 1;


select * FROM "TB_TYPE_EVALUATION";
