--liquibase formatted sql

--changeset adrianhawkins:add-mock-users
INSERT INTO "Users" ("userProfilePicture", "email", "isDeleted") VALUES ('1', 'user1@example.com', FALSE);
INSERT INTO "Users" ("userProfilePicture", "email", "isDeleted") VALUES ('2', 'user2@example.com', FALSE);
INSERT INTO "Users" ("userProfilePicture", "email", "isDeleted") VALUES ('3', 'user3@example.com', FALSE);
INSERT INTO "Users" ("userProfilePicture", "email", "isDeleted") VALUES ('4', 'user4@example.com', FALSE);
INSERT INTO "Users" ("userProfilePicture", "email", "isDeleted") VALUES ('5', 'user5@example.com', FALSE);
-- rollback DELETE FROM "Users" WHERE "email" IN ('user1@example.com', 'user2@example.com', 'user3@example.com', 'user4@example.com', 'user5@example.com');
