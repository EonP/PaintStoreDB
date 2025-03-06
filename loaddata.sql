-- Include your INSERT SQL statements in this file.
-- Make sure to terminate each statement with a semicolon (;)

-- LEAVE this statement on. It is required to connect to your database.
CONNECT TO COMP421;

-- Remember to put the INSERT statements for the tables with foreign key references
--    ONLY AFTER the insert for the parent tables!

-- This is only an example of how you add INSERT statements to this file.
--   You may remove it.

INSERT INTO STORE (s_id, s_address, phone_number, manager_id) VALUES
    (1, '9301 Leopard St', '3612422520', 1),
    (2, '456 Oakwood Dr', '3615551234', 2),
    (3, '789 Maple Ave', '3619876543', 3),
    (4, '321 Pine St', '3611112233', 4),
    (5, '654 Cedar Ln', '3613334455', 5),
    (6, '987 Birch Rd', '3617778899', 6),
    (7, '159 Elm St', '3619990001', 7),
    (8, '753 Walnut Blvd', '3616667778', 8);
;

INSERT INTO EMPLOYEE (e_id, e_name, s_id) VALUES
    ( 1, 'Jamey Prosacco', 1),
    ( 2, 'Miss Ralph Bergnaum', 2),
    ( 3, 'Tony Krajcik', 3),
    ( 4, 'Sarina Kiehn', 4),
    ( 5, 'Missouri Raynor', 5),
    ( 6, 'Ward Reichel', 6),
    ( 7, 'Lenora Bogisich', 7),
    ( 8, 'Edythe Lakin', 8),
    ( 9, 'Mustafa Robel', 1),
    (10, 'Nicholas Hane', 2),
    (11, 'Elvie Brown', 3),
    (12, 'Richie Hermiston', 4),
    (13, 'Marcellus Huels', 5),
    (14, 'Laurel Yost', 6),
    (15, 'Alia Breitenberg', 7),
    (16, 'Ardith Konopelski', 8),
    (17, 'Weldon Armstrong', 1),
    (18, 'Leonor Jakubowski', 2),
    (19, 'Einar McLaughlin', 3),
(20, 'Rodrigo Heaney', 4),
    (21, 'Jacklyn Schmidt', 5),
    (22, 'Shea Prosacco', 6),
    (23, 'Clay Upton I', 7),
    (24, 'Niko Nikolaus', 8),
    (25, 'Antonietta Cruickshank', 1),
    (26, 'Sydnee Cronin', 2),
    (27, 'Reanna Kerluke', 3),
    (28, 'Charlotte Green', 4),
    (29, 'Triston Okuneva DVM', 5),
    (30, 'Jeanette Smith', 6),
    (31, 'Ben Kuhic', 7),
    (32, 'Sharon Raynor', 8),
    (33, 'Cloyd Fadel', 1),
    (34, 'Zetta Bartoletti', 2),
    (35, 'Malika Ward', 3),
    (36, 'Joannie Upton', 4),
    (37, 'Lucio Kuhn', 5),
    (38, 'Emery Kozey', 6),
    (39, 'Uriel Toy', 7),
    (40, 'Miss Daniella Fay', 8),
    (41, 'Guillermo Boyer DDS', 1),
    (42, 'Alford Bayer', 2),
    (43, 'Amelie Vandervort', 3),
    (44, 'Lazaro Johnston', 4),
    (45, 'Maxwell Cole', 5),
(46, 'Mr. Keely Marks', 6),
    (47, 'Kaden Kuvalis', 7),
    (48, 'Trent Gulgowski', 8),
    (49, 'Alfred Howe', 1),
    (50, 'Tobin Hoeger', 2)
;

INSERT INTO MANUFACTURER (m_id, m_name) VALUES
    (1, 'Sherwin-Williams'),
    (2, 'Benjamin Moore'),
    (3, 'Behr'),
    (4, 'PPG Industries'),
    (5, 'Dulux'),
    (6, 'Valspar'),
    (7, 'Farrow & Ball'),
    (8, 'Glidden'),
    (9, 'Rust-Oleum'),
    (10, 'Crown Paints')
;

INSERT INTO PRODUCT (p_id, p_name, unit_price, description, discount_pourcentage, m_id) VALUES
    -- paint
    (1, 'Ultra White Gloss', 15.99, 'High-quality white gloss paint for interior use', 10, 1),
    (2, 'Ocean Breeze', 12.49, 'Fresh, cool blue paint perfect for bedroom walls', 15, 2),
    (3, 'Forest Green', 18.99, 'Rich green paint for exterior walls', 5, 3),
    (4, 'Sunset Orange', 14.99, 'Vibrant orange paint for accent walls', 20, 4),
    (5, 'Midnight Black', 22.49, 'Premium black paint for modern interiors', 10, 5),
    (6, 'Blush Pink', 16.49, 'Soft and elegant pink for nursery rooms', 0, 6),
    (7, 'Classic Red', 19.99, 'Bright red paint ideal for statement walls', 25, 7),
    (8, 'Royal Purple', 21.49, 'Luxurious purple paint for high-end rooms', 30, 8),
    (9, 'Aqua Blue', 13.99, 'Cool blue paint for bathrooms and kitchens', 12, 9),
    (10, 'Stone Grey', 17.99, 'Neutral grey paint for modern living rooms', 5, 10),
    (11, 'Autumn Brown', 16.99, 'Earthy brown paint for rustic interiors', 15, 1),
    (12, 'Snow White', 14.49, 'Bright white paint for ceilings and trim', 20, 2),
    (13, 'Cherry Red', 18.49, 'Bold red paint for dining rooms', 8, 3),
    (14, 'Lemon Yellow', 11.99, 'Cheerful yellow paint for kitchens', 10, 4),
    (15, 'Moss Green', 17.49, 'Natural green paint for exteriors', 18, 5),
    (16, 'Lavender Dream', 20.99, 'Calming lavender paint for bedrooms', 7, 6),
    (17, 'Cobalt Blue', 19.99, 'Deep blue paint for accent walls', 22, 7),
    (18, 'Champagne Gold', 23.49, 'Elegant gold paint for trim and accents', 10, 8),
    (19, 'Tangerine', 13.49, 'Bright tangerine paint for lively rooms', 15, 9),
    (20, 'Cement Gray', 17.49, 'Industrial grey paint for loft-style homes', 12, 10),
    (21, 'Coastal Blue', 14.99, 'Fresh blue for coastal-themed spaces', 9, 1),
    (22, 'Peach Blush', 16.99, 'Warm peach paint for living rooms', 20, 2),
    (23, 'Crisp White', 18.99, 'Pure white paint for clean finishes', 5, 3),
    (24, 'Coral Reef', 13.99, 'Vibrant coral paint for kids’ rooms', 30, 4),
    (25, 'Cedar Brown', 22.49, 'Rich brown for exterior woodwork', 5, 5),
    (26, 'Ballet Slipper', 12.99, 'Soft pale pink paint for bedrooms', 25, 6),
    (27, 'Electric Blue', 19.49, 'Bright electric blue for feature walls', 10, 7),
    (28, 'Mint Green', 15.49, 'Cool mint green for bathrooms', 20, 8),
    (29, 'Frosted Silver', 21.99, 'Shiny silver paint for contemporary spaces', 0, 9),
    (30, 'Burnt Sienna', 18.49, 'Earthy red-brown paint for rustic settings', 10, 10),
    (31, 'Spicy Red', 13.49, 'Bold red paint for accent walls', 10, 1),
    (32, 'Seafoam Green', 16.99, 'Soft green paint for calming bedrooms', 12, 2),
    (33, 'Violet Mist', 17.49, 'Gentle violet paint for cozy living rooms', 7, 3),
    (34, 'Golden Yellow', 14.49, 'Bright yellow paint for lively kitchens', 25, 4),
    (35, 'Ebony Black', 21.99, 'Sophisticated black paint for interiors', 20, 5),
    (36, 'Coral Pink', 19.49, 'Warm coral pink for kids’ rooms', 5, 6),
    (37, 'Turquoise Blue', 16.99, 'Bright turquoise blue for bathrooms', 18, 7),
    (38, 'Ivory White', 13.99, 'Soft white paint for ceilings and walls', 10, 8),
    (39, 'Amethyst Purple', 23.99, 'Luxurious purple for bedrooms and living rooms', 12, 9),
    (40, 'Berry Red', 15.49, 'Bold red paint for accent walls', 20, 10),
    (41, 'Warm Taupe', 17.99, 'Neutral taupe paint for modern interiors', 25, 1),
    (42, 'Ocean Mist', 14.99, 'Calming misty blue paint for living rooms', 12, 2),
    (43, 'Lime Green', 16.49, 'Vibrant lime green for kitchens and bathrooms', 15, 3),
    (44, 'Soft Lilac', 18.99, 'Gentle lilac paint for bedrooms', 7, 4),
    (45, 'Pine Forest', 20.49, 'Dark green paint for feature walls', 20, 5),
    (46, 'Peach Fizz', 13.49, 'Fresh peach paint for warm living spaces', 8, 6),
    (47, 'Bright White', 14.49, 'Super bright white for ceilings', 10, 7),
    (48, 'Tidal Wave', 22.99, 'Deep blue paint for coastal homes', 5, 8),
    (49, 'Sunshine Yellow', 12.99, 'Bright yellow paint for cheerful spaces', 25, 9),
    (50, 'Rich Burgundy', 19.99, 'Elegant burgundy paint for living rooms', 18, 10),
    (51, 'Lime Punch', 21.49, 'Bold lime green paint for modern interiors', 0, 1),
    (52, 'Blushing Rose', 17.99, 'Soft rose color for delicate walls', 5, 2),
    (53, 'Tangerine Twist', 15.49, 'Bright orange paint for kitchen or living room', 10, 3),
    (54, 'Cloud White', 16.99, 'Soft white paint perfect for a clean look', 20, 4),
    (55, 'Royal Red', 18.49, 'Bold, elegant red paint for any room', 12, 5),
    (56, 'Spruce Green', 20.99, 'Cool green paint for a natural vibe', 10, 6),
    (57, 'Mauve Magic', 17.49, 'A gentle and calming mauve color for bedrooms', 8, 7),
    (58, 'Jade Green', 19.99, 'Serene jade green for modern living rooms', 30, 8),
    (59, 'Golden Bronze', 22.99, 'Rich bronze paint for luxurious finishes', 18, 9),
    (60, 'Sunny Beige', 14.99, 'Warm beige for living spaces', 5, 10),
    (61, 'Dusty Rose', 15.99, 'Subtle rose color for dining rooms', 12, 1),
    (62, 'Ice Blue', 13.49, 'Soft, cool blue for wintery spaces', 10, 2),
    (63, 'Vibrant Coral', 17.99, 'Bright coral for creative spaces', 25, 3),
    (64, 'Classic Beige', 16.49, 'Timeless beige paint for any room', 5, 4),
    (65, 'Cocoa Brown', 19.49, 'Rich brown for rustic interior spaces', 10, 5),
    (66, 'Champagne Pink', 22.99, 'Soft champagne color for elegant rooms', 15, 6),
    (67, 'Tropical Green', 18.99, 'Bold tropical green for accent walls', 30, 7),
    (68, 'Winter White', 21.49, 'Cool white for contemporary interiors', 7, 8),
    (69, 'Pink Blossom', 14.99, 'Light and cheerful pink for kids’ rooms', 20, 9),
    (70, 'Dark Walnut', 23.99, 'Dark wood color for a sophisticated feel', 12, 10),
    (71, 'Crystal Clear', 15.99, 'Clear finish for wood and metal', 5, 1),
    (72, 'Raspberry Red', 16.99, 'Vivid raspberry color for playful rooms', 10, 2),
    (73, 'Spiced Pumpkin', 18.49, 'Warm orange paint for cozy spaces', 8, 3),
    (74, 'Slate Grey', 19.99, 'Dark grey for a modern look', 20, 4),
    (75, 'Deep Charcoal', 20.49, 'Dark grey for contemporary homes', 12, 5),
    (76, 'Bright Mint', 16.99, 'Refreshing mint green for kitchens', 7, 6),
    (77, 'Taffy Pink', 15.49, 'Sweet pink for living rooms', 25, 7),
    (78, 'Lush Lavender', 19.49, 'Soft lavender for peaceful bedrooms', 0, 8),
    (79, 'Sunset Yellow', 14.49, 'Warm yellow for creating cheerful spaces', 18, 9),
    (80, 'Cherry Blossom', 18.99, 'Soft pink for bedrooms', 5, 10),
    (81, 'Midnight Navy', 21.99, 'Dark navy blue for classy interiors', 10, 1),
    (82, 'Autumn Gold', 17.49, 'Golden yellow for living rooms', 12, 2),
    (83, 'Silver Lining', 19.99, 'Shiny silver for accent walls', 30, 3),
    (84, 'Sea Breeze', 14.99, 'Soft blue for bedrooms', 15, 4),
    (85, 'Burnt Copper', 20.99, 'Rich copper for warm interior spaces', 8, 5),
    (86, 'Lavender Field', 23.49, 'Lavender color for serene spaces', 5, 6),
    (87, 'Winter Frost', 17.99, 'Cool frosty white for modern interiors', 20, 7),
    (88, 'Pale Peach', 16.49, 'Light peach color for dining rooms', 12, 8),
    (89, 'Crimson Red', 22.49, 'Bold crimson for accent walls', 18, 9),
    (90, 'Grape Purple', 15.99, 'Rich purple for bedrooms', 10, 10),
    (91, 'Sunset Coral', 16.99, 'Soft coral for cozy spaces', 20, 1),
    (92, 'Classic Black', 18.49, 'Elegant black for modern homes', 5, 2),
    (93, 'Deep Teal', 19.49, 'A calm and deep teal for modern homes', 10, 3),
    (94, 'Biscotti Beige', 14.49, 'Warm beige for living rooms', 15, 4),
    (95, 'Turquoise Jewel', 21.99, 'Bright turquoise for feature walls', 12, 5),
    (96, 'Cantaloupe Orange', 17.49, 'Soft orange for accent walls', 18, 6),
    (97, 'Creamy Almond', 16.99, 'Neutral almond color for living rooms', 7, 7),
    (98, 'Rosewood', 20.49, 'Rich wood-like finish for interiors', 8, 8),
    (99, 'Magenta Pink', 22.99, 'Vibrant magenta for kids’ rooms', 5, 9),
    (100, 'Spring Green', 18.49, 'Fresh green for a spring-like feel', 15, 10),
    (101, 'Shimmering Silver', 19.99, NULL, 0, 1),
    (102, 'Mystic Black', 23.49, NULL, NULL, 2),

    -- tool
    (103, 'Paint Roller', 8.99, 'Soft and durable roller for smooth paint application', 5, 1),
    (104, 'Paint Brush Set', 14.49, 'Set of 3 brushes for detailed painting', 10, 2),
    (105, 'Paint Tray', 6.49, 'Plastic tray for holding paint while using rollers or brushes', 0, 3),
    (106, 'Drop Cloth', 12.99, 'Protective cloth to cover floors and furniture during painting', 15, 4),
    (107, 'Ladder', 49.99, 'Step ladder for reaching high areas while painting', 20, 5),
    (108, "Painter's Tape", 4.99, 'Masking tape for clean edges and lines', 10, 6),
    (109, 'Paint Scraper', 7.49, 'Tool for removing old paint or smoothing surfaces', 12, 7),
    (110, 'Paint Tray Liner', 3.99, 'Disposable liner for paint trays for easy cleanup', 5, 8),
    (111, 'Caulk Gun', 11.49, 'For applying caulk along seams and cracks in walls', 8, 9),
    (112, 'Paint Stir Stick', 1.49, 'Wooden stick for stirring paint to ensure an even mix', 0, 10);
;


INSERT INTO PAINT (p_id, base, color) VALUES
    (1, 'Gloss', 'Ultra White'),
    (2, 'Matte', 'Ocean Breeze'),
    (3, 'Matte', 'Forest Green'),
    (4, 'Gloss', 'Sunset Orange'),
    (5, 'Matte', 'Midnight Black'),
    (6, 'Matte', 'Blush Pink'),
    (7, 'Gloss', 'Classic Red'),
    (8, 'Gloss', 'Royal Purple'),
    (9, 'Matte', 'Aqua Blue'),
    (10, 'Matte', 'Stone Grey'),
    (11, 'Matte', 'Autumn Brown'),
    (12, 'Gloss', 'Snow White'),
    (13, 'Gloss', 'Cherry Red'),
    (14, 'Matte', 'Lemon Yellow'),
    (15, 'Matte', 'Moss Green'),
    (16, 'Matte', 'Lavender Dream'),
    (17, 'Gloss', 'Cobalt Blue'),
    (18, 'Gloss', 'Champagne Gold'),
    (19, 'Matte', 'Tangerine'),
    (20, 'Matte', 'Cement Gray'),
    (21, 'Matte', 'Coastal Blue'),
    (22, 'Matte', 'Peach Blush'),
    (23, 'Matte', 'Crisp White'),
    (24, 'Gloss', 'Coral Reef'),
    (25, 'Matte', 'Cedar Brown'),
    (26, 'Gloss', 'Ballet Slipper'),
    (27, 'Gloss', 'Electric Blue'),
    (28, 'Matte', 'Mint Green'),
    (29, 'Gloss', 'Frosted Silver'),
    (30, 'Matte', 'Burnt Sienna'),
    (31, 'Gloss', 'Spicy Red'),
    (32, 'Matte', 'Seafoam Green'),
    (33, 'Matte', 'Violet Mist'),
    (34, 'Gloss', 'Golden Yellow'),
    (35, 'Matte', 'Ebony Black'),
    (36, 'Matte', 'Coral Pink'),
    (37, 'Matte', 'Turquoise Blue'),
    (38, 'Matte', 'Ivory White'),
    (39, 'Gloss', 'Amethyst Purple'),
    (40, 'Gloss', 'Berry Red'),
    (41, 'Matte', 'Warm Taupe'),
    (42, 'Matte', 'Ocean Mist'),
    (43, 'Gloss', 'Lime Green'),
    (44, 'Matte', 'Soft Lilac'),
    (45, 'Matte', 'Pine Forest'),
    (46, 'Gloss', 'Peach Fizz'),
    (47, 'Gloss', 'Bright White'),
    (48, 'Gloss', 'Tidal Wave'),
    (49, 'Gloss', 'Sunshine Yellow'),
    (50, 'Gloss', 'Rich Burgundy'),
    (51, 'Gloss', 'Lime Punch'),
    (52, 'Gloss', 'Blushing Rose'),
    (53, 'Matte', 'Tangerine Twist'),
    (54, 'Matte', 'Cloud White'),
    (55, 'Gloss', 'Royal Red'),
    (56, 'Matte', 'Spruce Green'),
    (57, 'Matte', 'Mauve Magic'),
    (58, 'Gloss', 'Jade Green'),
    (59, 'Gloss', 'Golden Bronze'),
    (60, 'Matte', 'Sunny Beige'),
    (61, 'Matte', 'Dusty Rose'),
    (62, 'Matte', 'Ice Blue'),
    (63, 'Matte', 'Vibrant Coral'),
    (64, 'Matte', 'Classic Beige'),
    (65, 'Matte', 'Cocoa Brown'),
    (66, 'Gloss', 'Champagne Pink'),
    (67, 'Matte', 'Tropical Green'),
    (68, 'Gloss', 'Winter White'),
    (69, 'Matte', 'Pink Blossom'),
    (70, 'Gloss', 'Dark Walnut'),
    (71, 'Gloss', 'Crystal Clear'),
    (72, 'Matte', 'Raspberry Red'),
    (73, 'Matte', 'Spiced Pumpkin'),
    (74, 'Gloss', 'Slate Grey'),
    (75, 'Gloss', 'Deep Charcoal'),
    (76, 'Matte', 'Bright Mint'),
    (77, 'Gloss', 'Taffy Pink'),
    (78, 'Matte', 'Lush Lavender'),
    (79, 'Matte', 'Sunset Yellow'),
    (80, 'Gloss', 'Cherry Blossom'),
    (81, 'Matte', 'Midnight Navy'),
    (82, 'Matte', 'Autumn Gold'),
    (83, 'Gloss', 'Silver Lining'),
    (84, 'Matte', 'Sea Breeze'),
    (85, 'Gloss', 'Burnt Copper'),
    (86, 'Matte', 'Lavender Field'),
    (87, 'Matte', 'Winter Frost'),
    (88, 'Matte', 'Pale Peach'),
    (89, 'Gloss', 'Crimson Red'),
    (90, 'Gloss', 'Grape Purple'),
    (91, 'Gloss', 'Sunset Coral'),
    (92, 'Matte', 'Classic Black'),
    (93, 'Matte', 'Deep Teal'),
    (94, 'Matte', 'Biscotti Beige'),
    (95, 'Gloss', 'Turquoise Jewel'),
    (96, 'Matte', 'Cantaloupe Orange'),
    (97, 'Matte', 'Creamy Almond'),
    (98, 'Matte', 'Rosewood'),
    (99, 'Gloss', 'Magenta Pink'),
    (100, 'Matte', 'Spring Green'),
    (101, 'Gloss', 'Shimmering Silver'),
    (102, 'Matte', 'Mystic Black')
;

INSERT INTO TOOL (p_id, type) VALUES
    (103, 'Roller'),
    (104, 'Brush Set'),
    (105, 'Tray'),
    (106, 'Drop Cloth'),
    (107, 'Ladder'),
    (108, "Painter's Tape"),
    (109, 'Scraper'),
    (110, 'Tray Liner'),
    (111, 'Caulk Gun'),
    (112, 'Stir Stick')
;

INSERT INTO HAS_IN_STOCK (p_id, s_id, quantity) VALUES
    -- Store 1
    (1, 1, 100), (2, 1, 150), (3, 1, 200), (4, 1, 300), (5, 1, 50), (6, 1, 130),
    (7, 1, 75), (8, 1, 120), (9, 1, 200), (10, 1, 60), (11, 1, 110), (12, 1, 50),
    (13, 1, 75), (14, 1, 150), (15, 1, 200), (16, 1, 95), (17, 1, 250),
    -- Store 2
    (1, 2, 120), (2, 2, 140), (3, 2, 180), (4, 2, 275), (5, 2, 60), (6, 2, 125),
    (7, 2, 70), (8, 2, 110), (9, 2, 180), (10, 2, 50), (11, 2, 100), (12, 2, 60),
    (13, 2, 85), (14, 2, 140), (15, 2, 180), (16, 2, 85), (17, 2, 230),
    -- Store 3
    (1, 3, 95), (2, 3, 145), (3, 3, 190), (4, 3, 250), (5, 3, 55), (6, 3, 120),
    (7, 3, 80), (8, 3, 115), (9, 3, 190), (10, 3, 55), (11, 3, 95), (12, 3, 55),
    (13, 3, 70), (14, 3, 135), (15, 3, 190), (16, 3, 90), (17, 3, 240),
    -- Store 4
    (1, 4, 110), (2, 4, 155), (3, 4, 195), (4, 4, 265), (5, 4, 45), (6, 4, 135),
    (7, 4, 85), (8, 4, 125), (9, 4, 175), (10, 4, 70), (11, 4, 105), (12, 4, 45),
    (13, 4, 65), (14, 4, 125), (15, 4, 175), (16, 4, 100), (17, 4, 220),
    -- Store 5
    (1, 5, 105), (2, 5, 135), (3, 5, 210), (4, 5, 285), (5, 5, 70), (6, 5, 140),
    (7, 5, 90), (8, 5, 130), (9, 5, 210), (10, 5, 65), (11, 5, 90), (12, 5, 65),
    (13, 5, 60), (14, 5, 145), (15, 5, 185), (16, 5, 105), (17, 5, 210),
    -- Store 6
    (1, 6, 115), (2, 6, 160), (3, 6, 180), (4, 6, 310), (5, 6, 80), (6, 6, 150),
    (7, 6, 95), (8, 6, 140), (9, 6, 220), (10, 6, 75), (11, 6, 115), (12, 6, 55),
    (13, 6, 90), (14, 6, 160), (15, 6, 205), (16, 6, 110), (17, 6, 250),
    -- Store 7
    (1, 7, 130), (2, 7, 150), (3, 7, 205), (4, 7, 270), (5, 7, 65), (6, 7, 160),
    (7, 7, 100), (8, 7, 135), (9, 7, 230), (10, 7, 80), (11, 7, 120), (12, 7, 60),
    (13, 7, 80), (14, 7, 155), (15, 7, 220), (16, 7, 120), (17, 7, 260),
    -- Store 8
    (1, 8, 98), (2, 8, 142), (3, 8, 175), (4, 8, 260), (5, 8, 60), (6, 8, 155),
    (7, 8, 105), (8, 8, 120), (9, 8, 200), (10, 8, 85), (11, 8, 100), (12, 8, 70),
    (13, 8, 95), (14, 8, 130), (15, 8, 210), (16, 8, 105), (17, 8, 230)
;

INSERT INTO CUSTOMER (email, c_name, c_address) VALUES
    ('john.doe@example.com', 'John Doe', '123 Elm St, Springfield'),
    ('jane.smith@example.com', 'Jane Smith', '456 Oak St, Springfield'),
    ('mark.johnson@example.com', 'Mark Johnson', '789 Pine St, Springfield'),
    ('lisa.brown@example.com', 'Lisa Brown', '101 Maple St, Springfield'),
    ('michael.wilson@example.com', 'Michael Wilson', '202 Cedar St, Springfield'),
    ('emily.jones@example.com', 'Emily Jones', '303 Birch St, Springfield'),
    ('david.miller@example.com', 'David Miller', '404 Walnut St, Springfield'),
    ('susan.davis@example.com', 'Susan Davis', '505 Cherry St, Springfield'),
    ('james.white@example.com', 'James White', '606 Ash St, Springfield'),
    ('karen.martin@example.com', NULL, '707 Pinecone St, Springfield')
;

INSERT INTO PURCHASE (p_id, amount, p_date, p_time) VALUES
    (1,  44.47, '2025-03-01', '10:15:00'),
    (2, 107.45, '2025-03-02', '11:20:00'),
    (3,  90.95, '2025-03-03', '14:30:00'),
    (4,  97.45, '2025-03-04', '15:45:00'),
    (5, 105.93, '2025-03-05', '16:10:00'),
    (6,  66.45, '2025-03-06', '09:05:00'),
    (7,  88.45, '2025-03-07', '12:25:00'),
    (8,  66.46, '2025-03-08', '13:40:00'),
    (9, 182.41, '2025-03-09', '17:00:00'),
    (10, 56.46, '2025-03-10', '18:20:00')
;

INSERT INTO CONTAINS_PURCHASE (purchase_id, product_id, quantity) VALUES
    (1, 1, 2),   -- Purchase 1: 2 units of product 1
    (1, 2, 1),   -- Purchase 1: 1 unit of product 2
    (2, 5, 3),   -- Purchase 2: 3 units of product 5
    (2, 7, 2),   -- Purchase 2: 2 units of product 7
    (3, 3, 4),   -- Purchase 3: 4 units of product 3
    (3, 4, 1),   -- Purchase 3: 1 unit of product 4
    (4, 6, 2),   -- Purchase 4: 2 units of product 6
    (4, 8, 3),   -- Purchase 4: 3 units of product 8
    (5, 9, 5),   -- Purchase 5: 5 units of product 9
    (5, 10, 2),  -- Purchase 5: 2 units of product 10
    (6, 11, 1),  -- Purchase 6: 1 unit of product 11
    (6, 12, 3),  -- Purchase 6: 3 units of product 12
    (7, 13, 2),  -- Purchase 7: 2 units of product 13
    (7, 14, 4),  -- Purchase 7: 4 units of product 14
    (8, 15, 1),  -- Purchase 8: 1 unit of product 15
    (8, 16, 2),  -- Purchase 8: 2 units of product 16
    (9, 17, 3),  -- Purchase 9: 3 units of product 17
    (9, 18, 5),  -- Purchase 9: 5 units of product 18
    (10, 19, 1), -- Purchase 10: 1 unit of product 19
    (10, 20, 2)  -- Purchase 10: 2 units of product 20
;


INSERT INTO INSTORE (p_id, e_id) VALUES
    (1, 1),   -- Purchase 1: Made in-store by Employee 1
    (2, 2),   -- Purchase 2: Made in-store by Employee 2
    (3, 3),   -- Purchase 3: Made in-store by Employee 3
    (4, 4),   -- Purchase 4: Made in-store by Employee 4
    (5, 5)    -- Purchase 5: Made in-store by Employee 5
;

INSERT INTO ONLINE (p_id, rating, delivery_fee, email) VALUES
    (6, NULL, 5.99, 'lisa.brown@example.com'),  -- Purchase 6: Made online by customer1 with a rating of 4
    (7, 5, 3.49, 'michael.wilson@example.com'),  -- Purchase 7: Made online by customer2 with a rating of 5
    (8, 3, 6.99, 'emily.jones@example.com'),  -- Purchase 8: Made online by customer3 with a rating of 3
    (9, NULL, 4.99, 'david.miller@example.com'),  -- Purchase 9: Made online by customer4 with a rating of 2
    (10, NULL, 7.99, 'susan.davis@example.com') -- Purchase 10: Made online by customer5 with no rating
;
