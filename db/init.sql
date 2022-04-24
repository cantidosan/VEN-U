
CREATE DATABASE venue;

-- DROP TABLE  IF EXISTS  users,venues,events,venueissues,amentities,pictures_events,pictures_venues,customer ;

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE TYPE user_type AS ENUM ('HOST', 'BOOKEE', 'CUSTOMER');
CREATE TYPE event_type AS ENUM ('1-1', '1-M', '1-S');

CREATE TABLE "users" (
  "id" uuid  DEFAULT uuid_generate_v4 () PRIMARY KEY,
  "username" varchar,
  "first_name" varchar,
  "last_name" varchar,
  "created_at" date,
  "email" varchar(250),
  "password" varchar(250),
  "last_logged" varchar(250),
  "updated_at" varchar(250),
  "is_active" boolean,
  "user_type" user_type,
  "phone" varchar(250)
);



CREATE TABLE "events" (
  "id" uuid  DEFAULT uuid_generate_v4 () PRIMARY KEY,
  "name" varchar UNIQUE,
  "location" varchar(250),
  "bookee_id" uuid,
  "created_at" date,
  "type" event_type,
  "entry_price" int,
  "start_date" date,
  "duration" date,
  "start_time" date,
  "promotional_details" varchar(250),
  "venue_id" uuid,
  "is_active" boolean
);


CREATE TABLE "venueissues" (
  "id" uuid  DEFAULT uuid_generate_v4 () PRIMARY KEY,
  "title" varchar(250),
  "comment" varchar(250),
  "venue_id" uuid,
  "user_id" uuid
);


CREATE TABLE "venues" (
  "id" uuid  DEFAULT uuid_generate_v4 () PRIMARY KEY,
  "name" varchar UNIQUE NOT NULL,
  "location" varchar(250) NOT NULL,
  "price" int NOT NULL,
  "host_id" uuid,
  "created_at" date,
  "updated_at" varchar(250),
  "is_active" boolean
);




CREATE TABLE "amenities" (
  "id" uuid  DEFAULT uuid_generate_v4 () PRIMARY KEY,
  "venue_id" uuid,
  "Parking" boolean,
  "Blankets" boolean,
  "Food" boolean,
  "Electricity" boolean,
  "WiFi" boolean
);

CREATE TABLE "pictures_events" (
  "id" uuid  DEFAULT uuid_generate_v4 () PRIMARY KEY,
  "event_id" uuid,
  "pic_url" varchar(250),
  "is_active" boolean
);

CREATE TABLE "pictures_venues" (
  "id" uuid  DEFAULT uuid_generate_v4 () PRIMARY KEY,
  "venue_id" uuid,
  "pic_url" varchar(250),
  "is_active" boolean
);

CREATE TABLE "customer" (
  "id" uuid  DEFAULT uuid_generate_v4 () PRIMARY KEY,
  "user_id" uuid,
  "event_id" uuid,
  "purchase_status" boolean
);



ALTER TABLE "venues" ADD FOREIGN KEY ("host_id") REFERENCES "users" ("id");

ALTER TABLE "venueissues" ADD FOREIGN KEY ("venue_id") REFERENCES "venues" ("id");

ALTER TABLE "venueissues" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");


ALTER  TABLE "amenities" ADD FOREIGN KEY("venue_id") REFERENCES "venues"("id");


ALTER TABLE "events" ADD FOREIGN KEY("bookee_id") REFERENCES "users"("id");


ALTER TABLE "events" ADD FOREIGN KEY ("venue_id") REFERENCES "venues" ("id");

ALTER TABLE "pictures_events" ADD FOREIGN KEY ("event_id") REFERENCES "events" ("id");

ALTER TABLE "pictures_venues" ADD FOREIGN KEY ("venue_id") REFERENCES "venues" ("id");

ALTER TABLE "customer" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "customer" ADD FOREIGN KEY ("event_id") REFERENCES "events" ("id");

-- -- POPULATE THE USERS TABLE
insert into users (username, first_name, last_name, created_at, email, password, last_logged, updated_at, is_active, user_type, phone) values ('rvallantine0', 'Retha', 'Vallantine', '9/2/2021', 'rvallantine0@thetimes.co.uk', '$2a$08$EeQcxhHIh4d7Q3JpOlBCq.M.wky0s19Gs.2L/kYfTmqwAGgjDTSVm', '10/24/2021', '4/22/2022', true, 'HOST', '979-395-5903');
insert into users (username, first_name, last_name, created_at, email, password, last_logged, updated_at, is_active, user_type, phone) values ('gevill1', 'Glenden', 'Evill', '12/10/2021', 'gevill1@economist.com', '$2a$08$EeQcxhHIh4d7Q3JpOlBCq.M.wky0s19Gs.2L/kYfTmqwAGgjDTSVm', '4/19/2022', '6/27/2021', false, 'CUSTOMER', '509-917-7392');
insert into users (username, first_name, last_name, created_at, email, password, last_logged, updated_at, is_active, user_type, phone) values ('fkennet2', 'Frasquito', 'Kennet', '3/26/2022', 'fkennet2@mit.edu', '$2a$08$EeQcxhHIh4d7Q3JpOlBCq.M.wky0s19Gs.2L/kYfTmqwAGgjDTSVm', '1/28/2022', '4/29/2021', false, 'BOOKEE', '676-947-0438');
insert into users (username, first_name, last_name, created_at, email, password, last_logged, updated_at, is_active, user_type, phone) values ('odurand3', 'Oren', 'Durand', '3/23/2022', 'odurand3@uol.com.br', '$2a$08$EeQcxhHIh4d7Q3JpOlBCq.M.wky0s19Gs.2L/kYfTmqwAGgjDTSVm', '10/14/2021', '7/19/2021', false, 'HOST', '333-560-3146');
insert into users (username, first_name, last_name, created_at, email, password, last_logged, updated_at, is_active, user_type, phone) values ('edionisii4', 'Emmeline', 'Dionisii', '9/5/2021', 'edionisii4@plala.or.jp', '$2a$08$EeQcxhHIh4d7Q3JpOlBCq.M.wky0s19Gs.2L/kYfTmqwAGgjDTSVm', '4/19/2022', '8/8/2021', false, 'CUSTOMER', '881-591-1433');
insert into users (username, first_name, last_name, created_at, email, password, last_logged, updated_at, is_active, user_type, phone) values ('mwarmisham5', 'Maryrose', 'Warmisham', '7/15/2021', 'mwarmisham5@google.fr', '$2a$08$EeQcxhHIh4d7Q3JpOlBCq.M.wky0s19Gs.2L/kYfTmqwAGgjDTSVm', '4/24/2021', '12/16/2021', false, 'BOOKEE', '778-790-2020');
insert into users (username, first_name, last_name, created_at, email, password, last_logged, updated_at, is_active, user_type, phone) values ('alyes6', 'Antoine', 'Lyes', '5/19/2021', 'alyes6@nature.com', '$2a$08$EeQcxhHIh4d7Q3JpOlBCq.M.wky0s19Gs.2L/kYfTmqwAGgjDTSVm', '8/29/2021', '7/8/2021', true, 'HOST', '333-682-6551');
insert into users (username, first_name, last_name, created_at, email, password, last_logged, updated_at, is_active, user_type, phone) values ('ecolbertson7', 'Emery', 'Colbertson', '10/14/2021', 'ecolbertson7@home.pl', '$2a$08$EeQcxhHIh4d7Q3JpOlBCq.M.wky0s19Gs.2L/kYfTmqwAGgjDTSVm', '9/1/2021', '5/22/2021', true, 'CUSTOMER', '858-105-3736');
insert into users (username, first_name, last_name, created_at, email, password, last_logged, updated_at, is_active, user_type, phone) values ('eodeegan8', 'Ealasaid', 'O''Deegan', '9/13/2021', 'eodeegan8@pbs.org', '$2a$08$EeQcxhHIh4d7Q3JpOlBCq.M.wky0s19Gs.2L/kYfTmqwAGgjDTSVm', '4/25/2021', '9/3/2021', false, 'BOOKEE', '143-189-9220');
insert into users (username, first_name, last_name, created_at, email, password, last_logged, updated_at, is_active, user_type, phone) values ('dmetham9', 'Drucill', 'Metham', '5/8/2021', 'dmetham9@comsenz.com', '$2a$08$EeQcxhHIh4d7Q3JpOlBCq.M.wky0s19Gs.2L/kYfTmqwAGgjDTSVm', '1/14/2022', '1/28/2022', true, 'HOST', '489-420-1452');
insert into users (username, first_name, last_name, created_at, email, password, last_logged, updated_at, is_active, user_type, phone) values ('smacquakera', 'Siffre', 'MacQuaker', '2/18/2022', 'smacquakera@gnu.org', '$2a$08$EeQcxhHIh4d7Q3JpOlBCq.M.wky0s19Gs.2L/kYfTmqwAGgjDTSVm', '5/2/2021', '7/25/2021', true, 'CUSTOMER', '676-808-6095');
insert into users (username, first_name, last_name, created_at, email, password, last_logged, updated_at, is_active, user_type, phone) values ('lpaslowb', 'Lucy', 'Paslow', '8/3/2021', 'lpaslowb@amazonaws.com', '$2a$08$EeQcxhHIh4d7Q3JpOlBCq.M.wky0s19Gs.2L/kYfTmqwAGgjDTSVm', '2/5/2022', '8/17/2021', false, 'BOOKEE', '195-905-6899');
insert into users (username, first_name, last_name, created_at, email, password, last_logged, updated_at, is_active, user_type, phone) values ('mmarfieldc', 'Modestine', 'Marfield', '8/3/2021', 'mmarfieldc@xing.com', '$2a$08$EeQcxhHIh4d7Q3JpOlBCq.M.wky0s19Gs.2L/kYfTmqwAGgjDTSVm', '4/29/2021', '11/5/2021', true, 'HOST', '806-624-9904');
insert into users (username, first_name, last_name, created_at, email, password, last_logged, updated_at, is_active, user_type, phone) values ('nputtond', 'Natalie', 'Putton', '7/18/2021', 'nputtond@parallels.com', '$2a$08$EeQcxhHIh4d7Q3JpOlBCq.M.wky0s19Gs.2L/kYfTmqwAGgjDTSVm', '1/13/2022', '1/29/2022', true, 'CUSTOMER', '220-859-2454');
insert into users (username, first_name, last_name, created_at, email, password, last_logged, updated_at, is_active, user_type, phone) values ('vbloise', 'Vale', 'Blois', '12/31/2021', 'vbloise@cmu.edu', '$2a$08$EeQcxhHIh4d7Q3JpOlBCq.M.wky0s19Gs.2L/kYfTmqwAGgjDTSVm', '4/23/2022', '11/11/2021', true, 'BOOKEE', '905-439-3906');
insert into users (username, first_name, last_name, created_at, email, password, last_logged, updated_at, is_active, user_type, phone) values ('fheightonf', 'Finley', 'Heighton', '4/18/2022', 'fheightonf@gizmodo.com', '$2a$08$EeQcxhHIh4d7Q3JpOlBCq.M.wky0s19Gs.2L/kYfTmqwAGgjDTSVm', '8/24/2021', '11/17/2021', false, 'HOST', '341-485-5668');
insert into users (username, first_name, last_name, created_at, email, password, last_logged, updated_at, is_active, user_type, phone) values ('sastlettg', 'Stephine', 'Astlett', '1/31/2022', 'sastlettg@columbia.edu', '$2a$08$EeQcxhHIh4d7Q3JpOlBCq.M.wky0s19Gs.2L/kYfTmqwAGgjDTSVm', '9/18/2021', '9/22/2021', false, 'CUSTOMER', '453-651-0249');
insert into users (username, first_name, last_name, created_at, email, password, last_logged, updated_at, is_active, user_type, phone) values ('dkillelayh', 'Delano', 'Killelay', '1/21/2022', 'dkillelayh@hugedomains.com', '$2a$08$EeQcxhHIh4d7Q3JpOlBCq.M.wky0s19Gs.2L/kYfTmqwAGgjDTSVm', '1/21/2022', '9/6/2021', false, 'BOOKEE', '216-526-1486');
insert into users (username, first_name, last_name, created_at, email, password, last_logged, updated_at, is_active, user_type, phone) values ('bgehrelsi', 'Boyd', 'Gehrels', '4/2/2022', 'bgehrelsi@zdnet.com', '$2a$08$EeQcxhHIh4d7Q3JpOlBCq.M.wky0s19Gs.2L/kYfTmqwAGgjDTSVm', '11/1/2021', '5/8/2021', false, 'HOST', '438-710-7843');
insert into users (username, first_name, last_name, created_at, email, password, last_logged, updated_at, is_active, user_type, phone) values ('jspellecyj', 'Jory', 'Spellecy', '10/24/2021', 'jspellecyj@fema.gov', '$2a$08$EeQcxhHIh4d7Q3JpOlBCq.M.wky0s19Gs.2L/kYfTmqwAGgjDTSVm', '1/17/2022', '10/2/2021', true, 'CUSTOMER', '368-515-6675');
insert into users (username, first_name, last_name, created_at, email, password, last_logged, updated_at, is_active, user_type, phone) values ('bludlammek', 'Bunni', 'Ludlamme', '7/3/2021', 'bludlammek@nifty.com', '$2a$08$EeQcxhHIh4d7Q3JpOlBCq.M.wky0s19Gs.2L/kYfTmqwAGgjDTSVm', '1/23/2022', '6/8/2021', true, 'BOOKEE', '596-699-8083');
insert into users (username, first_name, last_name, created_at, email, password, last_logged, updated_at, is_active, user_type, phone) values ('esertinl', 'Eziechiele', 'Sertin', '7/22/2021', 'esertinl@tumblr.com', '$2a$08$EeQcxhHIh4d7Q3JpOlBCq.M.wky0s19Gs.2L/kYfTmqwAGgjDTSVm', '10/14/2021', '10/27/2021', true, 'HOST', '434-521-3907');
insert into users (username, first_name, last_name, created_at, email, password, last_logged, updated_at, is_active, user_type, phone) values ('dbarusm', 'Daniella', 'Barus', '10/18/2021', 'dbarusm@jimdo.com', '$2a$08$EeQcxhHIh4d7Q3JpOlBCq.M.wky0s19Gs.2L/kYfTmqwAGgjDTSVm', '7/26/2021', '5/18/2021', true, 'CUSTOMER', '295-913-0516');
insert into users (username, first_name, last_name, created_at, email, password, last_logged, updated_at, is_active, user_type, phone) values ('amccarlien', 'Atlanta', 'McCarlie', '6/2/2021', 'amccarlien@usatoday.com', '$2a$08$EeQcxhHIh4d7Q3JpOlBCq.M.wky0s19Gs.2L/kYfTmqwAGgjDTSVm', '9/17/2021', '3/29/2022', true, 'BOOKEE', '134-756-0896');
insert into users (username, first_name, last_name, created_at, email, password, last_logged, updated_at, is_active, user_type, phone) values ('jmcinneryo', 'Jayne', 'McInnery', '4/3/2022', 'jmcinneryo@aboutads.info', '$2a$08$EeQcxhHIh4d7Q3JpOlBCq.M.wky0s19Gs.2L/kYfTmqwAGgjDTSVm', '12/14/2021', '4/25/2021', true, 'HOST', '832-610-7937');
insert into users (username, first_name, last_name, created_at, email, password, last_logged, updated_at, is_active, user_type, phone) values ('btedmanp', 'Bertram', 'Tedman', '4/11/2022', 'btedmanp@wired.com', '$2a$08$EeQcxhHIh4d7Q3JpOlBCq.M.wky0s19Gs.2L/kYfTmqwAGgjDTSVm', '4/8/2022', '11/29/2021', false, 'CUSTOMER', '246-702-4312');
insert into users (username, first_name, last_name, created_at, email, password, last_logged, updated_at, is_active, user_type, phone) values ('vstockbridgeq', 'Valenka', 'Stockbridge', '2/5/2022', 'vstockbridgeq@dmoz.org', '$2a$08$EeQcxhHIh4d7Q3JpOlBCq.M.wky0s19Gs.2L/kYfTmqwAGgjDTSVm', '3/27/2022', '9/11/2021', false, 'BOOKEE', '119-373-4348');
insert into users (username, first_name, last_name, created_at, email, password, last_logged, updated_at, is_active, user_type, phone) values ('gsenussir', 'Garvey', 'Senussi', '1/26/2022', 'gsenussir@mozilla.com', '$2a$08$EeQcxhHIh4d7Q3JpOlBCq.M.wky0s19Gs.2L/kYfTmqwAGgjDTSVm', '12/4/2021', '2/2/2022', true, 'HOST', '358-913-4936');
insert into users (username, first_name, last_name, created_at, email, password, last_logged, updated_at, is_active, user_type, phone) values ('hguilletons', 'Henri', 'Guilleton', '5/29/2021', 'hguilletons@samsung.com', '$2a$08$EeQcxhHIh4d7Q3JpOlBCq.M.wky0s19Gs.2L/kYfTmqwAGgjDTSVm', '10/21/2021', '8/31/2021', true, 'CUSTOMER', '561-981-6903');
insert into users (username, first_name, last_name, created_at, email, password, last_logged, updated_at, is_active, user_type, phone) values ('tscheffelt', 'Tyler', 'Scheffel', '7/8/2021', 'tscheffelt@forbes.com', '$2a$08$EeQcxhHIh4d7Q3JpOlBCq.M.wky0s19Gs.2L/kYfTmqwAGgjDTSVm', '8/31/2021', '6/20/2021', false, 'BOOKEE', '645-101-3120');
insert into users (username, first_name, last_name, created_at, email, password, last_logged, updated_at, is_active, user_type, phone) values ('gwinnyu', 'Grover', 'Winny', '8/22/2021', 'gwinnyu@businessweek.com', '$2a$08$EeQcxhHIh4d7Q3JpOlBCq.M.wky0s19Gs.2L/kYfTmqwAGgjDTSVm', '10/6/2021', '8/21/2021', false, 'HOST', '129-785-7030');
insert into users (username, first_name, last_name, created_at, email, password, last_logged, updated_at, is_active, user_type, phone) values ('swrightonv', 'Sol', 'Wrighton', '6/29/2021', 'swrightonv@list-manage.com', '$2a$08$EeQcxhHIh4d7Q3JpOlBCq.M.wky0s19Gs.2L/kYfTmqwAGgjDTSVm', '11/7/2021', '9/17/2021', false, 'CUSTOMER', '937-420-7114');
insert into users (username, first_name, last_name, created_at, email, password, last_logged, updated_at, is_active, user_type, phone) values ('tmerigonw', 'Thadeus', 'Merigon', '11/29/2021', 'tmerigonw@slate.com', '$2a$08$EeQcxhHIh4d7Q3JpOlBCq.M.wky0s19Gs.2L/kYfTmqwAGgjDTSVm', '11/1/2021', '4/15/2022', true, 'BOOKEE', '583-639-1173');
insert into users (username, first_name, last_name, created_at, email, password, last_logged, updated_at, is_active, user_type, phone) values ('jkenningtonx', 'Joela', 'Kennington', '11/14/2021', 'jkenningtonx@reference.com', '$2a$08$EeQcxhHIh4d7Q3JpOlBCq.M.wky0s19Gs.2L/kYfTmqwAGgjDTSVm', '5/13/2021', '10/1/2021', true, 'HOST', '155-630-5826');
insert into users (username, first_name, last_name, created_at, email, password, last_logged, updated_at, is_active, user_type, phone) values ('ejanosevicy', 'Ettie', 'Janosevic', '12/5/2021', 'ejanosevicy@ca.gov', '$2a$08$EeQcxhHIh4d7Q3JpOlBCq.M.wky0s19Gs.2L/kYfTmqwAGgjDTSVm', '3/12/2022', '12/29/2021', false, 'CUSTOMER', '224-296-9051');
insert into users (username, first_name, last_name, created_at, email, password, last_logged, updated_at, is_active, user_type, phone) values ('dbaymanz', 'Dahlia', 'Bayman', '5/22/2021', 'dbaymanz@spiegel.de', '$2a$08$EeQcxhHIh4d7Q3JpOlBCq.M.wky0s19Gs.2L/kYfTmqwAGgjDTSVm', '11/24/2021', '12/7/2021', true, 'BOOKEE', '530-697-1038');
insert into users (username, first_name, last_name, created_at, email, password, last_logged, updated_at, is_active, user_type, phone) values ('cblagdon10', 'Charlie', 'Blagdon', '5/21/2021', 'cblagdon10@cbc.ca', '$2a$08$EeQcxhHIh4d7Q3JpOlBCq.M.wky0s19Gs.2L/kYfTmqwAGgjDTSVm', '8/10/2021', '1/3/2022', false, 'HOST', '951-605-3873');
insert into users (username, first_name, last_name, created_at, email, password, last_logged, updated_at, is_active, user_type, phone) values ('ismiz11', 'Ignacio', 'Smiz', '6/23/2021', 'ismiz11@miibeian.gov.cn', '$2a$08$EeQcxhHIh4d7Q3JpOlBCq.M.wky0s19Gs.2L/kYfTmqwAGgjDTSVm', '10/19/2021', '11/29/2021', true, 'CUSTOMER', '159-773-7741');
insert into users (username, first_name, last_name, created_at, email, password, last_logged, updated_at, is_active, user_type, phone) values ('megell12', 'Murielle', 'Egell', '6/30/2021', 'megell12@unesco.org', '$2a$08$EeQcxhHIh4d7Q3JpOlBCq.M.wky0s19Gs.2L/kYfTmqwAGgjDTSVm', '8/8/2021', '9/10/2021', false, 'BOOKEE', '324-883-0400');
insert into users (username, first_name, last_name, created_at, email, password, last_logged, updated_at, is_active, user_type, phone) values ('djeayes13', 'Dov', 'Jeayes', '9/23/2021', 'djeayes13@cyberchimps.com', '$2a$08$EeQcxhHIh4d7Q3JpOlBCq.M.wky0s19Gs.2L/kYfTmqwAGgjDTSVm', '8/29/2021', '8/25/2021', true, 'HOST', '478-261-7023');


-- POPULATE VENUES TABLE
-- NEEDS USERID
insert into venues (name, location, price, host_id, created_at, updated_at, is_active) values ('dallmark0', '9 Veith Hill', 1.59, '3128637c-6643-4255-9e60-6a280796cfb1 ', '7/28/2021', '10/19/2021', false);
insert into venues (name, location, price, host_id, created_at, updated_at, is_active) values ('mmathis1', '207 Burning Wood Circle', 3, '3128637c-6643-4255-9e60-6a280796cfb1 ', '5/4/2021', '10/15/2021', false);
insert into venues (name, location, price, host_id, created_at, updated_at, is_active) values ('abeaston2', '6180 Rutledge Center', 4, ' 8008bcb3-9866-40dd-8061-0d0d481df356 ', '1/18/2022', '5/29/2021', false);
insert into venues (name, location, price, host_id, created_at, updated_at, is_active) values ('drodell3', '698 Glacier Hill Way', 7, '3128637c-6643-4255-9e60-6a280796cfb1 ', '4/11/2022', '5/11/2021', false);
insert into venues (name, location, price, host_id, created_at, updated_at, is_active) values ('lallsupp4', '54 Shopko Terrace', 7, '3128637c-6643-4255-9e60-6a280796cfb1 ', '9/12/2021', '4/11/2022', false);
insert into venues (name, location, price, host_id, created_at, updated_at, is_active) values ('mgreensted5', '8 Park Meadow Terrace', 5, '3128637c-6643-4255-9e60-6a280796cfb1 ', '11/11/2021', '5/8/2021', true);
insert into venues (name, location, price, host_id, created_at, updated_at, is_active) values ('mgarretts6', '83452 1st Trail', 1, ' 8008bcb3-9866-40dd-8061-0d0d481df356 ', '4/20/2022', '9/3/2021', false);
insert into venues (name, location, price, host_id, created_at, updated_at, is_active) values ('cmaudsley7', '83047 Clove Drive', 4, '8905b4e2-47fe-45b6-9da3-961650fee8f2', '5/31/2021', '4/26/2021', false);
insert into venues (name, location, price, host_id, created_at, updated_at, is_active) values ('abernollet8', '616 Autumn Leaf Trail', 9, 'aaa10736-b683-423d-bedd-46de86fc8c6c', '7/1/2021', '4/2/2022', false);
insert into venues (name, location, price, host_id, created_at, updated_at, is_active) values ('vstclair9', '8100 Village Green Crossing', 2, 'aaa10736-b683-423d-bedd-46de86fc8c6c', '2/27/2022', '1/12/2022', false);
insert into venues (name, location, price, host_id, created_at, updated_at, is_active) values ('ssteffensa', '83 Briar Crest Crossing', 5, '13644872-21d9-41eb-8e8a-b241b3351d98', '9/29/2021', '4/21/2022', true);
insert into venues (name, location, price, host_id, created_at, updated_at, is_active) values ('smccartb', '7070 Division Hill', 4, '35f9fc5d-d57e-47f8-a78c-8fe3af98e7ae ', '11/12/2021', '1/15/2022', true);
insert into venues (name, location, price, host_id, created_at, updated_at, is_active) values ('dlotsc', '1190 Roth Place', 1, '13644872-21d9-41eb-8e8a-b241b3351d98', '1/17/2022', '1/1/2022', true);
insert into venues (name, location, price, host_id, created_at, updated_at, is_active) values ('ecourtind', '635 Marcy Place', 4, 'f8cf60d6-5e7b-4a00-bc3b-cd6a1887096d', '4/12/2022', '5/30/2021', true);
insert into venues (name, location, price, host_id, created_at, updated_at, is_active) values ('nbrusselse', '2538 Parkside Place', 7., 'db44c513-ef0f-4a09-a3b4-ce0691e5e12a', '6/8/2021', '5/15/2021', false);
insert into venues (name, location, price, host_id, created_at, updated_at, is_active) values ('dbicklef', '572 Porter Alley', 8, 'db44c513-ef0f-4a09-a3b4-ce0691e5e12a', '6/22/2021', '6/22/2021', false);
insert into venues (name, location, price, host_id, created_at, updated_at, is_active) values ('dpattieg', '7 Northfield Court', 1, ' 22463919-fabc-4db4-b4f1-ad956dad492e ', '12/8/2021', '5/20/2021', true);
insert into venues (name, location, price, host_id, created_at, updated_at, is_active) values ('spozzih', '0719 Dayton Alley', 3.49, '8905b4e2-47fe-45b6-9da3-961650fee8f2', '6/23/2021', '5/10/2021', true);
insert into venues (name, location, price, host_id, created_at, updated_at, is_active) values ('tbramei', '1 7th Drive', 1.83, '6a768ea3-22b0-4f47-93a3-d30a1d530035', '12/4/2021', '11/11/2021', false);
insert into venues (name, location, price, host_id, created_at, updated_at, is_active) values ('fmanwellj', '0 Washington Circle', 6, '9cba983f-5aa9-4cef-971f-8aed413fa3e6', '9/4/2021', '7/21/2021', true);
insert into venues (name, location, price, host_id, created_at, updated_at, is_active) values ('cbettesonk', '08730 Di Loreto Park', 7, 'db44c513-ef0f-4a09-a3b4-ce0691e5e12a', '11/10/2021', '6/10/2021', false);
insert into venues (name, location, price, host_id, created_at, updated_at, is_active) values ('ihowell', '2887 Badeau Place', 2, ' d421e21a-4d4c-43f3-b11d-2eaf41867681', '3/5/2022', '8/14/2021', true);
insert into venues (name, location, price, host_id, created_at, updated_at, is_active) values ('npietrzakm', '3566 Kipling Parkway', 2.71, ' d421e21a-4d4c-43f3-b11d-2eaf41867681 ', '1/2/2022', '9/3/2021', false);
insert into venues (name, location, price, host_id, created_at, updated_at, is_active) values ('ppennazzin', '793 Waywood Crossing', 3.97, ' d421e21a-4d4c-43f3-b11d-2eaf41867681', '1/31/2022', '9/18/2021', false);
insert into venues (name, location, price, host_id, created_at, updated_at, is_active) values ('nrammo', '65 Forest Avenue', 1, 'db44c513-ef0f-4a09-a3b4-ce0691e5e12a', '12/5/2021', '11/7/2021', true);
insert into venues (name, location, price, host_id, created_at, updated_at, is_active) values ('dsotheronp', '91664 Charing Cross Plaza', '3.37', '9cba983f-5aa9-4cef-971f-8aed413fa3e6 ', '6/5/2021', '5/6/2021', false);
insert into venues (name, location, price, host_id, created_at, updated_at, is_active) values ('abusheq', '821 Stuart Alley', 7.06, '2acf89a4-a616-429a-b2b1-309d328d07a1', '3/4/2022', '6/15/2021', true);
insert into venues (name, location, price, host_id, created_at, updated_at, is_active) values ('spriestlandr', '9402 Talmadge Alley', 1.49, '9cba983f-5aa9-4cef-971f-8aed413fa3e6', '2/25/2022', '10/27/2021', false);
insert into venues (name, location, price, host_id, created_at, updated_at, is_active) values ('bfyalls', '98 Forster Parkway', 6.41, ' 8008bcb3-9866-40dd-8061-0d0d481df356 ', '8/14/2021', '2/10/2022', true);
insert into venues (name, location, price, host_id, created_at, updated_at, is_active) values ('ckyndert', '558 Lerdahl Pass', 5.98, '9cba983f-5aa9-4cef-971f-8aed413fa3e6', '7/10/2021', '2/18/2022', true);
insert into venues (name, location, price, host_id, created_at, updated_at, is_active) values ('asandifordu', '276 Fordem Crossing', 8.2, '13644872-21d9-41eb-8e8a-b241b3351d98', '10/17/2021', '7/13/2021', false);
insert into venues (name, location, price, host_id, created_at, updated_at, is_active) values ('ccaplisv', '84901 Marcy Road', 1.44, '9cba983f-5aa9-4cef-971f-8aed413fa3e6 ', '1/25/2022', '3/22/2022', false);
insert into venues (name, location, price, host_id, created_at, updated_at, is_active) values ('dfeakew', '6 Quincy Way', 7.09, 'aa43cd91-b02b-4c3a-abd5-7da25243bc7d', '7/31/2021', '1/23/2022', false);
insert into venues (name, location, price, host_id, created_at, updated_at, is_active) values ('bfullalovex', '7475 Nelson Court', 8, '9cba983f-5aa9-4cef-971f-8aed413fa3e6', '8/7/2021', '11/18/2021', true);
insert into venues (name, location, price, host_id, created_at, updated_at, is_active) values ('chearmony', '1397 Gerald Parkway', 52, '12712f01-c8f3-4013-a0aa-994bf10c3893', '12/30/2021', '1/5/2022', true);
insert into venues (name, location, price, host_id, created_at, updated_at, is_active) values ('amcrillz', '909 South Court', 9, '6a768ea3-22b0-4f47-93a3-d30a1d530035', '5/24/2021', '6/17/2021', true);
insert into venues (name, location, price, host_id, created_at, updated_at, is_active) values ('tpolack10', '48 Butterfield Alley', 8.35, '8905b4e2-47fe-45b6-9da3-961650fee8f2 ', '9/30/2021', '11/29/2021', false);
insert into venues (name, location, price, host_id, created_at, updated_at, is_active) values ('alinnit11', '7 Arkansas Lane', 4.29, '6a768ea3-22b0-4f47-93a3-d30a1d530035', '9/9/2021', '5/27/2021', false);
insert into venues (name, location, price, host_id, created_at, updated_at, is_active) values ('sopie12', '45 Randy Drive', 3.21, '22463919-fabc-4db4-b4f1-ad956dad492e', '11/5/2021', '6/13/2021', false);
insert into venues (name, location, price, host_id, created_at, updated_at, is_active) values ('rherreros13', '80 Crowley Trail', 3.46, '6a768ea3-22b0-4f47-93a3-d30a1d530035', '2/21/2022', '7/30/2021', false);





-- --POPULATE THE AMENITIES TABLE
-- NEEDS VENUEID
-- insert into amenities (venue_id, parking, blankets, food, Electricity, WiFi) values ('71043310-d373-47db-8014-c883a0d1b884', false, false, false, true, false);
-- insert into amenities (venue_id, parking, blankets, food, Electricity, WiFi) values ('71e5fb01-ea0b-42d9-b1d9-20137a1dffcc', false, false, false, true, true);
-- insert into amenities (venue_id, parking, blankets, food, Electricity, WiFi) values ('a050f1a1-1048-45a0-bb78-6bbe39f1fd89', true, false, false, true, false);
-- insert into amenities (venue_id, parking, blankets, food, Electricity, WiFi) values ('ebda04ed-4143-48ac-89c7-7c6c17391865', true, false, false, false, true);
-- insert into amenities (venue_id, parking, blankets, food, Electricity, WiFi) values ('c22a4ec5-7efc-4026-a004-7144682e92a4', false, false, true, true, true);
-- insert into amenities (venue_id, parking, blankets, food, Electricity, WiFi) values ('38b4364b-3226-447e-850c-0df93c4fbba4', false, true, false, false, false);
-- insert into amenities (venue_id, parking, blankets, food, Electricity, WiFi) values ('2407ea6f-430b-4ffe-9cfa-415d35c1ed59', false, false, true, true, true);
-- insert into amenities (venue_id, parking, blankets, food, Electricity, WiFi) values ('29323ed4-a364-4517-9216-460d55126f5c', false, false, true, true, true);
-- insert into amenities (venue_id, parking, blankets, food, Electricity, WiFi) values ('2a5d6bee-7cde-46af-b32c-846480c25456', false, true, false, true, true);
-- insert into amenities (venue_id, parking, blankets, food, Electricity, WiFi) values ('2a2850a3-fea3-4481-9870-af68ac1238fc', true, true, true, false, true);
-- insert into amenities (venue_id, parking, blankets, food, Electricity, WiFi) values ('07bc2523-d9c5-4e09-8445-bfee2a9b1627', false, true, false, true, false);
-- insert into amenities (venue_id, parking, blankets, food, Electricity, WiFi) values ('bc716224-c442-4cbe-859f-94eddf231196', true, true, true, false, true);
-- insert into amenities (venue_id, parking, blankets, food, Electricity, WiFi) values ('c01dc419-b65e-45d7-920e-c154dc9f29cd', true, true, true, false, false);
-- insert into amenities (venue_id, parking, blankets, food, Electricity, WiFi) values ('e60958be-3cf0-4835-99be-9a5b5f31437f', true, false, false, false, true);
-- insert into amenities (venue_id, parking, blankets, food, Electricity, WiFi) values ('199e86cd-d4b4-4b8c-b528-0752c0a1d0f2', true, false, false, false, false);
-- insert into amenities (venue_id, parking, blankets, food, Electricity, WiFi) values ('33db4b31-c9af-4059-a971-9f9930b6100f', false, true, true, false, false);
-- insert into amenities (venue_id, parking, blankets, food, Electricity, WiFi) values ('62e3ae51-0567-4aeb-bd25-df4cd2ed84ee', false, false, true, true, false);
-- insert into amenities (venue_id, parking, blankets, food, Electricity, WiFi) values ('3a86b4e5-f7c9-4941-9a43-53e91db74e4b', false, true, false, false, false);
-- insert into amenities (venue_id, parking, blankets, food, Electricity, WiFi) values ('4ef016cf-a72f-4c41-906d-61b254d4dc86', true, true, false, true, false);
-- insert into amenities (venue_id, parking, blankets, food, Electricity, WiFi) values ('736b92bc-83b9-4aff-a31b-2f4f69a15c01', true, false, true, true, false);
-- insert into amenities (venue_id, parking, blankets, food, Electricity, WiFi) values ('86f31d4d-c1c9-4154-b1dd-a14cab0a6d73', false, true, false, true, false);
-- insert into amenities (venue_id, parking, blankets, food, Electricity, WiFi) values ('4461b2b3-adcc-4c30-ba3c-f3c28b3f8183', true, false, true, false, true);
-- insert into amenities (venue_id, parking, blankets, food, Electricity, WiFi) values ('1749e731-c9de-49eb-8625-ae074c362e25', false, false, true, true, false);
-- insert into amenities (venue_id, parking, blankets, food, Electricity, WiFi) values ('9a853684-e9a9-41ff-8e12-d3847a0a5cb1', false, true, false, true, true);
-- insert into amenities (venue_id, parking, blankets, food, Electricity, WiFi) values ('995d3024-e2ed-489d-997b-a4dea18cc72d', true, false, true, false, true);
-- insert into amenities (venue_id, parking, blankets, food, Electricity, WiFi) values ('d0871e49-4ed5-4320-8ae3-ad0e7eb377df', false, true, true, true, false);
-- insert into amenities (venue_id, parking, blankets, food, Electricity, WiFi) values ('305bb227-80e9-40a5-ac56-3b6c5e7cdef8', false, true, true, true, false);
-- insert into amenities (venue_id, parking, blankets, food, Electricity, WiFi) values ('edebda29-f38f-4a8c-a2a7-acbcc3520bca', false, false, false, false, true);
-- insert into amenities (venue_id, parking, blankets, food, Electricity, WiFi) values ('f7cc4659-8756-41e1-be2d-69317364600d', true, false, true, false, false);
-- insert into amenities (venue_id, parking, blankets, food, Electricity, WiFi) values ('8f3490b3-e07f-4b63-b047-f291d8982d33', false, false, false, true, true);
-- insert into amenities (venue_id, parking, blankets, food, Electricity, WiFi) values ('f3f03cfa-03f2-4005-94a4-6ffc26ac6b5f', false, true, true, true, true);
-- insert into amenities (venue_id, parking, blankets, food, Electricity, WiFi) values ('559dda18-1674-4076-b0bc-88a491855782', false, true, false, true, true);
-- insert into amenities (venue_id, parking, blankets, food, Electricity, WiFi) values ('083fe81d-bc48-4d5d-a4fe-01c3e6b5be93', false, false, true, true, false);
-- insert into amenities (venue_id, parking, blankets, food, Electricity, WiFi) values ('5c5fa8e3-8af8-4bbf-8bc0-631ba4c04b79', true, true, false, false, true);
-- insert into amenities (venue_id, parking, blankets, food, Electricity, WiFi) values ('9e1229c2-831a-4639-8c28-9d772955fc49', false, true, true, true, true);
-- insert into amenities (venue_id, parking, blankets, food, Electricity, WiFi) values ('422c8acd-03da-4700-af30-39b257b32d8f', false, false, false, true, false);
-- insert into amenities (venue_id, parking, blankets, food, Electricity, WiFi) values ('ec024f21-1aca-4f73-b32e-40e42115d0c6', true, false, false, true, false);
-- insert into amenities (venue_id, parking, blankets, food, Electricity, WiFi) values ('b5ba1bbb-6268-409b-b3dc-2eb07738371b', true, false, true, true, false);
-- insert into amenities (venue_id, parking, blankets, food, Electricity, WiFi) values ('4f96ab0f-cca1-4de2-8649-7774364fa2d6', true, true, true, false, true);
-- insert into amenities (venue_id, parking, blankets, food, Electricity, WiFi) values ('de1074e6-6d44-4168-bce6-bc6a732e8054', true, true, true, true, true);





-- -- POPULATE THE EVENTS TABLE
-- NEEDS USERID AND VENUE ID
-- insert into eventd (name, location, bookee_id, created_at, type, entry_price, start_date, duration, start_time, promotional_details, venue_id, is_active) values ('Torphy Group', '4 South Point', '5969174b-214d-4748-9b2a-b6064817b03c', '10/26/2021', '1-S', 5, '1/1/2022', 74, '7:10 PM', 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', '2bf61b42-9c8b-4cac-9edf-beb5896f1fea', true);
-- insert into eventd (name, location, bookee_id, created_at, type, entry_price, start_date, duration, start_time, promotional_details, venue_id, is_active) values ('Reinger, Wilderman and Cummings', '748 Tomscot Alley', 'ee5098ee-1018-47e0-a8a0-7ef2f2fb1a55', '8/6/2021', '1-M', 89, '11/22/2021', 57, '1:04 PM', 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.', '5346e8ec-803c-4a4c-bc0a-5deada7ce09f', false);
-- insert into eventd (name, location, bookee_id, created_at, type, entry_price, start_date, duration, start_time, promotional_details, venue_id, is_active) values ('Robel and Sons', '035 Division Crossing', '5227c385-ce2c-4dfa-a3e6-8dfd34a29881', '7/14/2021', '1-S', 77, '1/16/2022', 3, '9:20 PM', 'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.sque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.', '284a6c60-8b89-4379-9a0f-7d66a2b11447', false);
-- insert into eventd (name, location, bookee_id, created_at, type, entry_price, start_date, duration, start_time, promotional_details, venue_id, is_active) values ('Collier, Collins and Stracke', '194 Pankratz Lane', '785cc5dd-1342-41eb-bd15-b3e384506516', '4/30/2021', '1-M', 21, '3/9/2022', 15, '5:52 AM', 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', 'ca67190c-8178-495f-9603-97d91284fc13', false);
-- insert into eventd (name, location, bookee_id, created_at, type, entry_price, start_date, duration, start_time, promotional_details, venue_id, is_active) values ('Kling, Beahan and Kuhlman', '05 Cardinal Hill', 'b22fd6f7-b85c-42a9-a8a1-9da560b50b21', '12/2/2021', '1-1', 68, '10/8/2021', 55, '7:56 PM', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.', '3dd3477c-6371-4a16-84f3-3f44b1593c92', true);




-- -- POPULATE EVENT PICTURES TABLE
-- insert into pictures_events (event_id, pic_url, is_active) values ('8e425699-743d-48c0-824d-72d72064d00f', 'http://dummyimage.com/228x100.png/dddddd/000000', true);
-- insert into pictures_events (event_id, pic_url, is_active) values ('eb56b18d-4af6-4060-b865-e40689758745', 'http://dummyimage.com/189x100.png/cc0000/ffffff', false);
-- insert into pictures_events (event_id, pic_url, is_active) values ('22d582b5-cff4-4810-9b49-9d81bd30346a', 'http://dummyimage.com/102x100.png/cc0000/ffffff', true);
-- insert into pictures_events (event_id, pic_url, is_active) values ('322a5768-7b51-47ea-ab70-4cbd5b6eaea5', 'http://dummyimage.com/126x100.png/5fa2dd/ffffff', true);
-- insert into pictures_events (event_id, pic_url, is_active) values ('bc2551cd-0e70-43c9-b73e-77312452faa5', 'http://dummyimage.com/249x100.png/cc0000/ffffff', false);
-- insert into pictures_events (event_id, pic_url, is_active) values ('daea20a6-0e42-4c15-9723-c8b6bf10a222', 'http://dummyimage.com/195x100.png/cc0000/ffffff', false);
-- insert into pictures_events (event_id, pic_url, is_active) values ('83b4ecec-f592-4742-89cc-4f0cb0cabde2', 'http://dummyimage.com/197x100.png/ff4444/ffffff', true);
-- insert into pictures_events (event_id, pic_url, is_active) values ('29901cde-799f-4b9d-b2e8-69f91a231438', 'http://dummyimage.com/155x100.png/cc0000/ffffff', false);
-- insert into pictures_events (event_id, pic_url, is_active) values ('a10e0216-30af-4dd1-aeea-a3851e797e98', 'http://dummyimage.com/158x100.png/5fa2dd/ffffff', false);
-- insert into pictures_events (event_id, pic_url, is_active) values ('d1ea0554-3b0f-45dc-9a93-d94d70cc8e28', 'http://dummyimage.com/133x100.png/dddddd/000000', false);



-- -- POPULATE VENUE PICTURES TABLE
-- insert into pictures_venues (venue_id, pic_url, is_active) values ('3df1dbb6-14db-4063-b84f-1ebadf359efd', 'http://dummyimage.com/112x100.png/ff4444/ffffff', false);
-- insert into pictures_venues (venue_id, pic_url, is_active) values ('e3beca08-58ba-4e6c-b7f8-b615fe54235f', 'http://dummyimage.com/129x100.png/ff4444/ffffff', false);
-- insert into pictures_venues (venue_id, pic_url, is_active) values ('a76c3e17-50a9-429a-80cf-8859601fc296', 'http://dummyimage.com/243x100.png/ff4444/ffffff', true);
-- insert into pictures_venues (venue_id, pic_url, is_active) values ('2b978e91-0ed9-4aa8-ba11-e5ab8af8a9bd', 'http://dummyimage.com/119x100.png/5fa2dd/ffffff', true);
-- insert into pictures_venues (venue_id, pic_url, is_active) values ('67879237-1043-41b7-a955-58df13bb4d06', 'http://dummyimage.com/239x100.png/5fa2dd/ffffff', true);
-- insert into pictures_venues (venue_id, pic_url, is_active) values ('1f23de85-0b74-42ca-aa78-806d6f0d770b', 'http://dummyimage.com/121x100.png/cc0000/ffffff', false);
-- insert into pictures_venues (venue_id, pic_url, is_active) values ('2349b2f6-ab45-47c4-9b43-281cb3da35d1', 'http://dummyimage.com/177x100.png/dddddd/000000', true);
-- insert into pictures_venues (venue_id, pic_url, is_active) values ('b81e5c1b-51cc-496f-b782-ce89e08e4d3d', 'http://dummyimage.com/233x100.png/5fa2dd/ffffff', true);
-- insert into pictures_venues (venue_id, pic_url, is_active) values ('d485580d-0eb4-47e6-a552-e8a90afbff02', 'http://dummyimage.com/214x100.png/5fa2dd/ffffff', false);
-- insert into pictures_venues (venue_id, pic_url, is_active) values ('6db07506-cf8f-4384-8a0a-02cd142028a4', 'http://dummyimage.com/185x100.png/5fa2dd/ffffff', false);



-- --POPULATE VENUEiSSUES TABLE


-- --POPULATE THE CUSTOMER TABLE

-- INSERT INTO customer(user_id,event_id,purchase_status) VALUES('','','F');
-- INSERT INTO customer(user_id,event_id,purchase_status) VALUES('','','F');
-- INSERT INTO customer(user_id,event_id,purchase_status) VALUES('','','F');
-- INSERT INTO customer(user_id,event_id,purchase_status) VALUES('','','F');
-- INSERT INTO customer(user_id,event_id,purchase_status) VALUES('','','F');