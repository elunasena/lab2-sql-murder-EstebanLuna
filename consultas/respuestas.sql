-- ==========================================================
-- LAB 2 - SQL Murder Mystery
-- Archivo organizado con los pasos de la consulta
-- ==========================================================

-- ==========================================================
-- 1. Revisar el reporte del crimen
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
-- 2. Identificar a los testigos
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

-- ==========================================================
-- 3. Leer las entrevistas
-- ==========================================================

-- Consulté ambas entrevistas juntas.
-- Entrevista de Morty Schapiro.
-- Entrevista de Annabel Miller.

SELECT *
FROM interview
WHERE person_id IN (16371, 14887);

-- ==========================================================
-- 4. Filtrar sospechosos con las pistas del gimnasio
-- ==========================================================

-- Primero revisé los miembros gold cuya membresía empieza por 48Z.
SELECT *
FROM get_fit_now_member
WHERE id LIKE '48Z%'
  AND membership_status = 'gold';

-- Luego revisé quiénes hicieron check-in el 9 de enero de 2018.
SELECT *
FROM get_fit_now_check_in
WHERE check_in_date = 20180109
  AND membership_id LIKE '48Z%';


-- ==========================================================
-- 5. Confirmar al asesino
-- ==========================================================

-- Comparé los sospechosos con las licencias de conducción.
SELECT p.id,
       p.name,
       dl.plate_number,
       dl.car_make,
       dl.car_model
FROM person AS p
JOIN drivers_license AS dl
  ON p.license_id = dl.id
JOIN get_fit_now_member AS gfnm
  ON p.id = gfnm.person_id
WHERE gfnm.id LIKE '48Z%'
  AND dl.plate_number LIKE '%H42W%';

-- Consulta de apoyo: revisar placas de Joe y Jeremy.
SELECT p.id,
       p.name,
       dl.plate_number
FROM person AS p
JOIN drivers_license AS dl
  ON p.license_id = dl.id
WHERE p.name IN ('Joe Germuska', 'Jeremy Bowers');

-- Verificación del asesino material en la plataforma.
INSERT INTO solution VALUES (1, 'Jeremy Bowers');
SELECT value FROM solution;


