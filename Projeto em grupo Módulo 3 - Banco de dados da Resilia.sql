
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
	
-- Tabela cargos
CREATE TABLE cargos (
	id SERIAL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
	descricao VARCHAR(255),
	departamento_id INT,
	FOREIGN KEY (departamento_id) REFERENCES departamentos(id)
	);

-- Tabela funcionarios
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

-- Criar tabela de funcionarios que facilitam o curso em geral.
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

-- Comando para criar a tabela de relacionamento entre Alunos e Cursos
CREATE TABLE alunos_cursos_turmas (
	id SERIAL PRIMARY KEY,
	aluno_id INTEGER NOT NULL,
	curso_id INTEGER NOT NULL,
	turma_id INTEGER,
	FOREIGN KEY (aluno_id) REFERENCES alunos(id),
	FOREIGN KEY (curso_id) REFERENCES cursos(id),
	FOREIGN KEY (turma_id) REFERENCES turmas(id)
	);

CREATE TABLE cursos_modulos (
	id SERIAL PRIMARY KEY,
	curso_id INTEGER NOT NULL,
	modulo_id INTEGER NOT NULL,
	FOREIGN KEY (curso_id) REFERENCES cursos(id),
	FOREIGN KEY (modulo_id) REFERENCES modulos(id)
	);

------------------------------------------------
	
-- Inserir dados na tabela alunos
INSERT INTO alunos (id,nome, email, telefone, data_nascimento, cpf, cep, endereco) VALUES
    (1,'Luiz Felipe', 'luiz.felipe@aluno.resilia.com', '(21) 98888-5555', '2002-02-22', '777.456.789-00', '20511-290', 'Rua General Glicério, 364 - Laranjeiras, Rio de Janeiro - RJ'),
    (2,'Fernanda Costa', 'fernanda.costa@aluno.resilia.com', '(21) 98888-6666', '2002-05-10', '888.567.890-01', '22061-040', 'Rua Siqueira Campos, 30 - Copacabana, Rio de Janeiro - RJ'),
    (3,'Thiago Santos', 'thiago.santos@aluno.resilia.com', '(21) 98888-7777', '2002-06-15', '345.678.901-02', '20920-004', 'Rua Almirante Alexandrino, 618 - Santa Teresa, Rio de Janeiro - RJ'),
    (4,'Julia Oliveira', 'julia.oliveira@aluno.resilia.com', '(21) 98888-8888', '2002-01-01', '456.789.012-03', '22241-090', 'Rua Barão de Ipanema, 71 - Copacabana, Rio de Janeiro - RJ'),
    (5,'Lucas Santos', 'lucas.santos@aluno.resilia.com', '(21) 98888-9999', '2002-03-05', '567.890.123-04', '20231-052', 'Rua do Lavradio, 170 - Centro, Rio de Janeiro - RJ'),
    (6,'Gustavo Oliveira', 'gustavo.oliveira@aluno.resilia.com', '(21) 98888-0000', '2002-11-11', '678.901.234-05', '22021-001', 'Rua Nossa Senhora de Copacabana, 195 - Copacabana, Rio de Janeiro - RJ'),
    (7,'Luana Silva', 'luana.silva@aluno.resilia.com', '(21) 98888-1111', '2002-07-30', '789.012.345-06', '22250-040', 'Rua Santa Clara, 33 - Copacabana, Rio de Janeiro - RJ'),
    (8,'Rodrigo Oliveira', 'rodrigo.oliveira@aluno.resilia.com', '(21) 98888-2222', '2002-09-20', '890.123.456-07', '20541-190', 'Rua das Laranjeiras, 232 - Laranjeiras, Rio de Janeiro - RJ'),
    (9,'Mariana Santos', 'mariana.santos@aluno.resilia.com', '(21) 98888-3333', '2002-12-25', '901.234.567-08', '22211-080', 'Rua Barata Ribeiro, 726 - Copacabana, Rio de Janeiro - RJ'),
	(10,'Gabriel Almeida', 'gabriel.almeida@aluno.resilia.com', '(21) 98877-6655', '2001-03-15', '012.345.678-90', '20210-002', 'Rua do Carmo, 10, Rio de Janeiro - RJ'),
	(11,'Carla Ribeiro', 'carla.ribeiro@aluno.resilia.com', '(21) 98877-6655', '2001-03-15', '123.456.789-00', '20211-110', 'Rua do Lavradio, 20, Rio de Janeiro - RJ'),
	(12,'Mariana Lima', 'mariana.lima@aluno.resilia.com', '(21) 98877-6655', '2001-03-15', '234.567.890-01', '20230-150', 'Rua do Senado, 30, Rio de Janeiro - RJ'),
	(13,'Luiz Alves', 'luiz.alves@aluno.resilia.com', '(21) 98877-6655', '2001-03-15', '345.678.901-23', '20230-060', 'Rua dos Inválidos, 40, Rio de Janeiro - RJ'),
	(14,'Juliana Gonçalves', 'juliana.goncalves@aluno.resilia.com', '(21) 98877-6655', '2001-03-15', '456.789.012-34', '20231-016', 'Rua do Riachuelo, 50, Rio de Janeiro - RJ'),
	(15,'André Santos', 'andre.santos@aluno.resilia.com', '(21) 98877-6655', '2001-03-15', '567.890.123-45', '20231-030', 'Rua do Rosário, 60, Rio de Janeiro - RJ'),
	(16,'Renata Oliveira', 'renata.oliveira@aluno.resilia.com', '(21) 98877-6655', '2001-03-15', '678.901.234-56', '20231-004', 'Rua Buenos Aires, 70, Rio de Janeiro - RJ'),
	(17,'Rafaela Pereira', 'rafaela.pereira@aluno.resilia.com', '(21) 98877-6655', '2001-03-15', '789.012.345-67', '20230-012', 'Rua Sete de Setembro, 80, Rio de Janeiro - RJ'),
	(18,'Marcelo Souza', 'marcelo.souza@aluno.resilia.com', '(21) 98877-6655', '2001-03-15', '890.123.456-78', '20231-015', 'Rua dos Andradas, 90, Rio de Janeiro - RJ'),
	(19,'Roberto Ferreira', 'roberto.ferreira@aluno.resilia.com', '(21) 98555-6622', '2000-03-15', '901.124.887-85', '20923-092', 'Rua dos Silveiras, 30, Rio de Janeiro - RJ'),
	(20,'Rafael Santos', 'rafael.santos@aluno.resilia.com', '(21) 91234-6622', '2001-04-25', '101.124.457-95', '20900-442', 'Rua dos Oliveiras, 40, Rio de Janeiro - RJ'),
	(21,'Roberta Santos', 'roberta.santos@aluno.resilia.com', '(21) 99995-7772', '2003-09-23', '901.124.567-87', '20764-102', 'Rua das Palmeiras, 50, Rio de Janeiro - RJ'),
	(22,'Carlos Sampaio', 'carlos.sampaio@aluno.resilia.com', '(21) 98333-7722', '2001-01-13', '901.324.567-05', '23213-052', 'Rua dos Bandeirantes, 60, Rio de Janeiro - RJ'),
	(23,'Larissa Ferreira', 'larissa.ferreira@aluno.resilia.com', '(21) 98877-6655', '2001-02-20', '123.234.567-89', '21231-012', 'Rua dos Trabalhadores, 100, Rio de Janeiro - RJ');

-- Inserir dados na tabela turma
INSERT INTO turmas (id,nome,horario, data_inicio, data_fim) VALUES
	(1,'Turma de WebDev Full Stack JavaScript','08:00:00', '2023-01-10', '2023-06-20'),
	(2,'Turma de Data Analytics','12:00:00', '2023-02-15', '2023-08-01'),
	(3,'Turma de Análise de Sistemas','16:00:00', '2023-03-20', '2023-09-30'),
	(4,'Turma de WebDev Full Stack Java','20:00:00', '2023-04-25', '2023-11-10');
	
-- Inserir dados na tabela cursos
INSERT INTO cursos (id,nome, duracao, valor,turma_id) VALUES
	(1,'Formação WebDev Full Stack JavaScript', 240, 8000,1),
	(2,'Formação em Data Analytics', 480, 12000,2),
	(3,'Formação Análise de Sistemas', 480, 15000,3),
	(4,'Formação WebDev Full Stack Java', 240, 6000,4);

-- Inserir dados na tabela modulos
INSERT INTO modulos (id,nome, descricao) VALUES 
	-- Dados para a Formação WebDev Full Stack JavaScript.
	(1, 'Módulo 1: Fundamentos de JavaScript', 'Este módulo deve cobrir os fundamentos da linguagem JavaScript'),
	(2, 'Módulo 2: Desenvolvimento web front-end', 'Este módulo deve cobrir as tecnologias de desenvolvimento front-end, como HTML, CSS, JavaScript DOM e frameworks.'),
	(3, 'Módulo 3: Desenvolvimento web back-end', 'Este módulo deve abranger tecnologias de desenvolvimento back-end, como Node.js, Express, MongoDB e MySQL.'),
	(4, 'Módulo 4: Integração de sistemas e serviços', 'Este módulo deve cobrir o desenvolvimento de aplicativos que se integram com outros sistemas e serviços, como APIs, serviços em nuvem e serviços de pagamento e autenticação.'),
	(5, 'Módulo 5: Práticas e ferramentas de desenvolvimento', 'Este módulo deve cobrir as melhores práticas e ferramentas de desenvolvimento, incluindo controle de versão com Git, automação de tarefas com Gulp ou Webpack.'),
	
	-- Dados para a Formação em Data Analytics.
	(6, 'Módulo 1: Introdução à lógica de programação e preparação para processos seletivos', 'Ao final deste módulo, os participantes serão capazes de resolver problemas aplicando pensamento computacional e algorítmico.'),
	(7, 'Módulo 2: Estrutura de dados e inteligência emocional', 'Após este módulo, você será capaz de aplicar técnicas de programação para interagir com estruturas de dados, métodos e funções com Python, importar e acessar as bibliotecas.'),
	(8, 'Módulo 3: Banco de dados e relacionamento interpessoal', 'Depois desse módulo, o estudante será capaz de obter dados estruturados ou não estruturados, manipular, criar, ler, deletar e atualizar bancos de dados utilizando Python.'),
	(9, 'Módulo 4: Análise, visualização de dados e metodologias ágeis', 'Após este módulo, você será capaz de aplicar estatística descritiva para analisar dados utilizando ferramentas como Pandas e Google Colab.'),
	(10, 'Módulo 5: Visualização de dados com Power BI e Tableau, postura profissional e inovação', 'Depois deste módulo, você será capaz de definir objetivos antes da análise, limpar, tratar e transformar dados na prática.'),
	
	-- Dados para a Formação Análise de Sistemas.
	(11, 'Módulo 1: Fundamentos de programação', 'Este módulo é importante para quem está começando a estudar análise de sistemas, pois é fundamental ter uma base sólida em programação para entender como os sistemas são desenvolvidos.'),
	(12, 'Módulo 2: Análise de requisitos', 'Este módulo é essencial para entender como os sistemas são criados e como eles são projetados para atender às necessidades dos usuários.'),
	(13, 'Módulo 3: Design de sistemas', 'Este módulo abrange a criação da arquitetura do sistema, a definição dos componentes do sistema, a elaboração dos diagramas de fluxo de dados, o design da interface do usuário e a modelagem de dados.'),
	(14, 'Módulo 4: Desenvolvimento de software', 'Este módulo abrange a implementação do sistema, que envolve a codificação do software, a realização de testes e a depuração do sistema.'),
	(15, 'Módulo 5: Manutenção e suporte de sistemas', 'Este módulo abrange a manutenção e o suporte contínuo do sistema após o desenvolvimento.'),
	
	-- Dados para a Formação WebDev Full Stack Java.
	(16, 'Módulo 1: Fundamentos de programação', 'Este módulo é importante para quem está começando a estudar WebDev Full Stack Java, pois é fundamental ter uma base sólida em programação para entender como os sistemas são desenvolvidos.'),
	(17, 'Módulo 2: Desenvolvimento Front-end', 'Este módulo é focado no desenvolvimento da interface do usuário e inclui o uso de linguagens de marcação, como HTML e CSS, e linguagens de script, como JavaScript. '),
	(18, 'Módulo 3: Desenvolvimento Back-end', 'Este módulo é focado no desenvolvimento da lógica de negócios e inclui o uso da linguagem Java, bem como frameworks de back-end, como Spring e Hibernate.'),
	(19, 'Módulo 4: Desenvolvimento Full Stack', 'Este módulo abrange o desenvolvimento de sistemas completos, integrando o front-end e o back-end.'),
	(20, 'Módulo 5: Desenvolvimento de aplicações móveis', 'Este módulo abrange o desenvolvimento de aplicativos móveis para Android e iOS, utilizando tecnologias como Java e Kotlin para Android e Swift para iOS.')
	;
  	
-- Inserir dados na tabela de relacionamento cursos_modulos
INSERT INTO cursos_modulos (curso_id, modulo_id)
VALUES 
	(1, 1),
	(1, 2),
	(1, 3),
	(1, 4),
	(1, 5),
	(2, 6),
	(2, 7),
	(2, 8),
	(2, 9),
	(2, 10),
	(3, 11),
	(3, 12),
	(3, 13),
	(3, 14),
	(3, 15),
	(4, 16),
	(4, 17),
	(4, 18),
	(4, 19),
	(4, 20);

-- Inserir dados na tabela de relacionamento alunos_cursos_turmas
INSERT INTO alunos_cursos_turmas (aluno_id, curso_id, turma_id) VALUES
	(1, 1, 1),
	(1, 2, 2),
	(2, 2, 2),
	(3, 2, 2),
	(5, 2, 2),
	(6, 2, 2),
	(7, 2, 2),
	(8, 2, 2),
	(9, 2, 2),
	(10, 2, 2),
	(11, 2, 2),
	(12, 2, 2),
	(13, 3, 3),
	(14, 1, 1),
	(15, 2, 2),
	(16, 3, 3),
	(17, 1, 1),
	(18, 4, 4),
	(19, 3, 3),
	(20, 4, 4),
	(21, 4, 4),
	(22, 3, 3),
	(23, 1, 1);
	
-- Inserir dados na tabela departamentos
INSERT INTO departamentos (nome, descricao) VALUES
	('Recursos Humanos', 'Departamento relacionado a gestão de pessoas na empresa.'),
	('Marketing', 'Departamento relacionado a criação e promoção da marca e produtos da empresa.'),
	('Financeiro', 'Departamento relacionado a gestão financeira e contábil da empresa.'),
	('Tecnologia', 'Departamento relacionado a desenvolvimento e manutenção dos sistemas e tecnologias da empresa.'),
	('Pedagógico', 'Departamento relacionado a melhoria do ensino e aprendizagem, contribuindo com a formação geral e profissional dos envolvidos.');
	
-- Inserir dados dos facilitadores na tabela cargos
INSERT INTO cargos (id,nome, descricao, departamento_id)
VALUES
	(1,'Analista de Recursos Humanos', 'Responsável pelo recrutamento e seleção, treinamento e desenvolvimento de funcionários e gerenciamento de benefícios.',1),
	(2,'Analista de Marketing', 'Responsável pela pesquisa de mercado, desenvolvimento de estratégias de marketing, gestão de campanhas publicitárias e de mídia social.',2),
	(3,'Analista Financeiro', 'Responsável pelo gerenciamento financeiro, análise de dados financeiros, criação de relatórios financeiros e estratégias de investimento.',3),
	(4,'Analista de Tecnologia', 'Responsável por gerenciamento de sistemas de tecnologia, manutenção de redes, desenvolvimento de aplicativos e suporte técnico.',4),
	(5,'Facilitador', 'Lecionar os alunos com o material do curso, criar espaços para a construção coletiva de ideias, engajar as pessoas e promover debates construtivos, extraindo informações, conhecimento e potencial dos alunos.',5);

-- Inserir dados na tabela funcionarios
INSERT INTO funcionarios (id,nome, cpf, email, endereco, cep, salario, telefone, data_nascimento,cargo_id) VALUES
	(1,'Carlos Oliveira', '654.321.987-10', 'carlos.oliveira@facilitador.resilia.com', 'Rua 1 de Maio 100, Centro, Rio de Janeiro - RJ', '20020-200', 5000, '(21) 91234-5678', '1990-05-15',5),
	(2,'Ana Santos', '987.654.234-20', 'ana.santos@facilitador.resilia.com', 'Rua 5 de Maio 50, Centro, Rio de Janeiro - RJ', '20010-101', 4000, '(21) 98765-4321', '1995-01-20',5),
	(3,'Rodrigo Costa', '321.777.987-30', 'rodrigo.costa@facilitador.resilia.com', 'Rua 1 de Abril 40 , Centro, Rio de Janeiro - RJ', '20010-002', 4000, '(21) 99806-5002', '1988-11-10',5),
	(4,'Paulo Souza', '321.444.987-31', 'paulo.souza@facilitador.senac.com', 'Rua do Meio 35, Bairro Central, Rio de Janeiro - RJ', '20020-100', 3500, '(21) 99876-5432', '1993-03-01',5),
	(5,'Larissa Silva', '890.123.456-40', 'larissa.silva@facilitador.resilia.com', 'Rua 15 de Novembro 30, Centro, Rio de Janeiro - RJ', '20010-003', 3500, '(21) 97834-3478', '1992-07-07',5),
	(6,'Mariana Alexandre Alves', '123.776.709-09', 'mariana.alves@.resilia.com', 'Rua das Flores 100, Jardim Botânico, São Paulo - SP', '01234-567', 4500, '(21) 91234-5678', '1992-12-05',1),
	(7,'Lucas Santos Silva', '124.567.890-01', 'lucas.santos@.resilia.com', 'Avenida Paulista 1000, Bela Vista, São Paulo - SP', '01234-567', 5000, '(21) 98765-4321', '1985-08-10',2),
	(8,'Carla Gomes Oliveira', '215.678.901-02', 'carla.oliveira@.resilia.com', 'Rua das Margaridas 200, Jardim Europa, São Paulo - SP', '01234-567', 4000, '(21) 99806-5002', '1990-04-20,',3),
	(9,'Thiago da Silva', '516.789.012-03', 'thiago.silva@.resilia.com', 'Rua dos Pinheiros 300, Pinheiros, São Paulo - SP', '01234-567', 3500, '(21) 99876-5432', '1993-01-15',4);  

-- Inserir dados na tabela de relacionamento turmas_facilitadores
INSERT INTO facilitadores_facilitam (curso_id, modulo_id, turma_id,funcionario_id)VALUES 
	(1,1,1,1),
	(2,2,2,1),
	(3,3,3,2),
	(4,4,4,3),
	(4,1,4,4),
	(1,1,1,5);
	
--------------------------------------------------------------------------------------------------------

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
