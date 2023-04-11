-- 1 - Selecionar a quantidade total de estudantes cadastrados no banco.
SELECT COUNT(*) as total_de_estudantes FROM alunos;

-- 2 - Selecionar todos os estudantes com os respectivos cursos que eles estão cadastrados
SELECT alunos.nome AS aluno, cursos.nome AS curso
FROM alunos_cursos
INNER JOIN alunos ON alunos.id = alunos_cursos.aluno_id
INNER JOIN cursos ON cursos.id = alunos_cursos.curso_id;

-- 3 - Selecionar quais pessoas facilitadoras atuam em mais de uma turma.
SELECT facilitadores.nome, COUNT(turmas_facilitadores.turma_id) AS quantidade_de_turmas
FROM facilitadores
JOIN turmas_facilitadores ON facilitadores.id = turmas_facilitadores.facilitador_id
GROUP BY facilitadores.id
HAVING COUNT(turmas_facilitadores.turma_id) > 1;

-- 4 - Selecionar os funcionários da empresa em seus respectivos departamentos.
SELECT 
  d.nome AS departamento,
  f.id AS cargos_id,
  COALESCE(fac.nome, mark.nome, fin.nome, tec.nome, rh.nome) AS Funcionarios
FROM cargos f
JOIN departamentos d ON f.departamento_id = d.id
LEFT JOIN facilitadores fac ON f.facilitador_id = fac.id
LEFT JOIN administrador_marketing mark ON f.marketing_id = mark.id
LEFT JOIN administrador_financeiro fin ON f.financeiro_id = fin.id
LEFT JOIN administrador_tecnologia tec ON f.tecnologia_id = tec.id
LEFT JOIN administrador_rh rh ON f.rh_id = rh.id
WHERE d.nome IN ('Recursos Humanos', 'Marketing', 'Financeiro', 'Tecnologia', 'Pedagógico');


-- 5 - Selecionar os cursos e seus respectivos módulos.
SELECT cursos.nome AS curso, modulos.nome AS modulo, modulos.descricao
FROM cursos
JOIN cursos_modulos ON cursos.id = cursos_modulos.curso_id
JOIN modulos ON cursos_modulos.modulo_id = modulos.id;

-- 6 - Selecionar selecionar o curso com maior duração em horas.
SELECT nome, duracao
FROM cursos
WHERE duracao = (SELECT MAX(duracao) FROM cursos);
