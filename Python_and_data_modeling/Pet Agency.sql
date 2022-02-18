CREATE TABLE "pets" (
  "pet_id" SERIAL PRIMARY KEY,
  "pet_name" VARCHAR(40),
  "pet_age" INTEGER NOT NULL,
  "species_id" INTEGER NOT NULL,
  "breed_id" INTEGER NOT NULL,
  "good_with_kids" BOOLEAN
);

CREATE TABLE "species" (
  "species_id" SERIAL PRIMARY KEY,
  "species_name" VARCHAR(40)
);

CREATE TABLE "breed" (
  "breed_id" SERIAL PRIMARY KEY,
  "species_id" INTEGER NOT NULL,
  "breed_size" VARCHAR(20) NOT NULL,
  "breed_energy" VARCHAR(20) NOT NULL,
  "breed_dependency" VARCHAR(20) NOT NULL
);

CREATE TABLE "special_conditions" (
  "condition_id" SERIAL PRIMARY KEY,
  "condition_name" VARCHAR(40) NOT NULL,
  "condition_needs" VARCHAR(2500) NOT NULL
);

CREATE TABLE "pet_special_conditions" (
  "pet_special_conditions_id" SERIAL PRIMARY KEY,
  "condition_id" INTEGER NOT NULL,
  "pet_id" INTEGER NOT NULL
);

CREATE TABLE "owner_special_conditions" (
  "owner_special_conditions_id" SERIAL PRIMARY KEY,
  "condition_id" INTEGER NOT NULL,
  "owner_id" INTEGER NOT NULL
);

CREATE TABLE "owners" (
  "owner_id" SERIAL PRIMARY KEY,
  "owner_name" VARCHAR(50),
  "has_kids" BOOLEAN NOT NULL,
  "desired_species_id" INTEGER,
  "desired_breed_id" INTEGER,
  "desired_size" VARCHAR(20),
  "desired_energy" VARCHAR(20),
  "desired_dependency" VARCHAR(20)
);

ALTER TABLE "pets" ADD FOREIGN KEY ("species_id") REFERENCES "species" ("species_id");

ALTER TABLE "pets" ADD FOREIGN KEY ("breed_id") REFERENCES "breed" ("breed_id");

ALTER TABLE "breed" ADD FOREIGN KEY ("species_id") REFERENCES "species" ("species_id");

ALTER TABLE "pet_special_conditions" ADD FOREIGN KEY ("condition_id") REFERENCES "special_conditions" ("condition_id");

ALTER TABLE "pet_special_conditions" ADD FOREIGN KEY ("pet_id") REFERENCES "pets" ("pet_id");

ALTER TABLE "owner_special_conditions" ADD FOREIGN KEY ("condition_id") REFERENCES "special_conditions" ("condition_id");

ALTER TABLE "owner_special_conditions" ADD FOREIGN KEY ("owner_id") REFERENCES "owners" ("owner_id");

ALTER TABLE "owners" ADD FOREIGN KEY ("desired_species_id") REFERENCES "species" ("species_id");

ALTER TABLE "owners" ADD FOREIGN KEY ("desired_breed_id") REFERENCES "breed" ("breed_id");
