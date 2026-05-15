-- -----------------------------------------------------
CREATE DATABASE mercado;
USE mercado ;
DROP DATABASE mercado;

-- -----------------------------------------------------
CREATE TABLE usuarios(
  id_usuario INT PRIMARY KEY NULL,
  nome VARCHAR(100) NOT NULL,
  cargo VARCHAR(50) NOT NULL,
  departamento VARCHAR(50) NULL,
  ativo BOOLEAN DEFAULT TRUE,
  email VARCHAR(45) NULL,
  senha VARCHAR(45) NULL,
  perfil ENUM('ADM', 'GERENTE', 'VENDEDOR', 'ESTOQUISTA', 'VISUALIZADOR')
  );


CREATE TABLE clientes(
  id_cliente INT PRIMARY KEY NULL AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  CPF_CNPJ VARCHAR(20) UNIQUE,
  email VARCHAR(45) UNIQUE,
  tell VARCHAR (20),
  tipo ENUM('FÍSICO','JURÍDICO'),
  -- ENDEREÇO
  cidade VARCHAR(100),
  estado CHAR(2),
  cep VARCHAR(10),
  logradouro VARCHAR(100),
  pais VARCHAR (20),
  numero VARCHAR(5),
  complemento VARCHAR(500),
  -- ADICIONAIS
  limite_credito DECIMAL(10,2) NULL DEFAULT '0,00',
  data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP
  );


CREATE TABLE pedidos (
  id_pedido INT PRIMARY KEY NULL,
  id_usuario INT,
  id_cliente INT,
  data_pedido DATE NOT NULL,
  status_pedido ENUM('PENDENTE','CONCLUIDO', 'CANCELADO', 'EM ANDAMENTO'),
  valor_total DECIMAL(10,2) DEFAULT 0.00,
  FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
  FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)

);


CREATE TABLE produtos (
  id_produto INT PRIMARY KEY NULL AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  categoria VARCHAR(50) NOT NULL,
  sku VARCHAR(150) NOT NULL,
  preco_custo DECIMAL(10,2) NOT NULL,
  preco_venda DECIMAL(10,2) NOT NULL,
  quantidade_estoque INT(11) NOT NULL DEFAULT 0,
  estique_min INT DEFAULT 0,
  status_produto BOOLEAN DEFAULT TRUE,
  fornecedor VARCHAR (50) NOT NULL
);


CREATE TABLE itens_pedidos (
  id_item INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  id_produto INT NOT NULL,
  id_pedido INT NOT NULL,
  quantidade INT NOT NULL,
  preco_unitario DECIMAL(10,2) NOT NULL,
  desconto_percentual DECIMAL(5,2) DEFAULT 0.00,
  FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido),
  FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
  );
CREATE TABLE pagamentos(
id_pagamento INT(11) AUTO_INCREMENT PRIMARY KEY,
id_pedido INT(11) NOT NULL,
metodo_pagamento ENUM('PIX' , 'CREDITO', 'DEBITO', 'DINHEIRO', 'DEBITO', 'VR'),
valor_pago DECIMAL(10,2) NOT NULL,
status_pagamento ENUM ('PENDENTE','APROVADO', 'RECUSADO') DEFAULT 'PENDENTE',
FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido)
);
