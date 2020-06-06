DROP TABLE products;
DROP TABLE manufacturers;

CREATE TABLE manufacturers (
  id SERIAL primary key,
  name VARCHAR(255),
  category VARCHAR(255),
  contact_details VARCHAR(255)
);

CREATE TABLE products (
  id SERIAL primary key,
  name VARCHAR(255),
  category VARCHAR(255),
  manufacturer_id INT REFERENCES manufacturers(id),
  wholesale_price FLOAT,
  markup FLOAT,
  stock_level INT
);

