
-- Comando para criar a tabela alunos que irá armazenar informações básicas sobre.
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

-- Comando para criar a tabela Turmas
CREATE TABLE turmas (
	id SERIAL PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
	horario TIME NOT NULL,
	data_inicio DATE NOT NULL,
	data_fim DATE NOT NULL
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
	
-- Comando para criar a tabela cursos
CREATE TABLE cursos (
	id SERIAL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
	duracao INTEGER,
	valor DECIMAL(10,2),
	turma_id INTEGER,
	FOREIGN KEY (turma_id) REFERENCES turmas(id)
	);
	
-- Comando para criar a tabbela cargos
CREATE TABLE cargos (
	id SERIAL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
	descricao VARCHAR(255),
	departamento_id INT,
	FOREIGN KEY (departamento_id) REFERENCES departamentos(id)
	);

-- Comando para criar a tabela de funcionarios
CREATE TABLE funcionarios (
	id SERIAL PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
	cpf VARCHAR(14) NOT NULL UNIQUE,
	email VARCHAR(100) NOT NULL UNIQUE,
	endereco VARCHAR(150),
	cep VARCHAR(9),
	salario DECIMAL(10,2),
	telefone VARCHAR(20),
	data_nascimento DATE,
	cargo_id INT,
	FOREIGN KEY (cargo_id) REFERENCES cargos(id)
	);

-- Criar tabela de funcionarios que facilitam os cursos, modulos e turmas.
CREATE TABLE facilitadores_facilitam (
	id SERIAL PRIMARY KEY,
	curso_id INTEGER NOT NULL,
	modulo_id INTEGER NOT NULL,
	turma_id INTEGER NOT NULL,
	funcionario_id INTEGER NOT NULL,
	FOREIGN KEY (curso_id) REFERENCES cursos(id),
	FOREIGN KEY (modulo_id) REFERENCES modulos(id),
	FOREIGN KEY (turma_id) REFERENCES turmas(id),
	FOREIGN KEY (funcionario_id) REFERENCES funcionarios(id)
	);

-- Comando para criar a tabela de relacionamento entre alunos, cursos e turmas
CREATE TABLE alunos_cursos_turmas (
	id SERIAL PRIMARY KEY,
	aluno_id INTEGER NOT NULL,
	curso_id INTEGER NOT NULL,
	turma_id INTEGER,
	FOREIGN KEY (aluno_id) REFERENCES alunos(id),
	FOREIGN KEY (curso_id) REFERENCES cursos(id),
	FOREIGN KEY (turma_id) REFERENCES turmas(id)
	);
  
-- Comando para criar a tabela relacional entre cursos e modulos
CREATE TABLE cursos_modulos (
	id SERIAL PRIMARY KEY,
	curso_id INTEGER NOT NULL,
	modulo_id INTEGER NOT NULL,
	FOREIGN KEY (curso_id) REFERENCES cursos(id),
	FOREIGN KEY (modulo_id) REFERENCES modulos(id)
	);
