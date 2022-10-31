/*
  Warnings:

  - You are about to drop the `ApplicationInfo` table. If the table is not empty, all the data it contains will be lost.

*/
-- AlterTable
ALTER TABLE "Applications" ADD COLUMN "resumeImageLink" TEXT;

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "ApplicationInfo";
PRAGMA foreign_keys=on;

-- CreateTable
CREATE TABLE "ApplicationQuestionResponses" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "questionId" INTEGER NOT NULL,
    "userAnswer" TEXT,
    "comment" TEXT,
    "applicationsId" INTEGER NOT NULL,
    CONSTRAINT "ApplicationQuestionResponses_applicationsId_fkey" FOREIGN KEY ("applicationsId") REFERENCES "Applications" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "ApplicationQuestionResponses_questionId_fkey" FOREIGN KEY ("questionId") REFERENCES "Questions" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateIndex
CREATE UNIQUE INDEX "ApplicationQuestionResponses_questionId_applicationsId_key" ON "ApplicationQuestionResponses"("questionId", "applicationsId");

-- CreateIndex
CREATE UNIQUE INDEX "ApplicationQuestionResponses_applicationsId_key" ON "ApplicationQuestionResponses"("applicationsId");
