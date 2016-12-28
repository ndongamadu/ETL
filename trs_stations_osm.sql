ALTER TABLE lines DROP COLUMN geometry ;
ALTER TABLE lines DROP COLUMN sourceid ;
ALTER TABLE lines DROP COLUMN rtenme ;
ALTER TABLE lines DROP COLUMN ntlclass ;
ALTER TABLE lines DROP COLUMN fclass  ;
ALTER TABLE lines DROP COLUMN  srftpe  ;
ALTER TABLE lines DROP COLUMN gnralspeed  ;
ALTER TABLE lines DROP COLUMN rdwidthm  ;
ALTER TABLE lines DROP COLUMN bridge  ;


ALTER TABLE lines add column sourceid VARCHAR;
ALTER TABLE lines add column rtenme VARCHAR;
ALTER TABLE lines add column ntlclass VARCHAR;
ALTER TABLE lines add column fclass VARCHAR;
ALTER TABLE lines add column srftpe VARCHAR;
ALTER TABLE lines add column gnralspeed VARCHAR;
ALTER TABLE lines add column rdwidthm VARCHAR;
ALTER TABLE lines add column bridge VARCHAR;


UPDATE  lines SET rtenme = name ;
UPDATE  lines SET ntlclass = highway ;
UPDATE  lines SET bridge = bridge ;
UPDATE  lines SET gnralspeed = maxspeed ;
UPDATE  lines SET rdwidthm = width ;

DROP TABLE trs_roads_osm ;

CREATE TABLE trs_roads_osm (
	id serial,
	sourceid varchar,
	rtenme varchar,
	ntlclass varchar,
	fclass varchar,
	srftpe varchar,
	gnralspeed varchar,
	rdwidthm varchar,
	bridge varchar,
	constraint pk_trs_roads_osm primary key (id)
);

SELECT AddGeometryColumn ('trs_roads_osm','geometry',4326,'LINESTRING',2);

INSERT INTO trs_roads_osm (
	geometry,
	sourceid,
	rtenme,
	ntlclass,
	fclass,
	srftpe,
	gnralspeed,
	rdwidthm,
	bridge
)
SELECT 
	wkb_geometry,
	sourceid,
	rtenme,
	ntlclass,
	fclass,
	srftpe,
	gnralspeed,
	rdwidthm,
	bridge 
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
