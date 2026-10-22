USE test123;
GO

CREATE PROCEDURE dbo.SP_BringLocationData
    @BolgeAdi NVARCHAR(100)
AS
BEGIN
    SELECT * 
    FROM dbo.[greenhouse-gas-emissions-by-region-industry-and-household-year-ended-2024]
    WHERE Region = @BolgeAdi;
END;
GO