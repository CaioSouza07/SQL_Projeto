
CREATE OR ALTER PROCEDURE sp_IncluirNotaFalta(
    @MATRICULA INT,
    @CURSO CHAR(3),
    @PERLETIVO INT,
    @NOTA FLOAT,
    @FALTA INT,
    @MATERIA CHAR(3),
    @BIMESTRE INT
)
AS
BEGIN
    IF @BIMESTRE = 1
    BEGIN
        UPDATE MATRICULA
        SET
            N1 = @NOTA,
            F1 = @FALTA
        WHERE MATRICULA = @MATRICULA
            AND MATERIA = @MATERIA
            AND CURSO = @CURSO
            AND PERLETIVO = @PERLETIVO 
    END
    ELSE
    IF @BIMESTRE = 2
    BEGIN 
        UPDATE MATRICULA
        SET
            N2 = @NOTA,
            F2 = @FALTA
        WHERE MATRICULA = @MATRICULA
            AND MATERIA = @MATERIA
            AND CURSO = @CURSO
            AND PERLETIVO = @PERLETIVO 
    END
    ELSE
    IF @BIMESTRE = 3
    BEGIN
        UPDATE MATRICULA
        SET
            N3 = @NOTA,
            F3 = @FALTA
        WHERE MATRICULA = @MATRICULA
            AND MATERIA = @MATERIA
            AND CURSO = @CURSO
            AND PERLETIVO = @PERLETIVO 
    END
    ELSE
    IF @BIMESTRE = 4
    BEGIN
        UPDATE MATRICULA
        SET
            N4 = @NOTA,
            F4 = @FALTA
        WHERE MATRICULA = @MATRICULA
            AND MATERIA = @MATERIA
            AND CURSO = @CURSO
            AND PERLETIVO = @PERLETIVO
    END
    ELSE
    IF @BIMESTRE = 5
    BEGIN
        UPDATE MATRICULA
        SET 
            NOTAEXAME = @NOTA
        WHERE MATRICULA = @MATRICULA AND MATERIA = @MATERIA AND PERLETIVO = @PERLETIVO
    

    EXEC sp_ResultadoFinal @MATRICULA = @MATRICULA,
    @MATERIA = @MATERIA,
    @PERLETIVO = @PERLETIVO,
    @EXAME = 1
    END
END

EXEC sp_IncluirNotaFalta @MATRICULA = 1,
                         @CURSO = 'ENG',
                         @PERLETIVO = 2025,
                         @NOTA = 10,
                         @FALTA = 10,
                         @MATERIA = 'PRG',
                         @BIMESTRE = 4
