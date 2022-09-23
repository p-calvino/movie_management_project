# Movie Management Exercise

### List all the actors born before 1980.

```sql
+----+-----------------------+---------------+------+
| id | name                  | year_of_birth | sex  |
+----+-----------------------+---------------+------+
|  1 | Arnold Schwarzenegger |          1947 | M    |
|  3 | Sigourney Weaver      |          1949 | F    |
|  4 | Christian Bale        |          1974 | M    |
|  5 | Leonardo DiCaprio     |          1974 | M    |
|  6 | Angelina Jolie        |          1975 | M    |
|  7 | Zoe Saldaña           |          1978 | F    |
+----+-----------------------+---------------+------+
```
### How many movies did Nolan direct?

```sql
+----------+
| COUNT(*) |
+----------+
|        2 |
+----------+
```
### Among all the movies of James Cameron, how many were female actors?

```sql
+----------+
| COUNT(*) |
+----------+
|        3 |
+----------+
```
### How many directors did Leonardo DiCaprio worked with?

```sql
+----------+
| COUNT(*) |
+----------+
|        2 |
+----------+
```
### Who is the oldest director?

```sql
+---------------+
| name          |
+---------------+
| James Cameron |
+---------------+
```
### What is the earliest movie of the first director?

```sql
+------------+
| title      |
+------------+
| Terminator |
+------------+
```
### What is the latest movie of the youngest actor?

```sql
+-----------+
| title     |
+-----------+
| Cleopatra |
+-----------+
```

