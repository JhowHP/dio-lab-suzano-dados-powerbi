show databases;
use ecommerce;

INSERT INTO clients (Fname, Minit, Lname, CPF, Address) VALUES 
('Carlos', 'A.', 'Silva', '12345678901', 'Rua das Flores, 100'),
('Mariana', 'B.', 'Souza', '23456789012', 'Av. Paulista, 200'),
('Roberto', 'C.', 'Lima', '34567890123', 'Rua XV de Novembro, 300'),
('Fernanda', 'D.', 'Oliveira', '45678901234', 'Praça Central, 400'),
('José', 'E.', 'Santos', '56789012345', 'Rua da Praia, 500'),
('Ana', 'F.', 'Ferreira', '67890123456', 'Av. Beira-Mar, 600'),
('Paulo', 'G.', 'Gomes', '78901234567', 'Travessa dos Pinhais, 700');

select * from clients;

INSERT INTO product (Pname, Classification_kids, Category, CPF, Avaliação, Size) VALUES 
('Smartphone X', false, 'Eletronico', '12345678901', 4.5, '15x7cm'),
('Camiseta Polo', false, 'Vestimenta', '23456789012', 4.2, 'M'),
('Boneca Barbie', true, 'Brinquedos', '34567890123', 4.8, '30cm'),
('Chocolate 70%', false, 'Alimentos', '45678901234', 4.7, '200g'),
('Sofá 3 Lugares', false, 'Móveis', '56789012345', 4.3, '2m'),
('Carrinho de Controle', true, 'Brinquedos', '67890123456', 4.6, '40cm'),
('Geladeira Frost Free', false, 'Eletronico', '78901234567', 4.9, '1.8m');


INSERT INTO payments (idClient, idPayment, typePayment, limitAvaible) VALUES 
(1, 101, 'Cartão', 5000.00),
(2, 102, 'Boleto', 3000.50),
(3, 103, 'Cartão', 4500.75),
(4, 104, 'Dois Cartões', 7000.00),
(5, 105, 'Boleto', 2500.00),
(6, 106, 'Cartão', 6000.30),
(7, 107, 'Dois Cartões', 8000.90);


INSERT INTO orders (idOrderClient, orderStatus, orderDescription, sendValue, paymentCash) VALUES 
(1, 'Confirmado', 'Compra de um smartphone', 15.00, false),
(2, 'Em Processamento', 'Pedido de roupas esportivas', 10.00, true),
(3, 'Cancelado', 'Compra de um notebook gamer', 20.00, false),
(4, 'Confirmado', 'Aquisição de móveis para escritório', 25.00, false),
(5, 'Em Processamento', 'Compra de brinquedos infantis', 10.00, true),
(6, 'Confirmado', 'Pedido de alimentos para festa', 12.50, false),
(7, 'Cancelado', 'Compra de um smartwatch', 10.00, true);

INSERT INTO productStorage (storageLocation, quantity) VALUES 
('Armazém Central - Setor A', 150),
('Depósito Zona Norte', 75),
('Loja Matriz - Estoque', 200),
('Centro de Distribuição SP', 500),
('Filial RJ - Armazém 2', 120),
('Depósito Sul', 90),
('Centro Logístico Nordeste', 300);


INSERT INTO supplier (SocialName, CNPJ, contact) VALUES 
('Tech Solutions LTDA', '12345678000195', '11987654321'),
('EletroHouse Comércio', '22334455000188', '21998765432'),
('Moda & Estilo Ltda', '33445566000177', '31987654321'),
('Brinquedos Divertidos', '44556677000166', '41987654321'),
('Alimentos Saudáveis SA', '55667788000155', '51987654321'),
('Móveis Conforto', '66778899000144', '61987654321'),
('Distribuidora Global', '77889900000133', '71987654321');



INSERT INTO seller (SocialName, AbstName, CNPJ, CPF, location, contact) VALUES 
('Tech Solutions LTDA', 'TechSol', '12345678000195', NULL, 'São Paulo - SP', '11987654321'),
('EletroHouse Comércio', 'EletroH', '22334455000188', NULL, 'Rio de Janeiro - RJ', '21998765432'),
('Moda & Estilo Ltda', 'ModaEst', '33445566000177', NULL, 'Belo Horizonte - MG', '31987654321'),
('Brinquedos Divertidos', 'BrinqDiv', '44556677000166', NULL, 'Curitiba - PR', '41987654321'),
('Alimentos Saudáveis SA', 'AliSaud', '55667788000155', NULL, 'Porto Alegre - RS', '51987654321'),
('Móveis Conforto', 'MovConf', NULL, '123456789', 'Salvador - BA', '61987654321'),
('João da Silva ME', 'JoãoSil', NULL, '987654321', 'Recife - PE', '71987654321');


INSERT INTO productSeller (idPseller, idProduct, prodQuantity) VALUES 
(1, 1, 50),
(1, 2, 30),
(2, 3, 20),
(2, 4, 15),
(3, 5, 40),
(4, 6, 10),
(5, 7, 25);

-- Verificar o Pq do erro da Fk constraint
INSERT INTO productOrder (idPOproduct, idPOorder, poQuantity, poStatus) VALUES 
(1, 101, 3, 'Disponível'),
(2, 102, 2, 'Disponível'),
(3, 103, 5, 'Sem Estoque'),
(4, 104, 1, 'Disponível'),
(5, 105, 4, 'Disponível'),
(6, 106, 2, 'Sem Estoque'),
(7, 107, 3, 'Disponível');


INSERT INTO storageLocation (idLproduct, idLstorage, location) VALUES
(1, 1, 'Aisle 1 - Shelf 3'),
(2, 1, 'Aisle 2 - Shelf 5'),
(3, 2, 'Aisle 1 - Shelf 1'),
(4, 2, 'Aisle 3 - Shelf 2'),
(5, 3, 'Aisle 4 - Shelf 4'),
(6, 3, 'Aisle 5 - Shelf 1'),
(7, 4, 'Aisle 2 - Shelf 4');

INSERT INTO productSupplier (idPsSupplier, idPsProduct, quantity) VALUES
(1, 101, 50),
(2, 102, 30),
(3, 103, 20);





