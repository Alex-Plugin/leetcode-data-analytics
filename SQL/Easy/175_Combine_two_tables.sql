-- Topic: SQL JOIN
-- Difficulty: Easy
-- LeetC ode 175: Combine Two Tables
-- https://leetcode.com/problems/combine-two-tables/

-- Task:
-- Report the first name, last name, city, and state of each person.
-- If the address is missing, return NULL.

-- Solution:

SELECT
    p.firstName,
    p.lastName,
    a.city,
    a.state
FROM Person p
LEFT JOIN Address a
    on p.personId = a.personId

-- Explanation:
-- LEFT JOIN is used to return all rows from the Person table.
-- If a person does not have a corresponding address, city and state will be NULL.

