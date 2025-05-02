-- detailed_transactions_jan_week1_somerset.sql
-- Detailed sales transactions for Somerset outlet for Week 1 of January 2023

USE shoemart;
GO

-- **Monday (January 2)** - 8 transactions, 10 pairs sold, $1458.80 total
INSERT INTO sales (sale_id, outlet_id, employee_id, sale_date, payment_method, subtotal, gst_amount, discount_amount, total_amount)
VALUES
-- Morning/early afternoon transactions (EMP006)
('S20230102-00001', 'OUT001', 'EMP006', '2023-01-02 10:15:22', 'Credit Card', 129.90, 10.39, 0.00, 140.29),
('S20230102-00002', 'OUT001', 'EMP006', '2023-01-02 11:30:37', 'Cash', 89.90, 7.19, 0.00, 97.09),
('S20230102-00003', 'OUT001', 'EMP006', '2023-01-02 12:45:15', 'NETS', 159.90, 12.79, 0.00, 172.69),
('S20230102-00004', 'OUT001', 'EMP006', '2023-01-02 14:05:33', 'Credit Card', 189.90, 15.19, 15.00, 190.09),

-- Late afternoon/evening transactions (EMP007)
('S20230102-00005', 'OUT001', 'EMP007', '2023-01-02 15:20:48', 'PayNow', 99.90, 7.99, 0.00, 107.89),
('S20230102-00006', 'OUT001', 'EMP007', '2023-01-02 16:35:22', 'Credit Card', 149.90, 11.99, 0.00, 161.89),
('S20230102-00007', 'OUT001', 'EMP007', '2023-01-02 18:10:37', 'Cash', 279.80, 22.38, 25.00, 277.18),
('S20230102-00008', 'OUT001', 'EMP007', '2023-01-02 19:25:15', 'NETS', 169.90, 13.59, 0.00, 183.49);

INSERT INTO sale_items (sale_id, sku, quantity, unit_price, discount, item_total)
VALUES
-- Transaction 1: One men's formal shoe
('S20230102-00001', 'SM-MF-002', 1, 129.90, 0.00, 129.90),

-- Transaction 2: One women's formal shoe
('S20230102-00002', 'SM-WF-003', 1, 89.90, 0.00, 89.90),

-- Transaction 3: One sports shoe
('S20230102-00003', 'SM-MS-004', 1, 159.90, 0.00, 159.90),

-- Transaction 4: One premium formal shoe with discount
('S20230102-00004', 'SM-MF-004', 1, 189.90, 15.00, 174.90),

-- Transaction 5: One kids shoe
('S20230102-00005', 'SM-KF-001', 1, 99.90, 0.00, 99.90),

-- Transaction 6: One men's casual shoe
('S20230102-00006', 'SM-MC-003', 1, 149.90, 0.00, 149.90),

-- Transaction 7: Two pairs with $25 discount
('S20230102-00007', 'SM-MS-003', 1, 159.90, 15.00, 144.90),
('S20230102-00007', 'SM-WS-002', 1, 139.90, 10.00, 129.90),

-- Transaction 8: One women's premium shoe
('S20230102-00008', 'SM-WS-001', 1, 169.90, 0.00, 169.90);

-- **Tuesday (January 3)** - 10 transactions, 12 pairs sold, $1702.50 total
INSERT INTO sales (sale_id, outlet_id, employee_id, sale_date, payment_method, subtotal, gst_amount, discount_amount, total_amount)
VALUES
-- Morning transactions (EMP006)
('S20230103-00001', 'OUT001', 'EMP006', '2023-01-03 10:15:22', 'Credit Card', 129.90, 10.39, 0.00, 140.29),
('S20230103-00002', 'OUT001', 'EMP006', '2023-01-03 10:45:37', 'Cash', 89.90, 7.19, 0.00, 97.09),
('S20230103-00003', 'OUT001', 'EMP006', '2023-01-03 11:20:15', 'NETS', 209.80, 16.78, 20.00, 206.58),
('S20230103-00004', 'OUT001', 'EMP006', '2023-01-03 12:05:33', 'Credit Card', 139.90, 11.19, 0.00, 151.09),
('S20230103-00005', 'OUT001', 'EMP006', '2023-01-03 12:35:48', 'PayNow', 99.90, 7.99, 0.00, 107.89),

-- Afternoon/evening transactions (EMP007)
('S20230103-00006', 'OUT001', 'EMP007', '2023-01-03 13:10:22', 'Credit Card', 149.90, 11.99, 0.00, 161.89),
('S20230103-00007', 'OUT001', 'EMP007', '2023-01-03 14:45:37', 'Cash', 79.90, 6.39, 0.00, 86.29),
('S20230103-00008', 'OUT001', 'EMP007', '2023-01-03 16:20:15', 'NETS', 229.80, 18.38, 25.00, 223.18),
('S20230103-00009', 'OUT001', 'EMP007', '2023-01-03 18:05:33', 'Credit Card', 169.90, 13.59, 0.00, 183.49),
('S20230103-00010', 'OUT001', 'EMP007', '2023-01-03 19:40:48', 'PayNow', 119.90, 9.59, 0.00, 129.49);

INSERT INTO sale_items (sale_id, sku, quantity, unit_price, discount, item_total)
VALUES
-- Transaction 1: One men's formal shoe
('S20230103-00001', 'SM-MF-001', 1, 129.90, 0.00, 129.90),

-- Transaction 2: One women's formal shoe
('S20230103-00002', 'SM-WF-003', 1, 89.90, 0.00, 89.90),

-- Transaction 3: Two pairs with $20 discount
('S20230103-00003', 'SM-MS-001', 1, 139.90, 10.00, 129.90),
('S20230103-00003', 'SM-WC-002', 1, 89.90, 10.00, 79.90),

-- Transaction 4: One sports shoe
('S20230103-00004', 'SM-MS-005', 1, 139.90, 0.00, 139.90),

-- Transaction 5: One kids shoe
('S20230103-00005', 'SM-KF-001', 1, 99.90, 0.00, 99.90),

-- Transaction 6: One men's casual shoe
('S20230103-00006', 'SM-MC-003', 1, 149.90, 0.00, 149.90),

-- Transaction 7: One kids shoe
('S20230103-00007', 'SM-KC-002', 1, 79.90, 0.00, 79.90),

-- Transaction 8: Two pairs with $25 discount
('S20230103-00008', 'SM-MF-005', 1, 129.90, 15.00, 114.90),
('S20230103-00008', 'SM-WF-001', 1, 114.90, 10.00, 104.90),

-- Transaction 9: One women's sports shoe
('S20230103-00009', 'SM-WS-001', 1, 169.90, 0.00, 169.90),

-- Transaction 10: One women's casual shoe
('S20230103-00010', 'SM-WC-001', 1, 119.90, 0.00, 119.90);

-- **Wednesday (January 4)** - 9 transactions, 11 pairs sold, $1589.10 total
INSERT INTO sales (sale_id, outlet_id, employee_id, sale_date, payment_method, subtotal, gst_amount, discount_amount, total_amount)
VALUES
-- Morning transactions (EMP006)
('S20230104-00001', 'OUT001', 'EMP006', '2023-01-04 10:30:22', 'Credit Card', 139.90, 11.19, 0.00, 151.09),
('S20230104-00002', 'OUT001', 'EMP006', '2023-01-04 11:15:37', 'NETS', 99.90, 7.99, 0.00, 107.89),
('S20230104-00003', 'OUT001', 'EMP006', '2023-01-04 12:20:15', 'Cash', 149.90, 11.99, 0.00, 161.89),
('S20230104-00004', 'OUT001', 'EMP006', '2023-01-04 13:05:33', 'Credit Card', 229.80, 18.38, 20.00, 228.18),

-- Afternoon/evening transactions (EMP007)
('S20230104-00005', 'OUT001', 'EMP007', '2023-01-04 14:30:48', 'PayNow', 169.90, 13.59, 0.00, 183.49),
('S20230104-00006', 'OUT001', 'EMP007', '2023-01-04 15:45:22', 'Credit Card', 79.90, 6.39, 0.00, 86.29),
('S20230104-00007', 'OUT001', 'EMP007', '2023-01-04 17:10:37', 'Cash', 199.80, 15.98, 20.00, 195.78),
('S20230104-00008', 'OUT001', 'EMP007', '2023-01-04 18:25:15', 'NETS', 169.90, 13.59, 0.00, 183.49),
('S20230104-00009', 'OUT001', 'EMP007', '2023-01-04 19:40:33', 'Credit Card', 189.90, 15.19, 15.00, 190.09);

INSERT INTO sale_items (sale_id, sku, quantity, unit_price, discount, item_total)
VALUES
-- Transaction 1: One men's sports shoe
('S20230104-00001', 'SM-MS-005', 1, 139.90, 0.00, 139.90),

-- Transaction 2: One kids shoe
('S20230104-00002', 'SM-KF-001', 1, 99.90, 0.00, 99.90),

-- Transaction 3: One men's casual shoe
('S20230104-00003', 'SM-MC-003', 1, 149.90, 0.00, 149.90),

-- Transaction 4: Two pairs with $20 discount
('S20230104-00004', 'SM-MF-002', 1, 129.90, 10.00, 119.90),
('S20230104-00004', 'SM-WC-002', 1, 119.90, 10.00, 109.90),

-- Transaction 5: One women's sports shoe
('S20230104-00005', 'SM-WS-001', 1, 169.90, 0.00, 169.90),

-- Transaction 6: One kids casual shoe
('S20230104-00006', 'SM-KC-002', 1, 79.90, 0.00, 79.90),

-- Transaction 7: Two pairs with $20 discount
('S20230104-00007', 'SM-MS-004', 1, 109.90, 10.00, 99.90),
('S20230104-00007', 'SM-WC-004', 1, 109.90, 10.00, 99.90),

-- Transaction 8: One women's shoe
('S20230104-00008', 'SM-WF-002', 1, 169.90, 0.00, 169.90),

-- Transaction 9: One men's formal shoe with discount
('S20230104-00009', 'SM-MF-004', 1, 189.90, 15.00, 174.90);

-- **Thursday (January 5)** - 9 transactions, 10 pairs sold, $1534.20 total
INSERT INTO sales (sale_id, outlet_id, employee_id, sale_date, payment_method, subtotal, gst_amount, discount_amount, total_amount)
VALUES
-- Morning/afternoon transactions (EMP006)
('S20230105-00001', 'OUT001', 'EMP006', '2023-01-05 10:15:22', 'Credit Card', 149.90, 11.99, 0.00, 161.89),
('S20230105-00002', 'OUT001', 'EMP006', '2023-01-05 11:30:37', 'Cash', 119.90, 9.59, 0.00, 129.49),
('S20230105-00003', 'OUT001', 'EMP006', '2023-01-05 12:45:15', 'NETS', 169.90, 13.59, 0.00, 183.49),
('S20230105-00004', 'OUT001', 'EMP006', '2023-01-05 13:55:33', 'Credit Card', 89.90, 7.19, 0.00, 97.09),

-- Late afternoon/evening transactions (EMP007)
('S20230105-00005', 'OUT001', 'EMP007', '2023-01-05 15:10:48', 'PayNow', 179.90, 14.39, 15.00, 179.29),
('S20230105-00006', 'OUT001', 'EMP007', '2023-01-05 16:25:22', 'Credit Card', 129.90, 10.39, 0.00, 140.29),
('S20230105-00007', 'OUT001', 'EMP007', '2023-01-05 17:40:37', 'Cash', 249.80, 19.98, 25.00, 244.78),
('S20230105-00008', 'OUT001', 'EMP007', '2023-01-05 18:55:15', 'NETS', 99.90, 7.99, 0.00, 107.89),
('S20230105-00009', 'OUT001', 'EMP007', '2023-01-05 20:10:33', 'Credit Card', 179.90, 14.39, 0.00, 194.29);

INSERT INTO sale_items (sale_id, sku, quantity, unit_price, discount, item_total)
VALUES
-- Transaction 1: One men's casual shoe
('S20230105-00001', 'SM-MC-003', 1, 149.90, 0.00, 149.90),

-- Transaction 2: One women's casual shoe
('S20230105-00002', 'SM-WC-003', 1, 119.90, 0.00, 119.90),

-- Transaction 3: One women's sports shoe
('S20230105-00003', 'SM-WS-001', 1, 169.90, 0.00, 169.90),

-- Transaction 4: One women's formal shoe
('S20230105-00004', 'SM-WF-003', 1, 89.90, 0.00, 89.90),

-- Transaction 5: One men's sports shoe with discount
('S20230105-00005', 'SM-MS-002', 1, 179.90, 15.00, 164.90),

-- Transaction 6: One men's formal shoe
('S20230105-00006', 'SM-MF-001', 1, 129.90, 0.00, 129.90),

-- Transaction 7: Two pairs with $25 discount
('S20230105-00007', 'SM-MS-004', 1, 129.90, 15.00, 114.90),
('S20230105-00007', 'SM-WS-002', 1, 134.90, 10.00, 124.90),

-- Transaction 8: One kids formal shoe
('S20230105-00008', 'SM-KF-001', 1, 99.90, 0.00, 99.90),

-- Transaction 9: One women's sports shoe
('S20230105-00009', 'SM-WS-004', 1, 179.90, 0.00, 179.90);

-- **Friday (January 6)** - 12 transactions, 14 pairs sold, $1987.50 total
INSERT INTO sales (sale_id, outlet_id, employee_id, sale_date, payment_method, subtotal, gst_amount, discount_amount, total_amount)
VALUES
-- Morning/early afternoon transactions (EMP006)
('S20230106-00001', 'OUT001', 'EMP006', '2023-01-06 10:05:22', 'Credit Card', 139.90, 11.19, 0.00, 151.09),
('S20230106-00002', 'OUT001', 'EMP006', '2023-01-06 10:50:37', 'Cash', 99.90, 7.99, 0.00, 107.89),
('S20230106-00003', 'OUT001', 'EMP006', '2023-01-06 11:35:15', 'NETS', 159.90, 12.79, 0.00, 172.69),
('S20230106-00004', 'OUT001', 'EMP006', '2023-01-06 12:20:33', 'Credit Card', 219.80, 17.58, 20.00, 217.38),
('S20230106-00005', 'OUT001', 'EMP006', '2023-01-06 13:05:48', 'PayNow', 129.90, 10.39, 0.00, 140.29),
('S20230106-00006', 'OUT001', 'EMP006', '2023-01-06 13:50:22', 'Credit Card', 119.90, 9.59, 0.00, 129.49),

-- Late afternoon/evening transactions (EMP007)
('S20230106-00007', 'OUT001', 'EMP007', '2023-01-06 14:35:37', 'Cash', 89.90, 7.19, 0.00, 97.09),
('S20230106-00008', 'OUT001', 'EMP007', '2023-01-06 15:20:15', 'NETS', 199.80, 15.98, 20.00, 195.78),
('S20230106-00009', 'OUT001', 'EMP007', '2023-01-06 16:05:33', 'Credit Card', 169.90, 13.59, 0.00, 183.49),
('S20230106-00010', 'OUT001', 'EMP007', '2023-01-06 16:50:48', 'PayNow', 229.80, 18.38, 25.00, 223.18),
('S20230106-00011', 'OUT001', 'EMP007', '2023-01-06 17:35:22', 'Credit Card', 149.90, 11.99, 0.00, 161.89),
('S20230106-00012', 'OUT001', 'EMP007', '2023-01-06 18:20:37', 'Cash', 179.80, 14.38, 20.00, 174.18);

INSERT INTO sale_items (sale_id, sku, quantity, unit_price, discount, item_total)
VALUES
-- Transaction 1: One men's sports shoe
('S20230106-00001', 'SM-MS-005', 1, 139.90, 0.00, 139.90),

-- Transaction 2: One kids formal shoe
('S20230106-00002', 'SM-KF-001', 1, 99.90, 0.00, 99.90),

-- Transaction 3: One women's formal shoe
('S20230106-00003', 'SM-WF-004', 1, 159.90, 0.00, 159.90),

-- Transaction 4: Two pairs with $20 discount
('S20230106-00004', 'SM-MF-003', 1, 119.90, 10.00, 109.90),
('S20230106-00004', 'SM-WC-001', 1, 119.90, 10.00, 109.90),

-- Transaction 5: One men's formal shoe
('S20230106-00005', 'SM-MF-001', 1, 129.90, 0.00, 129.90),

-- Transaction 6: One women's casual shoe
('S20230106-00006', 'SM-WC-003', 1, 119.90, 0.00, 119.90),

-- Transaction 7: One women's formal shoe
('S20230106-00007', 'SM-WF-003', 1, 89.90, 0.00, 89.90),

-- Transaction 8: Two pairs with $20 discount
('S20230106-00008', 'SM-MS-001', 1, 109.90, 10.00, 99.90),
('S20230106-00008', 'SM-KC-001', 1, 109.90, 10.00, 99.90),

-- Transaction 9: One women's sports shoe
('S20230106-00009', 'SM-WS-001', 1, 169.90, 0.00, 169.90),

-- Transaction 10: Two pairs with $25 discount
('S20230106-00010', 'SM-MF-004', 1, 139.90, 15.00, 124.90),
('S20230106-00010', 'SM-WF-001', 1, 114.90, 10.00, 104.90),

-- Transaction 11: One men's casual shoe
('S20230106-00011', 'SM-MC-003', 1, 149.90, 0.00, 149.90),

-- Transaction 12: Two pairs with $20 discount
('S20230106-00012', 'SM-KC-002', 1, 99.90, 10.00, 89.90),
('S20230106-00012', 'SM-MS-005', 1, 99.90, 10.00, 89.90);

-- **Saturday (January 7)** - 15 transactions, 18 pairs sold, $2456.30 total (weekend - busier day)
INSERT INTO sales (sale_id, outlet_id, employee_id, sale_date, payment_method, subtotal, gst_amount, discount_amount, total_amount)
VALUES
-- Morning transactions (EMP006 & part-timer EMP016)
('S20230107-00001', 'OUT001', 'EMP006', '2023-01-07 10:10:22', 'Credit Card', 149.90, 11.99, 0.00, 161.89),
('S20230107-00002', 'OUT001', 'EMP006', '2023-01-07 10:40:37', 'Cash', 129.90, 10.39, 0.00, 140.29),
('S20230107-00003', 'OUT001', 'EMP006', '2023-01-07 11:15:15', 'NETS', 189.90, 15.19, 0.00, 205.09),
('S20230107-00004', 'OUT001', 'EMP006', '2023-01-07 11:45:33', 'Credit Card', 99.90, 7.99, 0.00, 107.89),
('S20230107-00005', 'OUT001', 'EMP016', '2023-01-07 12:20:48', 'PayNow', 169.90, 13.59, 0.00, 183.49),
('S20230107-00006', 'OUT001', 'EMP016', '2023-01-07 12:50:22', 'Credit Card', 139.90, 11.19, 0.00, 151.09),

-- Midday transactions (EMP007 & part-timer EMP016)
('S20230107-00007', 'OUT001', 'EMP016', '2023-01-07 13:25:37', 'Cash', 229.80, 18.38, 25.00, 223.18),
('S20230107-00008', 'OUT001', 'EMP016', '2023-01-07 13:55:15', 'NETS', 79.90, 6.39, 0.00, 86.29),
('S20230107-00009', 'OUT001', 'EMP007', '2023-01-07 14:30:33', 'Credit Card', 199.80, 15.98, 20.00, 195.78),
('S20230107-00010', 'OUT001', 'EMP007', '2023-01-07 15:00:48', 'PayNow', 159.90, 12.79, 0.00, 172.69),

-- Afternoon/evening transactions (EMP007 & part-timer EMP016)
('S20230107-00011', 'OUT001', 'EMP007', '2023-01-07 15:35:22', 'Credit Card', 249.80, 19.98, 25.00, 244.78),
('S20230107-00012', 'OUT001', 'EMP007', '2023-01-07 16:10:37', 'Cash', 109.90, 8.79, 0.00, 118.69),
('S20230107-00013', 'OUT001', 'EMP007', '2023-01-07 16:45:15', 'NETS', 179.90, 14.39, 0.00, 194.29),
('S20230107-00014', 'OUT001', 'EMP016', '2023-01-07 17:20:33', 'Credit Card', 149.90, 11.99, 0.00, 161.89),
('S20230107-00015', 'OUT001', 'EMP016', '2023-01-07 17:55:48', 'PayNow', 119.80, 9.58, 0.00, 129.38);

INSERT INTO sale_items (sale_id, sku, quantity, unit_price, discount, item_total)
VALUES
-- Transaction 1: One men's casual shoe
('S20230107-00001', 'SM-MC-003', 1, 149.90, 0.00, 149.90),

-- Transaction 2: One men's formal shoe
('S20230107-00002', 'SM-MF-001', 1, 129.90, 0.00, 129.90),

-- Transaction 3: One men's formal shoe
('S20230107-00003', 'SM-MF-002', 1, 189.90, 0.00, 189.90),

-- Transaction 4: One kids shoe
('S20230107-00004', 'SM-KF-001', 1, 99.90, 0.00, 99.90),

-- Transaction 5: One women's sports shoe
('S20230107-00005', 'SM-WS-001', 1, 169.90, 0.00, 169.90),

-- Transaction 6: One men's sports shoe
('S20230107-00006', 'SM-MS-005', 1, 139.90, 0.00, 139.90),

-- Transaction 7: Two pairs with $25 discount
('S20230107-00007', 'SM-MF-005', 1, 129.90, 15.00, 114.90),
('S20230107-00007', 'SM-WF-001', 1, 114.90, 10.00, 104.90),

-- Transaction 8: One kids shoe
('S20230107-00008', 'SM-KC-002', 1, 79.90, 0.00, 79.90),

-- Transaction 9: Two pairs with $20 discount
('S20230107-00009', 'SM-MS-001', 1, 109.90, 10.00, 99.90),
('S20230107-00009', 'SM-WC-002', 1, 109.90, 10.00, 99.90),

-- Transaction 10: One women's formal shoe
('S20230107-00010', 'SM-WF-004', 1, 159.90, 0.00, 159.90),

-- Transaction 11: Two pairs with $25 discount
('S20230107-00011', 'SM-MS-002', 1, 149.90, 15.00, 134.90),
('S20230107-00011', 'SM-WS-003', 1, 114.90, 10.00, 104.90),

-- Transaction 12: One kids sports shoe
('S20230107-00012', 'SM-KS-001', 1, 109.90, 0.00, 109.90),

-- Transaction 13: One women's sports shoe
('S20230107-00013', 'SM-WS-004', 1, 179.90, 0.00, 179.90),

-- Transaction 14: One men's casual shoe
('S20230107-00014', 'SM-MC-003', 1, 149.90, 0.00, 149.90),

-- Transaction 15: Two kids shoes (smaller sizes)
('S20230107-00015', 'SM-KF-002', 1, 59.90, 0.00, 59.90),
('S20230107-00015', 'SM-KC-002', 1, 59.90, 0.00, 59.90);

-- **Sunday (January 8)** - 14 transactions, 17 pairs sold, $2365.20 total (weekend - second busiest day)
INSERT INTO sales (sale_id, outlet_id, employee_id, sale_date, payment_method, subtotal, gst_amount, discount_amount, total_amount)
VALUES
-- Morning transactions (EMP006 & part-timer EMP016)
('S20230108-00001', 'OUT001', 'EMP006', '2023-01-08 11:15:22', 'Credit Card', 149.90, 11.99, 0.00, 161.89),
('S20230108-00002', 'OUT001', 'EMP006', '2023-01-08 11:45:37', 'Cash', 99.90, 7.99, 0.00, 107.89),
('S20230108-00003', 'OUT001', 'EMP006', '2023-01-08 12:15:15', 'NETS', 219.80, 17.58, 20.00, 217.38),
('S20230108-00004', 'OUT001', 'EMP006', '2023-01-08 12:45:33', 'Credit Card', 139.90, 11.19, 0.00, 151.09),
('S20230108-00005', 'OUT001', 'EMP016', '2023-01-08 13:15:48', 'PayNow', 189.90, 15.19, 0.00, 205.09),
('S20230108-00006', 'OUT001', 'EMP016', '2023-01-08 13:45:22', 'Credit Card', 129.90, 10.39, 0.00, 140.29),
('S20230108-00007', 'OUT001', 'EMP016', '2023-01-08 14:15:37', 'Cash', 199.80, 15.98, 20.00, 195.78),

-- Afternoon/evening transactions (EMP007 & part-timer EMP016)
('S20230108-00008', 'OUT001', 'EMP007', '2023-01-08 14:45:15', 'NETS', 169.90, 13.59, 0.00, 183.49),
('S20230108-00009', 'OUT001', 'EMP007', '2023-01-08 15:15:33', 'Credit Card', 89.90, 7.19, 0.00, 97.09),
('S20230108-00010', 'OUT001', 'EMP007', '2023-01-08 15:45:48', 'PayNow', 249.80, 19.98, 25.00, 244.78),
('S20230108-00011', 'OUT001', 'EMP007', '2023-01-08 16:15:22', 'Credit Card', 159.90, 12.79, 0.00, 172.69),
('S20230108-00012', 'OUT001', 'EMP007', '2023-01-08 16:45:37', 'Cash', 119.90, 9.59, 0.00, 129.49),
('S20230108-00013', 'OUT001', 'EMP016', '2023-01-08 17:15:15', 'NETS', 229.80, 18.38, 25.00, 223.18),
('S20230108-00014', 'OUT001', 'EMP016', '2023-01-08 17:45:33', 'Credit Card', 179.80, 14.38, 20.00, 174.18);

INSERT INTO sale_items (sale_id, sku, quantity, unit_price, discount, item_total)
VALUES
-- Transaction 1: One men's casual shoe
('S20230108-00001', 'SM-MC-003', 1, 149.90, 0.00, 149.90),

-- Transaction 2: One kids formal shoe
('S20230108-00002', 'SM-KF-001', 1, 99.90, 0.00, 99.90),

-- Transaction 3: Two pairs with $20 discount
('S20230108-00003', 'SM-MF-003', 1, 119.90, 10.00, 109.90),
('S20230108-00003', 'SM-WC-001', 1, 119.90, 10.00, 109.90),

-- Transaction 4: One men's sports shoe
('S20230108-00004', 'SM-MS-005', 1, 139.90, 0.00, 139.90),

-- Transaction 5: One men's formal shoe
('S20230108-00005', 'SM-MF-002', 1, 189.90, 0.00, 189.90),

-- Transaction 6: One men's formal shoe
('S20230108-00006', 'SM-MF-001', 1, 129.90, 0.00, 129.90),

-- Transaction 7: Two pairs with $20 discount
('S20230108-00007', 'SM-MS-004', 1, 109.90, 10.00, 99.90),
('S20230108-00007', 'SM-WF-003', 1, 109.90, 10.00, 99.90),

-- Transaction 8: One women's sports shoe
('S20230108-00008', 'SM-WS-001', 1, 169.90, 0.00, 169.90),

-- Transaction 9: One women's formal shoe
('S20230108-00009', 'SM-WF-003', 1, 89.90, 0.00, 89.90),

-- Transaction 10: Two pairs with $25 discount
('S20230108-00010', 'SM-MS-003', 1, 149.90, 15.00, 134.90),
('S20230108-00010', 'SM-WF-001', 1, 124.90, 10.00, 114.90),

-- Transaction 11: One women's formal shoe
('S20230108-00011', 'SM-WF-004', 1, 159.90, 0.00, 159.90),

-- Transaction 12: One women's casual shoe
('S20230108-00012', 'SM-WC-003', 1, 119.90, 0.00, 119.90),

-- Transaction 13: Two pairs with $25 discount
('S20230108-00013', 'SM-MF-004', 1, 139.90, 15.00, 124.90),
('S20230108-00013', 'SM-WS-002', 1, 114.90, 10.00, 104.90),

-- Transaction 14: Two pairs with $20 discount
('S20230108-00014', 'SM-MC-005', 1, 99.90, 10.00, 89.90),
('S20230108-00014', 'SM-KC-001', 1, 99.90, 10.00, 89.90);
