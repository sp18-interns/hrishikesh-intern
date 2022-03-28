
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