SELECT COUNT(medicamento) FROM farmacia;

SELECT MIN(idade) FROM usuarios;

SELECT MAX(idade) FROM usuarios;

SELECT AVG(idade) FROM usuarios WHERE idade >=18;

SELECT SUM(estoque) FROM farmacia WHERE categoria = 'blue' OR categoria = 'black';

SELECT SUM(estoque) FROM farmacia WHERE categoria IS NOT NULL;

SELECT SUM(estoque) FROM farmacia WHERE categoria IS NULL;

SELECT COUNT(medicamento) FROM farmacia WHERE categoria IS NULL;

SELECT CONCAT( medicamento, ' (', categoria, ')') FROM farmacia WHERE categoria IS NOT NULL;

SELECT CONCAT( id, ' - ', medicamento, 
' (', COALESCE(categoria, 'sem categoria'), ')') 
FROM farmacia;

SELECT (nome, idade, cadastro::date)
FROM  usuarios
WHERE cadastro LIKE '2020%';

SELECT
    nome,
    idade,
    email,
    jsonb_build_object(
        'years', DATE_PART('year', age(now(), cadastro::TIMESTAMP)),
        'months', DATE_PART('month', age(now(), cadastro::TIMESTAMP)),
        'days', DATE_PART('day', age(now(), cadastro::TIMESTAMP)),
        'hours', DATE_PART('hour', age(now(), cadastro::TIMESTAMP)),
        'minutes', DATE_PART('minute', age(now(), cadastro::TIMESTAMP)),
        'seconds', ROUND(DATE_PART('second', age(now(), cadastro::TIMESTAMP)))
    ) AS tempo_cadastro
FROM usuarios
WHERE idade < 18;


SELECT
    nome,
    idade,
    email,
    jsonb_build_object(
        'years', DATE_PART('year', age(now(), cadastro::DATE)),
        'months', DATE_PART('month', age(now(), cadastro::DATE)),
        'days', DATE_PART('day', age(now(), cadastro::DATE))
    ) AS tempo_cadastro
FROM usuarios
WHERE idade >= 60;

SELECT (categoria),
COUNT (*)
FROM farmacia
WHERE categoria IS NOT NULL
GROUP BY categoria;

SELECT (idade),
COUNT (*)
FROM usuarios
WHERE idade >= 18
Group by idade;

SELECT (categoria),
SUM (estoque)
FROM farmacia
WHERE categoria IS NOT NULL
GROUP BY categoria;
