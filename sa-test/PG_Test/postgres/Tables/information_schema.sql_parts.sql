SET SCHEMA "information_schema";

CREATE TABLE sql_parts (
    feature_id character_data,
    feature_name character_data,
    is_supported yes_or_no,
    is_verified_by character_data,
    comments character_data
);


ALTER TABLE sql_parts OWNER TO postgres;
