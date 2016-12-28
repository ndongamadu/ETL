ALTER TABLE lines DROP COLUMN geometry ;
ALTER TABLE lines DROP COLUMN name_eng ;
ALTER TABLE lines DROP COLUMN type ;

ALTER TABLE lines add column name_eng VARCHAR;
ALTER TABLE lines add column type VARCHAR;


UPDATE  lines SET name_eng = name ;
UPDATE  lines SET type ='ditch' where barrier='ditch' ;
UPDATE  lines SET type ='stream'where waterway='stream' ;
UPDATE  lines SET type ='river' where waterway='river' ;
UPDATE  lines SET type ='canal' where waterway='canal' ;
UPDATE  lines SET type ='drain' where waterway='drain';
UPDATE  lines SET type ='ditch' where waterway='ditch';

DROP TABLE hyd_rivers_osm ;

CREATE TABLE hyd_rivers_osm (
	id serial,
	name_eng VARCHAR,
	type VARCHAR,
	constraint pk_hyd_rivers_osm primary key (id)
);

SELECT AddGeometryColumn ('hyd_rivers_osm','geometry',4326,'LINESTRING',2);

INSERT INTO hyd_rivers_osm (
	geometry,
	name_eng,
	type
)
SELECT 
	wkb_geometry,
	name,
	type 
FROM lines ;



--ALTER TABLE lines add column ref VARCHAR;

--ALTER TABLE table_origine add column numlanes VARCHAR;
--ALTER TABLE table_origine add column iso3 VARCHAR;
--ALTER TABLE table_origine add column country VARCHAR;
--ALTER TABLE table_origine add column last_update VARCHAR;
--ALTER TABLE table_origine add column status VARCHAR;
--ALTER TABLE table_origine add column srfcond VARCHAR;
--ALTER TABLE table_origine add column isseasonal VARCHAR;
--ALTER TABLE table_origine add column curntprac VARCHAR;
