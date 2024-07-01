set search_path="I_NOTE";
select * from "TB_NOTE"

select max(cast("NB_NOTE" as integer)) as "Max Note",
 min(cast("NB_NOTE" as integer)) as "Min Note" from "TB_NOTE"

-- Changer le type de varchar en integer
alter table "TB_NOTE"
alter column "NB_NOTE" type integer using "NB_NOTE"::integer;

-- selectionner les bornes
select max("NB_NOTE") as "Max Note", min("NB_NOTE") as "Min Note" from "TB_NOTE";

select * from "TB_NOTE";

-- Sélectionner  l'étudiant avec le max de note 
select T."ID_ETUDIANT" as "N°Etudiant", "NOM_ETUDIANT" ||' '|| "PREN_ETUDIANT" 
	as "Identité Etudiant" , B."CD_MATIERE","LB_MATIERE" as "Libellé matière" ,
	max(B."NB_NOTE") as "Max Note" from "TB_ETUDIANT" T

inner join  "TB_NOTE" B on T."ID_ETUDIANT" =B."ID_ETUDIANT"
	inner join "TB_MATIERE" M on B."CD_MATIERE"=M."CD_MATIERE" 
	where B."CD_MATIERE"='M001'
	group by T."ID_ETUDIANT",
"NOM_ETUDIANT","PREN_ETUDIANT",B."CD_MATIERE","LB_MATIERE" limit 1;




