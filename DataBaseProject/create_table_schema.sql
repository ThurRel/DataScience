-- Database: I_NOTE

drop schema if exists  "I_NOTE";
create schema "I_NOTE"
	
--ALTER TABLE "TB_ETUDIANT" add COLUMN "NOM_ETUDIANT" VARCHAR(100) NOT NULL;
--ALTER TABLE "TB_ETUDIANT" RENAME  COLUMN "PRENOM_ETUDIANT" TO "PREN_ETUDIANT" ;


DROP TABLE IF EXISTS "TB_ETUDIANT" ;
CREATE TABLE "TB_ETUDIANT" 
(
"ID_ETUDIANT" 			VARCHAR(50) NOT NULL,
"CIVILITE_ETUDIANT" 	VARCHAR(100) NOT NULL,
"NOM_ETUDIANT" 			VARCHAR(100) NOT NULL,
"PREN_ETUDIANT" 		VARCHAR(100) NOT NULL,
"CD_POSTAL_ETUDIANT" 	VARCHAR(100) NOT NULL,
"VILLE_ETUDIANT" 		VARCHAR(100) NOT NULL,
CONSTRAINT "TB_ETUDIANT_PKEY" PRIMARY KEY("ID_ETUDIANT")
);

SELECT * FROM "TB_ENSEIGNANT"

DROP TABLE IF EXISTS "TB_TYPE_EVALUATION";
CREATE TABLE "TB_TYPE_EVALUATION" (
"CD_TYPE_EVALUATION" VARCHAR (50) NOT NULL,
	"LB_TYPE_EVALUATION" VARCHAR(50) NOT NULL,
	CONSTRAINT "CD_TYPE_EVALUATION_PKEY" PRIMARY KEY ("CD_TYPE_EVALUATION") 
	
);

DROP TABLE IF EXISTS"TB_TYPE_MATIERE" ;
CREATE TABLE "TB_TYPE_MATIERE"(
	"CD_TYPE_MATIERE" VARCHAR(50) NOT NULL,
	"LB_TYPE_MATIERE" VARCHAR(50) NOT NULL,
	CONSTRAINT "CD_TYPE_MATIERE_PKEY" PRIMARY KEY ("CD_TYPE_MATIERE")
)

DROP TABLE IF EXISTS "TB_ENSEIGNANT";
CREATE TABLE "TB_ENSEIGNANT"(
"ID_ENSEIGNANT" VARCHAR(50) NOT NULL,
	"NOM_ENSEIGNANT" VARCHAR(50) NOT NULL,
"PREN_ENSEIGNANT" VARCHAR(50) NOT NULL,
	"EMAIL_ENSEIGNANT" VARCHAR(50) NOT NULL,
CONSTRAINT "ID_ENSEIGNANT_PKEY" PRIMARY KEY ("ID_ENSEIGNANT")
	)
	
DROP TABLE IF EXISTS "TB_MATIERE";
	CREATE TABLE "TB_MATIERE"(
	"CD_MATIERE" VARCHAR(50) NOT NULL,
	"LB_MATIERE" VARCHAR(50) NOT NULL,
		"NB_COEF"  NUMERIC NOT NULL,
	"CD_TYPE_MATIERE" VARCHAR(50) NOT NULL,
	"ID_ENSEIGNANT" VARCHAR(50) NOT NULL,
	CONSTRAINT "CD_MATIERE_PKEY" PRIMARY KEY ("CD_MATIERE"),
	CONSTRAINT "CD_TYPE_MATIERE_FKEY" FOREIGN KEY ("CD_TYPE_MATIERE") REFERENCES "TB_TYPE_MATIERE"("CD_TYPE_MATIERE"),
CONSTRAINT "ID_ENSEIGNANT_FKEY" FOREIGN KEY ("ID_ENSEIGNANT") references "TB_ENSEIGNANT"("ID_ENSEIGNANT")
	
)	;


DROP TABLE IF EXISTS "TB_NOTE";
 CREATE TABLE "TB_NOTE" (
"ID_ETUDIANT" VARCHAR(50) NOT NULL,
"CD_MATIERE" VARCHAR(50) NOT NULL,
"CD_TYPE_EVALUATION" VARCHAR(50) NOT NULL,
"ANNEE_SCOLAIRE" VARCHAR(50) NOT NULL,
"DT_NOTE" VARCHAR(50) NOT NULL,
"NB_NOTE" VARCHAR(50) NOT NULL,
CONSTRAINT "TB_NOTE_PKEY" PRIMARY KEY ("ID_ETUDIANT", "CD_MATIERE", "CD_TYPE_EVALUATION", "ANNEE_SCOLAIRE"),
CONSTRAINT "TB_NOTE_ETUDIANT_FKEY" FOREIGN KEY ("ID_ETUDIANT") REFERENCES "TB_ETUDIANT"("ID_ETUDIANT"),
CONSTRAINT "TB_NOTE_MATIERE_FKEY" FOREIGN KEY ("CD_MATIERE") REFERENCES "TB_MATIERE"("CD_MATIERE"),
CONSTRAINT "TB_TYPE_EVALUATION_FKEY" FOREIGN KEY ("CD_TYPE_EVALUATION") REFERENCES "TB_TYPE_EVALUATION"("CD_TYPE_EVALUATION")
);


	
-- DROP DATABASE IF EXISTS "I_NOTE";

CREATE DATABASE "I_NOTE"
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'French_France.1252'
    LC_CTYPE = 'French_France.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;