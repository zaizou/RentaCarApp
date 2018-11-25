CREATE USER three_b_internationnal WITH PASSWORD 'admin';
CREATE DATABASE tbibase WITH OWNER = three_b_internationnal;

\c nextvrbase ;

CREATE SCHEMA IF NOT EXISTS tbi_schema AUTHORIZATION three_b_internationnal;
ALTER ROLE three_b_internationnal SET search_path TO tbi_schema,public;
GRANT ALL PRIVILEGES ON DATABASE nextvrbase to three_b_internationnal;
ALTER DEFAULT PRIVILEGES IN SCHEMA tbi_schema GRANT ALL ON TABLES TO three_b_internationnal;

\c nextvrbase three_b_internationnal;

CREATE TABLE tbi_schema.persistent_logins (
    username varchar(64) not null,
    series varchar(64) not null,
    token varchar(64) not null,
    last_used timestamp not null,
    CONSTRAINT PK_persistent_logins PRIMARY KEY (series)
);

ALTER TABLE tbi_schema.persistent_logins
  OWNER TO three_b_internationnal;


CREATE TABLE tbi_schema.fonctionnalite
(
  designation character varying(255) NOT NULL,
  idfonctionnalite serial NOT NULL,
  CONSTRAINT fonctionnalite_pkey PRIMARY KEY (designation)
);

ALTER TABLE tbi_schema.fonctionnalite
  OWNER TO three_b_internationnal;



CREATE TABLE tbi_schema.utilisateur
(
  id_utilisateur character varying(255) NOT NULL,
  actif integer,
  adresse character varying(255),
  codestructure character varying(255),
  email character varying(255),
  hashpasswd character varying(255),
  idutilisateur character varying(255),
  nom character varying(255),
  passwd character varying(255),
  prenom character varying(255),
  tel character varying(255),
  structure_idstructure integer,
  CONSTRAINT utilisateur_pkey PRIMARY KEY (id_utilisateur)
  
);

ALTER TABLE tbi_schema.utilisateur
  OWNER TO three_b_internationnal;



CREATE TABLE tbi_schema.autorite
(
  id_utilisateur character varying(255) NOT NULL,
  designation character varying(255) NOT NULL,
  CONSTRAINT autorite_pkey PRIMARY KEY (id_utilisateur, designation)
);

ALTER TABLE tbi_schema.autorite
  OWNER TO three_b_internationnal;

CREATE TABLE tbi_schema.wilaya
(
  matriculewilaya integer NOT NULL,
  intitulewilaya character varying(255),
  CONSTRAINT wilaya_pkey PRIMARY KEY (matriculewilaya)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE tbi_schema.wilaya
  OWNER TO three_b_internationnal;



-- ajout des utilisateurs
INSERT INTO tbi_schema.UTILISATEUR (ID_UTILISATEUR, PASSWD, ACTIF) VALUES ('admin','$2a$10$4bct.A1X43nncnTW52jMVuxrLtGPyhT0Qn.xxaH.JISlWKjjD6M7i',1);
--yazid -> admin
INSERT INTO tbi_schema.UTILISATEUR (ID_UTILISATEUR, PASSWD, ACTIF) VALUES ('yazid','$2a$04$VKBy8HGI5uPzySsJoBHgHuOP1F5Dx9j/ieAV/g703VXKdTS2PzmDO',1);

INSERT INTO tbi_schema.UTILISATEUR (ID_UTILISATEUR, PASSWD, ACTIF) VALUES ('USER','$2a$10$4bct.A1X43nncnTW52jMVuxrLtGPyhT0Qn.xxaH.JISlWKjjD6M7i',1);

-- roles et fonctionnalites generaux

insert into tbi_schema.FONCTIONNALITE (DESIGNATION) values ('ROLE_USER');
insert into tbi_schema.FONCTIONNALITE (DESIGNATION) values ('ROLE_ADMIN');
insert into tbi_schema.AUTORITE (ID_UTILISATEUR, DESIGNATION) values ('admin', 'ROLE_USER');
insert into tbi_schema.AUTORITE (ID_UTILISATEUR, DESIGNATION) values ('admin', 'ROLE_ADMIN');
insert into tbi_schema.AUTORITE (ID_UTILISATEUR, DESIGNATION) values ('yazid', 'ROLE_USER');
insert into tbi_schema.AUTORITE (ID_UTILISATEUR, DESIGNATION) values ('yazid', 'ROLE_ADMIN');
insert into tbi_schema.AUTORITE (ID_UTILISATEUR, DESIGNATION) values ('USER', 'ROLE_USER');




INSERT INTO tbi_schema.wilaya (matriculewilaya, intitulewilaya) VALUES
(1,  'Adrar'),
(2,  'Chlef'),
(3,  'Laghouat'),
(4,  'Oum El Bouaghi'),
(5,  'Batna'),
(6,  'Béjaïa'),
(7,  'Biskra'),
(8,  'Béchar'),
(9,  'Blida'),
(10, 'Bouira'),
(11,  'Tamanrasset'),
(12,  'Tébessa'),
(13,  'Tlemcen'),
(14,  'Tiaret'),
(15,  'Tizi Ouzou'),
(16,  'Alger'),
(17,  'Djelfa'),
(18,  'Jijel'),
(19,  'Sétif'),
(20,  'Saïda'),
(21,  'Skikda'),
(22,  'Sidi Bel Abbès'),
(23,  'Annaba'),
(24,  'Guelma'),
(25,  'Constantine'),
(26,  'Médéa'),
(27,  'Mostaganem'),
(28,  'M''Sila'),
(29,  'Mascara'),
(30,  'Ouargla'),
(31,  'Oran'),
(32,  'El Bayadh'),
(33,  'Illizi'),
(34,  'Bordj Bou Arreridj'),
(35,  'Boumerdès'),
(36,  'El Tarf'),
(37,  'Tindouf'),
(38,  'Tissemsilt'),
(39,  'El Oued'),
(40,  'Khenchela'),
(41,  'Souk Ahras'),
(42,  'Tipaza'),
(43,  'Mila'),
(44,  'Aïn Defla'),
(45,  'Naâma'),
(46,  'Aïn Témouchent'),
(47,  'Ghardaïa'),
(48,  'Relizane');