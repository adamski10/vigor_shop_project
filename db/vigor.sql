DROP TABLE products;
DROP TABLE manufacturers;

CREATE TABLE manufacturers (
  id SERIAL primary key,
  name VARCHAR(255),
  contact_details VARCHAR(255)
);

CREATE TABLE products (
  id SERIAL primary key,
  manufacturer_id INT REFERENCES manufacturers(id),
  name VARCHAR(255),
  type VARCHAR(255),
  wholesale_price FLOAT,
  markup FLOAT,
  stock_level INT
);

