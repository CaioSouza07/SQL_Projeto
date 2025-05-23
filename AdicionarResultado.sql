CREATE OR ALTER PROCEDURE sp_ResultadoFinal(
    @MATRICULA INT,
    @MATERIA CHAR(3),
    @PERLETIVO INT,
    @EXAME BIT
)
AS
BEGIN
    IF @EXAME = 0
    BEGIN
        UPDATE MATRICULA
        SET 
        RESULTADO =
            CASE 
                WHEN PERCFREQ < 75
                OR MEDIA < 3 THEN 'REPROVADO'

                WHEN PERCFREQ >= 75 AND
                MEDIA < 7 AND MEDIA >= 3 THEN 'EXAME'

                WHEN PERCFREQ >= 75 AND 
                MEDIA >= 7 THEN 'APROVADO'
            END,
        MEDIAFINAL = MEDIA
        WHERE MATRICULA = @MATRICULA AND MATERIA = @MATERIA
    END
    ELSE
    IF @EXAME = 1
    BEGIN
        UPDATE MATRICULA
        SET 
        RESULTADO = 
            CASE
                WHEN (MEDIA + NOTAEXAME) / 2 >= 5
                THEN 'APROVADO'

                WHEN (MEDIA + NOTAEXAME) / 2 < 5
                THEN 'REPROVADO'
            END,
        MEDIAFINAL = (MEDIA + NOTAEXAME) / 2
        WHERE MATRICULA = @MATRICULA AND MATERIA = @MATERIA
            
    END
END