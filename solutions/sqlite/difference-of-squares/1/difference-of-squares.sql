-- Schema: CREATE TABLE "difference-of-squares" ("number" INT, "property" TEXT, "result" INT);
-- Task: update the difference-of-squares table and set the result based on the number and property fields.
WITH RECURSIVE nums(x) AS (
  SELECT 1
  UNION ALL
  SELECT x+1 FROM nums WHERE x < (SELECT MAX(number) FROM "difference-of-squares")
)
UPDATE "difference-of-squares"
SET result = CASE property
    WHEN 'squareOfSum'         THEN ((number*(number+1))/2) * ((number*(number+1))/2)
    WHEN 'sumOfSquares'        THEN (number*(number+1)*(2*number+1))/6
    WHEN 'differenceOfSquares' THEN ((number*(number+1))/2) * ((number*(number+1))/2) - (number*(number+1)*(2*number+1))/6
  END;

