# Performance Monitoring & Refinement

## Objective
Continuously monitor and refine database performance by analyzing query execution plans and making schema adjustments. This document records the steps used to measure, identify bottlenecks, implement fixes, and verify improvements.

---

## 1. Setup (useful extensions & tools)

### Enable `pg_stat_statements` (gives aggregated query stats)
Run as a superuser (only once):
```sql
-- in postgresql.conf: add 'pg_stat_statements' to shared_preload_libraries and restart postgres
CREATE EXTENSION IF NOT EXISTS pg_stat_statements;
