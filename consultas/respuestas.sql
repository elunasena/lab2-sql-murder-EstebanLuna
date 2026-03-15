-- ==========================================================
-- LAB 2 - SQL Murder Mystery
-- Archivo organizado con los pasos de la consulta
-- ==========================================================

-- ==========================================================
-- Revisar el reporte del crimen
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

-- ==========================================================
-- Identificar a los testigos
-- ==========================================================

-- Testigo 1: Annabel en Franklin Ave.
SELECT id, name, address_number, address_street_name
FROM person
WHERE name LIKE '%Annabel%'
  AND address_street_name = 'Franklin Ave';

-- Testigo 2: persona de la última casa en Northwestern Dr.
SELECT id, name, address_number, address_street_name
FROM person
WHERE address_street_name = 'Northwestern Dr'
ORDER BY address_number DESC
LIMIT 1;








