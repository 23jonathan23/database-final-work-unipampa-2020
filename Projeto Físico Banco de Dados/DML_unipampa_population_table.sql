-------------------------------------------------------------------------------------
-- Instruções SQL DML ---------------------------------------------------------------

-- POPULA A TABELA ESTADO
INSERT INTO 
	Estado
VALUES 
	('AC', 'Acre'),
	('AL', 'Alagoas'),
	('BA', 'Bahia'),
	('CE', 'Ceará'),
	('ES', 'Espírito Santo'),
	('GO', 'Goiás'),
	('MA', 'Maranhão'),
	('MG', 'Minas Gerais'),
	('SP', 'São Paulo'),
	('RS', 'Rio Grando do Sul'),
	('RO', 'Rondônia')
	
-- POPULA A TABELA MUNICIPIO
INSERT INTO 
	Municipio (nome, uf)
VALUES 
	('Rio Branco', 'AC'),
	('Maceío', 'AL'),
	('Recife', 'BA'),
	('Fortaleza', 'CE'),
	('Vila Velha', 'ES'),
	('Goiânia', 'GO'),
	('São Luís', 'MA'),
	('Frutal', 'MG'),
	('São Paulo', 'SP'),
	('Porto Alegre', 'RS'),
	('Porto Velho','RO')
	
-- POPULA A TABELA ESFERA GOVERNAMENTAL
INSERT INTO 
	EsferaGovernamental (nome)
VALUES 
	('Federal'),
	('Estadual'),
	('Municipal')
	
-- POPULA A TABELA ESCOLA
INSERT INTO 
	Escola (inep, nome, localizacao, esferaGovId, municipioId)
VALUES 
	(11000708, 'ESCOLA MUNICIPAL DE ENSINO FUNDAMENTAL DOUTOR CUSTODIO', 'URBANA', 3, 1),
	(11000864, 'EEEFM IRMA MARIA CELESTE', 'URBANA', 2, 2),
	(11001160, 'ESC VISCONDE DO RIO BRANCO', 'RURAL', 1, 1),
	(11002255, 'ESC SANTA CLARA', 'RURAL', 1, 3),
	(11002280, 'ESC PROFESSORA SOFIA BARBOSA', 'URBANA', 2, 4),
	(11002883, 'ESCOLA ESTADUAL PROF GILBERTO MESTRINHO', 'RURAL', 2, 5),
	(11003693, 'ESC MUL MANOEL RIBEIRO ROSA', 'URBANA', 3, 9),
	(11007443, 'ESC MUL ODILON NERE SAMPAIO', 'RURAL', 3, 10),
	(11010126, 'ESCOLA MUNICIPAL SOUZA LIMA', 'URBANA', 3, 10),
	(11039779, 'EM CLARINOPOLIS', 'URBANA', 1, 9),
	(11053402, 'EM INDIGENA RAMAO MARTINS', 'RURAL', 3, 6)
	
-- POPULA TABELA PLANO GOVERNAMENTAL
INSERT INTO 
	PlanoGovernamental (nome, descricao, sigla)
VALUES 
	('Programa Novo Mais Educação','É uma estratégia do governo federal que objetiva melhorar a aprendizagem em Língua Portuguesa e Matemática no ensino fundamental', 'PNME'),
	('Programa Brasil Alfabetizado','Voltado para a alfabetização de jovens, adultos e idosos.', 'PBA'),
	('Programa Nacional de Inclusão de Jovens','Programa educacional destinado a jovens com 18 a 29 anos residentes em áreas rurais', 'Projovem'),
	('Programa de Bolsa Permanência','Tem por finalidade minimizar as desigualdades sociais, étnico-raciais e contribuir para permanência e diplomação dos estudantes.', 'SISBP'),
	('Programa de Educação Tutorial','O PET é desenvolvido por grupos de estudantes, com tutoria de um docente, organizados a partir de formações em nível de graduação.', 'PET')

-- PUPULA TABELA PLANO GOVERNAMENTAL APROVADO
INSERT INTO 
	PlanoGovernamentalAprovado (inepEscola, planoGovId, quantidadeBeneficiado, valorRecebido)
VALUES 
	(11000708, 1, 200, 3000000),
	(11000864, 2, 100, 5000000),
	(11001160, 3, 600, 90000000),
	(11002255, 4, 50, 1000000),
	(11002280, 5, 150, 2500000),
	(11002883, 1, 1000, 100000000),
	(11003693, 2, 10, 500000),
	(11007443, 3, 400, 6040000)