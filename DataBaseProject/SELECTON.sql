set search_path="I_NOTE";

SELECT * FROM "TB_NOTE";
SELECT "ID_ETUDIANT" AS "Identifiant etudiant", "CD_MATIERE" AS "Code Matière","NB_NOTE" AS "Note"
	from "TB_NOTE"  where 
"CD_TYPE_EVALUATION"='TN02';

--moyenne par étudiants
-- nbred'étudiats par cd_mariere,lb_matiere

select "CD_MATIERE" AS "Code matière","CD_TYPE_EVALUATION" as "code du type de matière"
	 , COUNT(1) AS "Nombre d'étudiants"
	from "TB_NOTE" GROUP BY "CD_MATIERE","CD_TYPE_EVALUATION"


select B."CD_MATIERE" AS "Code matière","CD_TYPE_EVALUATION" as "code du type de matière"
	 ,F."LB_MATIERE" AS "Libellé matière", COUNT(1) AS "Nombre d'étudiants"
	from "TB_NOTE" B inner join "TB_MATIERE" F ON B."CD_MATIERE"=F."CD_MATIERE" 
	GROUP BY B."CD_MATIERE","CD_TYPE_EVALUATION",F."LB_MATIERE" 

select 
	 F."LB_MATIERE" AS "Libellé matière", COUNT(1) AS "Nombre d'étudiants"
	from "TB_NOTE" B inner join "TB_MATIERE" F ON B."CD_MATIERE"=F."CD_MATIERE" 
	GROUP BY F."LB_MATIERE"


	
--Moyenne par étudiant	
SELECT 
    T."ID_ETUDIANT" AS "N° etudiant", 
    E."NOM_ETUDIANT" || ' ' || E."PREN_ETUDIANT" AS "Nom et Prénoms",
    ROUND(SUM(CAST("NB_COEF" AS INT) * CAST("NB_NOTE" AS INT)), 2) / SUM(CAST("NB_COEF" AS INT)) AS "Moyenne",
    CASE 
        WHEN ROUND(SUM(CAST("NB_COEF" AS INT) * CAST("NB_NOTE" AS INT)) / SUM(CAST("NB_COEF" AS INT)), 2) < 10 THEN 'Faible'
        WHEN ROUND(SUM(CAST("NB_COEF" AS INT) * CAST("NB_NOTE" AS INT)) / SUM(CAST("NB_COEF" AS INT)), 2) < 12 THEN 'Passable'
        WHEN ROUND(SUM(CAST("NB_COEF" AS INT) * CAST("NB_NOTE" AS INT)) / SUM(CAST("NB_COEF" AS INT)), 2) < 14 THEN 'Assez bien'
        WHEN ROUND(SUM(CAST("NB_COEF" AS INT) * CAST("NB_NOTE" AS INT)) / SUM(CAST("NB_COEF" AS INT)), 2) < 16 THEN 'Bien'
        WHEN ROUND(SUM(CAST("NB_COEF" AS INT) * CAST("NB_NOTE" AS INT)) / SUM(CAST("NB_COEF" AS INT)), 2) < 18 THEN 'Très bien'
        ELSE 'Excellent'
    END AS "Appréciation"
FROM "TB_NOTE" T
INNER JOIN "TB_ETUDIANT" E ON E."ID_ETUDIANT" = T."ID_ETUDIANT"
INNER JOIN "TB_MATIERE" L ON L."CD_MATIERE" = T."CD_MATIERE"
GROUP BY T."ID_ETUDIANT", E."NOM_ETUDIANT", E."PREN_ETUDIANT"
ORDER BY "Moyenne" DESC;


SELECT * FROM "TB_MATIERE";
SELECT * FROM "TB_ETUDIANT"
SELECT * FROM "TB_NOTE"
T."CD_MATIERE" AS "Code matière","NB_NOTE" AS "Note"
	, "NB_COEF" AS "Nbre de coefficient"
	

-- informations étudiants de l'année 2022	
select N."ID_ETUDIANT" AS "N° Etudiant" ,E."NOM_ETUDIANT" || ' '|| E."PREN_ETUDIANT" 
	AS "Nom et Prénoms" ,"LB_MATIERE" AS "Matière" ,"NB_NOTE" AS "Note" ,"NB_COEF" AS "Coefficient"
from "TB_NOTE" N
INNER JOIN "TB_ETUDIANT" E ON N."ID_ETUDIANT"=E."ID_ETUDIANT"
INNER JOIN "TB_MATIERE" L on L."CD_MATIERE"=E."CD_MATIERE" WHERE ANNEE_SCOLAIRE=2022;

