
-- 1. Selecionar a quantidade total de estudantes cadastrados no banco.
SELECT COUNT(*) as total_de_estudantes FROM alunos;

-- 2. Selecionar todos os estudantes com os respectivos cursos que eles estão cadastrados.
SELECT alunos.nome AS aluno, cursos.nome AS curso
FROM alunos_cursos_turmas
INNER JOIN alunos ON alunos.id = alunos_cursos_turmas.aluno_id
INNER JOIN cursos ON cursos.id = alunos_cursos_turmas.curso_id;

-- 3. Selecionar quais pessoas facilitadoras atuam em mais de uma turma.
SELECT funcionarios.nome AS facilitador, COUNT(*) AS quantidade_de_turmas
FROM facilitadores_facilitam
JOIN funcionarios ON facilitadores_facilitam.funcionario_id = funcionarios.id
GROUP BY facilitador
HAVING COUNT(*) > 1;

-- 4. Selecionar os funcionários da empresa em seus respectivos cargos e departamentos.
SELECT funcionarios.nome, cargos.nome AS cargo, departamentos.nome AS departamento
FROM funcionarios
JOIN cargos ON funcionarios.cargo_id = cargos.id
JOIN departamentos ON cargos.departamento_id = departamentos.id;

-- 5. Selecionar os cursos e seus respectivos módulos.
SELECT cursos.nome AS curso, modulos.nome AS modulo, modulos.descricao
FROM cursos
JOIN cursos_modulos ON cursos.id = cursos_modulos.curso_id
JOIN modulos ON cursos_modulos.modulo_id = modulos.id;

-- 6. selecionar o curso que possui a maior quantidade de alunos.
SELECT cursos.nome AS curso, COUNT(*) AS quantidade_de_alunos
FROM alunos_cursos_turmas
JOIN cursos ON alunos_cursos_turmas.curso_id = cursos.id
GROUP BY cursos.nome
ORDER BY quantidade_de_alunos DESC;
