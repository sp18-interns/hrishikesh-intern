
-- seed data for role
INSERT INTO zomato.role
(role_id, role_name)
VALUES
(1, 'Customer'),
(2, 'Restaurant owner');

-- seed data for cuisines
INSERT INTO zomato.cuisines
(cuisines_id, name)
VALUES
(1, 'Continental'),
(2, 'French'),
(3, 'Chinese'),
(4, 'Indian'),
(5, 'Italian'),
(6, 'Spanish'),
(7, 'Thai');

-- seed data for discount_provider
INSERT INTO zomato.discount_provider
(discount_provider_id, name)
VALUES(1, 'Ketan');

-- seed data for media_category
INSERT INTO zomato.media_category
(media_category_id, name)
VALUES(1, 'Food'),
(2, 'ambience');

-- seed data for area
--INSERT INTO zomato.area
--(area_id, name, latitude, longitude, radius)
--VALUES
--(1, 'Kopar Khairane', '19.102769', '73.009001', 5.5),
--(2, 'Vashi', '19.0745', '72.9978', 5.6),
--(3, 'Rabale', '19.1463', '73.0081', 5.7),
--(4, 'Airoli', '19.1590', '72.9986', 5.8);

--


