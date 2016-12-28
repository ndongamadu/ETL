ALTER TABLE table_origine add column geometry VARCHAR;
ALTER TABLE table_origine add column sourceid VARCHAR;

ALTER TABLE table_origine add column rtenme VARCHAR;
ALTER TABLE table_origine add column ntlclass VARCHAR;
ALTER TABLE table_origine add column fclass VARCHAR;
ALTER TABLE table_origine add column numlanes VARCHAR;
ALTER TABLE table_origine add column srftpe VARCHAR;
ALTER TABLE table_origine add column srfcond VARCHAR;
ALTER TABLE table_origine add column isseasonal VARCHAR;
ALTER TABLE table_origine add column curntprac VARCHAR;
ALTER TABLE table_origine add column gnralspeed VARCHAR;
ALTER TABLE table_origine add column rdwidthm VARCHAR;
ALTER TABLE table_origine add column status VARCHAR;
ALTER TABLE table_origine add column bridge VARCHAR;
ALTER TABLE table_origine add column iso3 VARCHAR;
ALTER TABLE table_origine add column country VARCHAR;
ALTER TABLE table_origine add column last_update VARCHAR;


UPDATE TABLE table_origine SET rtenme = name ;
UPDATE TABLE table_origine SET ntlclass = highway ;
--recuperer : osm_id, notes, ref,
