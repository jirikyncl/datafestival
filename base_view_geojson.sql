set search_path to df, public;

copy (
	select json_build_object(
		'type', 'FeatureCollection',
		'features', json_agg(
			json_build_object(
				'type', 'Feature',
				'geometry', ST_AsGeoJSON(definition_point)::json,
				'properties', json_build_object(
					'code', code,
					'name', name,
					'crime_count', crime_count,
					'year', year,
					'person_count', person_count
				)
			)
		)
	) as feature_collection from (select * from crime_view where year = 2022)

) to '/tmp/crime_view_geojson.json';




