CREATE TABLE item_bought (
    buyer TEXT NOT NULL,
    item TEXT NOT NULL
);

INSERT INTO item_bought (buyer, item) VALUES
('A', 'Asus'),
('B', 'Lenovo'),
('C', 'Lenovo'),
('D', 'Acer'),
('E', 'Acer'),
('F', 'Acer');

SELECT item FROM (
  SELECT item, COUNT(*) AS total
  FROM item_bought
  GROUP BY item
)
WHERE total != (
    SELECT COUNT(*)
    FROM item_bought
    GROUP BY item
    ORDER BY COUNT(*) DESC
    LIMIT 1
)
AND total != (
    SELECT COUNT(*)
    FROM item_bought
    GROUP BY item
    ORDER BY COUNT(*) ASC
    LIMIT 1
);