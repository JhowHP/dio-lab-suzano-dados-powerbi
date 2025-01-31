use ecommerce;

select a.idClient, a.Fname, a.CPF from clients a;

SELECT * FROM product
WHERE Category = 'Eletronico';

SELECT * FROM clients
WHERE CPF = '12345678901';


SELECT o.idOrder, c.Fname, c.Lname, p.typePayment, p.limitAvaible
FROM orders o
JOIN clients c ON o.idOrderClient = c.idClient
JOIN payments p ON c.idClient = p.idClient;

SELECT p.Pname, ps.storageLocation, sl.location
FROM product p
JOIN productStorage ps ON p.idProduct = ps.idProdStorage
JOIN storageLocation sl ON p.idProduct = sl.idLproduct;

SELECT idOrder FROM orders;

INSERT INTO productOrder (idPOproduct, idPOorder, poQuantity, poStatus) VALUES 
(1, 1, 3, 'Disponível'),
(2, 2, 2, 'Disponível'),
(3, 3, 5, 'Sem Estoque'),
(4, 4, 1, 'Disponível'),
(5, 5, 4, 'Disponível'),
(6, 6, 2, 'Sem Estoque'),
(7, 7, 3, 'Disponível');

SELECT o.idOrder, o.idOrderClient, o.orderDescription, o.sendValue, 
       (o.sendValue + 10) AS TotalOrderValue
FROM orders o;



SELECT o.idOrder, o.orderDescription, p.typePayment, p.limitAvaible
FROM orders o
JOIN payments p ON o.idOrderClient = p.idClient;

SELECT Fname, Lname, CPF
FROM clients
WHERE idClient IN (
    SELECT idClient
    FROM payments
    WHERE limitAvaible > 5000
);

