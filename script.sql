-- Início SQL-DDL
-- Criar banco e selecionar ele
CREATE DATABASE IF NOT EXISTS hotel;
USE hotel;
-- Criar todas as tabelas
CREATE TABLE atendentes (
	IDatendente int NOT NULL AUTO_INCREMENT,
	nome varchar(100),
    idade int(2),
    PRIMARY KEY (IDatendente)
);
CREATE TABLE telefoneatendentes (
	IDtelefone int NOT NULL AUTO_INCREMENT,
    telefone int(9),
    IDatendente int,
    PRIMARY KEY (IDtelefone),
    FOREIGN KEY (IDatendente) REFERENCES atendentes(IDatendente)
    );
CREATE TABLE hospedes (
	IDhospede int NOT NULL AUTO_INCREMENT,
    nome varchar(100),
    rg int(10),
    cpf bigint(11),
    nascimento date,
    PRIMARY KEY (IDhospede)
);
CREATE TABLE telefonehospedes (
	IDtelefone int NOT NULL AUTO_INCREMENT,
    telefone int(9),
    IDhospede int,
    PRIMARY KEY (IDtelefone),
    FOREIGN KEY (IDhospede) REFERENCES hospedes(IDhospede)
);
CREATE TABLE tipoquarto (
	IDtipo int NOT NULL AUTO_INCREMENT,
    nometipo varchar(20),
    PRIMARY KEY (IDtipo)
);
CREATE TABLE padraoquarto (
	IDpadrao int NOT NULL AUTO_INCREMENT,
    nomepadrao varchar(20),
    PRIMARY KEY (IDpadrao)
);
CREATE TABLE reservas (
	IDreserva int NOT NULL AUTO_INCREMENT,
    diaentrada date,
    diasaida date,
    tipo int,
    padrao int,
    numerohospedes int,
    IDhospede int,
    IDatendente int,
    PRIMARY KEY (IDreserva),
    FOREIGN KEY (IDhospede) REFERENCES hospedes(IDhospede),
    FOREIGN KEY (IDatendente) REFERENCES atendentes(IDatendente),
    FOREIGN KEY (tipo) REFERENCES tipoquarto(IDtipo),
    FOREIGN KEY (padrao) REFERENCES padraoquarto(IDpadrao)
);

-- Início SQL-DML
-- Inserir atendentes
INSERT INTO atendentes (nome,idade) VALUES ("Ana Paula",25);
INSERT INTO atendentes (nome,idade) VALUES ("Beatriz",28);
INSERT INTO atendentes (nome,idade) VALUES ("Paulo",24);
INSERT INTO atendentes (nome,idade) VALUES ("Mariana",20);
INSERT INTO atendentes (nome,idade) VALUES ("Jorge",40);
INSERT INTO atendentes (nome,idade) VALUES ("Luiz",30);
INSERT INTO atendentes (nome,idade) VALUES ("Marcos",21);
-- Inserir telefones dos atendentes
INSERT INTO telefoneatendentes (telefone,IDatendente) VALUES (111111111,1);
INSERT INTO telefoneatendentes (telefone,IDatendente) VALUES (222222222,2);
INSERT INTO telefoneatendentes (telefone,IDatendente) VALUES (333333333,3);
INSERT INTO telefoneatendentes (telefone,IDatendente) VALUES (444444444,4);
INSERT INTO telefoneatendentes (telefone,IDatendente) VALUES (555555555,5);
INSERT INTO telefoneatendentes (telefone,IDatendente) VALUES (666666666,6);
INSERT INTO telefoneatendentes (telefone,IDatendente) VALUES (777777777,7);
-- Inserir hóspedes
INSERT INTO hospedes (nome,rg,cpf,nascimento) VALUES ("Pedro Gaya",1234567890,12345678910,'1994-01-09');