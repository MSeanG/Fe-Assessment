/*
  Warnings:

  - You are about to drop the `ApplicationQuestionResponses` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "ApplicationQuestionResponses";
PRAGMA foreign_keys=on;

-- CreateTable
CREATE TABLE "ApplicationResponses" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "questionId" INTEGER NOT NULL,
    "userAnswer" TEXT,
    "comment" TEXT,
    "applicationId" INTEGER NOT NULL,
    CONSTRAINT "ApplicationResponses_applicationId_fkey" FOREIGN KEY ("applicationId") REFERENCES "Applications" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "ApplicationResponses_questionId_fkey" FOREIGN KEY ("questionId") REFERENCES "Questions" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateIndex
CREATE UNIQUE INDEX "ApplicationResponses_questionId_applicationId_key" ON "ApplicationResponses"("questionId", "applicationId");

-- CreateIndex
CREATE UNIQUE INDEX "ApplicationResponses_applicationId_key" ON "ApplicationResponses"("applicationId");
