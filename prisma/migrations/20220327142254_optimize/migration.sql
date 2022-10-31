/*
  Warnings:

  - The primary key for the `Applications` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `id` on the `Applications` table. All the data in the column will be lost.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_ApplicationResponses" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "questionId" INTEGER NOT NULL,
    "userAnswer" TEXT,
    "comment" TEXT,
    "applicationId" INTEGER NOT NULL,
    CONSTRAINT "ApplicationResponses_applicationId_fkey" FOREIGN KEY ("applicationId") REFERENCES "Applications" ("candidateId") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "ApplicationResponses_questionId_fkey" FOREIGN KEY ("questionId") REFERENCES "Questions" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_ApplicationResponses" ("applicationId", "comment", "id", "questionId", "userAnswer") SELECT "applicationId", "comment", "id", "questionId", "userAnswer" FROM "ApplicationResponses";
DROP TABLE "ApplicationResponses";
ALTER TABLE "new_ApplicationResponses" RENAME TO "ApplicationResponses";
CREATE UNIQUE INDEX "ApplicationResponses_questionId_applicationId_key" ON "ApplicationResponses"("questionId", "applicationId");
CREATE TABLE "new_Applications" (
    "candidateId" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "resume" TEXT,
    CONSTRAINT "Applications_candidateId_fkey" FOREIGN KEY ("candidateId") REFERENCES "Candidates" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Applications" ("candidateId", "resume") SELECT "candidateId", "resume" FROM "Applications";
DROP TABLE "Applications";
ALTER TABLE "new_Applications" RENAME TO "Applications";
CREATE UNIQUE INDEX "Applications_candidateId_key" ON "Applications"("candidateId");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
