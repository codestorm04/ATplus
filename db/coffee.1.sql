
BEGIN TRANSACTION;
DROP TABLE IF EXISTS "schema_migrations";
CREATE TABLE "schema_migrations" ("version" varchar NOT NULL);
INSERT INTO "schema_migrations" VALUES('20151218085456');
INSERT INTO "schema_migrations" VALUES('20151218085827');
INSERT INTO "schema_migrations" VALUES('20151218085907');
INSERT INTO "schema_migrations" VALUES('20151218085936');
INSERT INTO "schema_migrations" VALUES('20151218085956');
INSERT INTO "schema_migrations" VALUES('20151218090352');
INSERT INTO "schema_migrations" VALUES('20151218090434');
INSERT INTO "schema_migrations" VALUES('20151218090627');
INSERT INTO "schema_migrations" VALUES('20151222080709');
INSERT INTO "schema_migrations" VALUES('20151222144418');
INSERT INTO "schema_migrations" VALUES('20151222144914');
INSERT INTO "schema_migrations" VALUES('20151223074312');
INSERT INTO "schema_migrations" VALUES('20151223095224');
INSERT INTO "schema_migrations" VALUES('20151228143419');
INSERT INTO "schema_migrations" VALUES('20160106130208');
INSERT INTO "schema_migrations" VALUES('20160105144540');
INSERT INTO "schema_migrations" VALUES('20160105150515');
INSERT INTO "schema_migrations" VALUES('20160113122646');
INSERT INTO "schema_migrations" VALUES('20160113133639');
INSERT INTO "schema_migrations" VALUES('20160119081715');
INSERT INTO "schema_migrations" VALUES('20160119081901');
INSERT INTO "schema_migrations" VALUES('20160119084045');

DROP TABLE IF EXISTS "users";
CREATE TABLE "users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "email" varchar, "name" varchar, "admin" integer, "sex" integer, "institute" varchar, "phonenumber" varchar, "field" varchar, "obligate1" varchar, "obligate2" varchar, "obligate3" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "password_digest" varchar);
INSERT INTO "users" VALUES(14,'codestorm04@163.com','zhen',0,1,'ISCAS','1111111121','computer archtechture/design',NULL,NULL,NULL,'2016-01-20 06:37:04.430723','2016-01-20 06:37:04.430723','$2a$10$n4OuMzdfDn1nn5BEXxYNTu84PDP5tKzbNpZpb8Ikj.t/l3XL2GYpu');

DROP TABLE IF EXISTS "fields";
CREATE TABLE "fields" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "level" integer, "fatherid" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);

DROP TABLE IF EXISTS "articles";
CREATE TABLE "articles" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "title" varchar, "path" varchar, "keyword" varchar, "publication" varchar, "field" varchar, "author" varchar, "obligate1" varchar, "obligate2" varchar, "obligate3" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
INSERT INTO "articles" VALUES(19,'Mining Software Repair Models for Reasoning on 1311.3414.pdf','../ATplus/public/articles/''Mining Software Repair Models for Reasoning on 1311.3414.pdf''',NULL,NULL,'software','sdfsa',NULL,NULL,NULL,'2016-01-20 07:26:35.650549','2016-01-20 07:26:35.650549');

DROP TABLE IF EXISTS "likes";
CREATE TABLE "likes" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "liketype" varchar, "useremail" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "question_id" integer, "answer_id" integer, "user_id" integer);

DROP TABLE IF EXISTS "questions";
CREATE TABLE "questions" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "title" varchar, "content" varchar, "article_id" integer, "field" varchar, "filepath" varchar, "liker" varchar, "obligate1" varchar, "obligate2" varchar, "obligate3" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "state" integer, "user_id" integer);
INSERT INTO "questions" VALUES(32,'sfas','saaaasssssssssss',19,'software',NULL,NULL,NULL,NULL,NULL,'2016-01-20 07:26:42.196078','2016-01-20 07:26:42.196078',NULL,14);
INSERT INTO "questions" VALUES(33,'A Survey of Test Suite-Based Automatic Program Repair.3.0','PG::DatatypeMismatch: ERROR:  column "state" cannot be cast automatically to type integer',19,'software',NULL,NULL,NULL,NULL,NULL,'2016-01-20 07:51:51.417846','2016-01-20 07:51:51.417846',NULL,14);

DROP TABLE IF EXISTS "answers";
CREATE TABLE "answers" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "question_id" integer, "level" integer, "title" varchar, "content" varchar, "filepath" varchar, "liker" varchar, "obligate1" varchar, "obligate2" varchar, "obligate3" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "toreply_id" integer, "user_id" integer);
INSERT INTO "answers" VALUES(84,33,1,NULL,'sadasfdsds',NULL,NULL,NULL,NULL,NULL,'2016-01-20 07:52:00.562037','2016-01-20 07:52:00.562037',NULL,14);
INSERT INTO "answers" VALUES(85,33,2,NULL,'sds',NULL,NULL,NULL,NULL,NULL,'2016-01-20 07:52:06.462860','2016-01-20 07:52:06.462860',0,14);
DELETE FROM sqlite_sequence;
INSERT INTO "sqlite_sequence" VALUES('articles',19);
INSERT INTO "sqlite_sequence" VALUES('users',14);
INSERT INTO "sqlite_sequence" VALUES('fields',2);
INSERT INTO "sqlite_sequence" VALUES('likes',51);
INSERT INTO "sqlite_sequence" VALUES('questions',33);
INSERT INTO "sqlite_sequence" VALUES('answers',85);
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
CREATE UNIQUE INDEX "index_users_on_email" ON "users" ("email");
COMMIT;
