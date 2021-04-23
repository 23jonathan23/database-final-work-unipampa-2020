----------------------------------------------------------------------------------------
-- Instruções SQL DDL ------------------------------------------------------------------
CREATE DATABASE Unipampa

CREATE TABLE Estado(
	uf VARCHAR(2) PRIMARY KEY,
	nome VARCHAR(30) NOT NULL
)

CREATE TABLE Municipio(
	id SERIAL PRIMARY KEY,
	nome VARCHAR(30) NOT NULL,
	uf VARCHAR(2) NOT NULL REFERENCES Estado(uf)
)

CREATE TABLE EsferaGovernamental(
	id SERIAL PRIMARY KEY,
	nome VARCHAR(30) UNIQUE NOT NULL
)

CREATE TABLE Escola(
	inep INTEGER PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
	localizacao VARCHAR(30) NOT NULL,
	esferaGovId INTEGER NOT NULL REFERENCES EsferaGovernamental(id),
	municipioId INTEGER NOT NULL REFERENCES Municipio(id)
)

CREATE TABLE PlanoGovernamental(
	id SERIAL PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
	descricao VARCHAR(300) NOT NULL,
	sigla VARCHAR(10) NOT NULL
)

CREATE TABLE PlanoGovernamentalAprovado(
	inepEscola INTEGER NOT NULL REFERENCES Escola(inep),
	planoGovId INTEGER NOT NULL REFERENCES PlanoGovernamental(id),
	quantidadeBeneficiado INTEGER NOT NULL,
	valorRecebido DECIMAL(12,2) UNIQUE NOT NULL,
	PRIMARY KEY(inepEscola, planoGovId)
)

DROP TABLE PlanoGovernamentalAprovado
DROP TABLE PlanoGovernamental
DROP TABLE Escola
DROP TABLE EsferaGovernamental
DROP TABLE Municipio
DROP TABLE Estado