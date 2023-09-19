set search_path to df, public;

copy (
    select
        code, name, crime_count, "year", person_count, st_x(definition_point) lng, st_y(definition_point) lat
    from crime_view
) to '/tmp/crime_view_csv.csv' DELIMITER ',' CSV HEADER;
