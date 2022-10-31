/*
  Warnings:

  - You are about to drop the column `applicationsId` on the `ApplicationQuestionResponses` table. All the data in the column will be lost.
  - Added the required column `applicationId` to the `ApplicationQuestionResponses` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_ApplicationQuestionResponses" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "questionId" INTEGER NOT NULL,
    "userAnswer" TEXT,
    "comment" TEXT,
    "applicationId" INTEGER NOT NULL,
    CONSTRAINT "ApplicationQuestionResponses_applicationId_fkey" FOREIGN KEY ("applicationId") REFERENCES "Applications" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "ApplicationQuestionResponses_questionId_fkey" FOREIGN KEY ("questionId") REFERENCES "Questions" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_ApplicationQuestionResponses" ("comment", "id", "questionId", "userAnswer") SELECT "comment", "id", "questionId", "userAnswer" FROM "ApplicationQuestionResponses";
DROP TABLE "ApplicationQuestionResponses";
ALTER TABLE "new_ApplicationQuestionResponses" RENAME TO "ApplicationQuestionResponses";
CREATE UNIQUE INDEX "ApplicationQuestionResponses_questionId_applicationId_key" ON "ApplicationQuestionResponses"("questionId", "applicationId");
CREATE UNIQUE INDEX "ApplicationQuestionResponses_applicationId_key" ON "ApplicationQuestionResponses"("applicationId");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
