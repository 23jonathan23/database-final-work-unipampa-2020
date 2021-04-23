-------------------------------------------------------------------------------------
-- Instruções SQL DML ---------------------------------------------------------------

---VIEWS------------------------------------------------------------------

-- VIEW PARA REALIZAR A SOMA DO GASTO TOTAL COM PLANOS GOVERNAMENTAL

CREATE VIEW 
	GastoTotalPlanoGovernamental 
AS(
	SELECT 
		to_char((SUM(valorRecebido) / 100), 'L9G999G990D99') as GastoTotal
	FROM PlanoGovernamentalAprovado
)

SELECT * from GastoTotalPlanoGovernamental

DROP VIEW GastoTotalPlanoGovernamental

-- VIEW PARA OBTER O GASTO TOTAL COM O PLANO GOVERNAMENTAL AGRUPADOS POR ESFERA GOV.

CREATE VIEW 
	GastoTotalPlanoGovernamentalPorEsferaGov
AS(
	SELECT 
		eg.nome as EsferaGov,
		to_char((SUM(pga.valorRecebido) / 100), 'L9G999G990D99') as GastoTotal
	FROM PlanoGovernamentalAprovado pga
	INNER JOIN Escola e ON e.inep = pga.inepEscola
	INNER JOIN EsferaGovernamental eg ON eg.id = e.esferaGovId
	GROUP BY EsferaGov
	ORDER BY GastoTotal DESC
)

SELECT * from GastoTotalPlanoGovernamentalPorEsferaGov

DROP VIEW GastoTotalPlanoGovernamentalPorEsferaGov

-- VIEW PARA OBTER O GASTO TOTAL COM O PLANO GOVERNAMENTAL AGRUPADOS POR ESTADO.

CREATE VIEW 
	GastoTotalPlanoGovernamentalPorEstado
AS(
	SELECT 
		et.nome as Estado,
		to_char((SUM(pga.valorRecebido) / 100), 'L9G999G990D99') as GastoTotal
	FROM PlanoGovernamentalAprovado pga
	INNER JOIN Escola e ON e.inep = pga.inepEscola
	INNER JOIN Municipio m ON m.id = e.municipioId
	INNER JOIN Estado et ON et.uf = m.uf
	GROUP BY Estado
	ORDER BY GastoTotal DESC
)

SELECT * from GastoTotalPlanoGovernamentalPorEstado

DROP VIEW GastoTotalPlanoGovernamentalPorEstado

-- VIEW PARA OBTER O VALOR RECEBIDO POR CADA ESCOLA EM ORDEM DECRESCENTE

CREATE VIEW 
	ValorRecebidoPorEscola
AS(
	SELECT 
		e.nome as Escola,
		to_char((valorRecebido / 100), 'L9G999G990D99') as ValorRecebido
	FROM PlanoGovernamentalAprovado pga
	INNER JOIN Escola e ON e.inep = pga.inepEscola
	ORDER BY ValorRecebido DESC
)

SELECT * from ValorRecebidoPorEscola

DROP VIEW ValorRecebidoPorEscola

-- VIEW PARA OBTER O VALOR RECEBIDO POR ESCOLA DA ZONA RURAL

CREATE VIEW 
	ValorRecebidoPorEscolaRural
AS(
	SELECT 
		e.nome as Escola,
		to_char((valorRecebido / 100), 'L9G999G990D99') as ValorRecebido,
		e.localizacao
	FROM PlanoGovernamentalAprovado pga
	INNER JOIN Escola e ON e.inep = pga.inepEscola
	WHERE e.localizacao = 'RURAL'
	ORDER BY ValorRecebido DESC
)

SELECT * from ValorRecebidoPorEscolaRural

DROP VIEW ValorRecebidoPorEscolaRural

-- VIEW PARA OBTER O VALOR RECEBIDO POR ESCOLA DA ZONA URBANA

CREATE VIEW 
	ValorRecebidoPorEscolaUrbana
AS(
	SELECT 
		e.nome as Escola,
		to_char((valorRecebido / 100), 'L9G999G990D99') as ValorRecebido,
		e.localizacao
	FROM PlanoGovernamentalAprovado pga
	INNER JOIN Escola e ON e.inep = pga.inepEscola
	WHERE e.localizacao = 'URBANA'
	ORDER BY ValorRecebido DESC
)

SELECT * from ValorRecebidoPorEscolaUrbana

DROP VIEW ValorRecebidoPorEscolaUrbana

-- VIEW PARA OBTER O TOTAL DE ESCOLAS DA ZONA URBANA E RURAL SEPARADOS

CREATE VIEW 
	TotalDeEscolasUrbanaERural
AS(
	SELECT 
		e.localizacao,
		COUNT(e.*) as Escolas
	FROM PlanoGovernamentalAprovado pga
	INNER JOIN Escola e ON e.inep = pga.inepEscola
	WHERE e.localizacao = 'URBANA' OR e.localizacao = 'RURAL'
	GROUP BY e.localizacao
)

SELECT * from TotalDeEscolasUrbanaERural

DROP VIEW TotalDeEscolasUrbanaERural

-- VIEW PARA OBTER A QUANTIDADE DE ESCOLAS BENEFICIADAS POR PLANO GOVERNAMENTAL

CREATE VIEW 
	QtdEscolaBeneficiadasPorPlanoGovernamental
AS(
	SELECT 
		pg.nome as PlanoGovernamental,
		COUNT(pga.*) as EscolasContempladas
	FROM PlanoGovernamentalAprovado pga
	INNER JOIN PlanoGovernamental pg ON pg.id = pga.planoGovId
	GROUP BY 1
	ORDER BY EscolasContempladas DESC
)

SELECT * from QtdEscolaBeneficiadasPorPlanoGovernamental

DROP VIEW QtdEscolaBeneficiadasPorPlanoGovernamental

-- VIEW PARA OBTER AS ESCOLAS QUE NÃO FORAM BENEFICIADAS COM PLANO GOVERNAMENTAL

CREATE VIEW 
	EscolasNaoBeneficiadasComPlanoGovernamental
AS(
	SELECT 
		e.nome as Escola
	FROM PlanoGovernamentalAprovado pga
	RIGHT JOIN Escola e ON e.inep = pga.inepEscola
	WHERE pga.inepEscola IS NULL
)

SELECT * from EscolasNaoBeneficiadasComPlanoGovernamental

DROP VIEW EscolasNaoBeneficiadasComPlanoGovernamental

-- VIEW PARA OBTER OS PLANOS GOVERNAMENTAIS QUE NÃO FORAM IMPLANTADOS EM UMA ESCOLA

CREATE VIEW 
	PlanoGovernamentalNaoImplamtados
AS(
	SELECT 
		pg.nome as PlanoGovernamental
	FROM PlanoGovernamentalAprovado pga
	RIGHT JOIN PlanoGovernamental pg ON pg.id = pga.planoGovId
	WHERE pga.planoGovId IS NULL
)

SELECT * from PlanoGovernamentalNaoImplamtados

DROP VIEW PlanoGovernamentalNaoImplamtados