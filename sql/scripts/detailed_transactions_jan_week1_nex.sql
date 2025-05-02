-- detailed_transactions_jan_week1_nex.sql
-- Detailed sales transactions for NEX outlet for Week 1 of January 2023

USE shoemart;
GO

-- **Monday (January 2)** - 8 transactions, 9 pairs sold, $1367.40 total
INSERT INTO sales (sale_id, outlet_id, employee_id, sale_date, payment_method, subtotal, gst_amount, discount_amount, total_amount)
VALUES
-- Morning transactions (EMP012)
('S20230102-00301', 'OUT004', 'EMP012', '2023-01-02 10:25:28', 'Credit Card', 129.90, 10.39, 0.00, 140.29),
('S20230102-00302', 'OUT004', 'EMP012', '2023-01-02 11:40:41', 'Cash', 199.80, 15.98, 20.00, 195.78),
('S20230102-00303', 'OUT004', 'EMP012', '2023-01-02 12:55:56', 'NETS', 149.90, 11.99, 0.00, 161.89),

-- Afternoon/evening transactions (EMP013)
('S20230102-00304', 'OUT004', 'EMP013', '2023-01-02 14:10:22', 'PayNow', 169.90, 13.59, 0.00, 183.49),
('S20230102-00305', 'OUT004', 'EMP013', '2023-01-02 15:25:41', 'Credit Card', 99.90, 7.99, 0.00, 107.89),
('S20230102-00306', 'OUT004', 'EMP013', '2023-01-02 16:40:56', 'Cash', 219.80, 17.58, 20.00, 217.38),
('S20230102-00307', 'OUT004', 'EMP013', '2023-01-02 17:55:22', 'NETS', 139.90, 11.19, 0.00, 151.09),
('S20230102-00308', 'OUT004', 'EMP013', '2023-01-02 19:10:41', 'Credit Card', 229.80, 18.38, 25.00, 223.18);

INSERT INTO sale_items (sale_id, sku, quantity, unit_price, discount, item_total)
VALUES
-- Transaction 1: One men's formal shoe
('S20230102-00301', 'SM-MF-001', 1, 129.90, 0.00, 129.90),

-- Transaction 2: Two pairs with $20 discount
('S20230102-00302', 'SM-MS-001', 1, 109.90, 10.00, 99.90),
('S20230102-00302', 'SM-KC-001', 1, 109.90, 10.00, 99.90),

-- Transaction 3: One men's casual shoe
('S20230102-00303', 'SM-MC-003', 1, 149.90, 0.00, 149.90),

-- Transaction 4: One women's formal shoe
('S20230102-00304', 'SM-WF-002', 1, 169.90, 0.00, 169.90),

-- Transaction 5: One kids formal shoe
('S20230102-00305', 'SM-KF-001', 1, 99.90, 0.00, 99.90),

-- Transaction 6: Two pairs with $20 discount
('S20230102-00306', 'SM-MF-003', 1, 119.90, 10.00, 109.90),
('S20230102-00306', 'SM-WC-001', 1, 119.90, 10.00, 109.90),

-- Transaction 7: One men's sports shoe
('S20230102-00307', 'SM-MS-005', 1, 139.90, 0.00, 139.90),

-- Transaction 8: Two pairs with $25 discount
('S20230102-00308', 'SM-MF-004', 1, 129.90, 15.00, 114.90),
('S20230102-00308', 'SM-WF-001', 1, 124.90, 10.00, 114.90);

-- **Tuesday (January 3)** - 9 transactions, 11 pairs sold, $1545.60 total
INSERT INTO sales (sale_id, outlet_id, employee_id, sale_date, payment_method, subtotal, gst_amount, discount_amount, total_amount)
VALUES
-- Morning transactions (EMP012)
('S20230103-00301', 'OUT004', 'EMP012', '2023-01-03 10:15:28', 'Credit Card', 129.90, 10.39, 0.00, 140.29),
('S20230103-00302', 'OUT004', 'EMP012', '2023-01-03 11:05:41', 'Cash', 159.90, 12.79, 0.00, 172.69),
('S20230103-00303', 'OUT004', 'EMP012', '2023-01-03 11:55:56', 'NETS', 99.90, 7.99, 0.00, 107.89),
('S20230103-00304', 'OUT004', 'EMP012', '2023-01-03 12:45:22', 'PayNow', 219.80, 17.58, 20.00, 217.38),

-- Afternoon/evening transactions (EMP013)
('S20230103-00305', 'OUT004', 'EMP013', '2023-01-03 13:35:41', 'Credit Card', 179.90, 14.39, 0.00, 194.29),
('S20230103-00306', 'OUT004', 'EMP013', '2023-01-03 14:25:56', 'Cash', 139.90, 11.19, 0.00, 151.09),
('S20230103-00307', 'OUT004', 'EMP013', '2023-01-03 15:15:22', 'NETS', 199.80, 15.98, 20.00, 195.78),
('S20230103-00308', 'OUT004', 'EMP013', '2023-01-03 16:05:41', 'Credit Card', 149.90, 11.99, 0.00, 161.89),
('S20230103-00309', 'OUT004', 'EMP013', '2023-01-03 16:55:56', 'PayNow', 229.80, 18.38, 25.00, 223.18);

INSERT INTO sale_items (sale_id, sku, quantity, unit_price, discount, item_total)
VALUES
-- Transaction 1: One men's formal shoe
('S20230103-00301', 'SM-MF-001', 1, 129.90, 0.00, 129.90),

-- Transaction 2: One women's formal shoe
('S20230103-00302', 'SM-WF-004', 1, 159.90, 0.00, 159.90),

-- Transaction 3: One kids formal shoe
('S20230103-00303', 'SM-KF-001', 1, 99.90, 0.00, 99.90),

-- Transaction 4: Two pairs with $20 discount
('S20230103-00304', 'SM-MS-001', 1, 119.90, 10.00, 109.90),
('S20230103-00304', 'SM-WC-002', 1, 119.90, 10.00, 109.90),

-- Transaction 5: One women's sports shoe
('S20230103-00305', 'SM-WS-004', 1, 179.90, 0.00, 179.90),

-- Transaction 6: One men's sports shoe
('S20230103-00306', 'SM-MS-005', 1, 139.90, 0.00, 139.90),

-- Transaction 7: Two pairs with $20 discount
('S20230103-00307', 'SM-MF-003', 1, 109.90, 10.00, 99.90),
('S20230103-00307', 'SM-KC-001', 1, 109.90, 10.00, 99.90),

-- Transaction 8: One men's casual shoe
('S20230103-00308', 'SM-MC-003', 1, 149.90, 0.00, 149.90),

-- Transaction 9: Two pairs with $25 discount
('S20230103-00309', 'SM-MS-003', 1, 129.90, 15.00, 114.90),
('S20230103-00309', 'SM-WF-001', 1, 124.90, 10.00, 114.90);

-- **Wednesday (January 4)** - 9 transactions, 10 pairs sold, $1478.90 total
INSERT INTO sales (sale_id, outlet_id, employee_id, sale_date, payment_method, subtotal, gst_amount, discount_amount, total_amount)
VALUES
-- Morning transactions (EMP012)
('S20230104-00301', 'OUT004', 'EMP012', '2023-01-04 10:20:28', 'Credit Card', 139.90, 11.19, 0.00, 151.09),
('S20230104-00302', 'OUT004', 'EMP012', '2023-01-04 11:15:41', 'Cash', 179.90, 14.39, 0.00, 194.29),
('S20230104-00303', 'OUT004', 'EMP012', '2023-01-04 12:10:56', 'NETS', 119.90, 9.59, 0.00, 129.49),
('S20230104-00304', 'OUT004', 'EMP012', '2023-01-04 13:05:22', 'PayNow', 129.90, 10.39, 0.00, 140.29),

-- Afternoon/evening transactions (EMP013)
('S20230104-00305', 'OUT004', 'EMP013', '2023-01-04 14:00:41', 'Credit Card', 169.90, 13.59, 0.00, 183.49),
('S20230104-00306', 'OUT004', 'EMP013', '2023-01-04 14:55:56', 'Cash', 99.90, 7.99, 0.00, 107.89),
('S20230104-00307', 'OUT004', 'EMP013', '2023-01-04 15:50:22', 'NETS', 199.80, 15.98, 20.00, 195.78),
('S20230104-00308', 'OUT004', 'EMP013', '2023-01-04 16:45:41', 'Credit Card', 149.90, 11.99, 0.00, 161.89),
('S20230104-00309', 'OUT004', 'EMP013', '2023-01-04 17:40:56', 'PayNow', 239.80, 19.18, 25.00, 233.98);

INSERT INTO sale_items (sale_id, sku, quantity, unit_price, discount, item_total)
VALUES
-- Transaction 1: One men's sports shoe
('S20230104-00301', 'SM-MS-005', 1, 139.90, 0.00, 139.90),

-- Transaction 2: One women's sports shoe
('S20230104-00302', 'SM-WS-004', 1, 179.90, 0.00, 179.90),

-- Transaction 3: One women's casual shoe
('S20230104-00303', 'SM-WC-003', 1, 119.90, 0.00, 119.90),

-- Transaction 4: One men's formal shoe
('S20230104-00304', 'SM-MF-001', 1, 129.90, 0.00, 129.90),

-- Transaction 5: One women's formal shoe
('S20230104-00305', 'SM-WF-002', 1, 169.90, 0.00, 169.90),

-- Transaction 6: One kids formal shoe
('S20230104-00306', 'SM-KF-001', 1, 99.90, 0.00, 99.90),

-- Transaction 7: Two pairs with $20 discount
('S20230104-00307', 'SM-MF-003', 1, 109.90, 10.00, 99.90),
('S20230104-00307', 'SM-WC-001', 1, 109.90, 10.00, 99.90),

-- Transaction 8: One men's casual shoe
('S20230104-00308', 'SM-MC-003', 1, 149.90, 0.00, 149.90),

-- Transaction 9: Two women's shoes with $25 discount
('S20230104-00309', 'SM-WF-004', 1, 134.90, 15.00, 119.90),
('S20230104-00309', 'SM-WS-002', 1, 129.90, 10.00, 119.90);

-- **Thursday (January 5)** - 9 transactions, 10 pairs sold, $1456.30 total
INSERT INTO sales (sale_id, outlet_id, employee_id, sale_date, payment_method, subtotal, gst_amount, discount_amount, total_amount)
VALUES
-- Morning transactions (EMP012)
('S20230105-00301', 'OUT004', 'EMP012', '2023-01-05 10:15:28', 'Credit Card', 149.90, 11.99, 0.00, 161.89),
('S20230105-00302', 'OUT004', 'EMP012', '2023-01-05 11:10:41', 'Cash', 189.90, 15.19, 0.00, 205.09),
('S20230105-00303', 'OUT004', 'EMP012', '2023-01-05 12:05:56', 'NETS', 99.90, 7.99, 0.00, 107.89),
('S20230105-00304', 'OUT004', 'EMP012', '2023-01-05 13:00:22', 'PayNow', 119.90, 9.59, 0.00, 129.49),

-- Afternoon/evening transactions (EMP013)
('S20230105-00305', 'OUT004', 'EMP013', '2023-01-05 13:55:41', 'Credit Card', 199.80, 15.98, 20.00, 195.78),
('S20230105-00306', 'OUT004', 'EMP013', '2023-01-05 14:50:56', 'Cash', 169.90, 13.59, 0.00, 183.49),
('S20230105-00307', 'OUT004', 'EMP013', '2023-01-05 15:45:22', 'NETS', 139.90, 11.19, 0.00, 151.09),
('S20230105-00308', 'OUT004', 'EMP013', '2023-01-05 16:40:41', 'Credit Card', 129.90, 10.39, 0.00, 140.29),
('S20230105-00309', 'OUT004', 'EMP013', '2023-01-05 17:35:56', 'PayNow', 199.80, 15.98, 20.00, 195.78);

INSERT INTO sale_items (sale_id, sku, quantity, unit_price, discount, item_total)
VALUES
-- Transaction 1: One men's casual shoe
('S20230105-00301', 'SM-MC-003', 1, 149.90, 0.00, 149.90),

-- Transaction 2: One men's formal shoe
('S20230105-00302', 'SM-MF-002', 1, 189.90, 0.00, 189.90),

-- Transaction 3: One kids formal shoe
('S20230105-00303', 'SM-KF-001', 1, 99.90, 0.00, 99.90),

-- Transaction 4: One women's casual shoe
('S20230105-00304', 'SM-WC-003', 1, 119.90, 0.00, 119.90),

-- Transaction 5: Two pairs with $20 discount
('S20230105-00305', 'SM-MS-001', 1, 109.90, 10.00, 99.90),
('S20230105-00305', 'SM-WC-001', 1, 109.90, 10.00, 99.90),

-- Transaction 6: One women's formal shoe
('S20230105-00306', 'SM-WF-002', 1, 169.90, 0.00, 169.90),

-- Transaction 7: One men's sports shoe
('S20230105-00307', 'SM-MS-005', 1, 139.90, 0.00, 139.90),

-- Transaction 8: One men's formal shoe
('S20230105-00308', 'SM-MF-001', 1, 129.90, 0.00, 129.90),

-- Transaction 9: Two pairs with $20 discount
('S20230105-00309', 'SM-MS-004', 1, 109.90, 10.00, 99.90),
('S20230105-00309', 'SM-KC-001', 1, 109.90, 10.00, 99.90);

-- **Friday (January 6)** - 11 transactions, 13 pairs sold, $1789.70 total
INSERT INTO sales (sale_id, outlet_id, employee_id, sale_date, payment_method, subtotal, gst_amount, discount_amount, total_amount)
VALUES
-- Morning transactions (EMP012)
('S20230106-00301', 'OUT004', 'EMP012', '2023-01-06 10:10:28', 'Credit Card', 149.90, 11.99, 0.00, 161.89),
('S20230106-00302', 'OUT004', 'EMP012', '2023-01-06 10:55:41', 'Cash', 99.90, 7.99, 0.00, 107.89),
('S20230106-00303', 'OUT004', 'EMP012', '2023-01-06 11:40:56', 'NETS', 189.90, 15.19, 0.00, 205.09),
('S20230106-00304', 'OUT004', 'EMP012', '2023-01-06 12:25:22', 'PayNow', 139.90, 11.19, 0.00, 151.09),
('S20230106-00305', 'OUT004', 'EMP012', '2023-01-06 13:10:41', 'Credit Card', 239.80, 19.18, 25.00, 233.98),

-- Afternoon/evening transactions (EMP013)
('S20230106-00306', 'OUT004', 'EMP013', '2023-01-06 13:55:56', 'Cash', 169.90, 13.59, 0.00, 183.49),
('S20230106-00307', 'OUT004', 'EMP013', '2023-01-06 14:40:22', 'NETS', 119.90, 9.59, 0.00, 129.49),
('S20230106-00308', 'OUT004', 'EMP013', '2023-01-06 15:25:41', 'Credit Card', 199.80, 15.98, 20.00, 195.78),
('S20230106-00309', 'OUT004', 'EMP013', '2023-01-06 16:10:56', 'PayNow', 129.90, 10.39, 0.00, 140.29),
('S20230106-00310', 'OUT004', 'EMP013', '2023-01-06 16:55:22', 'Cash', 169.90, 13.59, 0.00, 183.49),
('S20230106-00311', 'OUT004', 'EMP013', '2023-01-06 17:40:41', 'NETS', 119.90, 9.59, 0.00, 129.49);

INSERT INTO sale_items (sale_id, sku, quantity, unit_price, discount, item_total)
VALUES
-- Transaction 1: One men's casual shoe
('S20230106-00301', 'SM-MC-003', 1, 149.90, 0.00, 149.90),

-- Transaction 2: One kids formal shoe
('S20230106-00302', 'SM-KF-001', 1, 99.90, 0.00, 99.90),

-- Transaction 3: One men's formal shoe
('S20230106-00303', 'SM-MF-002', 1, 189.90, 0.00, 189.90),

-- Transaction 4: One men's sports shoe
('S20230106-00304', 'SM-MS-005', 1, 139.90, 0.00, 139.90),

-- Transaction 5: Two pairs with $25 discount
('S20230106-00305', 'SM-MS-003', 1, 139.90, 15.00, 124.90),
('S20230106-00305', 'SM-WF-001', 1, 124.90, 10.00, 114.90),

-- Transaction 6: One women's formal shoe
('S20230106-00306', 'SM-WF-002', 1, 169.90, 0.00, 169.90),

-- Transaction 7: One women's casual shoe
('S20230106-00307', 'SM-WC-003', 1, 119.90, 0.00, 119.90),

-- Transaction 8: Two pairs with $20 discount
('S20230106-00308', 'SM-MF-003', 1, 109.90, 10.00, 99.90),
('S20230106-00308', 'SM-WC-001', 1, 109.90, 10.00, 99.90),

-- Transaction 9: One men's formal shoe
('S20230106-00309', 'SM-MF-001', 1, 129.90, 0.00, 129.90),

-- Transaction 10: One women's formal shoe
('S20230106-00310', 'SM-WF-004', 1, 169.90, 0.00, 169.90),

-- Transaction 11: One women's casual shoe
('S20230106-00311', 'SM-WC-002', 1, 119.90, 0.00, 119.90);

-- **Saturday (January 7)** - 14 transactions, 17 pairs sold, $2356.80 total
INSERT INTO sales (sale_id, outlet_id, employee_id, sale_date, payment_method, subtotal, gst_amount, discount_amount, total_amount)
VALUES
-- Morning transactions (EMP012 & part-timer EMP019)
('S20230107-00301', 'OUT004', 'EMP012', '2023-01-07 10:05:28', 'Credit Card', 149.90, 11.99, 0.00, 161.89),
('S20230107-00302', 'OUT004', 'EMP012', '2023-01-07 10:40:41', 'Cash', 129.90, 10.39, 0.00, 140.29),
('S20230107-00303', 'OUT004', 'EMP012', '2023-01-07 11:15:56', 'NETS', 169.90, 13.59, 0.00, 183.49),
('S20230107-00304', 'OUT004', 'EMP012', '2023-01-07 11:50:22', 'PayNow', 99.90, 7.99, 0.00, 107.89),
('S20230107-00305', 'OUT004', 'EMP019', '2023-01-07 12:25:41', 'Credit Card', 239.80, 19.18, 25.00, 233.98),
('S20230107-00306', 'OUT004', 'EMP019', '2023-01-07 13:00:56', 'Cash', 179.90, 14.39, 0.00, 194.29),

-- Midday transactions (EMP013 & part-timer EMP019)
('S20230107-00307', 'OUT004', 'EMP019', '2023-01-07 13:35:22', 'NETS', 219.80, 17.58, 20.00, 217.38),
('S20230107-00308', 'OUT004', 'EMP019', '2023-01-07 14:10:41', 'Credit Card', 149.90, 11.99, 0.00, 161.89),
('S20230107-00309', 'OUT004', 'EMP013', '2023-01-07 14:45:56', 'PayNow', 119.90, 9.59, 0.00, 129.49),
('S20230107-00310', 'OUT004', 'EMP013', '2023-01-07 15:20:22', 'Cash', 199.80, 15.98, 20.00, 195.78),

-- Afternoon/evening transactions (mixed staff)
('S20230107-00311', 'OUT004', 'EMP013', '2023-01-07 15:55:41', 'Credit Card', 169.90, 13.59, 0.00, 183.49),
('S20230107-00312', 'OUT004', 'EMP013', '2023-01-07 16:30:56', 'NETS', 199.80, 15.98, 20.00, 195.78),
('S20230107-00313', 'OUT004', 'EMP012', '2023-01-07 17:05:22', 'Cash', 139.90, 11.19, 0.00, 151.09),
('S20230107-00314', 'OUT004', 'EMP012', '2023-01-07 17:40:41', 'Credit Card', 129.90, 10.39, 0.00, 140.29);

INSERT INTO sale_items (sale_id, sku, quantity, unit_price, discount, item_total)
VALUES
-- Transaction 1: One men's casual shoe
('S20230107-00301', 'SM-MC-003', 1, 149.90, 0.00, 149.90),

-- Transaction 2: One men's formal shoe
('S20230107-00302', 'SM-MF-001', 1, 129.90, 0.00, 129.90),

-- Transaction 3: One women's formal shoe
('S20230107-00303', 'SM-WF-002', 1, 169.90, 0.00, 169.90),

-- Transaction 4: One kids formal shoe
('S20230107-00304', 'SM-KF-001', 1, 99.90, 0.00, 99.90),

-- Transaction 5: Two pairs with $25 discount
('S20230107-00305', 'SM-MF-004', 1, 139.90, 15.00, 124.90),
('S20230107-00305', 'SM-WF-001', 1, 124.90, 10.00, 114.90),

-- Transaction 6: One women's sports shoe
('S20230107-00306', 'SM-WS-004', 1, 179.90, 0.00, 179.90),

-- Transaction 7: Two pairs with $20 discount
('S20230107-00307', 'SM-MS-001', 1, 119.90, 10.00, 109.90),
('S20230107-00307', 'SM-WC-001', 1, 119.90, 10.00, 109.90),

-- Transaction 8: One men's casual shoe
('S20230107-00308', 'SM-MC-002', 1, 149.90, 0.00, 149.90),

-- Transaction 9: One women's casual shoe
('S20230107-00309', 'SM-WC-003', 1, 119.90, 0.00, 119.90),

-- Transaction 10: Two pairs with $20 discount
('S20230107-00310', 'SM-MS-004', 1, 109.90, 10.00, 99.90),
('S20230107-00310', 'SM-KC-001', 1, 109.90, 10.00, 99.90),

-- Transaction 11: One women's formal shoe
('S20230107-00311', 'SM-WF-004', 1, 169.90, 0.00, 169.90),

-- Transaction 12: Two pairs with $20 discount
('S20230107-00312', 'SM-MF-003', 1, 109.90, 10.00, 99.90),
('S20230107-00312', 'SM-WC-004', 1, 109.90, 10.00, 99.90),

-- Transaction 13: One men's sports shoe
('S20230107-00313', 'SM-MS-005', 1, 139.90, 0.00, 139.90),

-- Transaction 14: One men's formal shoe
('S20230107-00314', 'SM-MF-001', 1, 129.90, 0.00, 129.90);

-- **Sunday (January 8)** - 13 transactions, 15 pairs sold, $2045.60 total
INSERT INTO sales (sale_id, outlet_id, employee_id, sale_date, payment_method, subtotal, gst_amount, discount_amount, total_amount)
VALUES
-- Morning transactions (EMP012 & part-timer EMP019)
('S20230108-00301', 'OUT004', 'EMP012', '2023-01-08 11:10:28', 'Credit Card', 149.90, 11.99, 0.00, 161.89),
('S20230108-00302', 'OUT004', 'EMP012', '2023-01-08 11:45:41', 'Cash', 99.90, 7.99, 0.00, 107.89),
('S20230108-00303', 'OUT004', 'EMP012', '2023-01-08 12:20:56', 'NETS', 219.80, 17.58, 20.00, 217.38),
('S20230108-00304', 'OUT004', 'EMP012', '2023-01-08 12:55:22', 'PayNow', 169.90, 13.59, 0.00, 183.49),
('S20230108-00305', 'OUT004', 'EMP019', '2023-01-08 13:30:41', 'Credit Card', 139.90, 11.19, 0.00, 151.09),
('S20230108-00306', 'OUT004', 'EMP019', '2023-01-08 14:05:56', 'Cash', 99.90, 7.99, 0.00, 107.89),

-- Midday transactions (EMP013 & part-timer EMP019)
('S20230108-00307', 'OUT004', 'EMP019', '2023-01-08 14:40:22', 'NETS', 229.80, 18.38, 25.00, 223.18),
('S20230108-00308', 'OUT004', 'EMP019', '2023-01-08 15:15:41', 'Credit Card', 159.90, 12.79, 0.00, 172.69),
('S20230108-00309', 'OUT004', 'EMP013', '2023-01-08 15:50:56', 'PayNow', 179.90, 14.39, 0.00, 194.29),
('S20230108-00310', 'OUT004', 'EMP013', '2023-01-08 16:25:22', 'Cash', 199.80, 15.98, 20.00, 195.78),

-- Afternoon/evening transactions (mixed staff)
('S20230108-00311', 'OUT004', 'EMP013', '2023-01-08 17:00:41', 'Credit Card', 129.90, 10.39, 0.00, 140.29),
('S20230108-00312', 'OUT004', 'EMP013', '2023-01-08 17:35:56', 'NETS', 109.90, 8.79, 0.00, 118.69),
('S20230108-00313', 'OUT004', 'EMP013', '2023-01-08 18:10:22', 'Cash', 89.90, 7.19, 0.00, 97.09);

INSERT INTO sale_items (sale_id, sku, quantity, unit_price, discount, item_total)
VALUES
-- Transaction 1: One men's casual shoe
('S20230108-00301', 'SM-MC-003', 1, 149.90, 0.00, 149.90),

-- Transaction 2: One kids formal shoe
('S20230108-00302', 'SM-KF-001', 1, 99.90, 0.00, 99.90),

-- Transaction 3: Two pairs with $20 discount
('S20230108-00303', 'SM-MS-001', 1, 119.90, 10.00, 109.90),
('S20230108-00303', 'SM-WC-002', 1, 119.90, 10.00, 109.90),

-- Transaction 4: One women's formal shoe
('S20230108-00304', 'SM-WF-002', 1, 169.90, 0.00, 169.90),

-- Transaction 5: One men's sports shoe
('S20230108-00305', 'SM-MS-005', 1, 139.90, 0.00, 139.90),

-- Transaction 6: One kids formal shoe
('S20230108-00306', 'SM-KF-002', 1, 99.90, 0.00, 99.90),

-- Transaction 7: Two pairs with $25 discount
('S20230108-00307', 'SM-MF-004', 1, 139.90, 15.00, 124.90),
('S20230108-00307', 'SM-WF-001', 1, 114.90, 10.00, 104.90),

-- Transaction 8: One women's formal shoe
('S20230108-00308', 'SM-WF-004', 1, 159.90, 0.00, 159.90),

-- Transaction 9: One women's sports shoe
('S20230108-00309', 'SM-WS-004', 1, 179.90, 0.00, 179.90),

-- Transaction 10: Two pairs with $20 discount
('S20230108-00310', 'SM-MF-003', 1, 109.90, 10.00, 99.90),
('S20230108-00310', 'SM-KC-001', 1, 109.90, 10.00, 99.90),

-- Transaction 11: One men's formal shoe
('S20230108-00311', 'SM-MF-001', 1, 129.90, 0.00, 129.90),

-- Transaction 12: One kids sports shoe
('S20230108-00312', 'SM-KS-001', 1, 109.90, 0.00, 109.90),

-- Transaction 13: One women's formal shoe
('S20230108-00313', 'SM-WF-003', 1, 89.90, 0.00, 89.90);
