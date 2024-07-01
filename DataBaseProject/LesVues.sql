set search_path="I_NOTE";
CREATE VIEW "I_NOTE"."ViewEtudiant" AS 
SELECT
    C."ID_ETUDIANT" AS "N° Etudiant",
    C."NOM_ETUDIANT" AS "Nom étudiant",
    T."LB_MATIERE" AS "Libellé matière",
    COUNT(1) AS "Nombre total"
FROM "TB_ETUDIANT" C
INNER JOIN "TB_NOTE" B ON C."ID_ETUDIANT" = B."ID_ETUDIANT"
INNER JOIN "TB_MATIERE" T ON B."CD_MATIERE" = T."CD_MATIERE"
WHERE T."LB_MATIERE" IN ('Mathématiques', 'Base de données')
GROUP BY C."ID_ETUDIANT", C."NOM_ETUDIANT", T."LB_MATIERE"
ORDER BY C."NOM_ETUDIANT";

-- Afficher les donnees
select * from "I_NOTE"."ViewEtudiant"; 


-- Insertion des donnees dans une vue(cette vue contient groupby donc on ne peut pas insérer
--de données)

insert into "I_NOTE"."ViewEtudiant" ("N° Etudiant","Nom étudiant","Libellé matière","Nombre total")
values('ET098','Dalle','Anglais',1)