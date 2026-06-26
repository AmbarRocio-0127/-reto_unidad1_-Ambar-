-- nombre: consulta_1
SELECT DISTINCT producto AS Producto FROM ventas_techventas;

-- nombre: consulta_2
SELECT * FROM ventas_techventas WHERE fecha BETWEEN '2024-01-01' AND '2024-03-31' AND Cantidad > 5;

-- nombre: consulta_3
SELECT vendedor,  SUM(Cantidad * precio_unitario) AS Ingreso_Bruto FROM ventas_techventas
GROUP BY vendedor HAVING SUM(Cantidad * precio_unitario) > 10000 ORDER BY vendedor;

-- nombre: consulta_4
SELECT COUNT(Categoria) AS Count_Categoria, SUM(cantidad) AS Suma_cantidades, AVG(precio_unitario) AS Promedio_Precio 
FROM ventas_techventas;

-- nombre: consulta_5
CREATE TABLE vendedores (id_vendedor INTEGER PRIMARY KEY AUTOINCREMENT, order_id INTEGER NOT NULL, meta_mensual REAL NOT NULL,
FOREIGN KEY (order_id) REFERENCES ventas_techventas(order_id))

-- nombre: consulta_6
SELECT vent.vendedor, vent.region, v.meta_mensual FROM ventas_techventas vent JOIN vendedores v
ON v.order_id = vent.order_id GROUP BY vent.vendedor, vent.region;
-- nota: El valor explicito de la meta mensual en si no fue proporcionado. 

-- nombre: consulta_7
SELECT cliente_nombre, SUM(cantidad*precio_unitario) AS ingresos_totales FROM ventas_techventas
WHERE fecha BETWEEN '2024-01-01' AND '2024-06-30' GROUP BY cliente_nombre HAVING SUM(cantidad*precio_unitario)
= (SELECT MAX(ingreso_mayor) FROM (SELECT SUM(cantidad*precio_unitario) AS ingreso_mayor FROM ventas_techventas
WHERE fecha BETWEEN '2024-01-01' AND '2024-06-30' GROUP BY cliente_nombre));