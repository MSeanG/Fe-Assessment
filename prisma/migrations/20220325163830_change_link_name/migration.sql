/*
  Warnings:

  - You are about to drop the column `resumeImage` on the `Applications` table. All the data in the column will be lost.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Applications" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "candidateId" INTEGER NOT NULL,
    "resume" TEXT,
    CONSTRAINT "Applications_candidateId_fkey" FOREIGN KEY ("candidateId") REFERENCES "Candidates" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Applications" ("candidateId", "id") SELECT "candidateId", "id" FROM "Applications";
DROP TABLE "Applications";
ALTER TABLE "new_Applications" RENAME TO "Applications";
CREATE UNIQUE INDEX "Applications_candidateId_key" ON "Applications"("candidateId");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
