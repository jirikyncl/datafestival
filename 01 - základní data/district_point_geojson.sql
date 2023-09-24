select json_build_object(
    'type', 'FeatureCollection',
    'features', json_agg(
        json_build_object(
            'type', 'Feature',
                'geometry', st_asgeojson(definition_point)::json,
                'properties', json_build_object(
                    'code', code,
                    'name', name
                )
            )
        )
) as feature_collection from district d
