SELECT DISTINCT producto AS Producto FROM ventas_techventas;

SELECT * FROM ventas_techventas WHERE fecha BETWEEN '2024-01-01' AND '2024-03-31' AND Cantidad > 5;

SELECT vendedor,  SUM(Cantidad * precio_unitario) AS Ingreso_Bruto FROM ventas_techventas
GROUP BY vendedor HAVING SUM(Cantidad * precio_unitario) ORDER BY vendedor;

