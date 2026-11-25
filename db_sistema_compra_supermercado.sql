CREATE DATABASE db_sistema_compras_supermercado;
USE db_sistema_compras_supermercado;

CREATE TABLE tbl_cliente (
    id           INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome_cliente VARCHAR(45),
    cpf          VARCHAR(18),
    rg           VARCHAR(15)
);

CREATE TABLE tbl_telefone (
    id              INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_cliente      INT NOT NULL,
    numero_telefone VARCHAR(15) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES tbl_cliente(id)
);

CREATE TABLE tbl_email (
    id         INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT NOT NULL,
    email      VARCHAR(100) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES tbl_cliente(id)
);

CREATE TABLE tbl_endereco (
    id         INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT NOT NULL,
    cidade     VARCHAR(45),
    logradouro VARCHAR(100),  
    cep        VARCHAR(10),
    estado     VARCHAR(30),
    bairro     VARCHAR(50),    
    pais       VARCHAR(15),
    FOREIGN KEY (id_cliente) REFERENCES tbl_cliente(id)
);

CREATE TABLE tbl_produto (
    id           INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome_produto VARCHAR(50) NOT NULL,      
    estoque      INT NOT NULL,
    preco        DECIMAL(10,2),              
    categoria    VARCHAR(15) NOT NULL
);

CREATE TABLE tbl_colaborador (
    id               INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome_colaborador VARCHAR(50) NOT NULL,
    cargo            VARCHAR(45) NOT NULL,
    salario          DECIMAL(10,2),          
    data_admissao    DATE NOT NULL
);

CREATE TABLE tbl_compra (
    id             INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_cliente     INT NOT NULL,
    id_colaborador INT NOT NULL,
    valor_total    DECIMAL(10,2) NOT NULL,
    data_venda     DATE NOT NULL,
    FOREIGN KEY (id_cliente)     REFERENCES tbl_cliente(id),
    FOREIGN KEY (id_colaborador) REFERENCES tbl_colaborador(id)
);

CREATE TABLE tbl_itens_venda (
    id             INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_compra      INT NOT NULL,
    id_produto     INT NOT NULL,
    qtde           INT NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_compra)  REFERENCES tbl_compra(id),
    FOREIGN KEY (id_produto) REFERENCES tbl_produto(id)
);