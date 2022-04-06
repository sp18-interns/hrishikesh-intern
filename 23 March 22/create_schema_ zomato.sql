DROP SCHEMA zomato CASCADE;
CREATE SCHEMA zomato;

-- zomato.cuisines definition

-- Drop table

-- DROP TABLE zomato.cuisines;

CREATE TABLE zomato.cuisines (
	cuisines_id int8 NOT NULL,
	"name" varchar(255) NULL,
	CONSTRAINT cuisines_pkey PRIMARY KEY (cuisines_id)
);

-- zomato.discount_provider definition

-- Drop table

-- DROP TABLE zomato.discount_provider;

CREATE TABLE zomato.discount_provider (
	discount_provider_id int8 NOT NULL,
	"name" varchar(255) NOT NULL,
	CONSTRAINT discount_provider_pkey PRIMARY KEY (discount_provider_id)
);

-- zomato."location" definition

-- Drop table

-- DROP TABLE zomato."location";

CREATE TABLE zomato."location" (
	location_id int8 NOT NULL,
	"name" varchar(255) NOT NULL,
	latitude varchar(255) NOT NULL,
	longitude varchar(255) NOT NULL,
	area varchar(255) NOT NULL,
	radius varchar(255) NOT NULL,
	CONSTRAINT location_pkey PRIMARY KEY (location_id)
);

-- zomato.media_category definition

-- Drop table

-- DROP TABLE zomato.media_category;

CREATE TABLE zomato.media_category (
	media_category_id int8 NOT NULL,
	"name" varchar(255) NOT NULL,
	CONSTRAINT media_category_pkey PRIMARY KEY (media_category_id)
);

-- zomato.restaurant definition

-- Drop table

-- DROP TABLE zomato.restaurant;

CREATE TABLE zomato.restaurant (
	restaurant_id int8 NOT NULL,
	restaurant_name varchar(255) NOT NULL,
	phone_number varchar(255) NOT NULL,
	popularity varchar(255) NULL,
	rating varchar(255) NULL,
	opentime time NULL,
	closetime time NULL,
	CONSTRAINT restaurant_pkey PRIMARY KEY (restaurant_id)
);

-- zomato."role" definition

-- Drop table

-- DROP TABLE zomato."role";

CREATE TABLE zomato."role" (
	role_id int8 NOT NULL,
	role_name varchar(255) NOT NULL,
	CONSTRAINT role_pkey PRIMARY KEY (role_id)
);

-- zomato.cuisine_items definition

-- Drop table

-- DROP TABLE zomato.cuisine_items;

CREATE TABLE zomato.cuisine_items (
	cusine_items_id int8 NOT NULL,
	cuisines_id int8 NULL,
	"name" varchar(255) NOT NULL,
	is_veg bool NULL,
	CONSTRAINT cuisine_items_pkey PRIMARY KEY (cusine_items_id),
	CONSTRAINT cuisine_items_cuisines_id_fkey FOREIGN KEY (cuisines_id) REFERENCES zomato.cuisines(cuisines_id)
);

-- zomato.discount definition

-- Drop table

-- DROP TABLE zomato.discount;

CREATE TABLE zomato.discount (
	discount_id int8 NOT NULL,
	discount_provider_id int8 NULL,
	title varchar(255) NOT NULL,
	percentage varchar(255) NOT NULL,
	CONSTRAINT discount_pkey PRIMARY KEY (discount_id),
	CONSTRAINT discount_discount_provider_id_fkey FOREIGN KEY (discount_provider_id) REFERENCES zomato.discount_provider(discount_provider_id)
);

-- zomato.restaurant_address definition

-- Drop table

-- DROP TABLE zomato.restaurant_address;

CREATE TABLE zomato.restaurant_address (
	restaurant_address_id int8 NOT NULL,
	restaurant_id int8 NULL,
	location_id int8 NOT NULL,
	"name" varchar(255) NOT NULL,
	addressline1 varchar(255) NOT NULL,
	addressline2 varchar(255) NULL,
	addressline3 varchar(255) NULL,
	city varchar(255) NOT NULL,
	state varchar(255) NOT NULL,
	pincode varchar(255) NOT NULL,
	landmark varchar(255) NULL,
	CONSTRAINT restaurant_address_pkey PRIMARY KEY (restaurant_address_id),
	CONSTRAINT restaurant_address_restaurant_id_fkey FOREIGN KEY (restaurant_id) REFERENCES zomato.restaurant(restaurant_id),
	CONSTRAINT restaurant_address_location_id_fkey FOREIGN KEY (location_id) REFERENCES zomato.location(location_id)
);

-- zomato.restaurant_media definition

-- Drop table

-- DROP TABLE zomato.restaurant_media;

CREATE TABLE zomato.restaurant_media (
	restaurant_media_id int8 NOT NULL,
	restaurant_id int8 NULL,
	media_category_id int8 NOT NULL,
	url_to_media varchar(255) NULL,
	CONSTRAINT restaurant_media_pkey PRIMARY KEY (restaurant_media_id),
	CONSTRAINT restaurant_media_restaurant_id_fkey FOREIGN KEY (restaurant_id) REFERENCES zomato.restaurant(restaurant_id),
	CONSTRAINT restaurant_media_media_category_id_fkey FOREIGN KEY (media_category_id) REFERENCES zomato.media_category(media_category_id)	
);

-- zomato.restaurant_menu_item definition

-- Drop table

-- DROP TABLE zomato.restaurant_menu_item;

CREATE TABLE zomato.restaurant_menu_item (
	menu_item_id int8 NOT NULL,
	restaurant_id int8 NULL,
	cusine_items_id int8 NULL,
	cusineitemid int8 NULL,
	price int8 NOT NULL,
	quantity varchar(20) NULL,
	is_recommended bool NULL,
	is_added_to_cart bool NULL,
	CONSTRAINT restaurant_menu_item_pkey PRIMARY KEY (menu_item_id),
	CONSTRAINT restaurant_menu_item_cusine_items_id_fkey FOREIGN KEY (cusine_items_id) REFERENCES zomato.cuisine_items(cusine_items_id),
	CONSTRAINT restaurant_menu_item_restaurant_id_fkey FOREIGN KEY (restaurant_id) REFERENCES zomato.restaurant(restaurant_id)
);

-- zomato."user" definition

-- Drop table

-- DROP TABLE zomato."user";

CREATE TABLE zomato."user" (
	user_id int8 NOT NULL,
	role_id int8 NULL,
	user_password varchar(50) NOT NULL,
	user_gender varchar(10) NOT NULL,
	user_token varchar(255) NULL,
	expired bool NULL,
	CONSTRAINT user_pkey PRIMARY KEY (user_id),
	CONSTRAINT user_role_id_fkey FOREIGN KEY (role_id) REFERENCES zomato."role"(role_id)
);

-- zomato."order" definition

-- Drop table

-- DROP TABLE zomato."order";

CREATE TABLE zomato."order" (
	order_id int8 NOT NULL,
	restaurant_address_id int8 NOT NULL,
	customer_id int8 NULL,
	total int8 NOT NULL,
	discount_id int8 NOT NULL,
	"timestamp" time NOT NULL,
	CONSTRAINT order_pkey PRIMARY KEY (order_id),
	CONSTRAINT order_timestamp_key UNIQUE ("timestamp"),
	CONSTRAINT order_restaurant_address_id_fkey FOREIGN KEY (restaurant_address_id) REFERENCES zomato.restaurant_address(restaurant_address_id),
	CONSTRAINT user_id_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES zomato."user"(user_id),
	CONSTRAINT order_discount_id_fkey FOREIGN KEY (discount_id) REFERENCES zomato.discount(discount_id)
);

-- zomato.review definition

-- Drop table

-- DROP TABLE zomato.review;

CREATE TABLE zomato.review (
	review_id int8 NOT NULL,
	customer_id int8 NULL,
	restaurant_id int8 NULL,
	"text" varchar(255) NOT NULL,
	"timestamp" varchar(50) NOT NULL,
	stars int8 NULL,
	is_healpful bool NULL,
	CONSTRAINT review_pkey PRIMARY KEY (review_id),
	CONSTRAINT review_timestamp_key UNIQUE ("timestamp"),
	CONSTRAINT user_id_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES zomato."user"(user_id),
	CONSTRAINT review_restaurant_id_fkey FOREIGN KEY (restaurant_id) REFERENCES zomato.restaurant(restaurant_id)

);