BEGIN;

-- Insert test user
INSERT INTO "user" (id, name, email)
VALUES ('user_1234567890', 'John Doe', 'john.doe@example.com')
ON CONFLICT (id) DO NOTHING;

-- Insert 20 common food items
INSERT INTO "food" (name, calories, protein, carbs, fat, user_id) VALUES
('Grilled Chicken Breast (100g)', 165, 31, 0, 3, 'user_1234567890'),
('Salmon Fillet (100g)', 208, 20, 0, 13, 'user_1234567890'),
('Brown Rice (1 cup cooked)', 215, 5, 45, 2, 'user_1234567890'),
('Broccoli (100g)', 34, 3, 7, 0, 'user_1234567890'),
('Whole Wheat Bread (1 slice)', 69, 4, 12, 1, 'user_1234567890'),
('Almonds (28g)', 164, 6, 6, 14, 'user_1234567890'),
('Greek Yogurt (100g)', 59, 10, 4, 0, 'user_1234567890'),
('Sweet Potato (100g)', 86, 2, 20, 0, 'user_1234567890'),
('Avocado (100g)', 160, 2, 9, 15, 'user_1234567890'),
('Egg (Large)', 78, 6, 0, 5, 'user_1234567890'),
('Protein Powder (1 scoop)', 120, 24, 3, 1, 'user_1234567890'),
('Spinach (100g)', 23, 3, 4, 0, 'user_1234567890'),
('Quinoa (1 cup cooked)', 222, 8, 39, 4, 'user_1234567890'),
('Banana (Medium)', 105, 1, 27, 0, 'user_1234567890'),
('Peanut Butter (2 tbsp)', 188, 8, 6, 16, 'user_1234567890'),
('Oatmeal (1 cup cooked)', 158, 6, 27, 3, 'user_1234567890'),
('Cottage Cheese (100g)', 98, 11, 3, 4, 'user_1234567890'),
('Tuna in Water (100g)', 86, 19, 0, 1, 'user_1234567890'),
('Dark Chocolate (28g)', 170, 2, 13, 12, 'user_1234567890'),
('Olive Oil (1 tbsp)', 119, 0, 0, 14, 'user_1234567890');

-- Insert 10 meals
INSERT INTO "meal" (name, user_id) VALUES
('Morning Power Breakfast', 'user_1234567890'),
('Pre-Workout Snack', 'user_1234567890'),
('Post-Workout Lunch', 'user_1234567890'),
('Afternoon Energy Boost', 'user_1234567890'),
('Evening Muscle Feast', 'user_1234567890'),
('Bedtime Recovery Meal', 'user_1234567890'),
('Weekend Brunch Special', 'user_1234567890'),
('Quick Office Lunch', 'user_1234567890'),
('Post-Run Recovery', 'user_1234567890'),
('Late Night Study Snack', 'user_1234567890');

-- Insert meal-food combinations (40 entries)
INSERT INTO "meal_foods" (meal_id, food_id, quantity) VALUES
-- Morning Power Breakfast
(1, 10, 3),  -- 3 Eggs
(1, 16, 1),  -- Oatmeal
(1, 15, 1),  -- Peanut Butter

-- Pre-Workout Snack
(2, 6, 1),   -- Almonds
(2, 9, 0.5), -- Half avocado

-- Post-Workout Lunch
(3, 1, 2),   -- Double chicken breast
(3, 3, 1.5), -- 1.5 cups brown rice
(3, 4, 2),   -- Double broccoli

-- Afternoon Energy Boost
(4, 7, 1),   -- Greek Yogurt
(4, 19, 0.5),-- Dark Chocolate
(4, 12, 1),  -- Spinach

-- Evening Muscle Feast
(5, 2, 1.5), -- 1.5 salmon fillet
(5, 13, 1),  -- Quinoa
(5, 8, 2),   -- Double sweet potato
(5, 20, 0.5),-- Olive Oil

-- Bedtime Recovery Meal
(6, 17, 2),  -- Cottage Cheese
(6, 5, 1),   -- Whole Wheat Bread
(6, 18, 1),  -- Tuna

-- Weekend Brunch Special
(7, 10, 2),  -- 2 Eggs
(7, 5, 2),   -- 2 slices bread
(7, 14, 1),  -- Banana
(7, 15, 1),  -- Peanut Butter

-- Quick Office Lunch
(8, 18, 2),  -- Tuna
(8, 5, 2),   -- Bread
(8, 4, 1),   -- Broccoli
(8, 9, 0.5), -- Avocado

-- Post-Run Recovery
(9, 11, 1),  -- Protein Powder
(9, 14, 1),  -- Banana
(9, 16, 0.5),-- Oatmeal
(9, 6, 0.5), -- Almonds

-- Late Night Study Snack
(10, 7, 1),  -- Greek Yogurt
(10, 19, 1), -- Dark Chocolate
(10, 15, 1),-- Peanut Butter
(10, 14, 1);-- Banana

COMMIT;

-- Optional: Update sequences to prevent conflicts with future inserts
ALTER SEQUENCE food_id_seq RESTART WITH 100;
ALTER SEQUENCE meal_id_seq RESTART WITH 100;