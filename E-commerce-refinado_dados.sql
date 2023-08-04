-- Inserção de dados na tabela Cliente
INSERT INTO client (Fname, Minti, Lname, CPF, Street, City, Zipcode)
VALUES
    ('João', 'ABC', 'Silva', '12345678901', 'Rua A', 'Cidade A', '12345678'),
    ('Maria', 'DEF', 'Santos', '98765432101', 'Rua B', 'Cidade B', '87654321'),
    ('Pedro', 'GHI', 'Almeida', '65432198701', 'Rua C', 'Cidade C', '56789012'),
    ('Ana', 'JKL', 'Pereira', '45678912301', 'Rua D', 'Cidade D', '23456789');

-- Inserção de dados na tabela Produto
INSERT INTO product (Pname, category, rating, price)
VALUES
    ('Smartphone', 'Eletrônico', 4.5, 1000.00),
    ('Camiseta', 'Roupas', 3.8, 50.00),
    ('Boneca', 'Brinquedos', 4.2, 30.00),
    ('Livro', 'Livros', 4.7, 20.00);

-- Inserção de dados na tabela Pagamentos
INSERT INTO payment (idClient, paymentType)
VALUES
    (1, 'Cartão'),
    (2, 'Boleto'),
    (3, 'PIX'),
    (4, 'Cartão');

-- Inserção de dados na tabela Pedidos
INSERT INTO `order` (idClient, idPayment, orderStatus, orderDescription, sentValue)
VALUES
    (1, 1, 'Confirmado', 'Pedido 1', 800.00),
    (2, 2, 'Em análise', 'Pedido 2', 50.00),
    (3, 3, 'Confirmado', 'Pedido 3', 30.00),
    (4, 4, 'Em análise', 'Pedido 4', 900.00);

-- Inserção de dados na tabela Estoque
INSERT INTO inventory (location, quantity)
VALUES
    ('Local A', 100),
    ('Local B', 50),
    ('Local C', 200),
    ('Local D', 300);

-- Inserção de dados na tabela Fornecedor
INSERT INTO supplier (socialName, CNPJ, contact)
VALUES
    ('Fornecedor A', '12345678901234', '11111111111'),
    ('Fornecedor B', '98765432109876', '22222222222'),
    ('Fornecedor C', '56789012345678', '33333333333'),
    ('Fornecedor D', '45678901234567', '44444444444');

-- Inserção de dados na tabela Vendendor
INSERT INTO seller (socialName, AbstName, CNPJ, CPF, location, contact)
VALUES
    ('Vendedor A', 'Vend A', '12345678901234', NULL, 'Rua X', '55555555555'),
    ('Vendedor B', 'Vend B', '98765432109876', NULL, 'Rua Y', '66666666666'),
    ('Vendedor C', 'Vend C', NULL, '33333333333', 'Rua Z', '77777777777'),
    ('Vendedor D', 'Vend D', '45678901234567', NULL, 'Rua W', '88888888888');

-- Inserção de dados na tabela Produto_vendedor
INSERT INTO productSeller (idSeller, idProduct, quantity)
VALUES
    (1, 1, 10),
    (2, 2, 20),
    (3, 3, 5),
    (4, 4, 15);

-- Inserção de dados na tabela Produto_pedido
INSERT INTO productOrder (idProduct, idOrder, poQuantity)
VALUES
    (1, 1, 2),
    (2, 1, 3),
    (3, 2, 1),
    (4, 3, 2);

-- Inserção de dados na tabela Estoque_local
INSERT INTO inventoryLocation (idProduct, idInventory, location)
VALUES
    (1, 1, 'Local A'),
    (2, 2, 'Local B'),
    (3, 3, 'Local C'),
    (4, 4, 'Local D');

-- Inserção de dados na tabela productSupplier
INSERT INTO productSupplier (idSupplier, idProduct, quantity) VALUES
    (1, 1, 100),
    (2, 2, 50),
    (3, 3, 200),
    (4, 4, 150);
    
 -- Inserção de mais um pedido para o Cliente de ID 1
INSERT INTO `order` (idClient, idPayment, orderStatus, orderDescription, sentValue)
VALUES
    (1, 1, 'Confirmado', 'Pedido 5', 300.00);

-- Inserção de mais um pedido para o Cliente de ID 2
INSERT INTO `order` (idClient, idPayment, orderStatus, orderDescription, sentValue)
VALUES
    (2, 2, 'Em análise', 'Pedido 6', 75.00);
