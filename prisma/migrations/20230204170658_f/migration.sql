/*
  Warnings:

  - You are about to drop the column `prepTime` on the `Recipe` table. All the data in the column will be lost.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Recipe" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "prepartionTime" INTEGER,
    "cookTime" INTEGER,
    "instructions" TEXT NOT NULL,
    "recipesIngredientsId" INTEGER,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deletedAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "Recipe_recipesIngredientsId_fkey" FOREIGN KEY ("recipesIngredientsId") REFERENCES "RecipesIngredients" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);
INSERT INTO "new_Recipe" ("cookTime", "createdAt", "deletedAt", "id", "instructions", "name", "recipesIngredientsId", "updatedAt") SELECT "cookTime", "createdAt", "deletedAt", "id", "instructions", "name", "recipesIngredientsId", "updatedAt" FROM "Recipe";
DROP TABLE "Recipe";
ALTER TABLE "new_Recipe" RENAME TO "Recipe";
CREATE UNIQUE INDEX "Recipe_name_key" ON "Recipe"("name");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
