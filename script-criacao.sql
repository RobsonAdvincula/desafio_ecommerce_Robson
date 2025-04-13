CREATE TABLE CLIENTE (
    id_cliente INT PRIMARY KEY,
    nome VARCHAR(100),
    tipo_cliente ENUM('PF', 'PJ') NOT NULL,
    documento VARCHAR(20) UNIQUE
);

CREATE TABLE FORNECEDOR (
    id_fornecedor INT PRIMARY KEY,
    nome VARCHAR(100)
);

CREATE TABLE VENDEDOR (
    id_vendedor INT PRIMARY KEY,
    nome VARCHAR(100)
);

CREATE TABLE PRODUTO (
    id_produto INT PRIMARY KEY,
    nome VARCHAR(100),
    preco DECIMAL(10,2),
    id_fornecedor INT,
    FOREIGN KEY (id_fornecedor) REFERENCES FORNECEDOR(id_fornecedor)
);

CREATE TABLE ESTOQUE (
    id_produto INT PRIMARY KEY,
    quantidade INT,
    FOREIGN KEY (id_produto) REFERENCES PRODUTO(id_produto)
);

CREATE TABLE PEDIDO (
    id_pedido INT PRIMARY KEY,
    data_pedido DATE,
    id_cliente INT,
    id_vendedor INT,
    FOREIGN KEY (id_cliente) REFERENCES CLIENTE(id_cliente),
    FOREIGN KEY (id_vendedor) REFERENCES VENDEDOR(id_vendedor)
);

CREATE TABLE ITEM_PEDIDO (
    id_pedido INT,
    id_produto INT,
    quantidade INT,
    PRIMARY KEY (id_pedido, id_produto),
    FOREIGN KEY (id_pedido) REFERENCES PEDIDO(id_pedido),
    FOREIGN KEY (id_produto) REFERENCES PRODUTO(id_produto)
);

CREATE TABLE PAGAMENTO (
    id_pagamento INT PRIMARY KEY,
    id_pedido INT,
    forma_pagamento VARCHAR(50),
    valor DECIMAL(10,2),
    FOREIGN KEY (id_pedido) REFERENCES PEDIDO(id_pedido)
);

CREATE TABLE ENTREGA (
    id_entrega INT PRIMARY KEY,
    id_pedido INT,
    status VARCHAR(50),
    codigo_rastreio VARCHAR(50),
    FOREIGN KEY (id_pedido) REFERENCES PEDIDO(id_pedido)
);