-- detailed_transactions_jan_week1_tampines.sql
-- Detailed sales transactions for Tampines Mall outlet for Week 1 of January 2023

USE shoemart;
GO

-- **Monday (January 2)** - 6 transactions, 7 pairs sold, $932.20 total
INSERT INTO sales (sale_id, outlet_id, employee_id, sale_date, payment_method, subtotal, gst_amount, discount_amount, total_amount)
VALUES
-- Morning transactions (EMP014)
('S20230102-00401', 'OUT005', 'EMP014', '2023-01-02 10:45:19', 'Credit Card', 129.90, 10.39, 0.00, 140.29),
('S20230102-00402', 'OUT005', 'EMP014', '2023-01-02 12:20:33', 'NETS', 159.90, 12.79, 0.00, 172.69),
('S20230102-00403', 'OUT005', 'EMP014', '2023-01-02 13:55:15', 'Cash', 99.90, 7.99, 0.00, 107.89),

-- Afternoon/evening transactions (EMP015)
('S20230102-00404', 'OUT005', 'EMP015', '2023-01-02 15:30:44', 'PayNow', 199.80, 15.98, 20.00, 195.78),
('S20230102-00405', 'OUT005', 'EMP015', '2023-01-02 17:05:18', 'Credit Card', 169.90, 13.59, 0.00, 183.49),
('S20230102-00406', 'OUT005', 'EMP015', '2023-01-02 18:40:33', 'Cash', 139.90, 11.19, 0.00, 151.09);

INSERT INTO sale_items (sale_id, sku, quantity, unit_price, discount, item_total)
VALUES
-- Transaction 1: One men's formal shoe
('S20230102-00401', 'SM-MF-001', 1, 129.90, 0.00, 129.90),

-- Transaction 2: One women's formal shoe
('S20230102-00402', 'SM-WF-004', 1, 159.90, 0.00, 159.90),

-- Transaction 3: One kids formal shoe
('S20230102-00403', 'SM-KF-001', 1, 99.90, 0.00, 99.90),

-- Transaction 4: Two pairs with $20 discount
('S20230102-00404', 'SM-MF-003', 1, 109.90, 10.00, 99.90),
('S20230102-00404', 'SM-WC-001', 1, 109.90, 10.00, 99.90),

-- Transaction 5: One women's formal shoe
('S20230102-00405', 'SM-WF-002', 1, 169.90, 0.00, 169.90),

-- Transaction 6: One men's sports shoe
('S20230102-00406', 'SM-MS-005', 1, 139.90, 0.00, 139.90);

-- **Tuesday (January 3)** - 7 transactions, 8 pairs sold, $1087.40 total
INSERT INTO sales (sale_id, outlet_id, employee_id, sale_date, payment_method, subtotal, gst_amount, discount_amount, total_amount)
VALUES
-- Morning transactions (EMP014)
('S20230103-00401', 'OUT005', 'EMP014', '2023-01-03 10:20:19', 'Credit Card', 149.90, 11.99, 0.00, 161.89),
('S20230103-00402', 'OUT005', 'EMP014', '2023-01-03 11:45:33', 'NETS', 99.90, 7.99, 0.00, 107.89),
('S20230103-00403', 'OUT005', 'EMP014', '2023-01-03 13:10:15', 'Cash', 179.90, 14.39, 0.00, 194.29),

-- Afternoon/evening transactions (EMP015)
('S20230103-00404', 'OUT005', 'EMP015', '2023-01-03 14:35:44', 'PayNow', 129.90, 10.39, 0.00, 140.29),
('S20230103-00405', 'OUT005', 'EMP015', '2023-01-03 16:00:18', 'Credit Card', 169.90, 13.59, 0.00, 183.49),
('S20230103-00406', 'OUT005', 'EMP015', '2023-01-03 17:25:33', 'Cash', 119.90, 9.59, 0.00, 129.49),
('S20230103-00407', 'OUT005', 'EMP015', '2023-01-03 18:50:15', 'NETS', 189.80, 15.18, 20.00, 184.98);

INSERT INTO sale_items (sale_id, sku, quantity, unit_price, discount, item_total)
VALUES
-- Transaction 1: One men's casual shoe
('S20230103-00401', 'SM-MC-003', 1, 149.90, 0.00, 149.90),

-- Transaction 2: One kids formal shoe
('S20230103-00402', 'SM-KF-001', 1, 99.90, 0.00, 99.90),

-- Transaction 3: One women's sports shoe
('S20230103-00403', 'SM-WS-004', 1, 179.90, 0.00, 179.90),

-- Transaction 4: One men's formal shoe
('S20230103-00404', 'SM-MF-001', 1, 129.90, 0.00, 129.90),

-- Transaction 5: One women's formal shoe
('S20230103-00405', 'SM-WF-002', 1, 169.90, 0.00, 169.90),

-- Transaction 6: One women's casual shoe
('S20230103-00406', 'SM-WC-003', 1, 119.90, 0.00, 119.90),

-- Transaction 7: Two pairs with $20 discount
('S20230103-00407', 'SM-MS-001', 1, 109.90, 10.00, 99.90),
('S20230103-00407', 'SM-KC-001', 1, 109.90, 10.00, 99.90);

-- **Wednesday (January 4)** - 7 transactions, 8 pairs sold, $1023.70 total
INSERT INTO sales (sale_id, outlet_id, employee_id, sale_date, payment_method, subtotal, gst_amount, discount_amount, total_amount)
VALUES
-- Morning transactions (EMP014)
('S20230104-00401', 'OUT005', 'EMP014', '2023-01-04 10:30:19', 'Credit Card', 139.90, 11.19, 0.00, 151.09),
('S20230104-00402', 'OUT005', 'EMP014', '2023-01-04 11:50:33', 'NETS', 99.90, 7.99, 0.00, 107.89),
('S20230104-00403', 'OUT005', 'EMP014', '2023-01-04 13:10:15', 'Cash', 159.90, 12.79, 0.00, 172.69),

-- Afternoon/evening transactions (EMP015)
('S20230104-00404', 'OUT005', 'EMP015', '2023-01-04 14:30:44', 'PayNow', 129.90, 10.39, 0.00, 140.29),
('S20230104-00405', 'OUT005', 'EMP015', '2023-01-04 15:50:18', 'Credit Card', 89.90, 7.19, 0.00, 97.09),
('S20230104-00406', 'OUT005', 'EMP015', '2023-01-04 17:10:33', 'Cash', 199.80, 15.98, 20.00, 195.78),
('S20230104-00407', 'OUT005', 'EMP015', '2023-01-04 18:30:15', 'NETS', 169.90, 13.59, 0.00, 183.49);

INSERT INTO sale_items (sale_id, sku, quantity, unit_price, discount, item_total)
VALUES
-- Transaction 1: One men's sports shoe
('S20230104-00401', 'SM-MS-005', 1, 139.90, 0.00, 139.90),

-- Transaction 2: One kids formal shoe
('S20230104-00402', 'SM-KF-001', 1, 99.90, 0.00, 99.90),

-- Transaction 3: One women's formal shoe
('S20230104-00403', 'SM-WF-004', 1, 159.90, 0.00, 159.90),

-- Transaction 4: One men's formal shoe
('S20230104-00404', 'SM-MF-001', 1, 129.90, 0.00, 129.90),

-- Transaction 5: One women's formal shoe
('S20230104-00405', 'SM-WF-003', 1, 89.90, 0.00, 89.90),

-- Transaction 6: Two pairs with $20 discount
('S20230104-00406', 'SM-MF-003', 1, 109.90, 10.00, 99.90),
('S20230104-00406', 'SM-WC-001', 1, 109.90, 10.00, 99.90),

-- Transaction 7: One women's formal shoe
('S20230104-00407', 'SM-WF-002', 1, 169.90, 0.00, 169.90);

-- **Thursday (January 5)** - 7 transactions, 8 pairs sold, $1065.90 total
INSERT INTO sales (sale_id, outlet_id, employee_id, sale_date, payment_method, subtotal, gst_amount, discount_amount, total_amount)
VALUES
-- Morning transactions (EMP014)
('S20230105-00401', 'OUT005', 'EMP014', '2023-01-05 10:15:19', 'Credit Card', 149.90, 11.99, 0.00, 161.89),
('S20230105-00402', 'OUT005', 'EMP014', '2023-01-05 11:35:33', 'NETS', 99.90, 7.99, 0.00, 107.89),
('S20230105-00403', 'OUT005', 'EMP014', '2023-01-05 12:55:15', 'Cash', 169.90, 13.59, 0.00, 183.49),

-- Afternoon/evening transactions (EMP015)
('S20230105-00404', 'OUT005', 'EMP015', '2023-01-05 14:15:44', 'PayNow', 129.90, 10.39, 0.00, 140.29),
('S20230105-00405', 'OUT005', 'EMP015', '2023-01-05 15:35:18', 'Credit Card', 179.90, 14.39, 0.00, 194.29),
('S20230105-00406', 'OUT005', 'EMP015', '2023-01-05 16:55:33', 'Cash', 199.80, 15.98, 20.00, 195.78),
('S20230105-00407', 'OUT005', 'EMP015', '2023-01-05 18:15:15', 'NETS', 89.90, 7.19, 0.00, 97.09);

INSERT INTO sale_items (sale_id, sku, quantity, unit_price, discount, item_total)
VALUES
-- Transaction 1: One men's casual shoe
('S20230105-00401', 'SM-MC-003', 1, 149.90, 0.00, 149.90),

-- Transaction 2: One kids formal shoe
('S20230105-00402', 'SM-KF-001', 1, 99.90, 0.00, 99.90),

-- Transaction 3: One women's formal shoe
('S20230105-00403', 'SM-WF-002', 1, 169.90, 0.00, 169.90),

-- Transaction 4: One men's formal shoe
('S20230105-00404', 'SM-MF-001', 1, 129.90, 0.00, 129.90),

-- Transaction 5: One women's sports shoe
('S20230105-00405', 'SM-WS-004', 1, 179.90, 0.00, 179.90),

-- Transaction 6: Two pairs with $20 discount
('S20230105-00406', 'SM-MS-001', 1, 109.90, 10.00, 99.90),
('S20230105-00406', 'SM-KC-001', 1, 109.90, 10.00, 99.90),

-- Transaction 7: One women's formal shoe
('S20230105-00407', 'SM-WF-003', 1, 89.90, 0.00, 89.90);

-- **Friday (January 6)** - 8 transactions, 10 pairs sold, $1267.80 total
INSERT INTO sales (sale_id, outlet_id, employee_id, sale_date, payment_method, subtotal, gst_amount, discount_amount, total_amount)
VALUES
-- Morning transactions (EMP014)
('S20230106-00401', 'OUT005', 'EMP014', '2023-01-06 10:10:19', 'Credit Card', 149.90, 11.99, 0.00, 161.89),
('S20230106-00402', 'OUT005', 'EMP014', '2023-01-06 11:20:33', 'NETS', 99.90, 7.99, 0.00, 107.89),
('S20230106-00403', 'OUT005', 'EMP014', '2023-01-06 12:30:15', 'Cash', 179.90, 14.39, 0.00, 194.29),
('S20230106-00404', 'OUT005', 'EMP014', '2023-01-06 13:40:44', 'PayNow', 129.90, 10.39, 0.00, 140.29),

-- Afternoon/evening transactions (EMP015)
('S20230106-00405', 'OUT005', 'EMP015', '2023-01-06 14:50:18', 'Credit Card', 199.80, 15.98, 20.00, 195.78),
('S20230106-00406', 'OUT005', 'EMP015', '2023-01-06 16:00:33', 'Cash', 169.90, 13.59, 0.00, 183.49),
('S20230106-00407', 'OUT005', 'EMP015', '2023-01-06 17:10:15', 'NETS', 139.90, 11.19, 0.00, 151.09),
('S20230106-00408', 'OUT005', 'EMP015', '2023-01-06 18:20:44', 'Credit Card', 159.90, 12.79, 0.00, 172.69);

INSERT INTO sale_items (sale_id, sku, quantity, unit_price, discount, item_total)
VALUES
-- Transaction 1: One men's casual shoe
('S20230106-00401', 'SM-MC-003', 1, 149.90, 0.00, 149.90),

-- Transaction 2: One kids formal shoe
('S20230106-00402', 'SM-KF-001', 1, 99.90, 0.00, 99.90),

-- Transaction 3: One women's sports shoe
('S20230106-00403', 'SM-WS-004', 1, 179.90, 0.00, 179.90),

-- Transaction 4: One men's formal shoe
('S20230106-00404', 'SM-MF-001', 1, 129.90, 0.00, 129.90),

-- Transaction 5: Two pairs with $20 discount
('S20230106-00405', 'SM-MS-001', 1, 109.90, 10.00, 99.90),
('S20230106-00405', 'SM-WC-001', 1, 109.90, 10.00, 99.90),

-- Transaction 6: One women's formal shoe
('S20230106-00406', 'SM-WF-002', 1, 169.90, 0.00, 169.90),

-- Transaction 7: One men's sports shoe
('S20230106-00407', 'SM-MS-005', 1, 139.90, 0.00, 139.90),

-- Transaction 8: Two pairs of women's shoes
('S20230106-00408', 'SM-WF-004', 1, 159.90, 0.00, 159.90),
('S20230106-00408', 'SM-WC-003', 1, 119.90, 0.00, 119.90);

-- **Saturday (January 7)** - 11 transactions, 13 pairs sold, $1678.90 total
INSERT INTO sales (sale_id, outlet_id, employee_id, sale_date, payment_method, subtotal, gst_amount, discount_amount, total_amount)
VALUES
-- Morning transactions (EMP014 & part-timer EMP020)
('S20230107-00401', 'OUT005', 'EMP014', '2023-01-07 10:15:19', 'Credit Card', 149.90, 11.99, 0.00, 161.89),
('S20230107-00402', 'OUT005', 'EMP014', '2023-01-07 10:55:33', 'NETS', 99.90, 7.99, 0.00, 107.89),
('S20230107-00403', 'OUT005', 'EMP014', '2023-01-07 11:35:15', 'Cash', 189.90, 15.19, 0.00, 205.09),
('S20230107-00404', 'OUT005', 'EMP014', '2023-01-07 12:15:44', 'PayNow', 129.90, 10.39, 0.00, 140.29),
('S20230107-00405', 'OUT005', 'EMP020', '2023-01-07 12:55:18', 'Credit Card', 219.80, 17.58, 25.00, 212.38),

-- Afternoon transactions (EMP015 & part-timer EMP020)
('S20230107-00406', 'OUT005', 'EMP020', '2023-01-07 13:35:33', 'Cash', 169.90, 13.59, 0.00, 183.49),
('S20230107-00407', 'OUT005', 'EMP020', '2023-01-07 14:15:15', 'NETS', 139.90, 11.19, 0.00, 151.09),
('S20230107-00408', 'OUT005', 'EMP015', '2023-01-07 14:55:44', 'Credit Card', 99.90, 7.99, 0.00, 107.89),
('S20230107-00409', 'OUT005', 'EMP015', '2023-01-07 15:35:18', 'PayNow', 199.80, 15.98, 20.00, 195.78),

-- Evening transactions (EMP015)
('S20230107-00410', 'OUT005', 'EMP015', '2023-01-07 16:15:33', 'Cash', 129.90, 10.39, 0.00, 140.29),
('S20230107-00411', 'OUT005', 'EMP015', '2023-01-07 16:55:15', 'NETS', 89.90, 7.19, 0.00, 97.09);

INSERT INTO sale_items (sale_id, sku, quantity, unit_price, discount, item_total)
VALUES
-- Transaction 1: One men's casual shoe
('S20230107-00401', 'SM-MC-003', 1, 149.90, 0.00, 149.90),

-- Transaction 2: One kids formal shoe
('S20230107-00402', 'SM-KF-001', 1, 99.90, 0.00, 99.90),

-- Transaction 3: One men's formal shoe
('S20230107-00403', 'SM-MF-002', 1, 189.90, 0.00, 189.90),

-- Transaction 4: One men's formal shoe
('S20230107-00404', 'SM-MF-001', 1, 129.90, 0.00, 129.90),

-- Transaction 5: Two pairs with $25 discount
('S20230107-00405', 'SM-MS-003', 1, 139.90, 15.00, 124.90),
('S20230107-00405', 'SM-WF-001', 1, 104.90, 10.00, 94.90),

-- Transaction 6: One women's formal shoe
('S20230107-00406', 'SM-WF-002', 1, 169.90, 0.00, 169.90),

-- Transaction 7: One men's sports shoe
('S20230107-00407', 'SM-MS-005', 1, 139.90, 0.00, 139.90),

-- Transaction 8: One kids formal shoe
('S20230107-00408', 'SM-KF-001', 1, 99.90, 0.00, 99.90),

-- Transaction 9: Two pairs with $20 discount
('S20230107-00409', 'SM-MS-001', 1, 109.90, 10.00, 99.90),
('S20230107-00409', 'SM-KC-001', 1, 109.90, 10.00, 99.90),

-- Transaction 10: One men's formal shoe
('S20230107-00410', 'SM-MF-001', 1, 129.90, 0.00, 129.90),

-- Transaction 11: One women's formal shoe
('S20230107-00411', 'SM-WF-003', 1, 89.90, 0.00, 89.90);

-- **Sunday (January 8)** - 10 transactions, 12 pairs sold, $1534.70 total
INSERT INTO sales (sale_id, outlet_id, employee_id, sale_date, payment_method, subtotal, gst_amount, discount_amount, total_amount)
VALUES
-- Morning transactions (EMP014 & part-timer EMP020)
('S20230108-00401', 'OUT005', 'EMP014', '2023-01-08 11:10:19', 'Credit Card', 149.90, 11.99, 0.00, 161.89),
('S20230108-00402', 'OUT005', 'EMP014', '2023-01-08 11:50:33', 'NETS', 99.90, 7.99, 0.00, 107.89),
('S20230108-00403', 'OUT005', 'EMP014', '2023-01-08 12:30:15', 'Cash', 169.90, 13.59, 0.00, 183.49),
('S20230108-00404', 'OUT005', 'EMP014', '2023-01-08 13:10:44', 'PayNow', 129.90, 10.39, 0.00, 140.29),
('S20230108-00405', 'OUT005', 'EMP020', '2023-01-08 13:50:18', 'Credit Card', 199.80, 15.98, 20.00, 195.78),

-- Afternoon/evening transactions (EMP015 & part-timer EMP020)
('S20230108-00406', 'OUT005', 'EMP020', '2023-01-08 14:30:33', 'Cash', 189.90, 15.19, 0.00, 205.09),
('S20230108-00407', 'OUT005', 'EMP020', '2023-01-08 15:10:15', 'NETS', 139.90, 11.19, 0.00, 151.09),
('S20230108-00408', 'OUT005', 'EMP015', '2023-01-08 15:50:44', 'Credit Card', 159.90, 12.79, 0.00, 172.69),
('S20230108-00409', 'OUT005', 'EMP015', '2023-01-08 16:30:18', 'PayNow', 99.90, 7.99, 0.00, 107.89),
('S20230108-00410', 'OUT005', 'EMP015', '2023-01-08 17:10:33', 'Cash', 129.90, 10.39, 0.00, 140.29);

INSERT INTO sale_items (sale_id, sku, quantity, unit_price, discount, item_total)
VALUES
-- Transaction 1: One men's casual shoe
('S20230108-00401', 'SM-MC-003', 1, 149.90, 0.00, 149.90),

-- Transaction 2: One kids formal shoe
('S20230108-00402', 'SM-KF-001', 1, 99.90, 0.00, 99.90),

-- Transaction 3: One women's formal shoe
('S20230108-00403', 'SM-WF-002', 1, 169.90, 0.00, 169.90),

-- Transaction 4: One men's formal shoe
('S20230108-00404', 'SM-MF-001', 1, 129.90, 0.00, 129.90),

-- Transaction 5: Two pairs with $20 discount
('S20230108-00405', 'SM-MS-001', 1, 109.90, 10.00, 99.90),
('S20230108-00405', 'SM-WC-001', 1, 109.90, 10.00, 99.90),

-- Transaction 6: One men's formal shoe
('S20230108-00406', 'SM-MF-002', 1, 189.90, 0.00, 189.90),

-- Transaction 7: One men's sports shoe
('S20230108-00407', 'SM-MS-005', 1, 139.90, 0.00, 139.90),

-- Transaction 8: One women's formal shoe
('S20230108-00408', 'SM-WF-004', 1, 159.90, 0.00, 159.90),

-- Transaction 9: One kids formal shoe
('S20230108-00409', 'SM-KF-001', 1, 99.90, 0.00, 99.90),

-- Transaction 10: Two pairs of regular prices
('S20230108-00410', 'SM-MF-001', 1, 129.90, 0.00, 129.90),
('S20230108-00410', 'SM-KC-002', 1, 79.90, 0.00, 79.90);