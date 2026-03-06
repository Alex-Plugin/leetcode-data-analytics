-- Topic: SQL Subquery and JOIN (Self JOIN)
-- Difficulty: Easy
-- LeetC ode 196: Combine Two Tables
-- https://leetcode.com/problems/delete-duplicate-emails/

-- Task:
-- Write a solution to delete all duplicate emails, keeping only one unique email with the smallest id.
-- For SQL users, please note that you are supposed to write a DELETE statement and not a SELECT one.
-- For Pandas users, please note that you are supposed to modify Person in place.
-- After running your script, the answer shown is the Person table. The driver will first compile and run
-- your piece of code and then show the Person table. The final order of the Person table does not matter.

DELETE FROM Person
WHERE id NOT IN (
    SELECT id FROM (
        SELECT MIN(id)
        FROM Person
        GROUP BY email
    ) AS temp
);

-- Explanation for a subquery solution:
-- 1. First, we create a subquery on the Person table, grouping rows by email.
-- 2. Using the aggregation function MIN(), we get the smallest id for each email.
-- 3. We wrap this result into a temporary table alias temp to avoid MySQL errors.
-- 4. Then, in the outer DELETE, any id not in temp is removed, deleting duplicate emails.
-- 5. Thus, only rows with unique emails (keeping the smallest id) remain.

DELETE p1
FROM Person p1
JOIN Person p2
  ON p1.email = p2.email
 AND p1.id > p2.id;

-- Explanation for a self-JOIN solution:
-- 1. We join the Person table with itself (`p1` and `p2`) on the email column.
-- 2. For each pair of rows with the same email, we compare their ids.
-- 3. The condition `p1.id > p2.id` ensures that we only mark the rows with higher ids (duplicates) for deletion.
-- 4. The DELETE statement removes all such rows, leaving only the row with the smallest id for each email.
