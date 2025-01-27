--Promedio de usuarios de Internet por año

SELECT anio, 
       AVG(usuarios_internet_pct) AS promedio_usuarios
FROM datos_internet
GROUP BY anio
ORDER BY anio;

--Top 5 países con mayor porcentaje de población urbana en 2020

SELECT pais, 
       poblacion_urbana_pct
FROM datos_internet
WHERE anio = 2020
ORDER BY poblacion_urbana_pct DESC
LIMIT 5;

--Relación entre PIB per cápita y usuarios de Internet

SELECT anio, 
       pais, 
       pib_per_capita_usd, 
       usuarios_internet_pct
FROM datos_internet
WHERE usuarios_internet_pct IS NOT NULL AND pib_per_capita_usd IS NOT NULL
ORDER BY anio;

--Crecimiento de usuarios de Internet por país

SELECT pais, 
       MIN(anio) AS anio_inicio, 
       MAX(anio) AS anio_fin, 
       MIN(usuarios_internet_pct) AS inicio_pct, 
       MAX(usuarios_internet_pct) AS fin_pct,
       (MAX(usuarios_internet_pct) - MIN(usuarios_internet_pct)) AS crecimiento_pct
FROM datos_internet
GROUP BY pais
ORDER BY crecimiento_pct DESC;

--Comparación de alfabetización masculina y femenina

SELECT pais, 
       anio, 
       tasa_alfabetizacion_hombres, 
       tasa_alfabetizacion_mujeres
FROM datos_internet
WHERE tasa_alfabetizacion_hombres IS NOT NULL AND tasa_alfabetizacion_mujeres IS NOT NULL
ORDER BY anio, pais;

--Exportaciones TIC como porcentaje del total

SELECT pais, 
       anio, 
       exportaciones_tic_pct
FROM datos_internet
WHERE exportaciones_tic_pct IS NOT NULL
ORDER BY exportaciones_tic_pct DESC
LIMIT 10;

--Identificar países con menor acceso a Internet

SELECT pais, 
       usuarios_internet_pct
FROM indicadores
WHERE anio = 2020
ORDER BY usuarios_internet_pct ASC
LIMIT 5;

--Análisis del gasto en educación

SELECT pais, 
       anio,
       gasto_educacion_pib_pct, 
       Cast(gasto_educacion_pib_pct as DECIMAL(18,2)) as gasto_educacion_pib_pct, 
       usuarios_internet_pct
FROM indicadores
WHERE gasto_educacion_pib_pct IS NOT NULL AND usuarios_internet_pct IS NOT NULL
ORDER BY gasto_educacion_pib_pct DESC;


--Crecimiento urbano y usuarios de Internet

SELECT pais, 
       anio, 
       poblacion_urbana_pct, 
       usuarios_internet_pct
FROM indicadores
WHERE poblacion_urbana_pct IS NOT NULL AND usuarios_internet_pct IS NOT NULL
ORDER BY pais, anio;

--Desigualdad y acceso a Internet

SELECT pais, 
       anio, 
       indice_gini, 
       usuarios_internet_pct
FROM indicadores
WHERE indice_gini IS NOT NULL AND usuarios_internet_pct IS NOT NULL
ORDER BY indice_gini DESC;
