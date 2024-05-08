-- Criação do Banco de Dados
CREATE DATABASE IF NOT EXISTS Escola;
USE Escola;

-- Criação da Tabela Aluno
CREATE TABLE IF NOT EXISTS Aluno (
    aluno_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    idade INT
);

-- Criação da Tabela Curso
CREATE TABLE IF NOT EXISTS Curso (
    curso_id INT PRIMARY KEY AUTO_INCREMENT,
    nome_curso VARCHAR(50) NOT NULL
);

-- Criação da Tabela Matricula
CREATE TABLE IF NOT EXISTS Matricula (
    matricula_id INT PRIMARY KEY AUTO_INCREMENT,
    aluno_id INT,
    curso_id INT,
    data_matricula DATE,
    FOREIGN KEY (aluno_id) REFERENCES Aluno(aluno_id),
    FOREIGN KEY (curso_id) REFERENCES Curso(curso_id)
);


-- Etapa 2

-- Inserindo Alunos
INSERT INTO Aluno (nome, idade) VALUES
    ('João', 20),
    ('Maria', 22),
    ('Pedro', 21);

-- Inserindo Cursos
INSERT INTO Curso (nome_curso) VALUES
    ('Matemática'),
    ('História'),
    ('Ciência da Computação');

-- Inserindo Matrículas
INSERT INTO Matricula (aluno_id, curso_id, data_matricula) VALUES
    (1, 1, '2023-01-01'),
    (2, 2, '2023-02-01'),
    (3, 3, '2023-03-01');


-- Etapa 3

-- Consulta para obter o nome do aluno, nome do curso e a data da matrícula
SELECT
    Aluno.nome AS NomeAluno,
    Curso.nome_curso AS NomeCurso,
    Matricula.data_matricula AS DataMatricula,
    ROW_NUMBER() OVER (PARTITION BY Curso.curso_id ORDER BY Matricula.data_matricula) AS NumeroMatricula
FROM
    Matricula
INNER JOIN Aluno ON Matricula.aluno_id = Aluno.aluno_id
INNER JOIN Curso ON Matricula.curso_id = Curso.curso_id;

-- Etapa 4

-- Criação da Tabela Disciplina
CREATE TABLE IF NOT EXISTS Disciplina (
    disciplina_id INT PRIMARY KEY AUTO_INCREMENT,
    nome_disciplina VARCHAR(50) NOT NULL
);

-- Criação da Tabela Nota
CREATE TABLE IF NOT EXISTS Nota (
    nota_id INT PRIMARY KEY AUTO_INCREMENT,
    aluno_id INT,
    disciplina_id INT,
    valor FLOAT,
    FOREIGN KEY (aluno_id) REFERENCES Aluno(aluno_id),
    FOREIGN KEY (disciplina_id) REFERENCES Disciplina(disciplina_id)
);

-- Inserindo Disciplinas
INSERT INTO Disciplina (nome_disciplina) VALUES
    ('Matemática'),
    ('História'),
    ('Programação');

-- Inserindo Notas
INSERT INTO Nota (aluno_id, disciplina_id, valor) VALUES
    (1, 1, 8.5),
    (1, 2, 7.0),
    (1, 3, 9.2),
    (2, 1, 9.0),
    (2, 2, 8.0),
    (2, 3, 8.5),
    (3, 1, 7.5),
    (3, 2, 6.8),
    (3, 3, 9.8);

-- Consulta mais elaborada
SELECT
    Aluno.nome AS NomeAluno,
    Curso.nome_curso AS NomeCurso,
    Disciplina.nome_disciplina AS NomeDisciplina,
    AVG(Nota.valor) AS MediaNota
FROM
    Matricula
INNER JOIN Aluno ON Matricula.aluno_id = Aluno.aluno_id
INNER JOIN Curso ON Matricula.curso_id = Curso.curso_id
INNER JOIN Nota ON Aluno.aluno_id = Nota.aluno_id
INNER JOIN Disciplina ON Nota.disciplina_id = Disciplina.disciplina_id
GROUP BY
    Aluno.nome,
    Curso.nome_curso,
    Disciplina.nome_disciplina;

-- Etapa 5

-- Criação da Tabela ExameFinal
CREATE TABLE IF NOT EXISTS ExameFinal (
    exame_id INT PRIMARY KEY AUTO_INCREMENT,
    aluno_id INT,
    disciplina_id INT,
    nota_final FLOAT,
    FOREIGN KEY (aluno_id) REFERENCES Aluno(aluno_id),
    FOREIGN KEY (disciplina_id) REFERENCES Disciplina(disciplina_id)
);

-- Inserindo Notas dos Exames Finais
INSERT INTO ExameFinal (aluno_id, disciplina_id, nota_final) VALUES
    (1, 1, 8.0),
    (1, 2, 6.5),
    (1, 3, 7.8),
    (2, 1, 9.5),
    (2, 2, 8.2),
    (2, 3, 7.0),
    (3, 1, 6.0),
    (3, 2, 8.8),
    (3, 3, 9.2);

-- Etapa 6

-- Consulta para Calcular Estatísticas sobre Notas
SELECT
    Aluno.nome AS NomeAluno,
    AVG(Nota.valor) AS MediaNotas,
    MAX(Nota.valor) AS MaiorNota,
    MIN(Nota.valor) AS MenorNota,
    AVG(ExameFinal.nota_final) AS MediaExamesFinais,
    MAX(ExameFinal.nota_final) AS MaiorNotaFinal,
    MIN(ExameFinal.nota_final) AS MenorNotaFinal
FROM
    Aluno
LEFT JOIN Nota ON Aluno.aluno_id = Nota.aluno_id
LEFT JOIN ExameFinal ON Aluno.aluno_id = ExameFinal.aluno_id
GROUP BY
    Aluno.aluno_id, Aluno.nome;
