-- all bands with Glam rock as main style
SELECT band_name, (IFNULL(split, 2022) - formed) AS 'lifespan' from metal_bands ORDER BY lifespan DESC;
