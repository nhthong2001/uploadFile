CREATE TABLE public.Account (
	id serial NOT NULL,
	fulname VARCHAR(255),
	link_avatar VARCHAR(255),
	dob DATE,
	gender BOOLEAN NOT NULL DEFAULT false,
	link_facebook VARCHAR(255),
	list_friend_id VARCHAR(255),
	date_up_vip TIMESTAMP,
	date_expiration TIMESTAMP,
	address VARCHAR(255),
	email VARCHAR(255),
	company_name VARCHAR(255),
	description VARCHAR(255),
	phone_number VARCHAR(255),
	website VARCHAR(255),
	unique_id VARCHAR(255) NOT NULL,
	username VARCHAR(255),
	password VARCHAR(255),
	account_type VARCHAR(255),
	is_deleted BOOLEAN NOT NULL DEFAULT false,
	CONSTRAINT Account_pk PRIMARY KEY (id)
); 



CREATE TABLE public.Friend (
	unique_id VARCHAR(255) NOT NULL,
	id serial NOT NULL,
	friend_id integer,
	status VARCHAR(255),
	CONSTRAINT Friend_pk PRIMARY KEY (Id)
); 



CREATE TABLE public.Promotion (
	id serial NOT NULL,
	name VARCHAR(255),
	description VARCHAR(255),
	date_start DATE,
	date_end DATE,
	type BOOLEAN,
	unique_id VARCHAR(255) NOT NULL,
	location_id VARCHAR(255),
	is_deleted BOOLEAN,
	CONSTRAINT Promotion_pk PRIMARY KEY (id)
);



CREATE TABLE public.Wallet (
	id VARCHAR(255),
	promotion_id VARCHAR(255),
	account_id VARCHAR(255),
	is_deleted BOOLEAN,
	CONSTRAINT Wallet_pk PRIMARY KEY (id)
); 



CREATE TABLE public.FavoriteLocation (
	id serial NOT NULL,
	account_id VARCHAR(255),
	name VARCHAR(255),
	description VARCHAR(255),
	location_id VARCHAR(255),
	is_deleted BOOLEAN,
	CONSTRAINT FavoriteLocation_pk PRIMARY KEY (id,account_id)
); 



CREATE TABLE public.Location (
	create_by VARCHAR(255),
	unique_id VARCHAR(255) NOT NULL,
	id serial NOT NULL,
	name VARCHAR(255),
	description VARCHAR(255),
	link_avatar VARCHAR(255),
	rating FLOAT,
	address VARCHAR(255),
	phone_number VARCHAR(255),
	website VARCHAR(255),
	time_open TIME,
	time_close TIME,
	is_private BOOLEAN,
	region_id VARCHAR(255),
	type_id VARCHAR(255),
	is_deleted BOOLEAN,
	CONSTRAINT Location_pk PRIMARY KEY (id)
); 



CREATE TABLE public.LocationType (
	unique_id VARCHAR(255) NOT NULL,
	id serial NOT NULL,
	name VARCHAR(255),
	CONSTRAINT LocationType_pk PRIMARY KEY (id)
); 



CREATE TABLE public.Region (
	unique_id VARCHAR(255) NOT NULL,
	id serial NOT NULL,
	name VARCHAR(255),
	map VARCHAR(255),
	city_name VARCHAR(255),
	country_name VARCHAR(255),
	CONSTRAINT Region_pk PRIMARY KEY (id)
); 



CREATE TABLE public.Ratting (
	craete_by VARCHAR(255),
	location_id VARCHAR(255),
	pointRating integer,
	date TIMESTAMP,
	is_deleted BOOLEAN,
	CONSTRAINT Ratting_pk PRIMARY KEY (craete_by,location_id)
); 



CREATE TABLE public.Multimedia (
	id serial NOT NULL,
	location_id VARCHAR(255),
	description VARCHAR(255),
	link VARCHAR(255),
	type_name VARCHAR(255),
	CONSTRAINT Multimedia_pk PRIMARY KEY (id)
); 



CREATE TABLE public.Comment (
	id serial NOT NULL,
	create_by VARCHAR(255),
	location_id VARCHAR(255),
	content VARCHAR(255),
	is_deleted BOOLEAN,
	CONSTRAINT Comment_pk PRIMARY KEY (id)
); 

CREATE TABLE public.HotCheckIn (
	location_id VARCHAR(255),
	is_deleted BOOLEAN,
	CONSTRAINT HotCheckIn_pk PRIMARY KEY (location_id)
); 

CREATE TABLE public.MuseumTicket (
	location_id VARCHAR(255),
	price FLOAT,
	CONSTRAINT MuseumTicket_pk PRIMARY KEY (location_id)
); 

CREATE TABLE public.HotelRoom (
	id serial NOT NULL,
	location_id VARCHAR(255),
	name VARCHAR(255),
	description VARCHAR(255),
	link_image VARCHAR(255),
	price FLOAT,
	CONSTRAINT HotelRoom_pk PRIMARY KEY (id)
); 

CREATE TABLE public.FoodAndDrink (
	id serial NOT NULL,
	location_id VARCHAR(255),
	name VARCHAR(255),
	description VARCHAR(255),
	link_image VARCHAR(255),
	price FLOAT,
	CONSTRAINT FoodAndDrink_pk PRIMARY KEY (id)
); 


INSERT INTO public.account
(fulname, link_avatar, dob, gender, link_facebook, list_friend_id, address, email, unique_id, username, password, account_type, is_deleted) 
VALUES (N'Nguyễn Hoàng Thông','thong.com','2001-03-14',false,'fb.com/nht','5cbeb6b6-2903-402a-8bc0-38b56ef40292','hcm','nhthong@g.c','e66e9f23-89dd-4403-89de-90fac44da774','nhthong','haha','user',false);


INSERT INTO public.account (address, email, company_name, description, phone_number, website, unique_id, username, password, account_type, is_deleted) 
VALUES ('2 Tan Vien','kms@g.c','kms',N'Công ty công nghệ hàng đầu Việt Nam','0123456789','kms.com','4d3be260-c0fa-490a-a30f-09db5b1c0341','kms','haha','company',false);


INSERT INTO locationtype (unique_id, name) VALUES ('49136103-95cd-4946-8fdc-5a8a4a2141d8', 'Nhà hàng'),
('bc3723d7-3f5d-4f38-9015-fba8f2c869f0', 'Khách sạn'),
('d3f7c6ac-d80b-4f09-b5d1-606ee0163ef2', 'Quán ăn'),
('12d979bf-a8a7-44c8-b4b5-3bfd64f010e2', 'Quán nước'),
('04dbc2eb-c479-40aa-8319-64923527d034', 'Bảo tàng'),
('26b9ecbe-c456-4241-b6cd-8c4ed03d294b', 'Hot Checkin');

INSERT INTO region (unique_id, name, city_name, country_name) VALUES ('3db30047-4f71-4a4d-9fe8-034cec7945da','Khu du lịch Fresh','Hồ Chí Minh','Việt Nam'),
('29cbe986-abfc-40e4-9697-6684b1d1993e','Khu ẩm thực Ngon','Hồ Chí Minh','Việt Nam'),
('6fd3af26-376d-4f8f-840a-6a3ae9d33a15','Street Food Palace','LA','USA'),
('2e7ac728-d851-4b38-a706-ee23ff4fdf7e','Resort Palm','Ohio','Japan');

INSERT INTO location (create_by, unique_id, name, description, link_avatar, rating, address, phone_number, website, time_open, time_close, is_private, region_id, type_id, is_deleted) 
VALUES ('nhthong','980e12cd-0552-459f-b1c9-c093e3011779','Nhà Hàng Nhật 5 sao','Món ăn siêu ngon','',0.0,'123 Tan Vien','0123456789','abc.com','08:00:00','23:00:00',false,'29cbe986-abfc-40e4-9697-6684b1d1993e','49136103-95cd-4946-8fdc-5a8a4a2141d8',false);