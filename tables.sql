--liquibase formatted sql

--changeset ljordaan:create-users-table
CREATE TABLE "Users" (
    "userId" SERIAL PRIMARY KEY,
    "userProfilePicture" TEXT,
    "email" TEXT UNIQUE NOT NULL,
    "isDeleted" BOOLEAN DEFAULT FALSE
);
-- rollback DROP TABLE "Users";

--changeset ljordaan:create-boards-table
CREATE TABLE "Boards" (
    "boardId" SERIAL PRIMARY KEY,
    "userId" INTEGER REFERENCES "Users"("userId"),
    "boardCollaborators" INTEGER[],
    "boardName" TEXT,
    "boardCreateDate" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    "isPublic" BOOLEAN DEFAULT FALSE,
    "isDeleted" BOOLEAN DEFAULT FALSE
);
-- rollback DROP TABLE "Boards";

--changeset ljordaan:create-lists-table
CREATE TABLE "Lists" (
    "listId" SERIAL PRIMARY KEY,
    "userId" INTEGER REFERENCES "Users"("userId"),
    "boardId" INTEGER REFERENCES "Boards"("boardId"),
    "listName" TEXT,
    "listCreateDate" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    "isDeleted" BOOLEAN DEFAULT FALSE
);
-- rollback DROP TABLE "Lists";

--changeset ljordaan:create-tickets-table
CREATE TABLE "Tickets" (
    "ticketId" SERIAL PRIMARY KEY,
    "userId" INTEGER REFERENCES "Users"("userId"),
    "listId" INTEGER REFERENCES "Lists"("listId"),
    "ticketName" TEXT,
    "ticketDescription" TEXT,
    "ticketCreateDate" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    "ticketUpdateDate" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    "assignedUser" INTEGER REFERENCES "Users"("userId"),
    "ticketDueDate" TIMESTAMP,
    "isDeleted" BOOLEAN DEFAULT FALSE
);
-- rollback DROP TABLE "Tickets";