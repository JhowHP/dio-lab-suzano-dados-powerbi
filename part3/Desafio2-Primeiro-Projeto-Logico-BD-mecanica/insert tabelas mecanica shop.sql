use mechanic_shop;

INSERT INTO suppliers (SocialName, CNPJ, contact) VALUES 
('Auto Peças LTDA', '12345678000195', '11987654321'),
('MotoParts Brasil', '22334455000188', '21998765432'),
('Suspensões Premium', '33445566000177', '31987654321'),
('Freios & Cia', '44556677000166', '41987654321'),
('Eletricar Componentes', '55667788000155', '51987654321');


INSERT INTO parts (PartName, Category, SupplierID, Price, Stock) VALUES 
('Motor 1.6 Turbo', 'Motor', 1, 8500.00, 5),
('Kit Embreagem Completa', 'Transmissão', 2, 1200.50, 10),
('Amortecedor Dianteiro', 'Suspensão', 3, 750.00, 15),
('Pastilhas de Freio Cerâmica', 'Freios', 4, 320.00, 30),
('Alternador 12V 90A', 'Elétrica', 5, 980.00, 8);

INSERT INTO clients (Fname, Minit, Lname, CPF, Address) VALUES 
('Carlos', 'A.', 'Silva', '12345678901', 'Rua das Oficinas, 100'),
('Mariana', 'B.', 'Souza', '23456789012', 'Av. das Montadoras, 200'),
('Roberto', 'C.', 'Lima', '34567890123', 'Rua do Automóvel, 300'),
('Fernanda', 'D.', 'Oliveira', '45678901234', 'Praça da Mecânica, 400'),
('José', 'E.', 'Santos', '56789012345', 'Rua das Peças, 500');


-- necessita atualizar os dados a partir daqui, com problema:
ALTER TABLE payments ADD COLUMN limitAvailable FLOAT;
ALTER TABLE payments CHANGE limitAvaible limitAvailable FLOAT;
INSERT INTO payments (idClient, idPayment, typePayment, limitAvailable) VALUES  
(1, 101, 'Cartão', 10000.00), 
(2, 102, 'Boleto', 5000.50), 
(3, 103, 'Cartão', 7500.75), 
(4, 104, 'Dois Cartões', 12000.00), 
(5, 105, 'Boleto', 3000.00);

desc payments;

INSERT INTO orders (idOrderClient, orderStatus, orderDescription, sendValue, paymentCash) VALUES 
(1, 'Confirmado', 'Compra de um motor turbo', 50.00, false),
(2, 'Em Processamento', 'Pedido de embreagem completa', 30.00, true),
(3, 'Cancelado', 'Compra de amortecedores para suspensão', 40.00, false),
(4, 'Confirmado', 'Pastilhas de freio para carro esportivo', 20.00, false),
(5, 'Em Processamento', 'Alternador para motor elétrico', 15.00, true);

INSERT INTO productStorage (storageLocation, quantity) VALUES 
('Galpão Central - Setor A', 50),
('Depósito Zona Leste', 30),
('Loja Oficina - Estoque', 40),
('Centro de Distribuição Sul', 20),
('Armazém Nordeste', 25);


INSERT INTO seller (SocialName, AbstName, CNPJ, CPF, location, contact) VALUES 
('Auto Peças LTDA', 'AutoParts', '12345678000195', NULL, 'São Paulo - SP', '11987654321'),
('MotoParts Brasil', 'MotoParts', '22334455000188', NULL, 'Rio de Janeiro - RJ', '21998765432'),
('Oficina Souza', 'OficSouza', NULL, '123456789', 'Belo Horizonte - MG', '31987654321'),
('Distribuidora Nacional', 'DistNac', NULL, '987654321', 'Curitiba - PR', '41987654321'),
('Peças Rápidas LTDA', 'PecasRap', '55667788000155', NULL, 'Porto Alegre - RS', '51987654321');

INSERT INTO productSeller (idPseller, idProduct, prodQuantity) VALUES 
(1, 1, 5),
(1, 2, 10),
(2, 3, 15),
(3, 4, 20),
(4, 5, 8);

INSERT INTO productOrder (idPOproduct, idPOorder, poQuantity, poStatus) VALUES 
(1, 1, 1, 'Disponível'),
(2, 2, 1, 'Disponível'),
(3, 3, 2, 'Sem Estoque'),
(4, 4, 1, 'Disponível'),
(5, 5, 1, 'Disponível');

INSERT INTO storageLocation (idLproduct, idLstorage, location) VALUES
(1, 1, 'Setor A - Prateleira 3'),
(2, 2, 'Setor B - Prateleira 5'),
(3, 3, 'Setor C - Prateleira 1'),
(4, 4, 'Setor D - Prateleira 2'),
(5, 5, 'Setor E - Prateleira 4');

INSERT INTO productSupplier (idPsSupplier, idPsProduct, quantity) VALUES
(1, 1, 10),
(2, 2, 15),
(3, 3, 20),
(4, 4, 30),
(5, 5, 12);
