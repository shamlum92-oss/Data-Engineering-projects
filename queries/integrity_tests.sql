-- Foreign Key & Referential Integrity Verification
INSERT INTO authors (first_name, last_name) VALUES ('Test', 'Author');
INSERT INTO books (title, price, published_year) VALUES ('Test Book', 19.99, 2026);
INSERT INTO book_authors (book_id, author_id) VALUES (1, 1);

-- Test CASCADE Delete
DELETE FROM authors WHERE author_id = 1;

-- Confirm child record auto-deleted (Returns 0 rows)
SELECT * FROM book_authors WHERE author_id = 1;