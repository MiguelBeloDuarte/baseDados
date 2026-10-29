-- Matéria Semana 4.2 --
CREATE DATABASE Datawarehouse

-- Exercício 1 --
CREATE TABLE Clientes (
    ClienteID INT IDENTITY(1,1) PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL
);

CREATE TABLE Pedidos (
    PedidoID INT IDENTITY(1,1) PRIMARY KEY,
    DataPedido DATE,
    ClienteID INT NOT NULL,
    CONSTRAINT FK_ClienteID FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);

INSERT INTO Clientes (Nome) VALUES ('Ana Silva');
INSERT INTO Clientes (Nome) VALUES ('Bruno Costa');

INSERT INTO Pedidos (DataPedido, ClienteID) VALUES ('2026-10-28', 1);
INSERT INTO Pedidos (DataPedido, ClienteID) VALUES ('2026-10-29', 2);

INSERT INTO Pedidos (DataPedido, ClienteID) VALUES ('2026-10-29', 99);

DELETE FROM Clientes WHERE ClienteID = 1;

SELECT * FROM Clientes;
SELECT * FROM Pedidos;

-- Exercício 2 --
CREATE TABLE Departamentos (
    DepartamentoID INT IDENTITY(1,1) PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL
);

CREATE TABLE Funcionarios (
    FuncionarioID INT IDENTITY(1,1) PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL,
    DepartamentoID INT NOT NULL,
    CONSTRAINT FK_DepartamentoID FOREIGN KEY (DepartamentoID) REFERENCES Departamentos(DepartamentoID)
);

-- Exercício 3 --
CREATE TABLE Cursos (
    CursoID INT IDENTITY(1,1) PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL
);

CREATE TABLE Matriculas (
    AlunoID INT IDENTITY(1,1) PRIMARY KEY,
    CursoID INT NOT NULL,
    CONSTRAINT FK_CursoID FOREIGN KEY (CursoID) REFERENCES Cursos(CursoID)
);

-- Exercício 4 --
CREATE TABLE Fornecedores (
    FornecedorID INT IDENTITY(1,1) PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL
);

CREATE TABLE Produtos (
    ProdutoID INT IDENTITY(1,1) PRIMARY KEY,
    FornecedorID INT NOT NULL,
    CONSTRAINT FK_FornecedorID FOREIGN KEY (FornecedorID) REFERENCES Fornecedores(FornecedorID)
);

-- Exercício 5 --
CREATE TABLE Projetos (
    ProjetoID INT IDENTITY(1,1) PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL
);

CREATE TABLE Tarefas (
    TarefaID INT IDENTITY(1,1) PRIMARY KEY,
    ProjetoID INT NOT NULL,
    CONSTRAINT FK_ProjetoID FOREIGN KEY (ProjetoID) REFERENCES Projetos(ProjetoID)
);

-- Exercício 6 --
CREATE TABLE Medicos (
    MedicoID INT IDENTITY(1,1) PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL
);

CREATE TABLE Consultas (
    ConsultaID INT IDENTITY(1,1) PRIMARY KEY,
    MedicoID INT NOT NULL,
    CONSTRAINT FK_MedicoID FOREIGN KEY (MedicoID) REFERENCES Medicos(MedicoID)
);

-- Exercício 7 --
CREATE TABLE Escolas (
    EscolaID INT IDENTITY(1,1) PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL
);

CREATE TABLE Turmas (
    TurmaID INT IDENTITY(1,1) PRIMARY KEY,
    EscolaID INT NOT NULL,
    CONSTRAINT FK_EscolaID FOREIGN KEY (EscolaID) REFERENCES Escolas(EscolaID)
);

-- Exercício 8 --
CREATE TABLE Vendedores (
    VendedorID INT IDENTITY(1,1) PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL
);

CREATE TABLE Vendas (
    VendaID INT IDENTITY(1,1) PRIMARY KEY,
    VendedorID INT NOT NULL,
    CONSTRAINT FK_VendedorID FOREIGN KEY (VendedorID) REFERENCES Vendedores(VendedorID)
);

-- Exercício 9 --
CREATE TABLE Autores (
    AutorID INT IDENTITY(1,1) PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL
);

CREATE TABLE Livros (
    LivroID INT IDENTITY(1,1) PRIMARY KEY,
    AutorID INT NOT NULL,
    CONSTRAINT FK_AutorID FOREIGN KEY (AutorID) REFERENCES Autores(AutorID)
);

-- Exercício 10 --
CREATE TABLE Paises (
    PaisID INT IDENTITY(1,1) PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL
);

CREATE TABLE Cidades (
    CidadeID INT IDENTITY(1,1) PRIMARY KEY,
    PaisID INT NOT NULL,
    CONSTRAINT FK_PaisID FOREIGN KEY (PaisID) REFERENCES Paises(PaisID)
);