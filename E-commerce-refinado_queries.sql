-- Quantos pedidos foram feitos por cada cliente?
SELECT c.idClient, CONCAT(c.Fname, " ", c.Lname) as Full_name, c.CPF, COUNT(o.idClient) as Orders_quantity 
FROM client c INNER JOIN `order` o on c.idClient = o.idClient
GROUP BY o.idClient
ORDER BY c.idClient;

-- Algum vendedor também é fornecedor?
SELECT s.socialName AS SellerName, s.CNPJ AS SellerCNPJ, s.contact AS SellerContact,
       s.AbstName AS SellerAbstName, sp.socialName AS SupplierName
FROM seller s
INNER JOIN supplier sp ON s.CNPJ = sp.CNPJ;

-- OU:

SELECT s.socialName AS SellerName, s.CNPJ AS SellerCNPJ, s.contact AS SellerContact,
       s.AbstName AS SellerAbstName, sp.socialName AS SupplierName
FROM seller s, supplier sp
WHERE s.CNPJ = sp.CNPJ;

-- Relação de produtos fornecedores e estoques;
SELECT
	p.idProduct,
	p.Pname AS ProductName,
	ps.idSupplier,
	s.socialName AS SupplierName,
	ps.quantity AS QuantitySupplied,
	il.idInventory,
	il.location AS InventoryLocation,
	inv.quantity AS InventoryQuantity
FROM
	product p
JOIN
    productSupplier ps ON
	p.idProduct = ps.idProduct
JOIN
    supplier s ON
	ps.idSupplier = s.idSupplier
JOIN
    inventoryLocation il ON
	p.idProduct = il.idProduct
JOIN
    inventory inv ON
	il.idInventory = inv.idInventory;

  
-- Relação de nomes dos fornecedores e nomes dos produtos;
SELECT
	s.socialName AS SupplierName,
	p.Pname AS ProductName
FROM
	supplier s
JOIN
    productSupplier ps ON
	s.idSupplier = ps.idSupplier
JOIN
    product p ON
	ps.idProduct = p.idProduct;

-- Quais são os clientes que fizeram mais de um pedido?
SELECT
    c.idClient,
    CONCAT(c.Fname, ' ', c.Lname) AS Full_name,
    COUNT(*) AS Orders_quantity
FROM
    client c
JOIN
    `order` o ON c.idClient = o.idClient
GROUP BY
    o.idClient
HAVING
    Orders_quantity > 1;



