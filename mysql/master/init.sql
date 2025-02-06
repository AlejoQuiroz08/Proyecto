CREATE USER 'repl'@'%' IDENTIFIED BY 'replpass';
GRANT REPLICATION SLAVE ON *.* TO 'repl'@'%';
FLUSH PRIVILEGES;

CREATE TABLE IF NOT EXISTS form_data (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
-- Tabla de usuarios
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla de productos
CREATE TABLE IF NOT EXISTS products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10,2) NOT NULL,
    image_url VARCHAR(255)
);

-- Insertar algunos productos de ejemplo
INSERT INTO products (name, description, price, image_url) VALUES
('Zapatillas Deportivas', 'Zapatillas para running ultraligeras', 89.99, 'https://stevemadden.com.ec/cdn/shop/files/STEVEMADDEN_SHOES_SURGE1_WHITESILVER_SIDE.jpg?v=1709660289'),
('Camiseta Basica', 'Camiseta 100% algodon', 19.99, 'https://rolandecuador.vtexassets.com/arquivos/ids/155956-800-auto?v=637584192399370000&width=800&height=auto&aspect=true'),
('Reloj Inteligente', 'Monitor de actividad y notificaciones', 149.99, 'https://www.computron.com.ec/wp-content/uploads/2024/02/CT-VIVAP-1BK.jpg');