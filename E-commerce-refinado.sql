-- Cenário de E-commerce
CREATE DATABASE Ecommerce_refinado;
USE Ecommerce_refinado;


-- DROP DATABASE Ecommerce_refinado;

-- Tabela Cliente
CREATE TABLE client (
	 idClient INT AUTO_INCREMENT,
	 Fname VARCHAR(10) NOT NULL,
	 Minti CHAR(3),
	 Lname VARCHAR(20) NOT NULL,
	 CPF CHAR(11) NOT NULL,
	 Street VARCHAR(50) NOT NULL,
	 City VARCHAR(30)NOT NULL,
	 Zipcode CHAR(8) NOT NULL,
	 CONSTRAINT UQ_cpf_client UNIQUE(CPF),
	 CONSTRAINT PK_idClient PRIMARY KEY(idClient)
);

-- Tabela produto
CREATE TABLE product(
	 idProduct INT AUTO_INCREMENT,
	 Pname VARCHAR(10) NOT NULL,
	 category ENUM('Eletrônico', 'Roupas', 'Brinquedos', 'Livros', 'Moveis') NOT NULL,
	 rating FLOAT default 0,
	 price FLOAT,
	 CONSTRAINT PK_idProduct PRIMARY KEY(idProduct)
);

-- Tabela Pagamentos
CREATE TABLE payment (
	idPayment INT AUTO_INCREMENT,
    idClient INT NOT NULL,
    paymentType ENUM('Cartão', 'Boleto', 'PIX'),
    PRIMARY KEY(idPayment),
    CONSTRAINT FK_payment_client FOREIGN KEY(idClient) REFERENCES client(idClient) ON UPDATE CASCADE,
    CONSTRAINT UQ_payment_client UNIQUE(idPayment, idClient)
);

-- Tabela Pedidos
CREATE TABLE `order` (
	idOrder INT AUTO_INCREMENT,
	idClient INT NOT NULL,
	idPayment INT NOT NULL,
	orderStatus ENUM('Cancelado', 'Confirmado', 'Em análise') default 'Em análise' ,
	orderDescription VARCHAR(255),
	sentValue FLOAT DEFAULT 0,
	CONSTRAINT PK_order PRIMARY KEY(idOrder),
	CONSTRAINT FK_order_client FOREIGN KEY(idClient) REFERENCES client(idClient) ON UPDATE CASCADE,
	CONSTRAINT FK_order_payment FOREIGN KEY(idPayment) REFERENCES payment(idPayment) ON UPDATE CASCADE
);

-- Tabela Estoque
CREATE TABLE inventory (
	idInventory INT AUTO_INCREMENT,
	location  VARCHAR(255) NOT NULL,
	quantity INT default 0,
	CONSTRAINT PK_inventory PRIMARY KEY(idInventory)
);

-- Tabela Fornecedor
CREATE TABLE supplier(
	idSupplier INT AUTO_INCREMENT,
	socialName VARCHAR(255) NOT NULL,
	CNPJ CHAR(14) NOT NULL,
	contact CHAR(11) NOT NULL,
	CONSTRAINT PK_supplier PRIMARY KEY(idSupplier),
	CONSTRAINT UQ_supplier_cnpj UNIQUE(CNPJ)
);

-- Tabela Vendendor
CREATE TABLE seller(
	idSeller INT AUTO_INCREMENT,
	socialName VARCHAR(255) NOT NULL,
	AbstName VARCHAR(255),
	CNPJ CHAR(14),
	CPF CHAR(11),
	location VARCHAR(255),
	contact CHAR(11) NOT NULL,
	CONSTRAINT PK_seller PRIMARY KEY(idSeller),
	CONSTRAINT UQ_supplier_cnpj UNIQUE(CNPJ),
	CONSTRAINT UQ_cpf_seller UNIQUE(CPF)
);

-- Tabela Produto_vendedor
CREATE TABLE productSeller(
	idSeller INT,
	idProduct INT,
	quantity INT default 1,
	CONSTRAINT PK_product_seller PRIMARY KEY(idSeller, idProduct),
	CONSTRAINT FK_seller FOREIGN KEY (idSeller) REFERENCES seller(idSeller),
	CONSTRAINT FK_product FOREIGN KEY (idProduct) REFERENCES product(idProduct)
);

-- Tabela Produto_pedido
CREATE TABLE productOrder(
	idProduct INT,
	idOrder INT,
	poQuantity INT default 1,
	poStatus ENUM('Disponivel', 'Sem Estoque') default 'Disponivel',
	CONSTRAINT PK_product_order PRIMARY KEY(idProduct, idOrder),
	CONSTRAINT FK_productOrder_order FOREIGN KEY (idOrder) REFERENCES `order`(idOrder),
	CONSTRAINT FK_productOrder_product FOREIGN KEY (idProduct) REFERENCES product(idProduct)
);

-- Tabela Estoque_local
CREATE TABLE inventoryLocation(
	idProduct INT,
	idInventory INT,
	location VARCHAR(255),
	CONSTRAINT PK_inventoryLocation PRIMARY KEY(idProduct, idInventory),
	CONSTRAINT FK_product_inventoryLocation FOREIGN KEY(idProduct) REFERENCES product(idProduct),
	CONSTRAINT FK_inventory_inventoryLocation FOREIGN KEY(idInventory) REFERENCES inventory(idInventory)
);

-- Tabela produto_fornecedor
CREATE TABLE productSupplier(
	idSupplier INT,
	idProduct INT,
	quantity INT NOT NULL,
	CONSTRAINT PK_productSupplier PRIMARY KEY(idSupplier, idProduct),
	CONSTRAINT FK_productSupplier_supplier FOREIGN KEY(idSupplier) REFERENCES supplier(idSupplier),
	CONSTRAINT FK_productSupplier_product FOREIGN KEY(idProduct) REFERENCES product(idProduct)
);

show tables;
