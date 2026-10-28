Files and data rows:
customers_raw.csv 25
technicians_raw.csv 10
devices_raw.csv 25
repair_jobs_raw.csv 35
parts_raw.csv 12
job_parts_raw.csv 33
TOTAL 140 data rows (excluding headers)

These files are raw exports, not an SQL schema and not guaranteed to import without review. Some values blank, and some descriptive values are repeated. 

HINT: Before creating NOT NULL or FOREIGN KEY constraints, inspect empty fields and match IDs between exports. Decide what can be NULL, what must be checked with the business, and what must be temporarily excluded from an import. Record those decisions in your submission.
