USE test123;
GO

CREATE TRIGGER Trigger_DataUpdate
ON dbo.[greenhouse-gas-emissions-by-region-industry-and-household-year-ended-2024]
AFTER UPDATE
AS
BEGIN
    INSERT INTO LogTablosu (BolgeAdi, Yil, EskiVeri, YeniVeri, GuncellenmeTarihi)
    SELECT 
        i.Region, 
        i.Year,
        d.Data_value,
        i.Data_value,
        GETDATE()
    FROM inserted i
    INNER JOIN deleted d ON i.Region = d.Region AND i.Year = d.Year AND i.Gas = d.Gas;
END;
GO