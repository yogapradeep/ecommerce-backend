
-- Create users table
CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL
);

-- Create products table
CREATE TABLE IF NOT EXISTS products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    price INTEGER NOT NULL,
    category VARCHAR(255) NOT NULL,
    image TEXT NOT NULL
);

-- Create orders table
CREATE TABLE IF NOT EXISTS orders (
    id SERIAL PRIMARY KEY,
    amount INTEGER NOT NULL,
    user_id INTEGER REFERENCES users(id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create order_chairs table
CREATE TABLE IF NOT EXISTS order_chairs (
    id SERIAL PRIMARY KEY,
    order_id INTEGER REFERENCES orders(id) ON DELETE CASCADE,
    chair_id INTEGER REFERENCES products(id)
);

-- Create order_tables table
CREATE TABLE IF NOT EXISTS order_tables (
    id SERIAL PRIMARY KEY,
    order_id INTEGER REFERENCES orders(id) ON DELETE CASCADE,
    table_id INTEGER REFERENCES products(id)
);

-- Create order_tops table
CREATE TABLE IF NOT EXISTS order_tops (
    id SERIAL PRIMARY KEY,
    order_id INTEGER REFERENCES orders(id) ON DELETE CASCADE,
    top_id INTEGER REFERENCES products(id)
);

-- Insert initial data into products table
INSERT INTO products (id, name, price, category, image) VALUES
(1, 'Lounge Chair', 2000, 'chairs', 'https://cdn.bbopokertables.com/upload/thumbnail/400/_upload_file_2019_5_201905020321189719702996_luna.jpg'),
(2, 'Dining Chair', 1800, 'chairs', 'https://cdn.bbopokertables.com/upload/thumbnail/400/_upload_file_2015_10_20151016135262866286.jpg'),
(3, 'Table1', 3000, 'tables', 'https://cdn.bbopokertables.com/template/2022/selector/images/3-1.png'),
(4, 'Table2', 3200, 'tables', 'https://cdn.bbopokertables.com/template/asset/2021/11/prestige-x/Prestige-X-Gallery-Update-01.jpg'),
(5, 'Table3', 3100, 'tables', 'https://cdn.bbopokertables.com/template/asset/2021/11/prestige-x/Prestige-X-Gallery-Update-04.jpg'),
(6, 'Dining Top', 900, 'tops', 'https://cdn.bbopokertables.com/upload/file/temp/thumbnail_quality/75/600_400/_upload_file_2015_10_20151016140530233023.jpg')
ON CONFLICT (id) DO NOTHING;
