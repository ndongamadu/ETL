ALTER TABLE multipolygon DROP COLUMN geometry ;
ALTER TABLE multipolygon DROP COLUMN name_eng ;
ALTER TABLE multipolygon DROP COLUMN type ;
ALTER TABLE multipolygon DROP COLUMN area ;
ALTER TABLE multipolygon DROP COLUMN iso3 ;
ALTER TABLE multipolygon DROP COLUMN last_update ;
ALTER TABLE multipolygon DROP COLUMN country ;
ALTER TABLE multipolygon DROP COLUMN args ;

ALTER TABLE multipolygon add column name_eng VARCHAR;
ALTER TABLE multipolygon add column type VARCHAR;
ALTER TABLE multipolygon add column area VARCHAR;
ALTER TABLE multipolygon add COLUMN iso3 VARCHAR;
ALTER TABLE multipolygon add COLUMN last_update VARCHAR;
ALTER TABLE multipolygon add COLUMN country VARCHAR;
ALTER TABLE multipolygon add COLUMN args VARCHAR;

UPDATE  multipolygon SET name_eng = name ;
UPDATE  multipolygon SET type ='runway' where aeroway='runway';
UPDATE  multipolygon SET type ='taxiway' where aeroway='taxiway';

UPDATE  multipolygon SET type ='university' where amenity='university';
UPDATE  multipolygon SET type ='school' where amenity='school';
UPDATE  multipolygon SET type ='college' where amenity='college';
UPDATE  multipolygon SET type ='library' where amenity='library';
UPDATE  multipolygon SET type ='fuel' where amenity='fuel';
UPDATE  multipolygon SET type ='parking' where amenity='parking';
UPDATE  multipolygon SET type ='cinema' where amenity='cinema';
UPDATE  multipolygon SET type ='theatre' where amenity='theatre';
UPDATE  multipolygon SET type ='place_of_worship' where amenity='place_of_worship';
UPDATE  multipolygon SET type ='hospital' where amenity='hospital';
UPDATE  multipolygon SET type ='hedge' where barrier='hedge';

UPDATE  multipolygon SET type ='pedestrian' where highway='pedestrian';
UPDATE  multipolygon SET type ='footway' where highway='footway';

UPDATE  multipolygon SET type ='park' where landuse='park';
UPDATE  multipolygon SET type ='forest' where landuse='forest';
UPDATE  multipolygon SET type ='residential' where landuse='residential';
UPDATE  multipolygon SET type ='retail' where landuse='retail';
UPDATE  multipolygon SET type ='commercial' where landuse='commercial';
UPDATE  multipolygon SET type ='industrial' where landuse='industrial';
UPDATE  multipolygon SET type ='railway' where landuse='railway';
UPDATE  multipolygon SET type ='cemetery' where landuse='cemetery';
UPDATE  multipolygon SET type ='grass' where landuse='grass';
UPDATE  multipolygon SET type ='farmyard' where landuse='farmyard';
UPDATE  multipolygon SET type ='farm' where landuse='farm';
UPDATE  multipolygon SET type ='farmland' where landuse='farmland';
UPDATE  multipolygon SET type ='orchard' where landuse='orchard';
UPDATE  multipolygon SET type ='vineyard' where landuse='vineyard';
UPDATE  multipolygon SET type ='wood' where landuse='wood';
UPDATE  multipolygon SET type ='meadow' where landuse='meadow';
UPDATE  multipolygon SET type ='village_green' where landuse='village_green';
UPDATE  multipolygon SET type ='recreation_ground' where landuse='recreation_ground';
UPDATE  multipolygon SET type ='allotments' where landuse='allotments';
UPDATE  multipolygon SET type ='quarry' where landuse='quarry';

UPDATE  multipolygon SET type ='park' where leisure='';
UPDATE  multipolygon SET type ='garden' where leisure='';
UPDATE  multipolygon SET type ='playground' where leisure='';
UPDATE  multipolygon SET type ='golf_course' where leisure='';
UPDATE  multipolygon SET type ='sports_center' where leisure='';
UPDATE  multipolygon SET type ='pitch' where leisure='pitch';
UPDATE  multipolygon SET type ='stadium' where leisure='stadium';
UPDATE  multipolygon SET type ='common' where leisure='common';
UPDATE  multipolygon SET type ='nature_reserve' where leisure='nature_reserve';

UPDATE  multipolygon SET type ='pier' where man_made='pier';

UPDATE  multipolygon SET type ='barracks' where military='barracks';

UPDATE  multipolygon SET type ='wood' where natural='wood';
UPDATE  multipolygon SET type ='land' where natural='land';
UPDATE  multipolygon SET type ='scrub' where natural='scrub';
UPDATE  multipolygon SET type ='wetland' where natural='wetland';
UPDATE  multipolygon SET type ='heath' where natural='heath';

UPDATE  multipolygon SET type ='island' where place='island';
UPDATE  multipolygon SET type ='zoo' where tourism='zoo';

DROP TABLE poi_landusage_osm ;

CREATE TABLE poi_landusage_osm (
	id serial,
	name_eng varchar,
	type varchar,
	iso3 varchar,
	area varchar,
	last_update varchar,
	country varchar,
	args varchar,
	constraint pk_poi_landusage_osm primary key (id)
);

SELECT AddGeometryColumn ('poi_landusage_osm','geometry',4326,'MULTIPOLYGON',2);

INSERT INTO poi_landusage_osm (
	geometry,
	type,
	iso3,
	area,
	last_update,
	country,
	args
)
SELECT 
	wkb_geometry,
	type,
	iso3,
	area,
	last_update,
	country,
	args 
FROM multipolygon ;



--ALTER TABLE lines add column ref VARCHAR;

--ALTER TABLE table_origine add column numlanes VARCHAR;
--ALTER TABLE table_origine add column iso3 VARCHAR;
--ALTER TABLE table_origine add column country VARCHAR;
--ALTER TABLE table_origine add column last_update VARCHAR;
--ALTER TABLE table_origine add column status VARCHAR;
--ALTER TABLE table_origine add column srfcond VARCHAR;
--ALTER TABLE table_origine add column isseasonal VARCHAR;
--ALTER TABLE table_origine add column curntprac VARCHAR;
