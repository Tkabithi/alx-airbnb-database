# SQL Joins - Airbnb Database

## Objective
Practice different types of SQL joins using the Airbnb schema.

---

### 1. INNER JOIN
**Query:**  
Retrieves all bookings and the users who made those bookings.

```sql
SELECT b.booking_id, b.start_date, b.end_date, b.total_price, 
       u.first_name, u.last_name, u.email
FROM bookings b
INNER JOIN users u ON b.users_id = u.users_id;
