DROP SCHEMA IF EXISTS zomato CASCADE;
CREATE SCHEMA zomato;

-- zomato.restaurant definition

-- Drop table

-- DROP TABLE zomato.restaurant;

CREATE TABLE zomato.restaurant (
	restaurant_id int8 UNIQUE NOT NULL,
	restaurant_name varchar(255) NOT NULL,
	phone_number varchar(255) NOT NULL,
	popularity varchar(255) NOT NULL,
	rating varchar(255) NOT NULL,
	opentime time NOT NULL,
	closetime time NOT NULL,
	CONSTRAINT restaurant_pkey PRIMARY KEY (restaurant_id)
);

-- zomato."user" definition

-- Drop table

-- DROP TABLE zomato."user";

CREATE TABLE zomato."user" (
	user_id int8 NOT NULL,
	user_name varchar (255) not null,
	password varchar(50) NOT NULL,
	gender varchar(10) NOT NULL,
	token varchar(255) NULL,
	expired bool NULL,
	CONSTRAINT user_pkey PRIMARY KEY (user_id)
);

-- zomato."restaurant_menu_item" definition

-- Drop table

-- DROP TABLE zomato."restaurant_menu_item";


CREATE TABLE zomato.restaurant_menu_item (
	restaurant_menu_item_id int8 NOT NULL,
	restaurant_id int8 NOT NULL,
	cuisine varchar(255) NOT NULL,
	price int8 NOT NULL,
	quantity int8 NOT NULL,
	is_recommended bool NULL,
	CONSTRAINT restaurant_menu_item_pkey PRIMARY KEY (restaurant_menu_item_id),
	CONSTRAINT restaurant_menu_item_restaurant_id_fkey FOREIGN KEY (restaurant_id) REFERENCES zomato.restaurant(restaurant_id)
);


-- zomato."cart" definition

-- Drop table

-- DROP TABLE zomato."cart";

CREATE TABLE zomato.cart (
	cart_id int8 NOT NULL,
	cart_items int8 NOT NULL,
	user_id int8  NOT null,
	restaurant_menu_item_id int8 NOT NULL,
	CONSTRAINT cart_pkey PRIMARY KEY (cart_id),
	CONSTRAINT cart_restaurant_menu_item_id_fkey FOREIGN KEY (restaurant_menu_item_id) REFERENCES zomato.restaurant_menu_item(restaurant_menu_item_id),
	CONSTRAINT cart_user_id_fkey FOREIGN KEY (user_id) REFERENCES zomato.user(user_id)
);

-- zomato.restaurant_media definition

-- Drop table

-- DROP TABLE zomato.restaurant_media;

CREATE TABLE zomato.restaurant_media (
	restaurant_media_id int8 NOT NULL,
	restaurant_id int8 NOT NULL,
	media_category_type varchar(255) NOT NULL,
	url_to_media varchar(255) NULL,
	CONSTRAINT restaurant_media_pkey PRIMARY KEY (restaurant_media_id),
	CONSTRAINT restaurant_media_restaurant_id_fkey FOREIGN KEY (restaurant_id) REFERENCES zomato.restaurant(restaurant_id)
);

-- zomato.review definition

-- Drop table

-- DROP TABLE zomato.review;

CREATE TABLE zomato.review (
	review_id int8 NOT NULL,
	customer_id int8 NOT NULL,
	restaurant_id int8 NOT NULL,
	"text" varchar(255) NOT NULL,
	"timestamp" time UNIQUE NOT NULL,
	stars int8 NOT NULL,
	is_healpful bool NOT NULL,
	CONSTRAINT review_pkey PRIMARY KEY (review_id),
	CONSTRAINT review_timestamp_key UNIQUE ("timestamp"),
	CONSTRAINT review_user_id_fkey FOREIGN KEY (customer_id) REFERENCES zomato."user"(user_id),
	CONSTRAINT review_restaurant_id_fkey FOREIGN KEY (restaurant_id) REFERENCES zomato.restaurant(restaurant_id)

);

-- zomato.restaurant_address definition

-- Drop table

-- DROP TABLE zomato.restaurant_address;

CREATE TABLE zomato.restaurant_address (
	restaurant_address_id int8 NOT NULL,
	restaurant_id int8 NOT null,
	area varchar (255) NOT NULL,
	addressline1 varchar(255) NOT NULL,
	addressline2 varchar(255) NULL,
	addressline3 varchar(255) NULL,
	city varchar(255) NOT NULL,
	state varchar(255) NOT NULL,
	pincode varchar(255) NOT NULL,
	landmark varchar(255) NULL,
	CONSTRAINT restaurant_address_pkey PRIMARY KEY (restaurant_address_id),
	CONSTRAINT restaurant_address_restaurant_id_fkey FOREIGN KEY (restaurant_id) REFERENCES zomato.restaurant(restaurant_id)
);

-- zomato.discount definition

-- Drop table

-- DROP TABLE zomato.discount;

CREATE TABLE zomato.discount (
	discount_id int8 NOT NULL,
	percentage varchar(255) NOT NULL,
	discount_provider_name varchar(255) NOT NULL,
	dicount_provider_contact int8 NOT NULL,	
	CONSTRAINT discount_pkey PRIMARY KEY (discount_id)
);

-- zomato."order" definition

-- Drop table

-- DROP TABLE zomato."order";

CREATE TABLE zomato."order" (
	order_id int8 NOT NULL,
	user_id int8 NOT NULL,	
	restaurant_address_id int8 NOT NULL,
	discount_id int8 NOT NULL,
	total int8 NOT NULL,
	"timestamp" time UNIQUE NOT NULL,
	order_status varchar(255) NOT NULL,
	is_added_to_cart bool NOT NULL,
	CONSTRAINT order_timestamp_key UNIQUE ("timestamp"),
	CONSTRAINT order_pkey PRIMARY KEY (order_id),
	CONSTRAINT order_user_id_fkey FOREIGN KEY (user_id) REFERENCES zomato."user"(user_id),
	CONSTRAINT order_restaurant_address_id_fkey FOREIGN KEY (restaurant_address_id) REFERENCES zomato.restaurant_address(restaurant_address_id),
	CONSTRAINT order_discount_id_fkey FOREIGN KEY (discount_id) REFERENCES zomato.discount(discount_id)
);