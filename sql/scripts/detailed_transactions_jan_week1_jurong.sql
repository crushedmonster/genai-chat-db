-- detailed_transactions_jan_week1_jurong.sql
-- Detailed sales transactions for Jurong Point outlet for Week 1 of January 2023

USE shoemart;
GO

-- **Monday (January 2)** - 7 transactions, 8 pairs sold, $1179.60 total
INSERT INTO sales (sale_id, outlet_id, employee_id, sale_date, payment_method, subtotal, gst_amount, discount_amount, total_amount)
VALUES
-- Morning transactions (EMP010)
('S20230102-00201', 'OUT003', 'EMP010', '2023-01-02 10:30:12', 'Cash', 129.90, 10.39, 0.00, 140.29),
('S20230102-00202', 'OUT003', 'EMP010', '2023-01-02 11:45:37', 'Credit Card', 199.80, 15.98, 20.00, 195.78),
('S20230102-00203', 'OUT003', 'EMP010', '2023-01-02 13:15:22', 'NETS', 149.90, 11.99, 0.00, 161.89),

-- Afternoon/evening transactions (EMP011)
('S20230102-00204', 'OUT003', 'EMP011', '2023-01-02 14:30:45', 'PayNow', 89.90, 7.19, 0.00, 97.09),
('S20230102-00205', 'OUT003', 'EMP011', '2023-01-02 16:10:18', 'Credit Card', 229.80, 18.38, 25.00, 223.18),
('S20230102-00206', 'OUT003', 'EMP011', '2023-01-02 17:35:33', 'Cash', 179.90, 14.39, 0.00, 194.29),
('S20230102-00207', 'OUT003', 'EMP011', '2023-01-02 19:05:27', 'NETS', 169.90, 13.59, 0.00, 183.49);

INSERT INTO sale_items (sale_id, sku, quantity, unit_price, discount, item_total)
VALUES
-- Transaction 1: One men's formal shoe
('S20230102-00201', 'SM-MF-001', 1, 129.90, 0.00, 129.90),

-- Transaction 2: Two pairs with $20 discount
('S20230102-00202', 'SM-MS-001', 1, 109.90, 10.00, 99.90),
('S20230102-00202', 'SM-KC-001', 1, 109.90, 10.00, 99.90),

-- Transaction 3: One men's casual shoe
('S20230102-00203', 'SM-MC-003', 1, 149.90, 0.00, 149.90),

-- Transaction 4: One women's formal shoe
('S20230102-00204', 'SM-WF-003', 1, 89.90, 0.00, 89.90),

-- Transaction 5: Two pairs with $25 discount
('S20230102-00205', 'SM-MF-004', 1, 129.90, 15.00, 114.90),
('S20230102-00205', 'SM-WC-001', 1, 114.90, 10.00, 104.90),

-- Transaction 6: One women's sports shoe
('S20230102-00206', 'SM-WS-004', 1, 179.90, 0.00, 179.90),

-- Transaction 7: One women's formal shoe
('S20230102-00207', 'SM-WF-002', 1, 169.90, 0.00, 169.90);

-- **Tuesday (January 3)** - 8 transactions, 9 pairs sold, $1245.90 total
INSERT INTO sales (sale_id, outlet_id, employee_id, sale_date, payment_method, subtotal, gst_amount, discount_amount, total_amount)
VALUES
-- Morning transactions (EMP010)
('S20230103-00201', 'OUT003', 'EMP010', '2023-01-03 10:25:12', 'Cash', 109.90, 8.79, 0.00, 118.69),
('S20230103-00202', 'OUT003', 'EMP010', '2023-01-03 11:40:37', 'Credit Card', 169.90, 13.59, 0.00, 183.49),
('S20230103-00203', 'OUT003', 'EMP010', '2023-01-03 13:05:22', 'NETS', 139.90, 11.19, 0.00, 151.09),

-- Afternoon/evening transactions (EMP011)
('S20230103-00204', 'OUT003', 'EMP011', '2023-01-03 14:30:45', 'PayNow', 99.90, 7.99, 0.00, 107.89),
('S20230103-00205', 'OUT003', 'EMP011', '2023-01-03 15:55:18', 'Credit Card', 199.80, 15.98, 20.00, 195.78),
('S20230103-00206', 'OUT003', 'EMP011', '2023-01-03 17:15:33', 'Cash', 149.90, 11.99, 0.00, 161.89),
('S20230103-00207', 'OUT003', 'EMP010', '2023-01-03 18:40:27', 'NETS', 179.90, 14.39, 0.00, 194.29),
('S20230103-00208', 'OUT003', 'EMP010', '2023-01-03 19:55:53', 'Credit Card', 139.90, 11.19, 0.00, 151.09);

INSERT INTO sale_items (sale_id, sku, quantity, unit_price, discount, item_total)
VALUES
-- Transaction 1: One kids sports shoe
('S20230103-00201', 'SM-KS-001', 1, 109.90, 0.00, 109.90),

-- Transaction 2: One women's formal shoe
('S20230103-00202', 'SM-WF-002', 1, 169.90, 0.00, 169.90),

-- Transaction 3: One men's sports shoe
('S20230103-00203', 'SM-MS-005', 1, 139.90, 0.00, 139.90),

-- Transaction 4: One kids formal shoe
('S20230103-00204', 'SM-KF-001', 1, 99.90, 0.00, 99.90),

-- Transaction 5: Two pairs with $20 discount
('S20230103-00205', 'SM-MF-003', 1, 109.90, 10.00, 99.90),
('S20230103-00205', 'SM-WC-001', 1, 109.90, 10.00, 99.90),

-- Transaction 6: One men's casual shoe
('S20230103-00206', 'SM-MC-003', 1, 149.90, 0.00, 149.90),

-- Transaction 7: One women's sports shoe
('S20230103-00207', 'SM-WS-004', 1, 179.90, 0.00, 179.90),

-- Transaction 8: One men's sports shoe
('S20230103-00208', 'SM-MS-005', 1, 139.90, 0.00, 139.90);

-- **Wednesday (January 4)** - 8 transactions, 9 pairs sold, $1256.30 total
INSERT INTO sales (sale_id, outlet_id, employee_id, sale_date, payment_method, subtotal, gst_amount, discount_amount, total_amount)
VALUES
-- Morning transactions (EMP010)
('S20230104-00201', 'OUT003', 'EMP010', '2023-01-04 10:15:12', 'Cash', 129.90, 10.39, 0.00, 140.29),
('S20230104-00202', 'OUT003', 'EMP010', '2023-01-04 11:35:37', 'Credit Card', 179.90, 14.39, 0.00, 194.29),
('S20230104-00203', 'OUT003', 'EMP010', '2023-01-04 12:55:22', 'NETS', 149.90, 11.99, 0.00, 161.89),

-- Afternoon/evening transactions (EMP011)
('S20230104-00204', 'OUT003', 'EMP011', '2023-01-04 14:15:45', 'PayNow', 199.80, 15.98, 20.00, 195.78),
('S20230104-00205', 'OUT003', 'EMP011', '2023-01-04 15:40:18', 'Credit Card', 89.90, 7.19, 0.00, 97.09),
('S20230104-00206', 'OUT003', 'EMP011', '2023-01-04 17:00:33', 'Cash', 169.90, 13.59, 0.00, 183.49),
('S20230104-00207', 'OUT003', 'EMP010', '2023-01-04 18:25:27', 'NETS', 199.80, 15.98, 20.00, 195.78),
('S20230104-00208', 'OUT003', 'EMP010', '2023-01-04 19:40:53', 'Credit Card', 99.90, 7.99, 0.00, 107.89);

INSERT INTO sale_items (sale_id, sku, quantity, unit_price, discount, item_total)
VALUES
-- Transaction 1: One men's formal shoe
('S20230104-00201', 'SM-MF-001', 1, 129.90, 0.00, 129.90),

-- Transaction 2: One women's sports shoe
('S20230104-00202', 'SM-WS-004', 1, 179.90, 0.00, 179.90),

-- Transaction 3: One men's casual shoe
('S20230104-00203', 'SM-MC-003', 1, 149.90, 0.00, 149.90),

-- Transaction 4: Two pairs with $20 discount
('S20230104-00204', 'SM-MF-003', 1, 109.90, 10.00, 99.90),
('S20230104-00204', 'SM-WC-001', 1, 109.90, 10.00, 99.90),

-- Transaction 5: One women's formal shoe
('S20230104-00205', 'SM-WF-003', 1, 89.90, 0.00, 89.90),

-- Transaction 6: One women's formal shoe
('S20230104-00206', 'SM-WF-002', 1, 169.90, 0.00, 169.90),

-- Transaction 7: Two pairs with $20 discount
('S20230104-00207', 'SM-MF-004', 1, 109.90, 10.00, 99.90),
('S20230104-00207', 'SM-KC-001', 1, 109.90, 10.00, 99.90),

-- Transaction 8: One kids formal shoe
('S20230104-00208', 'SM-KF-001', 1, 99.90, 0.00, 99.90);

-- **Thursday (January 5)** - 8 transactions, 9 pairs sold, $1245.40 total
INSERT INTO sales (sale_id, outlet_id, employee_id, sale_date, payment_method, subtotal, gst_amount, discount_amount, total_amount)
VALUES
-- Morning transactions (EMP010)
('S20230105-00201', 'OUT003', 'EMP010', '2023-01-05 10:20:12', 'Cash', 119.90, 9.59, 0.00, 129.49),
('S20230105-00202', 'OUT003', 'EMP010', '2023-01-05 11:35:37', 'Credit Card', 159.90, 12.79, 0.00, 172.69),
('S20230105-00203', 'OUT003', 'EMP010', '2023-01-05 12:50:22', 'NETS', 139.90, 11.19, 0.00, 151.09),

-- Afternoon/evening transactions (EMP011)
('S20230105-00204', 'OUT003', 'EMP011', '2023-01-05 14:10:45', 'PayNow', 179.90, 14.39, 0.00, 194.29),
('S20230105-00205', 'OUT003', 'EMP011', '2023-01-05 15:30:18', 'Credit Card', 99.90, 7.99, 0.00, 107.89),
('S20230105-00206', 'OUT003', 'EMP011', '2023-01-05 16:45:33', 'Cash', 149.90, 11.99, 0.00, 161.89),
('S20230105-00207', 'OUT003', 'EMP010', '2023-01-05 18:05:27', 'NETS', 219.80, 17.58, 20.00, 217.38),
('S20230105-00208', 'OUT003', 'EMP010', '2023-01-05 19:25:53', 'Credit Card', 129.90, 10.39, 0.00, 140.29);

INSERT INTO sale_items (sale_id, sku, quantity, unit_price, discount, item_total)
VALUES
-- Transaction 1: One women's casual shoe
('S20230105-00201', 'SM-WC-003', 1, 119.90, 0.00, 119.90),

-- Transaction 2: One women's formal shoe
('S20230105-00202', 'SM-WF-004', 1, 159.90, 0.00, 159.90),

-- Transaction 3: One men's sports shoe
('S20230105-00203', 'SM-MS-005', 1, 139.90, 0.00, 139.90),

-- Transaction 4: One women's sports shoe
('S20230105-00204', 'SM-WS-004', 1, 179.90, 0.00, 179.90),

-- Transaction 5: One kids formal shoe
('S20230105-00205', 'SM-KF-001', 1, 99.90, 0.00, 99.90),

-- Transaction 6: One men's casual shoe
('S20230105-00206', 'SM-MC-003', 1, 149.90, 0.00, 149.90),

-- Transaction 7: Two pairs with $20 discount
('S20230105-00207', 'SM-MF-003', 1, 119.90, 10.00, 109.90),
('S20230105-00207', 'SM-WC-001', 1, 119.90, 10.00, 109.90),

-- Transaction 8: One men's formal shoe
('S20230105-00208', 'SM-MF-001', 1, 129.90, 0.00, 129.90);

-- **Friday (January 6)** - 10 transactions, 12 pairs sold, $1567.90 total
INSERT INTO sales (sale_id, outlet_id, employee_id, sale_date, payment_method, subtotal, gst_amount, discount_amount, total_amount)
VALUES
-- Morning transactions (EMP010)
('S20230106-00201', 'OUT003', 'EMP010', '2023-01-06 10:10:12', 'Cash', 129.90, 10.39, 0.00, 140.29),
('S20230106-00202', 'OUT003', 'EMP010', '2023-01-06 11:00:37', 'Credit Card', 159.90, 12.79, 0.00, 172.69),
('S20230106-00203', 'OUT003', 'EMP010', '2023-01-06 11:50:22', 'NETS', 99.90, 7.99, 0.00, 107.89),
('S20230106-00204', 'OUT003', 'EMP010', '2023-01-06 12:40:45', 'PayNow', 179.90, 14.39, 0.00, 194.29),

-- Afternoon transactions (EMP011)
('S20230106-00205', 'OUT003', 'EMP011', '2023-01-06 13:30:18', 'Credit Card', 229.80, 18.38, 25.00, 223.18),
('S20230106-00206', 'OUT003', 'EMP011', '2023-01-06 14:20:33', 'Cash', 149.90, 11.99, 0.00, 161.89),
('S20230106-00207', 'OUT003', 'EMP011', '2023-01-06 15:10:27', 'NETS', 199.80, 15.98, 20.00, 195.78),
('S20230106-00208', 'OUT003', 'EMP011', '2023-01-06 16:00:53', 'Credit Card', 139.90, 11.19, 0.00, 151.09),

-- Evening transactions (EMP010)
('S20230106-00209', 'OUT003', 'EMP010', '2023-01-06 16:50:12', 'Cash', 119.90, 9.59, 0.00, 129.49),
('S20230106-00210', 'OUT003', 'EMP010', '2023-01-06 17:40:37', 'NETS', 109.90, 8.79, 0.00, 118.69);

INSERT INTO sale_items (sale_id, sku, quantity, unit_price, discount, item_total)
VALUES
-- Transaction 1: One men's formal shoe
('S20230106-00201', 'SM-MF-001', 1, 129.90, 0.00, 129.90),

-- Transaction 2: One women's formal shoe
('S20230106-00202', 'SM-WF-004', 1, 159.90, 0.00, 159.90),

-- Transaction 3: One kids formal shoe
('S20230106-00203', 'SM-KF-001', 1, 99.90, 0.00, 99.90),

-- Transaction 4: One women's sports shoe
('S20230106-00204', 'SM-WS-004', 1, 179.90, 0.00, 179.90),

-- Transaction 5: Two pairs with $25 discount
('S20230106-00205', 'SM-MS-003', 1, 129.90, 15.00, 114.90),
('S20230106-00205', 'SM-WF-001', 1, 124.90, 10.00, 114.90),

-- Transaction 6: One men's casual shoe
('S20230106-00206', 'SM-MC-003', 1, 149.90, 0.00, 149.90),

-- Transaction 7: Two pairs with $20 discount
('S20230106-00207', 'SM-MF-003', 1, 109.90, 10.00, 99.90),
('S20230106-00207', 'SM-WC-001', 1, 109.90, 10.00, 99.90),

-- Transaction 8: One men's sports shoe
('S20230106-00208', 'SM-MS-005', 1, 139.90, 0.00, 139.90),

-- Transaction 9: One women's casual shoe
('S20230106-00209', 'SM-WC-003', 1, 119.90, 0.00, 119.90),

-- Transaction 10: One kids sports shoe
('S20230106-00210', 'SM-KS-001', 1, 109.90, 0.00, 109.90);

-- **Saturday (January 7)** - 13 transactions, 15 pairs sold, $2023.50 total
INSERT INTO sales (sale_id, outlet_id, employee_id, sale_date, payment_method, subtotal, gst_amount, discount_amount, total_amount)
VALUES
-- Morning transactions (EMP010 & part-timer EMP018)
('S20230107-00201', 'OUT003', 'EMP010', '2023-01-07 10:15:12', 'Cash', 149.90, 11.99, 0.00, 161.89),
('S20230107-00202', 'OUT003', 'EMP010', '2023-01-07 10:55:37', 'Credit Card', 189.90, 15.19, 0.00, 205.09),
('S20230107-00203', 'OUT003', 'EMP010', '2023-01-07 11:35:22', 'NETS', 99.90, 7.99, 0.00, 107.89),
('S20230107-00204', 'OUT003', 'EMP010', '2023-01-07 12:15:45', 'PayNow', 139.90, 11.19, 0.00, 151.09),
('S20230107-00205', 'OUT003', 'EMP018', '2023-01-07 12:55:18', 'Credit Card', 229.80, 18.38, 25.00, 223.18),
('S20230107-00206', 'OUT003', 'EMP018', '2023-01-07 13:35:33', 'Cash', 179.90, 14.39, 0.00, 194.29),

-- Afternoon transactions (EMP011 & part-timer EMP018)
('S20230107-00207', 'OUT003', 'EMP018', '2023-01-07 14:15:27', 'NETS', 169.90, 13.59, 0.00, 183.49),
('S20230107-00208', 'OUT003', 'EMP018', '2023-01-07 14:55:53', 'Credit Card', 119.90, 9.59, 0.00, 129.49),
('S20230107-00209', 'OUT003', 'EMP011', '2023-01-07 15:35:12', 'PayNow', 199.80, 15.98, 20.00, 195.78),
('S20230107-00210', 'OUT003', 'EMP011', '2023-01-07 16:15:37', 'Cash', 129.90, 10.39, 0.00, 140.29),

-- Evening transactions (EMP011)
('S20230107-00211', 'OUT003', 'EMP011', '2023-01-07 16:55:22', 'Credit Card', 159.90, 12.79, 0.00, 172.69),
('S20230107-00212', 'OUT003', 'EMP011', '2023-01-07 17:35:45', 'NETS', 89.90, 7.19, 0.00, 97.09),
('S20230107-00213', 'OUT003', 'EMP011', '2023-01-07 18:15:18', 'Cash', 89.90, 7.19, 0.00, 97.09);

INSERT INTO sale_items (sale_id, sku, quantity, unit_price, discount, item_total)
VALUES
-- Transaction 1: One men's casual shoe
('S20230107-00201', 'SM-MC-003', 1, 149.90, 0.00, 149.90),

-- Transaction 2: One men's formal shoe
('S20230107-00202', 'SM-MF-002', 1, 189.90, 0.00, 189.90),

-- Transaction 3: One kids formal shoe
('S20230107-00203', 'SM-KF-001', 1, 99.90, 0.00, 99.90),

-- Transaction 4: One men's sports shoe
('S20230107-00204', 'SM-MS-005', 1, 139.90, 0.00, 139.90),

-- Transaction 5: Two pairs with $25 discount
('S20230107-00205', 'SM-MF-004', 1, 139.90, 15.00, 124.90),
('S20230107-00205', 'SM-WF-001', 1, 114.90, 10.00, 104.90),

-- Transaction 6: One women's sports shoe
('S20230107-00206', 'SM-WS-004', 1, 179.90, 0.00, 179.90),

-- Transaction 7: One women's formal shoe
('S20230107-00207', 'SM-WF-002', 1, 169.90, 0.00, 169.90),

-- Transaction 8: One women's casual shoe
('S20230107-00208', 'SM-WC-003', 1, 119.90, 0.00, 119.90),

-- Transaction 9: Two pairs with $20 discount
('S20230107-00209', 'SM-MS-001', 1, 109.90, 10.00, 99.90),
('S20230107-00209', 'SM-KC-001', 1, 109.90, 10.00, 99.90),

-- Transaction 10: One men's formal shoe
('S20230107-00210', 'SM-MF-001', 1, 129.90, 0.00, 129.90),

-- Transaction 11: One women's formal shoe
('S20230107-00211', 'SM-WF-004', 1, 159.90, 0.00, 159.90),

-- Transaction 12: One women's formal shoe
('S20230107-00212', 'SM-WF-003', 1, 89.90, 0.00, 89.90),

-- Transaction 13: One women's formal shoe (different size)
('S20230107-00213', 'SM-WF-003', 1, 89.90, 0.00, 89.90);

-- **Sunday (January 8)** - 12 transactions, 14 pairs sold, $1867.80 total
INSERT INTO sales (sale_id, outlet_id, employee_id, sale_date, payment_method, subtotal, gst_amount, discount_amount, total_amount)
VALUES
-- Morning transactions (EMP010 & part-timer EMP018)
('S20230108-00201', 'OUT003', 'EMP010', '2023-01-08 11:00:12', 'Cash', 139.90, 11.19, 0.00, 151.09),
('S20230108-00202', 'OUT003', 'EMP010', '2023-01-08 11:35:37', 'Credit Card', 179.90, 14.39, 0.00, 194.29),
('S20230108-00203', 'OUT003', 'EMP010', '2023-01-08 12:10:22', 'NETS', 99.90, 7.99, 0.00, 107.89),
('S20230108-00204', 'OUT003', 'EMP010', '2023-01-08 12:45:45', 'PayNow', 219.80, 17.58, 20.00, 217.38),
('S20230108-00205', 'OUT003', 'EMP018', '2023-01-08 13:20:18', 'Credit Card', 169.90, 13.59, 0.00, 183.49),
('S20230108-00206', 'OUT003', 'EMP018', '2023-01-08 13:55:33', 'Cash', 149.90, 11.99, 0.00, 161.89),

-- Afternoon transactions (EMP011 & part-timer EMP018)
('S20230108-00207', 'OUT003', 'EMP018', '2023-01-08 14:30:27', 'NETS', 129.90, 10.39, 0.00, 140.29),
('S20230108-00208', 'OUT003', 'EMP018', '2023-01-08 15:05:53', 'Credit Card', 199.80, 15.98, 20.00, 195.78),
('S20230108-00209', 'OUT003', 'EMP011', '2023-01-08 15:40:12', 'PayNow', 119.90, 9.59, 0.00, 129.49),
('S20230108-00210', 'OUT003', 'EMP011', '2023-01-08 16:15:37', 'Cash', 159.90, 12.79, 0.00, 172.69),

-- Evening transactions (EMP011)
('S20230108-00211', 'OUT003', 'EMP011', '2023-01-08 16:50:22', 'Credit Card', 109.90, 8.79, 0.00, 118.69),
('S20230108-00212', 'OUT003', 'EMP011', '2023-01-08 17:25:45', 'NETS', 119.90, 9.59, 0.00, 129.49);

INSERT INTO sale_items (sale_id, sku, quantity, unit_price, discount, item_total)
VALUES
-- Transaction 1: One men's sports shoe
('S20230108-00201', 'SM-MS-005', 1, 139.90, 0.00, 139.90),

-- Transaction 2: One women's sports shoe
('S20230108-00202', 'SM-WS-004', 1, 179.90, 0.00, 179.90),

-- Transaction 3: One kids formal shoe
('S20230108-00203', 'SM-KF-001', 1, 99.90, 0.00, 99.90),

-- Transaction 4: Two pairs with $20 discount
('S20230108-00204', 'SM-MF-003', 1, 119.90, 10.00, 109.90),
('S20230108-00204', 'SM-WC-001', 1, 119.90, 10.00, 109.90),

-- Transaction 5: One women's formal shoe
('S20230108-00205', 'SM-WF-002', 1, 169.90, 0.00, 169.90),

-- Transaction 6: One men's casual shoe
('S20230108-00206', 'SM-MC-003', 1, 149.90, 0.00, 149.90),

-- Transaction 7: One men's formal shoe
('S20230108-00207', 'SM-MF-001', 1, 129.90, 0.00, 129.90),

-- Transaction 8: Two pairs with $20 discount
('S20230108-00208', 'SM-MS-001', 1, 109.90, 10.00, 99.90),
('S20230108-00208', 'SM-KC-001', 1, 109.90, 10.00, 99.90),

-- Transaction 9: One women's casual shoe
('S20230108-00209', 'SM-WC-003', 1, 119.90, 0.00, 119.90),

-- Transaction 10: One women's formal shoe
('S20230108-00210', 'SM-WF-004', 1, 159.90, 0.00, 159.90),

-- Transaction 11: One kids sports shoe
('S20230108-00211', 'SM-KS-001', 1, 109.90, 0.00, 109.90),

-- Transaction 12: One women's casual shoe
('S20230108-00212', 'SM-WC-002', 1, 119.90, 0.00, 119.90);