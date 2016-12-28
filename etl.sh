#!/bin/bash 
if [ $# -ne 1 ]; then
	echo " fichier .pbf manquant ";
	exit 1
fi

if [ -f $1 ]; then
	#import  
	echo " infos sur le fichier : "

	ogrinfo -ro $1
	echo
	echo " -- import des donnees .pbf dans la base --"
	echo
	ogr2ogr -f "PostgreSQL" PG:"dbname=etl user=amadu password=passer" $1	
	if [ $? -eq 0 ] ; then
		echo "import succeeded"
	else
		echo "fail"
	fi
	echo " connexion to db etl "
	psql -d etl -f trs_roads_osm.sql

	if [ $? -eq 0 ] ; then
		echo "generation des fichiers shapefile"
		ogr2ogr -f "ESRI Shapefile" "DATA/trs_roads_osm.shp" PG:"dbname=etl user=amadu password=passer" "trs_roads_osm"
		echo 
		echo " see files here : DATA/"
		ls DATA/
	else
		echo "fail"
	fi
fi
