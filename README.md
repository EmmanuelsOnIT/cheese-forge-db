# CheeseForge Database

This repository contains the SQLite database and schema for the CheeseForge cheese-making management system.

## Summary

The CheeseForge database is designed to support a comprehensive cheese-making management system. It includes:
- A robust user management system with role-based access control
- Detailed cheese type and category management
- Complete recipe and ingredient tracking
- Equipment and process management
- Production batch tracking with quality control
- Aging and storage management
- Monitoring and alert systems
- Knowledge base for troubleshooting and learning

## Files

- `cheese_db_sqlite.sql`: The SQLite database schema
- `CheeseForge Sample Data.sql`: Sample data for the database
- `cheesy.db`: The SQLite database file with sample data loaded

## Database Structure

The database contains tables for:
- User management (users, roles)
- Cheese types and categories
- Recipes and ingredients
- Equipment management
- Process management
- Production batches
- Quality control
- Aging and storage
- Monitoring and alerts
- Knowledge base
- And more...

## Summary
1. Cheese Library tables:
   - `cheese_types`
   - `cheese_categories`
   - `cheese_type_categories`

2. Recipe and Ingredient Management tables:
   - `ingredients`
   - `recipes`
   - `recipe_ingredients`

3. Equipment Management tables:
   - `equipment`
   - `recipe_equipment`

4. Process Management tables:
   - `process_templates`
   - `process_steps`
   - `substeps`

5. Production Batches tables:
   - `batches`
   - `batch_ingredients`
   - `batch_steps`
   - `step_measurements`

6. User Comments and Notes:
   - `comments`

7. Reminders and Notifications:
   - `reminder_templates`
   - `reminders`

8. Monitoring and Alerts:
   - `sensor_devices`
   - `alert_rules`
   - `alerts`

9. Quality Control and Assessment:
    - `quality_tests`
    - `batch_tests`

10. Aging and Storage:
    - `aging_locations`
    - `aging_batches`
    - `aging_activities`

11. Audit Trail:
    - `audit_logs`

12. Integration with External Systems:
    - `sensor_readings`

13. Knowledge Base and Learning:
    - `knowledge_articles`
    - `troubleshooting_issues`

14. Batch Reports and Analysis:
    - `batch_reports`

15. Community and Collaboration:
    - `batch_sharing`


## Getting Started

1. Clone this repository
2. Use the database file `cheesy.db` directly with SQLite
3. Or recreate the database using the schema and sample data files

## Requirements

- SQLite 3 or higher
- Python 3.x (for running the sample data loading scripts)

## License

This project is licensed under the MIT License - see the LICENSE file for details. 