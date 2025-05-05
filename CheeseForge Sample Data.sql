-- CheeseForge Sample Data
-- Initial Sample Data for a Professional Cheese-Making Application

-- Roles
INSERT INTO roles (role_name, description, permissions) VALUES
('Administrator', 'Full system access', '{"manage_users": true, "manage_recipes": true, "manage_all_batches": true}'),
('Master Cheesemaker', 'Can create and manage all cheese-making content', '{"manage_recipes": true, "manage_all_batches": true}'),
('Cheesemaker', 'Standard cheese production role', '{"manage_own_recipes": true, "manage_own_batches": true}'),
('Apprentice', 'Learning role with limited permissions', '{"view_recipes": true, "manage_own_batches": true}'),
('Quality Control', 'Focused on testing and quality assurance', '{"manage_tests": true, "view_all_batches": true}');

-- Sample Users
INSERT INTO users (username, email, password_hash, first_name, last_name, role_id, is_active) VALUES
('admin', 'admin@cheeseforge.com', 'hashed_password_here', 'System', 'Administrator', 1, true),
('master_cheese', 'master@cheeseforge.com', 'hashed_password_here', 'Marie', 'Curie', 2, true),
('cheese_pro', 'pro@cheeseforge.com', 'hashed_password_here', 'Pierre', 'Roquefort', 3, true),
('apprentice1', 'apprentice@cheeseforge.com', 'hashed_password_here', 'Alex', 'Novice', 4, true),
('quality_lead', 'quality@cheeseforge.com', 'hashed_password_here', 'Quentin', 'Tester', 5, true);

-- Cheese Categories
INSERT INTO cheese_categories (name, description) VALUES
('Fresh', 'Unaged cheeses with high moisture content and mild flavors'),
('Soft-Ripened', 'Cheeses with a soft interior and bloomy rind'),
('Semi-Soft', 'Cheeses with moderate moisture content and melting properties'),
('Semi-Hard', 'Firm but pliable cheeses with diverse flavors'),
('Hard', 'Aged cheeses with low moisture and concentrated flavors'),
('Blue', 'Cheeses with distinctive blue or green mold veins'),
('Brined', 'Cheeses aged in brine solution'),
('Pasta Filata', 'Stretched-curd cheeses'),
('Processed', 'Manufactured cheese products'),
('Washed-Rind', 'Cheeses with rinds washed during aging');

-- Cheese Types (Global Selection)
INSERT INTO cheese_types (name, description, origin, milk_type, texture, flavor_profile, aging_time_min, aging_time_max, difficulty_level, created_by) VALUES
-- Western European Classics
('Parmigiano-Reggiano', 'The "King of Cheeses", a hard, granular cheese used for grating and as a table cheese', 'Italy', 'cow', 'hard', 'Rich, nutty, savory with slight sweetness and a fruity/pineapple aroma', 365, 1095, 5, 2),
('Cheddar', 'A firm, natural cheese with a slightly crumbly texture if properly cured', 'England', 'cow', 'hard', 'Ranges from mild to extra sharp, with notes of butter and hazelnut', 60, 730, 3, 2),
('Brie', 'Soft cheese named after the French region Brie', 'France', 'cow', 'soft-ripened', 'Mild with a buttery, creamy flavor and ammonia hints when ripe', 28, 56, 4, 2),
('Gouda', 'Semi-hard to hard cheese celebrated for its rich, unique flavor and smooth texture', 'Netherlands', 'cow', 'semi-hard', 'Sweet and fruity when young, developing caramel and nut notes with age', 30, 1095, 3, 2),
('Camembert', 'Soft, creamy, surface-ripened cow''s milk cheese', 'France', 'cow', 'soft-ripened', 'Mild and creamy when young, developing stronger earthy notes with age', 21, 35, 4, 2),
('Roquefort', 'Blue cheese made from sheep milk', 'France', 'sheep', 'blue', 'Tangy, crumbly and moist with distinctive blue veins and complex flavor', 90, 180, 5, 3),
('Gruyère', 'Hard yellow cheese known for its distinctive flavor', 'Switzerland', 'cow', 'hard', 'Complex flavors of nuts, fruits and slight saltiness', 180, 365, 4, 2),
('Manchego', 'Made from Manchega sheep milk in La Mancha region', 'Spain', 'sheep', 'semi-hard', 'Fruity, nutty, with a tangy note and sweet aftertaste', 60, 730, 3, 2),
('Gorgonzola', 'Blue-veined Italian cheese made from unskimmed cow''s milk', 'Italy', 'cow', 'blue', 'Creamy with sharp, spicy flavor from blue veining', 90, 180, 4, 3),

-- Mediterranean and Middle Eastern
('Feta', 'Brined curd white cheese made from sheep milk or mixture with goat milk', 'Greece', 'sheep', 'brined', 'Tangy, salty with a lemony flavor and hint of sweetness', 60, 90, 2, 2),
('Halloumi', 'Semi-hard, unripened brined cheese with high melting point', 'Cyprus', 'mixed', 'semi-hard', 'Mild, salty flavor with distinctive squeaky texture when eaten', 0, 0, 2, 3),
('Kashkaval', 'Traditional semi-hard cheese made from sheep milk', 'Balkans', 'sheep', 'semi-hard', 'Somewhat tangy flavor with slight sweetness', 60, 180, 3, 3),
('Burrata', 'Fresh Italian cheese made from mozzarella and cream', 'Italy', 'cow', 'fresh', 'Milky, buttery flavor with rich, creamy interior', 0, 2, 3, 3),

-- Eastern European
('Oscypek', 'Smoked cheese made from salted sheep milk from Tatra Mountains', 'Poland', 'sheep', 'hard', 'Salty with a distinctive smoked flavor', 14, 21, 4, 3),
('Bryndza', 'Sheep milk cheese characterized by strong smell and taste', 'Slovakia', 'sheep', 'soft', 'Distinctive strong, piquant taste and aroma', 14, 30, 3, 3),

-- North American
('Monterey Jack', 'American semi-hard cheese with mild flavor', 'United States', 'cow', 'semi-hard', 'Mild and buttery flavor that melts easily', 30, 90, 2, 3),
('Colby', 'Semi-hard American cheese from pasteurized cow''s milk', 'United States', 'cow', 'semi-hard', 'Mild flavor with slightly tangy finish', 30, 90, 2, 3),
('Humboldt Fog', 'Ripened goat cheese with distinctive layer of edible vegetable ash', 'United States', 'goat', 'soft-ripened', 'Creamy, light citrus flavor with floral notes', 21, 35, 4, 3),

-- Latin American
('Queso Fresco', 'Fresh cheese popular in Mexican and Central American cuisines', 'Mexico', 'cow', 'fresh', 'Mild, slightly salty and tangy', 0, 5, 1, 3),
('Queso Oaxaca', 'Mexican string cheese similar to mozzarella', 'Mexico', 'cow', 'pasta filata', 'Mild, slightly salty with buttery flavor', 0, 7, 2, 3),

-- Asian
('Paneer', 'Fresh cheese common in South Asian cuisine', 'India', 'cow', 'fresh', 'Mild flavor with slight acidity', 0, 2, 1, 3),
('Sakura Cheese', 'Soft cheese flavored with cherry blossoms', 'Japan', 'cow', 'soft', 'Mild with faint cherry blossom aroma', 14, 21, 3, 3),

-- African
('Ayib', 'Fresh soft cheese from Ethiopia', 'Ethiopia', 'cow', 'fresh', 'Mild and crumbly with slight sourness', 0, 3, 1, 3),
('Wagasi', 'Traditional cheese made by Fulani people', 'West Africa', 'cow', 'semi-hard', 'Mild to strong flavor depending on aging', 14, 60, 2, 3),

-- Unique/Specialty
('Stilton', 'English blue cheese protected by designation of origin', 'England', 'cow', 'blue', 'Strong, pungent flavor with rich creaminess', 90, 180, 4, 2),
('Mimolette', 'Cannonball-shaped cheese originally made to resemble Edam', 'France', 'cow', 'hard', 'Fruity and nutty with caramel notes when aged', 180, 730, 3, 2),
('Taleggio', 'Semisoft, washed-rind, smear-ripened Italian cheese', 'Italy', 'cow', 'washed-rind', 'Strong aroma but mild flavor with fruity tang', 40, 60, 4, 2),
('Mozzarella', 'Traditional southern Italian fresh cheese made from buffalo milk', 'Italy', 'buffalo', 'pasta filata', 'Delicate dairy flavor with slight tanginess', 0, 1, 2, 2),
('Emmental', 'Yellow, medium-hard Swiss cheese with characteristic holes', 'Switzerland', 'cow', 'semi-hard', 'Mild, slightly sweet with nutty flavor', 120, 365, 4, 2);

-- Link cheese types to categories
INSERT INTO cheese_type_categories (cheese_type_id, category_id) VALUES
(1, 5), -- Parmigiano-Reggiano - Hard
(2, 5), -- Cheddar - Hard
(3, 2), -- Brie - Soft-Ripened
(4, 4), -- Gouda - Semi-Hard
(5, 2), -- Camembert - Soft-Ripened
(6, 6), -- Roquefort - Blue
(7, 5), -- Gruyère - Hard
(8, 4), -- Manchego - Semi-Hard
(9, 6), -- Gorgonzola - Blue
(10, 7), -- Feta - Brined
(11, 4), -- Halloumi - Semi-Hard
(12, 4), -- Kashkaval - Semi-Hard
(13, 1), -- Burrata - Fresh
(14, 5), -- Oscypek - Hard
(15, 1), -- Bryndza - Soft
(16, 3), -- Monterey Jack - Semi-Soft
(17, 3), -- Colby - Semi-Soft
(18, 2), -- Humboldt Fog - Soft-Ripened
(19, 1), -- Queso Fresco - Fresh
(20, 8), -- Queso Oaxaca - Pasta Filata
(21, 1), -- Paneer - Fresh
(22, 1), -- Sakura Cheese - Soft
(23, 1), -- Ayib - Fresh
(24, 4), -- Wagasi - Semi-Hard
(25, 6), -- Stilton - Blue
(26, 5), -- Mimolette - Hard
(27, 10), -- Taleggio - Washed-Rind
(28, 8), -- Mozzarella - Pasta Filata
(29, 4); -- Emmental - Semi-Hard

-- Ingredients
INSERT INTO ingredients (name, description, category, units_of_measure, storage_guidelines, shelf_life_days) VALUES
-- Milks
('Cow Milk (Raw)', 'Unpasteurized whole cow milk', 'milk', '{"liter": "L", "gallon": "gal"}', 'Refrigerate at 1-4°C', 3),
('Cow Milk (Pasteurized)', 'Pasteurized whole cow milk', 'milk', '{"liter": "L", "gallon": "gal"}', 'Refrigerate at 1-4°C', 7),
('Cow Milk (Skimmed)', 'Pasteurized skimmed cow milk', 'milk', '{"liter": "L", "gallon": "gal"}', 'Refrigerate at 1-4°C', 7),
('Sheep Milk', 'Whole sheep milk', 'milk', '{"liter": "L", "gallon": "gal"}', 'Refrigerate at 1-4°C', 5),
('Goat Milk', 'Whole goat milk', 'milk', '{"liter": "L", "gallon": "gal"}', 'Refrigerate at 1-4°C', 5),
('Buffalo Milk', 'Whole water buffalo milk', 'milk', '{"liter": "L", "gallon": "gal"}', 'Refrigerate at 1-4°C', 3),
('Cream', 'Heavy cream with high fat content', 'milk', '{"liter": "L", "cup": "cup"}', 'Refrigerate at 1-4°C', 7),

-- Cultures
('Mesophilic Culture', 'Standard mesophilic cheese culture', 'culture', '{"gram": "g", "unit": "unit", "DCU": "DCU"}', 'Keep frozen below -18°C', 365),
('Thermophilic Culture', 'Heat-loving bacteria culture for higher-temperature cheeses', 'culture', '{"gram": "g", "unit": "unit", "DCU": "DCU"}', 'Keep frozen below -18°C', 365),
('Propionibacterium', 'Culture for Swiss-type cheeses', 'culture', '{"gram": "g", "unit": "unit"}', 'Keep frozen below -18°C', 365),
('Penicillium Candidum', 'White mold for bloomy rind cheeses', 'culture', '{"gram": "g", "unit": "unit"}', 'Keep frozen below -18°C', 365),
('Penicillium Roqueforti', 'Blue mold for blue cheeses', 'culture', '{"gram": "g", "unit": "unit"}', 'Keep frozen below -18°C', 365),
('Geotrichum Candidum', 'Surface ripening culture for washed rind cheeses', 'culture', '{"gram": "g", "unit": "unit"}', 'Keep frozen below -18°C', 365),
('Brevibacterium Linens', 'Red/orange bacteria for washed rind cheeses', 'culture', '{"gram": "g", "unit": "unit"}', 'Keep frozen below -18°C', 365),
('Direct Set Yogurt Culture', 'Culture for making yogurt base', 'culture', '{"gram": "g", "unit": "unit"}', 'Keep frozen below -18°C', 365),

-- Coagulants
('Animal Rennet', 'Traditional animal rennet extract', 'coagulant', '{"milliliter": "ml", "teaspoon": "tsp"}', 'Refrigerate at 1-4°C', 180),
('Vegetable Rennet', 'Plant-based coagulant alternative', 'coagulant', '{"milliliter": "ml", "teaspoon": "tsp"}', 'Refrigerate at 1-4°C', 180),
('Microbial Rennet', 'Fermentation-produced coagulant', 'coagulant', '{"milliliter": "ml", "teaspoon": "tsp"}', 'Refrigerate at 1-4°C', 180),
('Citric Acid', 'Acid coagulant for direct acidification', 'coagulant', '{"gram": "g", "teaspoon": "tsp"}', 'Store in cool, dry place', 730),
('Lactic Acid', 'Acid for direct acidification', 'coagulant', '{"milliliter": "ml", "teaspoon": "tsp"}', 'Store in cool, dry place', 730),
('Vinegar', 'Acetic acid for fresh cheese coagulation', 'coagulant', '{"milliliter": "ml", "cup": "cup"}', 'Store at room temperature', 365),
('Lemon Juice', 'Natural acid for fresh cheese making', 'coagulant', '{"milliliter": "ml", "cup": "cup"}', 'Refrigerate after opening', 14),

-- Additives
('Salt (Non-Iodized)', 'Standard cheese salt without iodine', 'additive', '{"gram": "g", "kilogram": "kg", "tablespoon": "tbsp"}', 'Store in cool, dry place', 1825),
('Calcium Chloride', 'For improving coagulation of pasteurized milk', 'additive', '{"milliliter": "ml", "teaspoon": "tsp"}', 'Store in cool, dry place', 730),
('Lipase', 'Enzyme for flavor development in Italian-style cheeses', 'additive', '{"gram": "g", "teaspoon": "tsp"}', 'Keep frozen below -18°C', 365),
('Annatto', 'Natural color additive for orange/yellow cheese', 'additive', '{"milliliter": "ml", "teaspoon": "tsp"}', 'Store in cool, dry place', 365),
('Herbs (Mixed)', 'Various dried herbs for flavored cheeses', 'additive', '{"gram": "g", "tablespoon": "tbsp"}', 'Store in cool, dry place', 180),
('Black Pepper (Ground)', 'Ground black pepper for flavored cheeses', 'additive', '{"gram": "g", "tablespoon": "tbsp"}', 'Store in cool, dry place', 365),
('Garlic (Dried)', 'Dried garlic for flavored cheeses', 'additive', '{"gram": "g", "tablespoon": "tbsp"}', 'Store in cool, dry place', 365),
('Cumin Seeds', 'Whole cumin seeds for flavored cheeses', 'additive', '{"gram": "g", "tablespoon": "tbsp"}', 'Store in cool, dry place', 365),
('Wine (Red)', 'For washing cheese rinds', 'additive', '{"milliliter": "ml", "cup": "cup"}', 'Store in cool, dark place', 30),
('Brine Solution', 'Prepared salt brine for cheese aging', 'additive', '{"liter": "L", "gallon": "gal"}', 'Refrigerate at 10-12°C', 90),
('Vegetable Ash', 'Edible ash for cheese coating', 'additive', '{"gram": "g", "tablespoon": "tbsp"}', 'Store in cool, dry place', 365),
('Olive Oil', 'For coating and preserving cheese rinds', 'additive', '{"milliliter": "ml", "tablespoon": "tbsp"}', 'Store in cool, dark place', 180),
('Truffle Pieces', 'For specialty flavored cheeses', 'additive', '{"gram": "g", "tablespoon": "tbsp"}', 'Refrigerate', 30);

-- Equipment
INSERT INTO equipment (name, description, category, usage_instructions, cleaning_instructions) VALUES
-- Vats and Containers
('Cheese Vat (50L)', 'Large double-walled stainless steel vat with heating capability', 'vat', 'Pre-heat to required temperature before adding milk', 'Clean with food-safe detergent, rinse thoroughly, sanitize before use'),
('Cheese Vat (20L)', 'Medium double-walled stainless steel vat with heating capability', 'vat', 'Pre-heat to required temperature before adding milk', 'Clean with food-safe detergent, rinse thoroughly, sanitize before use'),
('Stockpot (10L)', 'Large stainless steel pot for smaller batches', 'vat', 'Place on heat source and monitor temperature carefully', 'Wash with hot soapy water, rinse thoroughly'),
('Plastic Cheese Tub', 'Food-grade plastic container for milk handling', 'container', 'Sanitize before use', 'Wash with hot soapy water, rinse thoroughly, air dry'),

-- Cutting and Handling Tools
('Curd Knife', 'Long knife for cutting cheese curds', 'cutting tool', 'Ensure clean cut from top to bottom of milk', 'Wash with hot water immediately after use, sanitize before next use'),
('Curd Harp', 'Wire frame for cutting curds in multiple directions', 'cutting tool', 'Use gentle rocking motion to cut', 'Clean with food-safe detergent, rinse thoroughly'),
('Curd Rake', 'Tool for stirring and separating curds', 'stirring tool', 'Use gentle motion to avoid breaking curds too small', 'Clean with food-safe detergent, rinse thoroughly'),
('Perforated Ladle', 'Large spoon with holes for separating curds from whey', 'separating tool', 'Scoop gently to avoid breaking curds', 'Clean with food-safe detergent, rinse thoroughly'),
('Cheesecloth', 'Fine mesh cloth for draining and forming', 'separating tool', 'Rinse in cool water before use', 'Boil after use to sanitize, rinse thoroughly, air dry'),
('Curd Scoop', 'Perforated scoop for transferring curds', 'separating tool', 'Drain briefly before transferring curds', 'Clean with food-safe detergent, rinse thoroughly'),

-- Molds and Presses
('Cheese Mold (Small)', 'Small perforated plastic mold for fresh cheeses', 'mold', 'Sanitize before use', 'Clean with food-safe detergent, rinse thoroughly'),
('Cheese Mold (Medium)', 'Medium perforated plastic mold for semi-hard cheeses', 'mold', 'Sanitize before use', 'Clean with food-safe detergent, rinse thoroughly'),
('Cheese Mold (Large)', 'Large perforated plastic mold for hard cheeses', 'mold', 'Sanitize before use', 'Clean with food-safe detergent, rinse thoroughly'),
('Traditional Basket Mold', 'Natural reed basket for traditional appearance', 'mold', 'Line with cheesecloth before use', 'Clean with hot water and vinegar solution, air dry completely'),
('Cheese Press (Spring)', 'Spring-based press for controlled pressure', 'press', 'Increase pressure gradually as specified in recipe', 'Clean all parts thoroughly after use, dry completely'),
('Cheese Press (Weights)', 'Traditional press using weight system', 'press', 'Calculate weight needed based on cheese size', 'Clean all parts thoroughly after use, dry completely'),
('Follower', 'Disc that sits on top of cheese in press', 'press component', 'Must fit inside mold with minimal gap', 'Clean with food-safe detergent, rinse thoroughly'),

-- Measuring and Monitoring
('Digital Thermometer', 'Precise temperature measurement tool', 'measuring tool', 'Calibrate regularly with ice water test', 'Wipe clean with alcohol pad after use'),
('pH Meter', 'Electronic device for measuring acidity', 'measuring tool', 'Calibrate before each use with buffer solutions', 'Clean electrode with distilled water, store properly'),
('Dairy Hydrometer', 'Tool for measuring milk density', 'measuring tool', 'Use with a test cylinder at correct temperature', 'Rinse with clean water after use'),
('Digital Scale', 'For precise ingredient measurement', 'measuring tool', 'Tare before adding ingredients', 'Wipe clean with damp cloth'),
('Timer', 'For tracking various process times', 'measuring tool', 'Set for each step in the process', 'Wipe clean with damp cloth'),
('Humidity Monitor', 'For aging room conditions', 'measuring tool', 'Place in aging space at cheese level', 'Wipe clean with damp cloth'),

-- Aging Equipment
('Aging Container', 'Controlled environment box for aging', 'aging equipment', 'Maintain at specified temperature and humidity', 'Clean and sanitize between cheese batches'),
('Cheese Cave Humidifier', 'For maintaining proper humidity in aging space', 'aging equipment', 'Fill with distilled water only', 'Clean regularly to prevent mineral buildup'),
('Cheese Mat', 'Mat for cheese to rest on during aging', 'aging equipment', 'Sanitize before use', 'Wash with hot water and vinegar, dry completely'),
('Cheese Brush', 'Soft brush for cleaning cheese rinds', 'aging equipment', 'Use with appropriate brine or solution as recipe specifies', 'Clean with hot water and vinegar, dry completely'),
('Aging Board (Wood)', 'Traditional wood board for aging', 'aging equipment', 'Season before first use with salt water', 'Clean with salt and vinegar solution, never soap');

-- Recipes (for major cheese types)
INSERT INTO recipes (cheese_type_id, name, description, yield_amount, yield_unit, difficulty_level, total_time_minutes, notes, is_public, version, created_by) VALUES
-- Parmigiano-Reggiano Recipe
(1, 'Traditional Parmigiano-Reggiano', 'Authentic recipe following traditional Italian methods for the king of cheeses', 10, 'kg', 5, 4320, 'Requires specific milk quality and aging conditions. This is a multi-day process with extensive aging.', true, '1.0', 2),

-- Cheddar Recipe
(2, 'Traditional Farmhouse Cheddar', 'Classic English cheddar with excellent aging potential', 2, 'kg', 3, 480, 'The cheddaring process (stacking and turning curds) is essential for developing proper texture.', true, '1.0', 2),

-- Brie Recipe
(3, 'Classic French Brie', 'Soft-ripened cheese with bloomy white rind', 1, 'kg', 4, 240, 'Temperature and humidity control during aging is critical for proper rind development.', true, '1.0', 2),

-- Gouda Recipe
(4, 'Baby Gouda', 'Young Dutch-style semi-hard cheese', 2, 'kg', 3, 360, 'Washing curds with hot water is key to developing the proper texture and flavor.', true, '1.0', 2),

-- Feta Recipe
(10, 'Traditional Greek Feta', 'Brined white cheese with tangy flavor', 1.5, 'kg', 2, 180, 'Can be made with sheep milk or a mixture of sheep and goat milk. The brine is essential for preservation and flavor.', true, '1.0', 3),

-- Mozzarella Recipe
(28, 'Fresh Mozzarella', 'Traditional stretched curd cheese', 1, 'kg', 2, 120, 'The stretching process requires practice to develop the proper texture and sheen.', true, '1.0', 3),

-- Paneer Recipe
(21, 'Homemade Paneer', 'Fresh Indian cheese for cooking', 0.5, 'kg', 1, 45, 'A simple acid-coagulated cheese that doesn''t require cultures or aging.', true, '1.0', 3),

-- Blue Cheese Recipe
(6, 'Classic Roquefort-Style Blue', 'Sheep milk blue cheese with distinctive veining', 1, 'kg', 5, 600, 'Proper piercing and aging conditions are essential for mold development.', true, '1.0', 2);

-- Recipe Ingredients for Parmigiano-Reggiano
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, preparation_notes) VALUES
(1, 1, 100, 'L', 'Use evening milk that has been partially skimmed after overnight rest, mixed with fresh morning milk'),
(1, 9, 100, 'g', 'Use natural whey starter from previous day''s production'),
(1, 10, 35, 'ml', 'Dilute in cool water before adding'),
(1, 18, 2.5, 'kg', 'For brine solution');

-- Recipe Ingredients for Cheddar
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, preparation_notes) VALUES
(2, 2, 20, 'L', 'Pasteurized whole milk'),
(2, 8, 5, 'g', 'Rehydrate according to package instructions'),
(2, 10, 4, 'ml', 'Dilute in cool water before adding'),
(2, 19, 5, 'ml', 'Dilute in water before adding to milk'),
(2, 18, 200, 'g', 'For salting curds'),
(2, 21, 2, 'ml', 'Optional, for traditional orange color');

-- Recipe Ingredients for Brie
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, preparation_notes) VALUES
(3, 2, 10, 'L', 'Pasteurized whole milk'),
(3, 8, 3, 'g', 'Rehydrate according to package instructions'),
(3, 11, 1, 'g', 'Sprinkle on surface after draining'),
(3, 10, 2.5, 'ml', 'Dilute in cool water before adding'),
(3, 19, 2, 'ml', 'Dilute in water before adding to milk'),
(3, 18, 100, 'g', 'For salting surface');

-- Recipe Ingredients for Gouda
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, preparation_notes) VALUES
(4, 2, 20, 'L', 'Pasteurized whole milk'),
(4, 8, 5, 'g', 'Rehydrate according to package instructions'),
(4, 10, 4, 'ml', 'Dilute in cool water before adding'),
(4, 19, 5, 'ml', 'Dilute in water before adding to milk'),
(4, 18, 400, 'g', 'For brine solution');

-- Recipe Ingredients for Feta
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, preparation_notes) VALUES
(5, 4, 8, 'L', 'Sheep milk preferred, can mix with goat milk'),
(5, 8, 2, 'g', 'Rehydrate according to package instructions'),
(5, 10, 2, 'ml', 'Dilute in cool water before adding'),
(5, 18, 500, 'g', 'For brine solution');

-- Recipe Ingredients for Mozzarella
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, preparation_notes) VALUES
(6, 2, 10, 'L', 'Fresh pasteurized whole milk'),
(6, 9, 3, 'g', 'Use thermophilic culture for traditional flavor'),
(6, 10, 2.5, 'ml', 'Dilute in cool water before adding'),
(6, 12, 10, 'ml', 'Added directly to milk before culture'),
(6, 18, 50, 'g', 'For stretching water and final salting');

-- Recipe Ingredients for Paneer
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, preparation_notes) VALUES
(7, 2, 5, 'L', 'Whole milk for best texture'),
(7, 16, 250, 'ml', 'Fresh lemon juice, strained'),
(7, 18, 15, 'g', 'Optional, can be added for flavor');

-- Recipe Ingredients for Blue Cheese
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, preparation_notes) VALUES
(8, 4, 10, 'L', 'Traditional sheep milk'),
(8, 8, 3, 'g', 'Rehydrate according to package instructions'),
(8, 12, 2, 'g', 'Add after milk ripening'),
(8, 10, 2, 'ml', 'Dilute in cool water before adding'),
(8, 18, 200, 'g', 'For dry salting');

-- Recipe Equipment (Link recipes with required equipment)
INSERT INTO recipe_equipment (recipe_id, equipment_id, quantity, notes) VALUES
-- Parmigiano-Reggiano Equipment
(1, 1, 1, 'Large vat required for commercial batches'),
(1, 5, 1, 'For cutting curd precisely'),
(1, 7, 1, 'For stirring during cooking'),
(1, 15, 1, 'Heavy pressing required'),
(1, 18, 1, 'For monitoring temperature'),
(1, 19, 1, 'For checking acidification'),

-- Cheddar Equipment
(2, 2, 1, 'Medium vat suitable'),
(2, 5, 1, 'For cutting initial curd'),
(2, 7, 1, 'For stirring during cooking'),
(2, 9, 2, 'For draining and cheddaring process'),
(2, 13, 1, 'For final molding'),
(2, 15, 1, 'For pressing the cheese'),
(2, 18, 1, 'For monitoring temperature'),

-- Brie Equipment
(3, 3, 1, 'Suitable for smaller batches'),
(3, 5, 1, 'For gentle cutting of curd'),
(3, 9, 2, 'For draining and molding'),
(3, 12, 2, 'Traditional molds for proper shape'),
(3, 18, 1, 'For precise temperature control'),
(3, 24, 1, 'For aging environment'),

-- Gouda Equipment
(4, 2, 1, 'Medium vat suitable'),
(4, 6, 1, 'For precise curd cutting'),
(4, 7, 1, 'For stirring and washing curds'),
(4, 13, 1, 'For molding with traditional shape'),
(4, 15, 1, 'For pressing the cheese'),
(4, 18, 1, 'For monitoring temperature'),

-- Feta Equipment
(5, 3, 1, 'Suitable for smaller batches'),
(5, 5, 1, 'For cutting curd'),
(5, 8, 1, 'For transferring curds'),
(5, 9, 2, 'For draining curds'),
(5, 12, 1, 'For molding cheese'),
(5, 18, 1, 'For monitoring temperature'),

-- Mozzarella Equipment
(6, 3, 1, 'Suitable for smaller batches'),
(6, 5, 1, 'For cutting initial curd'),
(6, 8, 1, 'For handling curds'),
(6, 9, 2, 'For draining and stretching preparation'),
(6, 18, 2, 'One for milk, one for stretching water'),

-- Paneer Equipment
(7, 3, 1, 'Suitable for smaller batches'),
(7, 8, 1, 'For transferring curds'),
(7, 9, 1, 'For draining the curds'),
(7, 12, 1, 'For shaping the paneer'),
(7, 18, 1, 'For monitoring temperature'),

-- Blue Cheese Equipment
(8, 2, 1, 'Medium vat suitable'),
(8, 5, 1, 'For cutting curd precisely'),
(8, 7, 1, 'For gentle stirring'),
(8, 9, 2, 'For draining curds'),
(8, 13, 1, 'For molding the cheese'),
(8, 18, 1, 'For monitoring temperature'),
(8, 24, 1, 'For controlled aging environment'),
(8, 26, 1, 'For maintaining proper humidity');

-- Process Templates (Define cheese making processes)
INSERT INTO process_templates (recipe_id, name, description, version, created_by) VALUES
(1, 'Parmigiano-Reggiano Production Process', 'Traditional Italian production method for hard grating cheese', '1.0', 2),
(2, 'Traditional Cheddar Process', 'Complete process for making traditional cheddar with cheddaring technique', '1.0', 2),
(3, 'Brie Making Process', 'White mold surface-ripened cheese production', '1.0', 2),
(4, 'Gouda Production', 'Traditional Dutch washed curd technique', '1.0', 2),
(5, 'Feta Production', 'Greek brined cheese method', '1.0', 3),
(6, 'Fresh Mozzarella Process', 'Pasta filata method for stretchy cheese', '1.0', 3),
(7, 'Quick Paneer Method', 'Acid-coagulated fresh cheese technique', '1.0', 3),
(8, 'Blue Cheese Production', 'Process for making internally molded blue cheese', '1.0', 2);

-- Process Steps for Parmigiano-Reggiano
INSERT INTO process_steps (process_template_id, step_number, title, description, estimated_time_minutes, temperature_target_celsius, temperature_tolerance, equipment_ids) VALUES
(1, 1, 'Milk Preparation', 'Combine partially skimmed evening milk with fresh morning milk in the vat', 30, 18, 2, '{1, 18}'),
(1, 2, 'Starter Addition', 'Add natural whey starter culture and mix thoroughly', 5, 18, 2, '{1, 7}'),
(1, 3, 'Warming', 'Gradually heat milk to coagulation temperature', 30, 33, 1, '{1, 18}'),
(1, 4, 'Rennet Addition', 'Add diluted calf rennet and stir gently', 5, 33, 1, '{1, 7}'),
(1, 5, 'Coagulation', 'Allow milk to coagulate undisturbed', 15, 33, 1, '{1, 18}'),
(1, 6, 'Cutting the Curd', 'Cut curd into rice-sized pieces', 15, 33, 1, '{1, 5, 6}'),
(1, 7, 'Cooking the Curd', 'Gradually increase temperature while stirring gently', 60, 55, 2, '{1, 7, 18}'),
(1, 8, 'Settling', 'Allow curds to settle at bottom of vat', 30, 55, 2, '{1, 18}'),
(1, 9, 'Collecting the Curd', 'Gather curd mass with cheesecloth', 10, 55, 3, '{1, 9}'),
(1, 10, 'Cutting and Molding', 'Cut mass in two and place in molds', 10, 50, 5, '{13, 14}'),
(1, 11, 'Initial Pressing', 'Apply weights for initial shape formation', 20, 40, 5, '{15, 17}'),
(1, 12, 'Brine Bath', 'Immerse in saturated brine solution', 1440, 18, 2, '{4}'),
(1, 13, 'Initial Aging', 'Age in warm room for rind formation', 4320, 18, 2, '{24, 25, 26}'),
(1, 14, 'Long-term Aging', 'Transfer to cool aging room for extended aging', 0, 16, 2, '{24, 25, 26}');

-- Process Steps for Cheddar
INSERT INTO process_steps (process_template_id, step_number, title, description, estimated_time_minutes, temperature_target_celsius, temperature_tolerance, equipment_ids) VALUES
(2, 1, 'Milk Preparation', 'Heat pasteurized milk in vat', 30, 32, 1, '{2, 18}'),
(2, 2, 'Culture Addition', 'Add mesophilic culture and ripen', 60, 32, 1, '{2, 18}'),
(2, 3, 'Color Addition', 'Add annatto color if using', 5, 32, 1, '{2, 7}'),
(2, 4, 'Rennet Addition', 'Add diluted rennet and stir briefly', 5, 32, 1, '{2, 7}'),
(2, 5, 'Coagulation', 'Allow milk to coagulate undisturbed', 45, 32, 1, '{2, 18}'),
(2, 6, 'Cutting the Curd', 'Cut curd into 1cm cubes', 10, 32, 1, '{2, 5, 6}'),
(2, 7, 'Healing', 'Let curds rest to heal cut surfaces', 5, 32, 1, '{2, 18}'),
(2, 8, 'Cooking the Curd', 'Gradually raise temperature while stirring', 45, 39, 1, '{2, 7, 18}'),
(2, 9, 'Draining', 'Drain whey from curds', 10, 39, 2, '{2, 8}'),
(2, 10, 'Cheddaring', 'Mat curds, cut into blocks, stack and turn repeatedly', 60, 37, 2, '{2, 5}'),
(2, 11, 'Milling', 'Break cheddared curd into walnut-sized pieces', 10, 35, 3, '{2}'),
(2, 12, 'Salting', 'Add salt and mix thoroughly', 10, 35, 3, '{2}'),
(2, 13, 'Molding', 'Pack curds into molds', 15, 30, 5, '{13, 17}'),
(2, 14, 'Pressing', 'Press with increasing pressure over time', 720, 20, 5, '{15, 17}'),
(2, 15, 'Drying', 'Air dry to form rind', 24, 15, 3, '{24}'),
(2, 16, 'Aging', 'Age in cool environment for desired maturity', 1440, 10, 2, '{24, 25, 26}');

-- Process Steps for Brie
INSERT INTO process_steps (process_template_id, step_number, title, description, estimated_time_minutes, temperature_target_celsius, temperature_tolerance, equipment_ids) VALUES
(3, 1, 'Milk Preparation', 'Heat pasteurized milk in vat', 30, 32, 1, '{3, 18}'),
(3, 2, 'Culture Addition', 'Add mesophilic culture and P. candidum', 5, 32, 1, '{3, 7}'),
(3, 3, 'Ripening', 'Allow milk to acidify slightly', 60, 32, 1, '{3, 18, 19}'),
(3, 4, 'Rennet Addition', 'Add diluted rennet and stir briefly', 5, 32, 1, '{3, 7}'),
(3, 5, 'Coagulation', 'Allow milk to coagulate undisturbed', 60, 32, 1, '{3, 18}'),
(3, 6, 'Cutting the Curd', 'Cut curd into 2cm cubes', 10, 32, 1, '{3, 5}'),
(3, 7, 'Resting', 'Allow curds to rest and release whey', 15, 32, 1, '{3}'),
(3, 8, 'Gentle Stirring', 'Stir very gently to encourage whey release', 10, 32, 1, '{3, 7}'),
(3, 9, 'Ladling', 'Ladle curds into molds carefully', 20, 30, 2, '{3, 8, 12}'),
(3, 10, 'Draining', 'Allow to drain without pressing', 720, 22, 3, '{12, 24}'),
(3, 11, 'Flipping', 'Flip cheeses several times during draining', 5, 22, 3, '{12}'),
(3, 12, 'Salting', 'Salt all surfaces evenly', 10, 20, 3, '{12}'),
(3, 13, 'Drying', 'Allow surface to dry slightly', 24, 18, 2, '{24}'),
(3, 14, 'Aging', 'Age in high humidity environment', 336, 12, 2, '{24, 26}');

-- Process Steps for Fresh Mozzarella
INSERT INTO process_steps (process_template_id, step_number, title, description, estimated_time_minutes, temperature_target_celsius, temperature_tolerance, equipment_ids) VALUES
(6, 1, 'Milk Preparation', 'Heat pasteurized milk in pot', 20, 36, 1, '{3, 18}'),
(6, 2, 'Culture Addition', 'Add thermophilic culture and stir well', 5, 36, 1, '{3, 7}'),
(6, 3, 'Ripening', 'Hold temperature for light acidification', 30, 36, 1, '{3, 18}'),
(6, 4, 'Rennet Addition', 'Add diluted rennet and stir briefly', 5, 36, 1, '{3, 7}'),
(6, 5, 'Coagulation', 'Allow milk to coagulate undisturbed', 30, 36, 1, '{3, 18}'),
(6, 6, 'Cutting the Curd', 'Cut curd into 2cm cubes', 5, 36, 1, '{3, 5}'),
(6, 7, 'Resting', 'Let curds heal and settle', 5, 36, 1, '{3, 18}'),
(6, 8, 'Cooking', 'Gently stir and gradually raise temperature', 20, 42, 2, '{3, 7, 18}'),
(6, 9, 'Draining', 'Drain whey from curds', 10, 42, 2, '{3, 8, 9}'),
(6, 10, 'Acidification', 'Allow curds to continue acidifying', 60, 40, 3, '{4, 19}'),
(6, 11, 'Stretching Test', 'Test small piece in hot water for stretching', 5, 85, 5, '{3, 18}'),
(6, 12, 'Stretching', 'Immerse curds in hot water and stretch until smooth', 10, 85, 5, '{3, 8}'),
(6, 13, 'Forming', 'Shape into balls or desired forms', 5, 65, 10, NULL),
(6, 14, 'Cooling', 'Cool in cold water or brine', 30, 10, 5, '{4}');

-- Process Steps for Paneer
INSERT INTO process_steps (process_template_id, step_number, title, description, estimated_time_minutes, temperature_target_celsius, temperature_tolerance, equipment_ids) VALUES
(7, 1, 'Milk Heating', 'Heat milk to near boiling', 20, 90, 5, '{3, 18}'),
(7, 2, 'Acid Addition', 'Add lemon juice or vinegar while stirring', 5, 90, 5, '{3, 7}'),
(7, 3, 'Coagulation', 'Stop stirring and let curds fully separate from whey', 10, 85, 10, '{3}'),
(7, 4, 'Draining', 'Pour into cheesecloth-lined colander', 5, 80, 10, '{9}'),
(7, 5, 'Rinsing', 'Optional: rinse with cool water to remove acidity', 5, 40, 10, '{9}'),
(7, 6, 'Salting', 'Optional: mix salt into curds or add to rinse water', 2, 40, 10, '{9}'),
(7, 7, 'Pressing', 'Wrap and press under weight', 30, 30, 10, '{12, 17}'),
(7, 8, 'Cooling', 'Refrigerate to firm up', 120, 4, 2, NULL);

-- Aging Locations
INSERT INTO aging_locations (name, description, temperature_target_celsius, humidity_target_percent, capacity, current_occupancy) VALUES
('Main Aging Cave', 'Primary aging facility for hard and semi-hard cheeses', 12, 85, 500, 210),
('Blue Cheese Room', 'High humidity room for blue cheese development', 10, 95, 100, 45),
('Bloomy Rind Chamber', 'Controlled environment for white mold cheeses', 12, 92, 200, 85),
('Washed Rind Chamber', 'Higher temperature space for washed rind varieties', 14, 95, 100, 30),
('Fresh Cheese Cooler', 'Cold storage for fresh cheeses', 4, 80, 300, 120);

-- Quality Tests
INSERT INTO quality_tests (name, description, test_method, parameter_name, expected_range, units) VALUES
('pH Test', 'Measure acidity level of cheese', 'Use calibrated pH meter on cheese sample', 'pH', '{"min": 4.5, "max": 7.0}', 'pH'),
('Fat Content', 'Determine fat percentage', 'Gerber method or laboratory analysis', 'Fat', '{"min": 20, "max": 55}', '%'),
('Moisture Analysis', 'Measure water content', 'Oven drying method', 'Moisture', '{"min": 30, "max": 60}', '%'),
('Salt Content', 'Determine salt percentage', 'Titration method', 'Salt', '{"min": 0.5, "max": 5}', '%'),
('Coliform Count', 'Check for fecal contamination', 'Plate count method', 'Coliforms', '{"min": 0, "max": 10}', 'CFU/g'),
('Texture Analysis', 'Measure firmness and consistency', 'Penetrometer test', 'Firmness', '{"min": 1, "max": 10}', 'N'),
('Sensory Evaluation', 'Expert taste assessment', 'Blind tasting by qualified panel', 'Score', '{"min": 1, "max": 10}', 'points');

-- Knowledge Articles
INSERT INTO knowledge_articles (title, content, category, tags, created_by, is_published) VALUES
('Understanding Cheese Cultures', 'Detailed guide to the various bacterial and fungal cultures used in cheesemaking, their functions, and how they influence flavor development...', 'Technical', ARRAY['cultures', 'fermentation', 'flavor'], 2, true),
('Troubleshooting Acid Development', 'Common issues with milk acidification and how to address them. Includes pH targets for various cheese styles and strategies for controlling acid development...', 'Troubleshooting', ARRAY['pH', 'acidity', 'cultures'], 2, true),
('The Art of Affinage', 'Comprehensive guide to cheese aging techniques, environment management, and rind development for various cheese styles...', 'Aging', ARRAY['aging', 'affinage', 'rinds'], 2, true),
('Milk Quality and Selection', 'How to select and evaluate milk for cheesemaking, including seasonal variations, breed differences, and the impact of animal diet on cheese quality...', 'Ingredients', ARRAY['milk', 'quality', 'raw milk'], 3, true),
('Food Safety in Cheesemaking', 'Essential practices for maintaining proper hygiene and preventing contamination throughout the cheesemaking process...', 'Safety', ARRAY['safety', 'contamination', 'hygiene'], 5, true);

-- Troubleshooting Issues
INSERT INTO troubleshooting_issues (title, description, cheese_type_id, process_stage, symptoms, possible_causes, solutions, prevention_tips, created_by) VALUES
('Early Blowing', 'Gas formation in cheese during first days of aging', 2, 'Early Aging', 'Cheese swells, develops cracks or eyes prematurely, off-flavors may develop', ARRAY['Coliform contamination', 'Yeast contamination', 'Excessive moisture retention'], 'Discard affected cheese if severe; for mild cases, move to cooler temperature and monitor. Test for contaminants.', 'Ensure proper hygiene, adequate acidification, appropriate pressing, and proper salting.', 2),
('Poor Curd Formation', 'Weak coagulation leading to poor quality curd', NULL, 'Coagulation', 'Soft, weak curds that break easily and retain too much moisture', ARRAY['Low calcium in milk', 'Excessive pasteurization', 'Incorrect rennet amount', 'Wrong temperature'], 'Add calcium chloride to milk before renneting. Adjust rennet amount. Ensure proper temperature.', 'Test milk quality regularly. Standardize pasteurization process if applicable. Calibrate thermometers.', 3),
('Blue Mold Doesn''t Develop', 'Failure of blue veins to form properly', 6, 'Aging', 'Cheese lacks characteristic blue-green veining, flavor development is poor', ARRAY['Insufficient oxygen', 'Too much salt', 'Poor piercing technique', 'Incorrect humidity'], 'Pierce cheese again to create air channels. Adjust aging room humidity. Ensure cheese isn''t too dry.', 'Follow proper piercing protocol. Monitor and control aging room conditions precisely.', 2),
('Bitter Flavors', 'Development of unpleasant bitter notes', NULL, 'Aging', 'Cheese develops bitter, unpleasant taste, especially in the finish', ARRAY['Excessive rennet', 'Certain bacterial strains', 'Proteolysis issues', 'Low salt levels'], 'Aging may help in some cases. Adjust recipe for future batches.', 'Use correct amount of rennet. Select appropriate cultures. Ensure proper salting.', 3),
('Excessive Acid', 'Too much acid development resulting in sharp flavors', NULL, 'Fermentation', 'Cheese has sharp, acidic flavor, crumbly texture, and brittle body', ARRAY['Too much culture', 'Too long ripening time', 'High temperature during culture development'], 'Cannot be fixed in current batch. Adjust for future batches.', 'Monitor pH during make process. Control temperature carefully. Use appropriate amount of culture.', 5);

-- Create a few sample batches
INSERT INTO batches (batch_code, recipe_id, process_template_id, created_by, started_at, completed_at, status, milk_source, notes) VALUES
('CHED2025-001', 2, 2, 3, '2025-05-01 08:00:00', '2025-05-02 16:00:00', 'completed', 'Jersey Farm Cooperative', 'Experimental batch with extended cheddaring time'),
('BRIE2025-002', 3, 3, 3, '2025-05-02 09:00:00', NULL, 'in-progress', 'Holstein Farm Certified Organic', 'Using new P. candidum culture strain'),
('PARM2025-001', 1, 1, 2, '2025-04-15 07:00:00', NULL, 'in-progress', 'Mountain Valley Raw Milk', 'Traditional method batch for 24-month aging program'),
('MOZZ2025-010', 6, 6, 4, '2025-05-04 10:00:00', '2025-05-04 14:00:00', 'completed', 'Local Dairy Pasteurized', 'Training batch for new apprentices');

-- Sample batch steps (for the completed cheddar batch)
INSERT INTO batch_steps (batch_id, step_id, started_at, completed_at, status, operator_id, notes) VALUES
(1, 9, '2025-05-01 08:00:00', '2025-05-01 08:30:00', 'completed', 3, 'Milk quality excellent with 4.1% fat'),
(1, 10, '2025-05-01 08:30:00', '2025-05-01 09:30:00', 'completed', 3, 'Good acid development'),
(1, 11, '2025-05-01 09:30:00', '2025-05-01 09:35:00', 'completed', 3, NULL),
(1, 12, '2025-05-01 09:35:00', '2025-05-01 10:20:00', 'completed', 3, NULL),
(1, 13, '2025-05-01 10:20:00', '2025-05-01 11:05:00', 'completed', 3, NULL),
(1, 14, '2025-05-01 11:05:00', '2025-05-01 11:15:00', 'completed', 3, NULL),
(1, 15, '2025-05-01 11:15:00', '2025-05-01 12:15:00', 'completed', 3, 'Extended healing time by 15 minutes'),
(1, 16, '2025-05-01 12:15:00', '2025-05-01 13:00:00', 'completed', 3, NULL),
(1, 17, '2025-05-01 13:00:00', '2025-05-01 13:10:00', 'completed', 3, NULL),
(1, 18, '2025-05-01 13:10:00', '2025-05-01 14:10:00', 'completed', 4, 'Extended cheddaring time for additional flavor development'),
(1, 19, '2025-05-01 14:10:00', '2025-05-01 14:20:00', 'completed', 4, NULL),
(1, 20, '2025-05-01 14:20:00', '2025-05-01 14:30:00', 'completed', 4, 'Added extra 0.1% salt'),
(1, 21, '2025-05-01 14:30:00', '2025-05-01 14:45:00', 'completed', 4, NULL),
(1, 22, '2025-05-01 14:45:00', '2025-05-02 14:45:00', 'completed', 4, 'Used progressive pressure schedule'),
(1, 23, '2025-05-02 14:45:00', '2025-05-02 15:45:00', 'completed', 3, NULL),
(1, 24, '2025-05-02 15:45:00', NULL, 'in-progress', 3, 'Transferred to aging room 2, shelf B');

-- Sample measurements
INSERT INTO step_measurements (batch_step_id, parameter_name, value, unit, measured_at, measured_by, is_within_bounds, notes) VALUES
(1, 'temperature', 32.1, 'C', '2025-05-01 08:15:00', 3, true, NULL),
(1, 'pH', 6.65, 'pH', '2025-05-01 08:20:00', 3, true, NULL),
(2, 'temperature', 32.0, 'C', '2025-05-01 09:00:00', 3, true, NULL),
(2, 'pH', 6.45, 'pH', '2025-05-01 09:15:00', 3, true, NULL),
(6, 'temperature', 38.9, 'C', '2025-05-01 11:00:00', 3, true, NULL),
(10, 'pH', 5.85, 'pH', '2025-05-01 14:00:00', 4, true, 'Good acid development'),
(13, 'weight', 2.2, 'kg', '2025-05-01 14:40:00', 4, true, 'Final yield slightly above expected');

-- Sample comments
INSERT INTO comments (user_id, batch_id, batch_step_id, comment_text, created_at) VALUES
(3, 1, 10, 'Excellent curd formation with this milk. Consider using this supplier for future cheddar batches.', '2025-05-01 14:15:00'),
(4, 1, null, 'Final texture seems ideal for a medium-aged cheddar. Recommend minimum 3 months aging.', '2025-05-02 16:10:00'),
(2, 1, null, 'I like the modifications to the cheddaring process. Let\'s standardize this approach if the final flavor profile is as expected.', '2025-05-02 17:30:00');

-- Sample batch tests
INSERT INTO batch_tests (batch_id, test_id, tested_at, tested_by, result_value, result_unit, is_within_range, notes) VALUES
(1, 1, '2025-05-02 16:30:00', 5, 5.2, 'pH', true, 'Good final pH for cheddar'),
(1, 2, '2025-05-02 16:35:00', 5, 38.5, '%', true, 'Moisture content within target range'),
(1, 3, '2025-05-02 16:40:00', 5, 1.8, '%', true, 'Salt content slightly above target but acceptable'),
(2, 1, '2025-05-03 09:00:00', 5, 6.4, 'pH', true, 'pH normal for early ripening stage'),
(2, 4, '2025-05-03 09:15:00', 5, 52.0, '%', true, 'Initial moisture content good for soft cheese'),
(3, 1, '2025-04-20 14:00:00', 5, 5.3, 'pH', true, 'pH on track for Parmigiano-style'),
(3, 2, '2025-04-20 14:15:00', 5, 35.1, '%', true, 'Moisture content appropriate for long aging'),
(4, 1, '2025-05-04 13:45:00', 5, 5.2, 'pH', true, 'Final pH perfect for fresh mozzarella'),
(4, 5, '2025-05-04 13:50:00', 5, 185, 'F', true, 'Stretch temperature optimal');

-- Sample aging records
INSERT INTO aging_records (batch_id, recorded_at, recorded_by, temperature, humidity, notes) VALUES
(1, '2025-05-09 08:00:00', 3, 12.2, 85, 'First week progressing well. No surface defects.'),
(1, '2025-05-16 08:00:00', 3, 12.0, 86, 'Developing good rind. Turned all wheels.'),
(1, '2025-05-23 08:00:00', 3, 12.1, 85, 'Color developing nicely. No issues noted.'),
(3, '2025-04-22 08:00:00', 2, 18.5, 82, 'Initial aging phase started. Wheels marked for 24-month program.'),
(3, '2025-04-29 08:00:00', 2, 18.4, 83, 'First week complete. Rind formation beginning.');

-- Sample equipment maintenance records
INSERT INTO equipment_maintenance (equipment_id, maintained_by, maintenance_date, maintenance_type, notes, next_maintenance_due) VALUES
(1, 3, '2025-04-15', 'cleaning', 'Deep cleaned vat and replaced gaskets', '2025-05-15'),
(2, 3, '2025-04-20', 'calibration', 'Calibrated pH meters against standard solutions', '2025-05-20'),
(3, 2, '2025-04-25', 'inspection', 'Checked aging room ventilation system', '2025-05-25'),
(4, 4, '2025-05-01', 'repair', 'Fixed loose handle on curd knife', '2025-06-01'),
(5, 3, '2025-05-02', 'cleaning', 'Sanitized all cheese molds', '2025-05-09');

-- Sample inventory transactions
INSERT INTO inventory_transactions (item_id, transaction_type, quantity, unit, batch_id, transaction_date, recorded_by, notes) VALUES
(1, 'consumption', -500, 'L', 1, '2025-05-01 08:00:00', 3, 'Raw milk for cheddar batch'),
(2, 'consumption', -150, 'ml', 1, '2025-05-01 09:30:00', 3, 'Rennet for cheddar batch'),
(3, 'consumption', -50, 'g', 1, '2025-05-01 08:30:00', 3, 'Starter culture'),
(4, 'consumption', -8, 'kg', 1, '2025-05-01 14:20:00', 4, 'Salt for cheddar batch'),
(5, 'receipt', 1000, 'L', NULL, '2025-05-01 06:00:00', 3, 'Morning milk delivery'),
(6, 'receipt', 100, 'kg', NULL, '2025-05-01 07:00:00', 3, 'Monthly salt stock');
