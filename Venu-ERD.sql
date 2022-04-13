CREATE TABLE "users" (
  "id" uuid PRIMARY KEY NOT NULL,
  "name" varchar,
  "created_at" timestamp,
  "email" string,
  "password" string,
  "last_logged" string,
  "updated_at" string,
  "active" boolean,
  "user_type" enum,
  "phone" string
);

CREATE TABLE "hosts" (
  "id" uuid PRIMARY KEY,
  "user_id" string
);

CREATE TABLE "venues" (
  "id" uuid PRIMARY KEY,
  "name" varchar UNIQUE NOT NULL,
  "location" string NOT NULL,
  "host_id" string,
  "Property1" string,
  "Property2" string,
  "Property3" string,
  "Property4" string,
  "Property5" string,
  "created_at" timestamp,
  "updated_at" string
);

CREATE TABLE "event" (
  "id" uuid PRIMARY KEY,
  "name" varchar[unique],
  "location" string,
  "bookee_id" string,
  "event_host_id" string,
  "created_at" timestamp,
  "type" enum,
  "entryPrice" int,
  "start_date" datetime,
  "duration" datetime,
  "start_time" timestamp,
  "promotionalDetails" string
);

CREATE TABLE "user_types" (
  "id" SERIAL PRIMARY KEY,
  "type" varchar(30)
);

CREATE TABLE "user_user_types" (
  "user_id" uuid,
  "user_type_id" varchar(30)
);

CREATE TABLE "bookees" (
  "id" uuid PRIMARY KEY,
  "venues_id" string
);

CREATE TABLE "customers" (
  "id" uuid PRIMARY KEY,
  "customer_event_id" string
);

CREATE TABLE "vendor" (
  "id" iuuid PRIMARY KEY,
  "vendor_event_id" string,
  "name" varchar,
  "created_at" timestamp,
  "product_name" enum,
  "product_url_link" string
);

ALTER TABLE "hosts" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "users" ADD FOREIGN KEY ("id") REFERENCES "hosts" ("id");

ALTER TABLE "venues" ADD FOREIGN KEY ("host_id") REFERENCES "hosts" ("id");

ALTER TABLE "bookees" ADD FOREIGN KEY ("id") REFERENCES "event" ("bookee_id");

ALTER TABLE "event" ADD FOREIGN KEY ("event_host_id") REFERENCES "hosts" ("id");

ALTER TABLE "user_user_types" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "user_user_types" ADD FOREIGN KEY ("user_type_id") REFERENCES "user_types" ("id");

ALTER TABLE "venues" ADD FOREIGN KEY ("id") REFERENCES "bookees" ("venues_id");

ALTER TABLE "bookees" ADD FOREIGN KEY ("id") REFERENCES "hosts" ("id");

ALTER TABLE "customers" ADD FOREIGN KEY ("customer_event_id") REFERENCES "event" ("id");

ALTER TABLE "vendor" ADD FOREIGN KEY ("vendor_event_id") REFERENCES "event" ("id");
