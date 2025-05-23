CREATE OR ALTER PROCEDURE sp_AdicionarMateria(
    @SIGLA CHAR(3),
    @NOME VARCHAR(50),
    @CARGAHORARIA INT,
    @CURSO CHAR(3),
    @PROFESSOR INT
)
AS
BEGIN
    INSERT MATERIAS (
        SIGLA,
        NOME,
        CARGAHORARIA,
        CURSO,
        PROFESSOR
    ) VALUES (
        @SIGLA,
        @NOME,
        @CARGAHORARIA,
        @CURSO,
        @PROFESSOR
    )
    SELECT * FROM MATERIAS WHERE SIGLA = @SIGLA AND CURSO = @CURSO
END

EXEC sp_AdicionarMateria @SIGLA = 'VIE',
                         @NOME = 'VIVÊNCIAS DE EXTENSÃO',
                         @CARGAHORARIA = 144,
                         @CURSO = 'ENG',
                         @PROFESSOR = 8


