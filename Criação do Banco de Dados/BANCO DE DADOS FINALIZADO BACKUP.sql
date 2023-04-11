
-- Criar tabela alunos
CREATE TABLE alunos (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  email VARCHAR(255) NOT NULL UNIQUE,
  telefone VARCHAR(20),
  data_nascimento DATE,
  cpf VARCHAR(14) NOT NULL UNIQUE,
  cep VARCHAR(9),
  endereco VARCHAR(255)
);

-- Comando para criar a tabela cursos
CREATE TABLE cursos (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(255) NOT NULL,
  duracao INTEGER,
  valor DECIMAL(10,2)
);

-- Comando para criar a tabela modulos 
CREATE TABLE modulos (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(255)NOT NULL,
  descricao VARCHAR(255)
);

-- Comando para criar a tabela departamentos
CREATE TABLE departamentos (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(255) NOT NULL,
  descricao VARCHAR(255)
);

-- Comando para criar a tabela Facilitadores
CREATE TABLE facilitadores (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  cpf VARCHAR(14) NOT NULL UNIQUE,
  email VARCHAR(255) NOT NULL UNIQUE,
  endereco VARCHAR(255),
  salario INTEGER,
  telefone VARCHAR(20)
);

-- Comando para criar a tabela administrador_rh
CREATE TABLE administrador_rh (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  cpf VARCHAR(14) NOT NULL UNIQUE,
  email VARCHAR(255) NOT NULL UNIQUE,
  endereco VARCHAR(255),
  salario INTEGER,
  telefone VARCHAR(20)
);

-- Comando para criar a tabela administrador_tecnologia
CREATE TABLE administrador_tecnologia (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  cpf VARCHAR(14) NOT NULL UNIQUE,
  email VARCHAR(255) NOT NULL UNIQUE,
  endereco VARCHAR(255),
  salario INTEGER,
  telefone VARCHAR(20)
);

-- Comando para criar a tabela administrador_marketing
CREATE TABLE administrador_marketing (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  cpf VARCHAR(14) NOT NULL UNIQUE,
  email VARCHAR(255) NOT NULL UNIQUE,
  endereco VARCHAR(255),
  salario INTEGER,
  telefone VARCHAR(20)
);

-- Comando para criar a tabela administrador_financeiro
CREATE TABLE Administrador_financeiro (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  cpf VARCHAR(14) NOT NULL UNIQUE,
  email VARCHAR(100) NOT NULL UNIQUE,
  telefone VARCHAR(20),
  endereco VARCHAR(255),
  salario INTEGER
);

-- Criar tabela para relacionar e alocar os cargos dos funcionarios em seus departamentos.
CREATE TABLE cargos (
  id SERIAL PRIMARY KEY,
  departamento_id INTEGER,
  facilitador_id INTEGER,
  marketing_id INTEGER,
  financeiro_id INTEGER,
  tecnologia_id INTEGER,
  rh_id INTEGER,
  FOREIGN KEY (departamento_id) REFERENCES departamentos(id),
  FOREIGN KEY (facilitador_id) REFERENCES facilitadores(id),
  FOREIGN KEY (marketing_id) REFERENCES administrador_marketing(id),
  FOREIGN KEY (financeiro_id) REFERENCES administrador_financeiro(id),
  FOREIGN KEY (tecnologia_id) REFERENCES administrador_tecnologia(id),
  FOREIGN KEY (rh_id) REFERENCES administrador_rh(id)
);
-- Comando para criar a tabela de relacionamento entre Alunos e Cursos
CREATE TABLE alunos_cursos (
  id SERIAL PRIMARY KEY,
  aluno_id INTEGER NOT NULL,
  curso_id INTEGER NOT NULL,
  FOREIGN KEY (aluno_id) REFERENCES alunos(id),
  FOREIGN KEY (curso_id) REFERENCES cursos(id)
);

-- Comando para criar a tabela Turmas
CREATE TABLE turmas (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  horario TIME NOT NULL,
  data_inicio DATE NOT NULL,
  data_fim DATE NOT NULL,
  curso_id INTEGER NOT NULL,
  FOREIGN KEY (curso_id) REFERENCES cursos(id)
);

-- Comando para criar a tabela de relacionamento entre Turmas e Facilitadores
CREATE TABLE turmas_facilitadores (
  id SERIAL PRIMARY KEY,
  turma_id INTEGER NOT NULL,
  facilitador_id INTEGER NOT NULL,
  FOREIGN KEY (turma_id) REFERENCES turmas(id),
  FOREIGN KEY (facilitador_id) REFERENCES facilitadores(id)
);

-- Comando para criar a tabela de relacionamento entre Cursos e Módulos
CREATE TABLE cursos_modulos (
  id SERIAL PRIMARY KEY,
  curso_id INTEGER NOT NULL,
  modulo_id INTEGER NOT NULL,
  FOREIGN KEY (curso_id) REFERENCES cursos(id),
  FOREIGN KEY (modulo_id) REFERENCES modulos(id)
);


	
	
--------------------------------------------------------------------------------------------------------

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



