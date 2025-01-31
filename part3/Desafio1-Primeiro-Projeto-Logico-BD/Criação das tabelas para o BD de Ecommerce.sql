-- Criação de BD para o Cenário de E-Commerce desafio 1, parte 3:
-- drop database ecommerce;
create database ecommerce;
use ecommerce;

-- Criar tabela Cliente

create table clients(
		idClient int auto_increment primary key,
        Fname varchar(30),
        Minit char(3),
        Lname varchar(20),
        CPF char(11) not null,
        Address varchar(30),
        constraint unique_cpf_client unique (CPF)
);

-- Criar tabela Produto
-- size equivale a dimensão do produto
create table product(
		idProduct int auto_increment primary key,
        Pname varchar(30) not null,
        Classification_kids bool default false,
        Category enum('Eletronico', 'Vestimenta', 'Brinquedos', 'Alimentos', 'Móveis') not null,
        CPF char(11) not null,
        Avaliação float default 0,
        Size varchar(10)
);

-- para ser continuado o desafio: terminar de implementar a tabela e criar a conexao com as tabelas necessárias e reflita as modificações no driagrama de equema relacional
-- Criar constraints relacionadas ao pagamento

create table payments(
		idClient int,
        idPayment int,
        typePayment enum('Boleto', 'Cartão', 'Dois Cartões'),
        limitAvaible float,
        primary key(idClient, idPayment)
);


-- Criar tabela Pedido
create table orders(
		idOrder int auto_increment primary key,
        idOrderClient int,
        orderStatus enum('Cancelado', 'Confirmado', 'Em Processamento') default 'Em Processamento',
        orderDescription varchar(255),
        sendValue float default 10,
        paymentCash bool default false,
        constraint fk_ordes_client foreign key (idOrderClient) references clients(idClient)
				on update cascade
);

-- Criar tabela estoque
create table productStorage(
		idProdStorage int auto_increment primary key,
        storageLocation varchar(255),
        quantity int default 0
);


-- Criar tabela fornecedor
create table supplier(
		idSupplier int auto_increment primary key,
        SocialName varchar(255) not null,
        CNPJ char(15) not null,
        contact char(11) not null,
        constraint unique_supplier unique (CNPJ)
);

-- Criar tabela Vendendor
create table seller(
		idSeller int auto_increment primary key,
        SocialName varchar(255) not null,
        AbstName varchar(255),
        CNPJ char(15),
        CPF char(9),
        location varchar(255),
        contact char(11) not null,
        constraint unique_cnpj_seller unique (CNPJ),
        constraint unique_cpf_seller unique (CPF)
);

create table productSeller(
		idPseller int,
        idProduct int,
        prodQuantity int default 1,
        primary key (idPseller, idProduct),
        constraint fk_product_seller foreign key (idPSeller) references seller(idSeller),
        constraint fk_product_product foreign key (idProduct) references product(idProduct)
);

create table productOrder(
		idPOproduct int,
        idPOorder int,
        poQuantity int default 1,
        poStatus enum('Disponível', 'Sem Estoque') default 'Disponível',
        primary key (idPOproduct, idPOorder),
        constraint fk_productorder_seller foreign key (idPOproduct) references product(idProduct),
        constraint fk_productorder_product foreign key (idPOorder) references orders(idOrder)
);

create table storageLocation(
		idLproduct int,
        idLstorage int,
        location varchar(255) not null,
        primary key (idLproduct, idLstorage),
        constraint fk_storage_location_product foreign key (idLproduct) references product(idProduct),
        constraint fk_storage_location_storage foreign key (idLstorage) references productStorage(idProdStorage)
);

create table productSupplier(
		idPsSupplier int,
        idPsProduct int,
        quantity int not null,
        primary key (IdPsSupplier, idPsProduct),
        constraint fk_product_supplier_supplier foreign key (idPsSupplier) references supplier(idSupplier),
        constraint fk_product_supplier_product foreign key (idPsProduct) references product(idProduct)
);


show tables;

show databases;
use perfomance_schema;
 
select * from referential_constraints where constraintss_schema = 'ecommerce';

