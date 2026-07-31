# Olist E-Commerce SQL Analysis

End-to-end SQL analysis of 100K real Brazilian e-commerce orders — customer segmentation, cohort retention, revenue trends, seller performance, and operations metrics — translating business questions into actionable findings.

## Headline findings
- Monthly revenue grew from R$138,488 in Jan 2017 to a peak of R$1,194,883 in Nov 2017, an increase of 762.8%, before easing to R$878,401 in Dec 2017.
- 32.38% of customers fall into the "At-Risk" RFM segment, representing R$5,013,170.04 in recoverable revenue.
- Orders delivered within 7 days average 4.41 stars, while orders delivered after 30 days average 3.17 stars.
- The top 10 product categories generated R$9.62M in revenue and accounted for 63.2% of total delivered revenue.

## What's in this repo
- `sql/` — 8 numbered analytical SQL files, each answering one business question
- `docs/findings.md` — executive summary of every query's finding
- `docs/ER_diagram.png` — schema diagram

## Tech
SQL · MySQL · Window functions (LAG, NTILE, RANK, FIRST_VALUE) · CTEs · multi-table joins · Python for data load

## How to run
1. Download the Olist dataset from Kaggle into `data/` (see `data/README.md`)
2. Open MySQL Workbench and create the database by running `sql/00_setup_database.sql`.
3. Load each CSV file into MySQL using MySQL Workbench's Table Data Import Wizard.
4. If needed, run the date column fix in `sql/00_setup_database.sql`.
5. Run the analytical SQL files in the `sql/` folder one by one.

## Author
Hamza Qureshi
