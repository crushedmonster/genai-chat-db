-- product_catalog.sql
-- Inserts product data with active status tracking

USE shoemart;
GO

INSERT INTO products (sku, product_name, brand, category, cost_price, retail_price, current_stock, status, discontinue_date)
VALUES
-- Current Active Products
-- Men's Formal Shoes
('SM-MF-001', 'Classic Oxford Leather Shoes', 'Clarks', 'Men Formal', 65.00, 129.90, 45, 'Active', NULL),
('SM-MF-002', 'Executive Leather Loafers', 'Hush Puppies', 'Men Formal', 60.00, 119.90, 38, 'Active', NULL),
('SM-MF-003', 'Premium Derby Shoes', 'Bata', 'Men Formal', 50.00, 99.90, 32, 'Active', NULL),
('SM-MF-004', 'Business Brogues', 'Clarks', 'Men Formal', 70.00, 139.90, 25, 'Active', NULL),
('SM-MF-005', 'Formal Monk Strap Shoes', 'Hush Puppies', 'Men Formal', 65.00, 129.90, 30, 'Active', NULL),

-- Men's Casual Shoes
('SM-MC-001', 'Casual Canvas Sneakers', 'Converse', 'Men Casual', 40.00, 79.90, 60, 'Active', NULL),
('SM-MC-002', 'Slip-on Loafers', 'Bata', 'Men Casual', 35.00, 69.90, 45, 'Active', NULL),
('SM-MC-003', 'Driving Moccasins', 'Timberland', 'Men Casual', 55.00, 109.90, 35, 'Active', NULL),
('SM-MC-004', 'Boat Shoes', 'Sperry', 'Men Casual', 50.00, 99.90, 40, 'Active', NULL),
('SM-MC-005', 'Leather Sandals', 'Birkenstock', 'Men Casual', 45.00, 89.90, 50, 'Active', NULL),

-- Men's Sports Shoes
('SM-MS-001', 'Running Performance Shoes', 'Nike', 'Men Sports', 70.00, 139.90, 55, 'Active', NULL),
('SM-MS-002', 'Training Sneakers', 'Adidas', 'Men Sports', 75.00, 149.90, 48, 'Active', NULL),
('SM-MS-003', 'Basketball High-Tops', 'Nike', 'Men Sports', 80.00, 159.90, 38, 'Active', NULL),
('SM-MS-004', 'Cross-Training Shoes', 'Reebok', 'Men Sports', 65.00, 129.90, 42, 'Active', NULL),
('SM-MS-005', 'Court Tennis Shoes', 'Adidas', 'Men Sports', 60.00, 119.90, 40, 'Active', NULL),

-- Women's Formal Shoes
('SM-WF-001', 'Classic Office Pumps', 'Charles & Keith', 'Women Formal', 45.00, 89.90, 52, 'Active', NULL),
('SM-WF-002', 'Professional Heels', 'Nine West', 'Women Formal', 55.00, 109.90, 48, 'Active', NULL),
('SM-WF-003', 'Formal Pointed Flats', 'Bata', 'Women Formal', 35.00, 69.90, 55, 'Active', NULL),
('SM-WF-004', 'Office Slingback Heels', 'Charles & Keith', 'Women Formal', 50.00, 99.90, 42, 'Active', NULL),
('SM-WF-005', 'Dress Court Shoes', 'Clarks', 'Women Formal', 60.00, 119.90, 35, 'Active', NULL),

-- Women's Casual Shoes
('SM-WC-001', 'Casual Ballet Flats', 'Charles & Keith', 'Women Casual', 35.00, 69.90, 65, 'Active', NULL),
('SM-WC-002', 'Slip-on Canvas Shoes', 'Keds', 'Women Casual', 30.00, 59.90, 58, 'Active', NULL),
('SM-WC-003', 'Platform Sandals', 'Bata', 'Women Casual', 40.00, 79.90, 45, 'Active', NULL),
('SM-WC-004', 'Ankle Boots', 'Aldo', 'Women Casual', 60.00, 119.90, 40, 'Active', NULL),
('SM-WC-005', 'Espadrille Wedges', 'Charles & Keith', 'Women Casual', 45.00, 89.90, 38, 'Active', NULL),

-- Women's Sports Shoes
('SM-WS-001', 'Women Running Shoes', 'Nike', 'Women Sports', 65.00, 129.90, 50, 'Active', NULL),
('SM-WS-002', 'Training Sneakers', 'Adidas', 'Women Sports', 60.00, 119.90, 45, 'Active', NULL),
('SM-WS-003', 'Walking Comfort Shoes', 'Skechers', 'Women Sports', 55.00, 109.90, 52, 'Active', NULL),
('SM-WS-004', 'Fitness Cross-Trainers', 'Reebok', 'Women Sports', 50.00, 99.90, 48, 'Active', NULL),
('SM-WS-005', 'Tennis Shoes', 'Adidas', 'Women Sports', 55.00, 109.90, 40, 'Active', NULL),

-- Kids' Shoes
('SM-KF-001', 'Boys School Shoes', 'Bata', 'Kids Formal', 25.00, 49.90, 75, 'Active', NULL),
('SM-KF-002', 'Girls School Shoes', 'Bata', 'Kids Formal', 25.00, 49.90, 70, 'Active', NULL),
('SM-KS-001', 'Kids Sports Sneakers', 'Nike', 'Kids Sports', 35.00, 69.90, 60, 'Active', NULL),
('SM-KC-001', 'Children Casual Shoes', 'Adidas', 'Kids Casual', 30.00, 59.90, 55, 'Active', NULL),
('SM-KC-002', 'Kids Sandals', 'Crocs', 'Kids Casual', 20.00, 39.90, 65, 'Active', NULL),

-- Discontinued/Old SKUs (Previous Seasons or Replaced Models)
('SM-MF-101', 'Vintage Leather Oxfords', 'Clarks', 'Men Formal', 60.00, 119.90, 5, 'Discontinued', '2022-05-15'),
('SM-MF-102', 'Classic Wingtip Brogues', 'Florsheim', 'Men Formal', 65.00, 129.90, 0, 'Discontinued', '2022-08-10'),
('SM-MC-101', 'Canvas Deck Shoes', 'Vans', 'Men Casual', 35.00, 69.90, 3, 'Discontinued', '2022-04-20'),
('SM-MS-101', 'Ultra Lightweight Runners', 'New Balance', 'Men Sports', 70.00, 139.90, 2, 'Discontinued', '2022-07-15'),
('SM-MS-102', 'High-Impact Training Shoes', 'Under Armour', 'Men Sports', 75.00, 149.90, 0, 'Discontinued', '2022-09-05'),

('SM-WF-101', 'Kitten Heel Pumps', 'Nine West', 'Women Formal', 50.00, 99.90, 0, 'Discontinued', '2022-06-30'),
('SM-WC-101', 'Suede Moccasins', 'Hush Puppies', 'Women Casual', 40.00, 79.90, 4, 'Discontinued', '2022-05-10'),
('SM-WS-101', 'Cushioned Joggers', 'Asics', 'Women Sports', 60.00, 119.90, 0, 'Discontinued', '2022-08-25'),
('SM-WS-102', 'Aerobic Exercise Shoes', 'Reebok', 'Women Sports', 55.00, 109.90, 3, 'Discontinued', '2022-03-15'),

('SM-KF-101', 'Boys Velcro School Shoes', 'Bata', 'Kids Formal', 20.00, 39.90, 0, 'Discontinued', '2022-01-20'),
('SM-KS-101', 'Junior Football Trainers', 'Adidas', 'Kids Sports', 30.00, 59.90, 2, 'Discontinued', '2022-07-30');