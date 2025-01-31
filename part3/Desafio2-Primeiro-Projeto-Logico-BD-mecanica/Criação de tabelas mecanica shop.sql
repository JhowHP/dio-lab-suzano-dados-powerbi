-- Criação do BD para o Cenário de Mecânica
CREATE DATABASE mechanic_shop;
USE mechanic_shop;

-- Criar tabela Cliente (Dono do Veículo)
CREATE TABLE clients (
    idClient INT AUTO_INCREMENT PRIMARY KEY,
    Fname VARCHAR(30),
    Minit CHAR(3),
    Lname VARCHAR(20),
    CPF CHAR(11) NOT NULL UNIQUE,
    Address VARCHAR(50)
);

-- Criar tabela Veículos
CREATE TABLE vehicles (
    idVehicle INT AUTO_INCREMENT PRIMARY KEY,
    idClient INT,
    Brand VARCHAR(30) NOT NULL,
    Model VARCHAR(30) NOT NULL,
    Year INT NOT NULL,
    Plate CHAR(7) NOT NULL UNIQUE,
    CONSTRAINT fk_vehicle_client FOREIGN KEY (idClient) REFERENCES clients(idClient)
    ON UPDATE CASCADE
);

-- Criar tabela Peças (Produtos)
CREATE TABLE parts (
    idPart INT AUTO_INCREMENT PRIMARY KEY,
    PartName VARCHAR(50) NOT NULL,
    Category ENUM('Motor', 'Suspensão', 'Freios', 'Elétrica', 'Transmissão') NOT NULL,
    SupplierID INT NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    Stock INT DEFAULT 0,
    CONSTRAINT fk_parts_supplier FOREIGN KEY (SupplierID) REFERENCES suppliers(idSupplier)
);

-- Criar tabela Serviços
CREATE TABLE services (
    idService INT AUTO_INCREMENT PRIMARY KEY,
    ServiceName VARCHAR(50) NOT NULL,
    Description TEXT,
    Price DECIMAL(10,2) NOT NULL
);

-- Criar tabela Ordem de Serviço
CREATE TABLE work_orders (
    idWorkOrder INT AUTO_INCREMENT PRIMARY KEY,
    idClient INT NOT NULL,
    idVehicle INT NOT NULL,
    OrderStatus ENUM('Aberto', 'Em Andamento', 'Concluído', 'Cancelado') DEFAULT 'Aberto',
    ServiceDate DATE NOT NULL,
    TotalCost DECIMAL(10,2) DEFAULT 0,
    CONSTRAINT fk_workorder_client FOREIGN KEY (idClient) REFERENCES clients(idClient),
    CONSTRAINT fk_workorder_vehicle FOREIGN KEY (idVehicle) REFERENCES vehicles(idVehicle)
);

-- Criar tabela de relacionamento entre Ordem de Serviço e Serviços
CREATE TABLE work_order_services (
    idWorkOrder INT,
    idService INT,
    Quantity INT DEFAULT 1,
    PRIMARY KEY (idWorkOrder, idService),
    CONSTRAINT fk_wos_workorder FOREIGN KEY (idWorkOrder) REFERENCES work_orders(idWorkOrder),
    CONSTRAINT fk_wos_service FOREIGN KEY (idService) REFERENCES services(idService)
);

-- Criar tabela de Fornecedores de Peças
CREATE TABLE suppliers (
    idSupplier INT AUTO_INCREMENT PRIMARY KEY,
    SocialName VARCHAR(255) NOT NULL,
    CNPJ CHAR(15) NOT NULL UNIQUE,
    Contact CHAR(11) NOT NULL
);

-- Criar tabela de Estoque de Peças
CREATE TABLE parts_storage (
    idStorage INT AUTO_INCREMENT PRIMARY KEY,
    idPart INT NOT NULL,
    StorageLocation VARCHAR(255) NOT NULL,
    Quantity INT DEFAULT 0,
    CONSTRAINT fk_parts_storage FOREIGN KEY (idPart) REFERENCES parts(idPart)
);

-- Criar tabela de Pagamentos
CREATE TABLE payments (
    idPayment INT AUTO_INCREMENT PRIMARY KEY,
    idClient INT NOT NULL,
    idWorkOrder INT NOT NULL,
    TypePayment ENUM('Boleto', 'Cartão', 'Dinheiro', 'Pix') NOT NULL,
    AmountPaid DECIMAL(10,2) NOT NULL,
    PaymentDate DATE NOT NULL,
    CONSTRAINT fk_payments_client FOREIGN KEY (idClient) REFERENCES clients(idClient),
    CONSTRAINT fk_payments_workorder FOREIGN KEY (idWorkOrder) REFERENCES work_orders(idWorkOrder)
);

