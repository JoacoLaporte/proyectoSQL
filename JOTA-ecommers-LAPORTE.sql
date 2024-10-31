CREATE DATABASE proyectoSql;
use proyectoSql;

CREATE TABLE clientes (
    id_cliente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    telefono INT,
    direccion VARCHAR(255)
);

CREATE TABLE forma_de_pago (
    id_forma_pago INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    descripcion VARCHAR(255)
);

CREATE TABLE categoria_prod (
    id_categoria_prod INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    descripcion VARCHAR(255)
);

CREATE TABLE proveedores (
    id_proveedor INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    telefono INT,
    direccion VARCHAR(255),
    email VARCHAR(100) UNIQUE
);

CREATE TABLE producto (
    id_producto INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_categoria INT,
    id_proveedor INT,
    nombre VARCHAR(100),
    descripcion VARCHAR(255),
    precio INT,
    stock INT
);

CREATE TABLE pedido (
    id_pedido INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    id_producto INT,
    id_forma_pago INT,
    fecha DATE,
    cantidad INT,
    precio INT
);

CREATE TABLE stock (
    id_stock INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_producto INT,
    cantidad INT
);


ALTER TABLE producto
ADD CONSTRAINT fk_producto_categoria
FOREIGN KEY (id_categoria) REFERENCES categoria_prod(id_categoria_prod);

ALTER TABLE producto
ADD CONSTRAINT fk_producto_proveedor 
FOREIGN KEY (id_proveedor) REFERENCES proveedores(id_proveedor);

ALTER TABLE pedido
ADD CONSTRAINT fk_pedido_cliente 
FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente);

ALTER TABLE pedido
ADD CONSTRAINT fk_pedido_producto
FOREIGN KEY (id_producto) REFERENCES producto (id_producto);

ALTER TABLE pedido
ADD CONSTRAINT fk_pedido_forma_de_pago
FOREIGN KEY (id_forma_pago) REFERENCES forma_de_pago(id_forma_pago);


ALTER TABLE stock
ADD CONSTRAINT Ffk_stock_producto
FOREIGN KEY (id_producto) REFERENCES producto(id_producto);




