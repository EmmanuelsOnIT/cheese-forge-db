-- CheeseForge: Professional Cheese-Making Management System Database
-- SQLite Version

-- User Management
CREATE TABLE roles (
    role_id INTEGER PRIMARY KEY AUTOINCREMENT,
    role_name TEXT NOT NULL,
    description TEXT,
    permissions TEXT
);

CREATE TABLE users (
    user_id INTEGER PRIMARY KEY AUTOINCREMENT,
    username TEXT UNIQUE NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password_hash TEXT NOT NULL,
    first_name TEXT,
    last_name TEXT,
    profile_image_url TEXT,
    bio TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_login TIMESTAMP,
    role_id INTEGER,
    is_active INTEGER DEFAULT 1,
    FOREIGN KEY (role_id) REFERENCES roles(role_id)
);

-- Cheese Library
CREATE TABLE cheese_types (
    cheese_type_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    description TEXT,
    origin TEXT,
    milk_type TEXT,
    texture TEXT,
    flavor_profile TEXT,
    aging_time_min INTEGER,
    aging_time_max INTEGER,
    difficulty_level INTEGER,
    image_url TEXT,
    created_by INTEGER,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (created_by) REFERENCES users(user_id)
);

CREATE TABLE cheese_categories (
    category_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    description TEXT
);

CREATE TABLE cheese_type_categories (
    cheese_type_id INTEGER,
    category_id INTEGER,
    PRIMARY KEY (cheese_type_id, category_id),
    FOREIGN KEY (cheese_type_id) REFERENCES cheese_types(cheese_type_id),
    FOREIGN KEY (category_id) REFERENCES cheese_categories(category_id)
);

-- Recipe and Ingredient Management
CREATE TABLE ingredients (
    ingredient_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    description TEXT,
    category TEXT,
    units_of_measure TEXT,
    storage_guidelines TEXT,
    shelf_life_days INTEGER,
    image_url TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE recipes (
    recipe_id INTEGER PRIMARY KEY AUTOINCREMENT,
    cheese_type_id INTEGER,
    name TEXT NOT NULL,
    description TEXT,
    yield_amount REAL,
    yield_unit TEXT,
    difficulty_level INTEGER,
    total_time_minutes INTEGER,
    notes TEXT,
    is_public INTEGER DEFAULT 0,
    version TEXT,
    created_by INTEGER,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (cheese_type_id) REFERENCES cheese_types(cheese_type_id),
    FOREIGN KEY (created_by) REFERENCES users(user_id)
);

CREATE TABLE recipe_ingredients (
    recipe_ingredient_id INTEGER PRIMARY KEY AUTOINCREMENT,
    recipe_id INTEGER,
    ingredient_id INTEGER,
    quantity REAL,
    unit TEXT,
    preparation_notes TEXT,
    is_optional INTEGER DEFAULT 0,
    substitution_notes TEXT,
    FOREIGN KEY (recipe_id) REFERENCES recipes(recipe_id),
    FOREIGN KEY (ingredient_id) REFERENCES ingredients(ingredient_id)
);

-- Equipment Management
CREATE TABLE equipment (
    equipment_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    description TEXT,
    category TEXT,
    usage_instructions TEXT,
    cleaning_instructions TEXT,
    image_url TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE recipe_equipment (
    recipe_id INTEGER,
    equipment_id INTEGER,
    quantity INTEGER DEFAULT 1,
    notes TEXT,
    PRIMARY KEY (recipe_id, equipment_id),
    FOREIGN KEY (recipe_id) REFERENCES recipes(recipe_id),
    FOREIGN KEY (equipment_id) REFERENCES equipment(equipment_id)
);

-- Process Management
CREATE TABLE process_templates (
    process_template_id INTEGER PRIMARY KEY AUTOINCREMENT,
    recipe_id INTEGER,
    name TEXT NOT NULL,
    description TEXT,
    version TEXT,
    created_by INTEGER,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (recipe_id) REFERENCES recipes(recipe_id),
    FOREIGN KEY (created_by) REFERENCES users(user_id)
);

CREATE TABLE process_steps (
    step_id INTEGER PRIMARY KEY AUTOINCREMENT,
    process_template_id INTEGER,
    step_number INTEGER NOT NULL,
    title TEXT NOT NULL,
    description TEXT,
    estimated_time_minutes INTEGER,
    temperature_target_celsius REAL,
    temperature_tolerance REAL,
    humidity_target_percent REAL,
    humidity_tolerance REAL,
    ph_target REAL,
    ph_tolerance REAL,
    equipment_ids TEXT,
    alert_thresholds TEXT,
    image_url TEXT,
    video_url TEXT,
    FOREIGN KEY (process_template_id) REFERENCES process_templates(process_template_id)
);

CREATE TABLE substeps (
    substep_id INTEGER PRIMARY KEY AUTOINCREMENT,
    step_id INTEGER,
    substep_number INTEGER NOT NULL,
    description TEXT,
    estimated_time_minutes INTEGER,
    FOREIGN KEY (step_id) REFERENCES process_steps(step_id)
);

-- Production Batches
CREATE TABLE batches (
    batch_id INTEGER PRIMARY KEY AUTOINCREMENT,
    batch_code TEXT UNIQUE NOT NULL,
    recipe_id INTEGER,
    process_template_id INTEGER,
    created_by INTEGER,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    started_at TIMESTAMP,
    completed_at TIMESTAMP,
    yield_amount REAL,
    yield_unit TEXT,
    status TEXT NOT NULL,
    milk_source TEXT,
    milk_collection_date DATE,
    notes TEXT,
    is_test_batch INTEGER DEFAULT 0,
    FOREIGN KEY (recipe_id) REFERENCES recipes(recipe_id),
    FOREIGN KEY (process_template_id) REFERENCES process_templates(process_template_id),
    FOREIGN KEY (created_by) REFERENCES users(user_id)
);

CREATE TABLE batch_ingredients (
    batch_ingredient_id INTEGER PRIMARY KEY AUTOINCREMENT,
    batch_id INTEGER,
    ingredient_id INTEGER,
    recipe_ingredient_id INTEGER,
    actual_quantity REAL,
    actual_unit TEXT,
    lot_number TEXT,
    expiration_date DATE,
    notes TEXT,
    FOREIGN KEY (batch_id) REFERENCES batches(batch_id),
    FOREIGN KEY (ingredient_id) REFERENCES ingredients(ingredient_id),
    FOREIGN KEY (recipe_ingredient_id) REFERENCES recipe_ingredients(recipe_ingredient_id)
);

-- Batch Process Execution
CREATE TABLE batch_steps (
    batch_step_id INTEGER PRIMARY KEY AUTOINCREMENT,
    batch_id INTEGER,
    step_id INTEGER,
    started_at TIMESTAMP,
    completed_at TIMESTAMP,
    status TEXT NOT NULL,
    operator_id INTEGER,
    notes TEXT,
    FOREIGN KEY (batch_id) REFERENCES batches(batch_id),
    FOREIGN KEY (step_id) REFERENCES process_steps(step_id),
    FOREIGN KEY (operator_id) REFERENCES users(user_id)
);

CREATE TABLE step_measurements (
    measurement_id INTEGER PRIMARY KEY AUTOINCREMENT,
    batch_step_id INTEGER,
    parameter_name TEXT NOT NULL,
    value REAL,
    unit TEXT,
    measured_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    measured_by INTEGER,
    measurement_device TEXT,
    is_within_bounds INTEGER,
    notes TEXT,
    FOREIGN KEY (batch_step_id) REFERENCES batch_steps(batch_step_id),
    FOREIGN KEY (measured_by) REFERENCES users(user_id)
);

-- User Comments and Notes
CREATE TABLE comments (
    comment_id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER,
    batch_id INTEGER,
    batch_step_id INTEGER,
    comment_text TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    parent_comment_id INTEGER,
    attachment_urls TEXT,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (batch_id) REFERENCES batches(batch_id),
    FOREIGN KEY (batch_step_id) REFERENCES batch_steps(batch_step_id),
    FOREIGN KEY (parent_comment_id) REFERENCES comments(comment_id)
);

-- Reminders and Notifications
CREATE TABLE reminder_templates (
    reminder_template_id INTEGER PRIMARY KEY AUTOINCREMENT,
    process_template_id INTEGER,
    step_id INTEGER,
    title TEXT NOT NULL,
    message TEXT,
    trigger_type TEXT NOT NULL,
    trigger_details TEXT,
    created_by INTEGER,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (process_template_id) REFERENCES process_templates(process_template_id),
    FOREIGN KEY (step_id) REFERENCES process_steps(step_id),
    FOREIGN KEY (created_by) REFERENCES users(user_id)
);

CREATE TABLE reminders (
    reminder_id INTEGER PRIMARY KEY AUTOINCREMENT,
    reminder_template_id INTEGER,
    batch_id INTEGER,
    batch_step_id INTEGER,
    status TEXT NOT NULL,
    scheduled_time TIMESTAMP,
    triggered_at TIMESTAMP,
    acknowledged_at TIMESTAMP,
    acknowledged_by INTEGER,
    FOREIGN KEY (reminder_template_id) REFERENCES reminder_templates(reminder_template_id),
    FOREIGN KEY (batch_id) REFERENCES batches(batch_id),
    FOREIGN KEY (batch_step_id) REFERENCES batch_steps(batch_step_id),
    FOREIGN KEY (acknowledged_by) REFERENCES users(user_id)
);

-- Monitoring and Alerts
CREATE TABLE sensor_devices (
    sensor_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    device_type TEXT,
    model TEXT,
    serial_number TEXT,
    location TEXT,
    last_calibrated_at TIMESTAMP,
    next_calibration_due TIMESTAMP,
    status TEXT
);

CREATE TABLE alert_rules (
    alert_rule_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    description TEXT,
    process_template_id INTEGER,
    step_id INTEGER,
    parameter_name TEXT NOT NULL,
    condition_type TEXT NOT NULL,
    threshold_values TEXT,
    severity TEXT NOT NULL,
    message_template TEXT,
    created_by INTEGER,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    is_active INTEGER DEFAULT 1,
    FOREIGN KEY (process_template_id) REFERENCES process_templates(process_template_id),
    FOREIGN KEY (step_id) REFERENCES process_steps(step_id),
    FOREIGN KEY (created_by) REFERENCES users(user_id)
);

CREATE TABLE alerts (
    alert_id INTEGER PRIMARY KEY AUTOINCREMENT,
    alert_rule_id INTEGER,
    batch_id INTEGER,
    batch_step_id INTEGER,
    triggered_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    parameter_name TEXT NOT NULL,
    actual_value REAL,
    threshold_values TEXT,
    severity TEXT NOT NULL,
    message TEXT,
    status TEXT NOT NULL,
    acknowledged_at TIMESTAMP,
    acknowledged_by INTEGER,
    resolved_at TIMESTAMP,
    resolved_by INTEGER,
    resolution_notes TEXT,
    FOREIGN KEY (alert_rule_id) REFERENCES alert_rules(alert_rule_id),
    FOREIGN KEY (batch_id) REFERENCES batches(batch_id),
    FOREIGN KEY (batch_step_id) REFERENCES batch_steps(batch_step_id),
    FOREIGN KEY (acknowledged_by) REFERENCES users(user_id),
    FOREIGN KEY (resolved_by) REFERENCES users(user_id)
);

-- Quality Control and Assessment
CREATE TABLE quality_tests (
    test_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    description TEXT,
    test_method TEXT,
    parameter_name TEXT,
    expected_range TEXT,
    units TEXT
);

CREATE TABLE batch_tests (
    batch_test_id INTEGER PRIMARY KEY AUTOINCREMENT,
    batch_id INTEGER,
    test_id INTEGER,
    tested_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    tested_by INTEGER,
    result_value REAL,
    result_unit TEXT,
    is_within_range INTEGER,
    notes TEXT,
    image_urls TEXT,
    FOREIGN KEY (batch_id) REFERENCES batches(batch_id),
    FOREIGN KEY (test_id) REFERENCES quality_tests(test_id),
    FOREIGN KEY (tested_by) REFERENCES users(user_id)
);

-- Aging and Storage
CREATE TABLE aging_locations (
    location_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    description TEXT,
    temperature_target_celsius REAL,
    humidity_target_percent REAL,
    capacity INTEGER,
    current_occupancy INTEGER
);

CREATE TABLE aging_batches (
    aging_batch_id INTEGER PRIMARY KEY AUTOINCREMENT,
    batch_id INTEGER,
    location_id INTEGER,
    position_identifier TEXT,
    started_at TIMESTAMP,
    target_completion_at TIMESTAMP,
    completed_at TIMESTAMP,
    initial_weight REAL,
    current_weight REAL,
    weight_unit TEXT,
    status TEXT,
    notes TEXT,
    FOREIGN KEY (batch_id) REFERENCES batches(batch_id),
    FOREIGN KEY (location_id) REFERENCES aging_locations(location_id)
);

CREATE TABLE aging_activities (
    activity_id INTEGER PRIMARY KEY AUTOINCREMENT,
    aging_batch_id INTEGER,
    activity_type TEXT,
    performed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    performed_by INTEGER,
    notes TEXT,
    FOREIGN KEY (aging_batch_id) REFERENCES aging_batches(aging_batch_id),
    FOREIGN KEY (performed_by) REFERENCES users(user_id)
);

-- Audit Trail
CREATE TABLE audit_logs (
    log_id INTEGER PRIMARY KEY AUTOINCREMENT,
    entity_type TEXT NOT NULL,
    entity_id INTEGER NOT NULL,
    action TEXT NOT NULL,
    changed_data TEXT,
    performed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    performed_by INTEGER,
    ip_address TEXT,
    user_agent TEXT,
    FOREIGN KEY (performed_by) REFERENCES users(user_id)
);

-- Integration with External Systems
CREATE TABLE sensor_readings (
    reading_id INTEGER PRIMARY KEY AUTOINCREMENT,
    sensor_id INTEGER,
    batch_id INTEGER,
    aging_batch_id INTEGER,
    parameter_name TEXT NOT NULL,
    value REAL,
    unit TEXT,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    is_anomaly INTEGER DEFAULT 0,
    FOREIGN KEY (sensor_id) REFERENCES sensor_devices(sensor_id),
    FOREIGN KEY (batch_id) REFERENCES batches(batch_id),
    FOREIGN KEY (aging_batch_id) REFERENCES aging_batches(aging_batch_id)
);

-- Knowledge Base and Learning
CREATE TABLE knowledge_articles (
    article_id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,
    content TEXT NOT NULL,
    category TEXT,
    tags TEXT,
    created_by INTEGER,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    is_published INTEGER DEFAULT 0,
    FOREIGN KEY (created_by) REFERENCES users(user_id)
);

CREATE TABLE troubleshooting_issues (
    issue_id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,
    description TEXT NOT NULL,
    cheese_type_id INTEGER,
    process_stage TEXT,
    symptoms TEXT,
    possible_causes TEXT,
    solutions TEXT,
    prevention_tips TEXT,
    created_by INTEGER,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (cheese_type_id) REFERENCES cheese_types(cheese_type_id),
    FOREIGN KEY (created_by) REFERENCES users(user_id)
);

-- Batch Reports and Analysis
CREATE TABLE batch_reports (
    report_id INTEGER PRIMARY KEY AUTOINCREMENT,
    batch_id INTEGER,
    report_type TEXT,
    generated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    generated_by INTEGER,
    report_data TEXT,
    pdf_url TEXT,
    FOREIGN KEY (batch_id) REFERENCES batches(batch_id),
    FOREIGN KEY (generated_by) REFERENCES users(user_id)
);

-- Community and Collaboration
CREATE TABLE batch_sharing (
    sharing_id INTEGER PRIMARY KEY AUTOINCREMENT,
    batch_id INTEGER,
    shared_by INTEGER,
    shared_with INTEGER,
    shared_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    access_level TEXT,
    expires_at TIMESTAMP,
    is_active INTEGER DEFAULT 1,
    FOREIGN KEY (batch_id) REFERENCES batches(batch_id),
    FOREIGN KEY (shared_by) REFERENCES users(user_id),
    FOREIGN KEY (shared_with) REFERENCES users(user_id)
);

-- Create indexes for performance optimization
CREATE INDEX idx_batches_recipe ON batches(recipe_id);
CREATE INDEX idx_batches_status ON batches(status);
CREATE INDEX idx_batch_steps_batch ON batch_steps(batch_id);
CREATE INDEX idx_batch_steps_status ON batch_steps(status);
CREATE INDEX idx_comments_batch ON comments(batch_id);
CREATE INDEX idx_comments_step ON comments(batch_step_id);
CREATE INDEX idx_measurements_param ON step_measurements(parameter_name);
CREATE INDEX idx_alerts_batch ON alerts(batch_id);
CREATE INDEX idx_alerts_status ON alerts(status);
CREATE INDEX idx_sensor_readings_batch ON sensor_readings(batch_id);
CREATE INDEX idx_audit_entity ON audit_logs(entity_type, entity_id); 