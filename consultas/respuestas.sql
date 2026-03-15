-- ==========================================================
-- LAB 2 - SQL Murder Mystery
-- Archivo organizado con los pasos de la consulta
-- ==========================================================

-- ==========================================================
-- Paso 1. Revisar el reporte del crimen
-- ==========================================================

-- Consulta principal: ubicar el asesinato ocurrido en SQL City en la fecha dada.
SELECT *
FROM crime_scene_report
WHERE date = 20180115
  AND city = 'SQL City'
  AND type = 'murder';

-- Consulta de apoyo: solo para apoyar la descripción del reporte.
SELECT *
FROM crime_scene_report
WHERE city = 'SQL City'
  AND date = 20180115;