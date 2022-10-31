-- CreateTable
CREATE TABLE "Candidates" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Applications" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "candidateId" INTEGER NOT NULL,
    CONSTRAINT "Applications_candidateId_fkey" FOREIGN KEY ("candidateId") REFERENCES "Candidates" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "ApplicationInfo" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "questionId" INTEGER NOT NULL,
    "userAnswer" TEXT,
    "comment" TEXT,
    "applicationsId" INTEGER NOT NULL,
    CONSTRAINT "ApplicationInfo_applicationsId_fkey" FOREIGN KEY ("applicationsId") REFERENCES "Applications" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "ApplicationInfo_questionId_fkey" FOREIGN KEY ("questionId") REFERENCES "Questions" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Questions" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "question" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "Applications_candidateId_key" ON "Applications"("candidateId");

-- CreateIndex
CREATE UNIQUE INDEX "ApplicationInfo_questionId_applicationsId_key" ON "ApplicationInfo"("questionId", "applicationsId");

-- CreateIndex
CREATE UNIQUE INDEX "ApplicationInfo_applicationsId_key" ON "ApplicationInfo"("applicationsId");
