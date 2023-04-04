
-- Criação das tabelas
CREATE TABLE alunos (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL UNIQUE,
  telefone VARCHAR(20),
  data_nascimento DATE
);

-- Comando para criar a tabela Cursos
CREATE TABLE cursos (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(255) NOT NULL,
  duracao INTEGER NOT NULL,
  valor DECIMAL(10,2) NOT NULL
);

-- Comando para criar a tabela Módulos 
CREATE TABLE modulos (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(255) NOT NULL,
  descricao VARCHAR(255) NOT NULL,
  carga_horaria INTEGER NOT NULL
);

-- Comando para criar a tabela departamentos
CREATE TABLE departamentos (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(255) NOT NULL,
  descricao VARCHAR(255)
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
  nome VARCHAR(255) NOT NULL,
  data_inicio DATE NOT NULL,
  data_fim DATE NOT NULL,
  curso_id INTEGER NOT NULL,
  FOREIGN KEY (curso_id) REFERENCES cursos(id)
);

-- Comando para criar a tabela Facilitadores
DROP TABLE facilitadores (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(255) NOT NULL,
  cpf VARCHAR(14) NOT NULL UNIQUE,
  email VARCHAR(255) NOT NULL UNIQUE,
  telefone VARCHAR(20),
  id_departamento INTEGER NOT NULL,
  FOREIGN KEY (id_departamento) REFERENCES departamentos(id)
);

-- Comando para criar a tabela de relacionamento entre Turmas e Facilitadores
CREATE TABLE turmas_facilitadores (
  id SERIAL PRIMARY KEY,
  turma_id INTEGER NOT NULL,
  facilitador_id INTEGER NOT NULL,
  FOREIGN KEY (turma_id) REFERENCES turmas(id),
  FOREIGN KEY (facilitador_id) REFERENCES facilitadores(id)
);

-- Comando para criar a tabela Funcionários
CREATE TABLE funcionarios (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(255) NOT NULL,
  cpf VARCHAR(14) NOT NULL UNIQUE,
  email VARCHAR(255) NOT NULL UNIQUE,
  telefone VARCHAR(20),
  departamento_id INTEGER NOT NULL,
  FOREIGN KEY (departamento_id) REFERENCES departamentos(id)
);

-- Comando para criar a tabela de relacionamento entre Cursos e Módulos
CREATE TABLE cursos_modulos (
  id SERIAL PRIMARY KEY,
  curso_id INTEGER NOT NULL,
  modulo_id INTEGER NOT NULL,
  FOREIGN KEY (curso_id) REFERENCES cursos(id),
  FOREIGN KEY (modulo_id) REFERENCES modulos(id)
);
