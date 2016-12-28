ALTER TABLE points DROP COLUMN geometry ;
ALTER TABLE points DROP COLUMN name_eng ;
ALTER TABLE points DROP COLUMN type ;
ALTER TABLE points DROP COLUMN iso3 ;
ALTER TABLE points DROP COLUMN last_update ;
ALTER TABLE points DROP COLUMN country ;

ALTER TABLE points add column name_eng VARCHAR;
ALTER TABLE points add column type VARCHAR;
ALTER TABLE points add column iso3 VARCHAR;
ALTER TABLE points add column last_update VARCHAR;
ALTER TABLE points add column country VARCHAR;

UPDATE  points SET name_eng = name ;
UPDATE  points SET type ='university' where amenity ='university' ;
UPDATE  points SET type ='school' where amenity ='school' ;
UPDATE  points SET type ='library' where amenity ='library' ;
UPDATE  points SET type ='fuel' where amenity ='fuel' ;
UPDATE  points SET type ='hospital' where amenity ='hospital';
UPDATE  points SET type ='fire_station' where amenity='fire_station';
UPDATE  points SET type ='police' where amenity='police';
UPDATE  points SET type ='townhall' where amenity='townhall';
UPDATE  points SET type ='bar' where amenity='bar';
UPDATE  points SET type ='cafe' where amenity='cafe';
UPDATE  points SET type ='fast_food' where amenity='fast_food';
UPDATE  points SET type ='ice_cream' where amenity='ice_cream';
UPDATE  points SET type ='restaurant' where amenity='restaurant';
UPDATE  points SET type ='bus_station' where amenity='bus_station';
UPDATE  points SET type ='parking' where amenity='parking';
UPDATE  points SET type ='bank' where amenity='bank';
UPDATE  points SET type ='clinic' where amenity='clinic';
UPDATE  points SET type ='theatre' where amenity='theatre';
UPDATE  points SET type ='courthouse' where amenity='courthouse';
UPDATE  points SET type ='embassy' where amenity='embassy';
UPDATE  points SET type ='market_place' where amenity='market_place';
UPDATE  points SET type ='poste_office' where amenity='poste_office';
UPDATE  points SET type ='prison' where amenity='prison';

DROP TABLE poi_amenities_osm ;

CREATE TABLE poi_amenities_osm (
	id serial,
	name_eng varchar,
	type varchar,
	iso3 varchar,
	last_update varchar,
	country varchar,
	constraint pk_poi_amenities_osm primary key (id)
);

SELECT AddGeometryColumn ('poi_amenities_osm','geometry',4326,'POINT',2);

INSERT INTO trs_roads_osm (
	geometry,
	name_eng,
	type,
	iso3,
	last_update,
	country
)
SELECT 
	wkb_geometry,
	name_eng,
	type,
	iso3,
	last_update,
	country 
FROM points ;



--ALTER TABLE lines add column ref VARCHAR;

--ALTER TABLE table_origine add column numlanes VARCHAR;
--ALTER TABLE table_origine add column iso3 VARCHAR;
--ALTER TABLE table_origine add column country VARCHAR;
--ALTER TABLE table_origine add column last_update VARCHAR;
--ALTER TABLE table_origine add column status VARCHAR;
--ALTER TABLE table_origine add column srfcond VARCHAR;
--ALTER TABLE table_origine add column isseasonal VARCHAR;
--ALTER TABLE table_origine add column curntprac VARCHAR;
