-- Topic: SQL JOIN
-- Difficulty: Easy
-- LeetCode 183: Customers Who Never Order
-- https://leetcode.com/problems/customers-who-never-order/

-- Task:
-- Write a solution to find all customers who never order anything.
-- Return the result table in any order.

SELECT c.name
FROM Customers c
LEFT JOIN Orders o
on c.id = o.customerId
WHERE o.id IS NULL

-- Explanation:
-- LEFT JOIN returns all rows from the Customers table.
-- If a customer has no orders, the columns from Orders become NULL.
-- Therefore, filtering with WHERE o.id IS NULL returns customers who never placed an order.