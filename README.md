# 📚 eBook Catalog & Inventory Relational Engine

A normalized relational database schema designed for managing an eBook catalog, author attributions, and inventory tracking. Built and tested on MariaDB / MySQL using InnoDB engine constraints.

## 🛠️ Tech Stack & Concepts
* **Database Engine:** MariaDB / MySQL (InnoDB)
* **GUI Tooling:** phpMyAdmin
* **Key Architecture Features:**
  * **Entity Integrity:** Primary Keys with `AUTO_INCREMENT` and `NOT NULL` constraints across master tables (`authors`, `books`).
  * **Relational Mapping:** Junction table (`book_authors`) modeling a Many-to-Many (M:N) relationship between titles and co-authors.
  * **Referential Integrity:** Foreign keys with `ON DELETE CASCADE` and `ON UPDATE RESTRICT` rules to prevent orphaned records.

## 📊 Database Schema Overview

* **authors**: `author_id` (PK, AI), `first_name` (NOT NULL), `last_name`
* **books**: `book_id` (PK, AI), `title` (NOT NULL), `price` (NOT NULL), `published_year`
* **book_authors**: `book_id` (FK -> books.book_id), `author_id` (FK -> authors.author_id)

## 🧪 Referential Integrity Verification
The schema's `CASCADE` delete behavior was verified by creating relational entries and executing an author deletion:

```sql
-- Deleting an author automatically cascades to the junction table
DELETE FROM authors WHERE author_id = 1;

-- Verification query returns 0 rows (orphaned foreign key successfully purged)
SELECT * FROM book_authors WHERE author_id = 1;