CREATE TABLE Cliente (
    Codigo Int IDENTITY (1,1) PRIMARY KEY,
    Nome VARCHAR (50) NOT NULL,
    NumeroEndereco VARCHAR(12) NOT NULL,
    TelefoneResidencial VARCHAR(14),
    TelefoneCelular VARCHAR(14) NOT NULL,
    TelefoneComercial VARCHAR(14)
);
CREATE TABLE EnderecoCliente (
    Cidade VARCHAR(50) NOT NULL,
    UF CHAR (2) NOT NULL,
    Logradouro VARCHAR(100) NOT NULL,
    TipoLogradouro VARCHAR(20) NOT NULL,
    CEP VARCHAR (10) NOT NULL , 
    Bairro VARCHAR (30) NOT NULL,
    Numero VARCHAR (10) NOT NULL,
    Complemento VARCHAR (20),
	CodigoCliente int PRIMARY KEY,
    CONSTRAINT fkEndercoCliente FOREIGN KEY (CodigoCliente) REFERENCES Cliente(Codigo)
);
CREATE TABLE PJ (
    CNPJ VARCHAR(20) UNIQUE,
    InscEstadual VARCHAR(20),
    NomeResponsavel VARCHAR (50),
    CodigoCliente INT PRIMARY KEY,
	CONSTRAINT fkPJ FOREIGN KEY (CodigoCliente) REFERENCES Cliente(Codigo)
);

CREATE TABLE PF (
    CPF VARCHAR(11) UNIQUE,
    RG VARCHAR (9) UNIQUE,
    DataNascimento DATE,
    Sexo CHAR (1),
    CodigoCliente INT PRIMARY KEY
	CONSTRAINT fkPF FOREIGN KEY (CodigoCliente) REFERENCES Cliente(Codigo)
);
CREATE TABLE Funcionario (
    Codigo INT IDENTITY (1,1) PRIMARY KEY,
    Nome VARCHAR (50) NOT NULL,
    Telefone VARCHAR (14) NOT NULL,
    Contato VARCHAR (20) NOT NULL,
    Funcao VARCHAR (30) NOT NULL,
    Departamento INTEGER NOT NULL
);
CREATE TABLE EnderecoFuncionario (
    Cidade VARCHAR(50) NOT NULL,
    UF CHAR (2) NOT NULL,
    Logradouro VARCHAR(100) NOT NULL,
    TipoLogradouro VARCHAR(20) NOT NULL,
    CEP VARCHAR (10) NOT NULL , 
    Bairro VARCHAR (30) NOT NULL,
    Numero VARCHAR (10) NOT NULL,
    Complemento VARCHAR (20),
	CodigoFuncionario INT PRIMARY KEY,
    CONSTRAINT fkEndercoFuncionario FOREIGN KEY (CodigoFuncionario) REFERENCES Funcionario(Codigo)
);
CREATE TABLE Produto (
    Codigo INT PRIMARY KEY,
    Descricao VARCHAR (50),
    PrecoCusto NUMERIC NOT NULL,
    QuantidadeEstoque NUMERIC NOT NULL,
    QuantidadeMinima NUMERIC NOT NULL,
    Tipo VARCHAR (20) NOT NULL
);
CREATE TABLE Venda (
    NumeroVenda INT IDENTITY (1,1) PRIMARY KEY,
    DataVenda DATE NOT NULL,
    ValorVenda NUMERIC NOT NULL,
    CondicaoPagamento VARCHAR (50) NOT NULL,
    CodigoFuncionario Int,
	CodigoCliente INT,
	CONSTRAINT fkCodigoFuncionario FOREIGN KEY (CodigoFuncionario) REFERENCES Funcionario(Codigo),
	CONSTRAINT fkCodigoCliente FOREIGN KEY (CodigoCliente) REFERENCES Cliente(Codigo)
);
CREATE TABLE ItemVenda (
    NumeroVenda INT,
    CodigoProduto INT,
    QuantidadeProduto NUMERIC NOT NULL,
    ValorUnitario NUMERIC NOT NULL,
    ValorTotalItem NUMERIC NOT NULL,
    CONSTRAINT fkCodigoProduto FOREIGN KEY(CodigoProduto) REFERENCES Produto(Codigo),
	CONSTRAINT fkNumeroVenda FOREIGN KEY(NumeroVenda) REFERENCES Venda(NumeroVenda),
	PRIMARY KEY(NumeroVenda,CodigoProduto)
);

INSERT INTO Cliente (Nome, NumeroEndereco, TelefoneResidencial, TelefoneCelular, TelefoneComercial)
VALUES ('João Silva', '123 Main St', '555-1234', '555-5678', NULL);

INSERT INTO EnderecoCliente (Cidade, UF, Logradouro, TipoLogradouro, CEP, Bairro, Numero, Complemento, CodigoCliente)
VALUES ('São Paulo', 'SP', 'Av. Paulista', 'Avenida', '01234-567', 'Bela Vista', '1000', NULL, 1);

INSERT INTO PJ (CNPJ, InscEstadual, NomeResponsavel, CodigoCliente)
VALUES ('12345678901234', '123456', 'José da Silva', 1);

INSERT INTO PF (CPF, RG, DataNascimento, Sexo, CodigoCliente)
VALUES ('12345678901', '1234567', '1980-01-01', 'M', 1);

INSERT INTO Funcionario (Nome, Telefone, Contato, Funcao, Departamento)
VALUES ('Maria Oliveira', '555-9876', 'maria@example.com', 'Vendedor', 1);

INSERT INTO EnderecoFuncionario (Cidade, UF, Logradouro, TipoLogradouro, CEP, Bairro, Numero, Complemento, CodigoFuncionario)
VALUES ('Rio de Janeiro', 'RJ', 'Rua das Flores', 'Rua', '54321-098', 'Centro', '500', NULL, 1);

INSERT INTO Produto (Codigo, Descricao, PrecoCusto, QuantidadeEstoque, QuantidadeMinima, Tipo)
VALUES (1, 'Camiseta', 20.00, 100, 10, 'Vestuário');

INSERT INTO Venda (DataVenda, ValorVenda, CondicaoPagamento, CodigoFuncionario, CodigoCliente)
VALUES ('2024-05-19', 500.00, 'À vista', 1, 1);

INSERT INTO ItemVenda (NumeroVenda, CodigoProduto, QuantidadeProduto, ValorUnitario, ValorTotalItem)
VALUES (1, 1, 5, 20.00, 100.00);

SELECT * FROM Cliente;

SELECT * FROM EnderecoCliente;

SELECT * FROM PJ;

SELECT * FROM PF;

SELECT * FROM Funcionario;

SELECT * FROM EnderecoFuncionario;

SELECT * FROM Produto;

SELECT * FROM Venda;

SELECT * FROM ItemVenda;