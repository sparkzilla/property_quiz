DROP TABLE IF EXISTS properties;

CREATE TABLE properties (
  id SERIAL PRIMARY KEY,
  address VARCHAR,
  value INT,
  bedrooms INT,
  year_built VARCHAR
);
