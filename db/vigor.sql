DROP TABLE products;
DROP TABLE manufacturers;
DROP TABLE categories;

CREATE TABLE categories (
  id SERIAL primary key,
  name VARCHAR(255)
);


CREATE TABLE manufacturers (
  id SERIAL primary key,
  name VARCHAR(255),
  category_id INT REFERENCES categories(id),
  contact_details VARCHAR(255)
);

CREATE TABLE products (
  id SERIAL primary key,
  name VARCHAR(255),
  category_id INT REFERENCES categories(id),
  manufacturer_id INT REFERENCES manufacturers(id),
  buying_price FLOAT,
  markup FLOAT,
  units VARCHAR(255),
  stock_level INT
);


