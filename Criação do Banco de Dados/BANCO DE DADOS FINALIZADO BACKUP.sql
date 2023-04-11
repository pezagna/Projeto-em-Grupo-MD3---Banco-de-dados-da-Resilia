
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



