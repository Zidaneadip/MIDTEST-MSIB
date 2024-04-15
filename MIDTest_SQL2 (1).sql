CREATE TABLE item_bought (
    buyer TEXT NOT NULL,
    item TEXT NOT NULL
);

INSERT INTO item_bought (buyer, item) VALUES
('Abdul', 'iPhone'),
('Budi', 'Samsung'),
('Charlie', 'Realme'),
('Dimas', 'Realme'),
('Erik', 'Samsung'),
('Fikri', 'Realme'),
('Gerry', 'Huawei'),
('Hans', 'Huawei'),
('Ihsan', 'Huawei'),
('Jerome', 'Realme'),
('Kevin', 'Huawei');
SELECT * FROM item_bought;

SELECT item
FROM (
    SELECT item, COUNT(*) AS total_bought
    FROM item_bought
    GROUP BY item
) AS counts
WHERE total_bought NOT IN (
    SELECT MAX(cnt)
    FROM (
        SELECT COUNT(*) AS cnt
        FROM item_bought
        GROUP BY item
    ) AS max_counts
    UNION ALL
    SELECT MIN(cnt)
    FROM (
        SELECT COUNT(*) AS cnt
        FROM item_bought
        GROUP BY item
    ) AS min_counts
);
