INSERT ALUNOS (NOME) VALUES ('CAIO DE SOUZA')
GO

CREATE OR ALTER PROCEDURE sp_AdicionarAluno(
    @NOME_ALUNO VARCHAR(50)
)
AS
BEGIN
    INSERT ALUNOS (NOME) VALUES (@NOME_ALUNO)
    SELECT * FROM ALUNOS WHERE NOME = @NOME_ALUNO
END
GO

EXEC sp_AdicionarAluno 'CARLOS LANSER'
EXEC sp_AdicionarAluno 'FERNANDA'
EXEC sp_AdicionarAluno 'SAMUEL'
EXEC sp_AdicionarAluno 'CARLOS DERETTI'
EXEC sp_AdicionarAluno 'MATHIAS'
EXEC sp_AdicionarAluno 'VITOR'