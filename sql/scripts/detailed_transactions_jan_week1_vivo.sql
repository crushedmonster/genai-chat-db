-- detailed_transactions_jan_week1_vivocity.sql
-- Detailed sales transactions for VivoCity outlet for Week 1 of January 2023

USE shoemart;
GO

-- **Monday (January 2)** - 10 transactions, 12 pairs sold, $1845.70 total
INSERT INTO sales (sale_id, outlet_id, employee_id, sale_date, payment_method, subtotal, gst_amount, discount_amount, total_amount)
VALUES
-- Morning transactions (EMP008)
('S20230102-00101', 'OUT002', 'EMP008', '2023-01-02 10:15:18', 'Credit Card', 159.90, 12.79, 0.00, 172.69),
('S20230102-00102', 'OUT002', 'EMP008', '2023-01-02 11:05:42', 'NETS', 129.90, 10.39, 0.00, 140.29),
('S20230102-00103', 'OUT002', 'EMP008', '2023-01-02 11:55:27', 'Cash', 239.80, 19.18, 25.00, 233.98),
('S20230102-00104', 'OUT002', 'EMP008', '2023-01-02 12:40:53', 'Credit Card', 99.90, 7.99, 0.00, 107.89),

-- Afternoon transactions (EMP009)
('S20230102-00105', 'OUT002', 'EMP009', '2023-01-02 13:30:15', 'PayNow', 199.80, 15.98, 20.00, 195.78),
('S20230102-00106', 'OUT002', 'EMP009', '2023-01-02 14:20:22', 'Credit Card', 149.90, 11.99, 0.00, 161.89),
('S20230102-00107', 'OUT002', 'EMP009', '2023-01-02 15:15:47', 'Cash', 179.90, 14.39, 0.00, 194.29),

-- Evening transactions (EMP008)
('S20230102-00108', 'OUT002', 'EMP008', '2023-01-02 16:10:33', 'NETS', 229.80, 18.38, 25.00, 223.18),
('S20230102-00109', 'OUT002', 'EMP008', '2023-01-02 17:25:18', 'Credit Card', 189.90, 15.19, 0.00, 205.09),
('S20230102-00110', 'OUT002', 'EMP008', '2023-01-02 18:45:42', 'PayNow', 219.80, 17.58, 20.00, 217.38);

INSERT INTO sale_items (sale_id, sku, quantity, unit_price, discount, item_total)
VALUES
-- Transaction 1: One women's formal shoe
('S20230102-00101', 'SM-WF-004', 1, 159.90, 0.00, 159.90),

-- Transaction 2: One men's formal shoe
('S20230102-00102', 'SM-MF-001', 1, 129.90, 0.00, 129.90),

-- Transaction 3: Two pairs with $25 discount
('S20230102-00103', 'SM-MS-003', 1, 139.90, 15.00, 124.90),
('S20230102-00103', 'SM-WF-001', 1, 124.90, 10.00, 114.90),

-- Transaction 4: One kids formal shoe
('S20230102-00104', 'SM-KF-001', 1, 99.90, 0.00, 99.90),

-- Transaction 5: Two pairs with $20 discount
('S20230102-00105', 'SM-MC-003', 1, 109.90, 10.00, 99.90),
('S20230102-00105', 'SM-WC-001', 1, 109.90, 10.00, 99.90),

-- Transaction 6: One men's casual shoe
('S20230102-00106', 'SM-MC-003', 1, 149.90, 0.00, 149.90),

-- Transaction 7: One women's sports shoe
('S20230102-00107', 'SM-WS-004', 1, 179.90, 0.00, 179.90),

-- Transaction 8: Two pairs with $25 discount
('S20230102-00108', 'SM-MF-004', 1, 139.90, 15.00, 124.90),
('S20230102-00108', 'SM-WC-004', 1, 114.90, 10.00, 104.90),

-- Transaction 9: One men's formal shoe
('S20230102-00109', 'SM-MF-002', 1, 189.90, 0.00, 189.90),

-- Transaction 10: Two pairs with $20 discount
('S20230102-00110', 'SM-MS-001', 1, 119.90, 10.00, 109.90),
('S20230102-00110', 'SM-WS-002', 1, 119.90, 10.00, 109.90);

-- **Tuesday (January 3)** - 12 transactions, 14 pairs sold, $2089.30 total
INSERT INTO sales (sale_id, outlet_id, employee_id, sale_date, payment_method, subtotal, gst_amount, discount_amount, total_amount)
VALUES
-- Morning transactions
('S20230103-00101', 'OUT002', 'EMP008', '2023-01-03 10:10:18', 'Credit Card', 149.90, 11.99, 0.00, 161.89),
('S20230103-00102', 'OUT002', 'EMP008', '2023-01-03 10:50:42', 'NETS', 99.90, 7.99, 0.00, 107.89),
('S20230103-00103', 'OUT002', 'EMP008', '2023-01-03 11:30:27', 'Cash', 219.80, 17.58, 20.00, 217.38),
('S20230103-00104', 'OUT002', 'EMP008', '2023-01-03 12:10:53', 'Credit Card', 169.90, 13.59, 0.00, 183.49),
('S20230103-00105', 'OUT002', 'EMP008', '2023-01-03 12:55:15', 'PayNow', 129.90, 10.39, 0.00, 140.29),

-- Midday transactions
('S20230103-00106', 'OUT002', 'EMP009', '2023-01-03 13:35:22', 'Credit Card', 189.90, 15.19, 0.00, 205.09),
('S20230103-00107', 'OUT002', 'EMP009', '2023-01-03 14:20:47', 'Cash', 239.80, 19.18, 25.00, 233.98),
('S20230103-00108', 'OUT002', 'EMP009', '2023-01-03 15:05:33', 'NETS', 159.90, 12.79, 0.00, 172.69),

-- Afternoon/evening transactions
('S20230103-00109', 'OUT002', 'EMP008', '2023-01-03 15:45:18', 'Credit Card', 179.90, 14.39, 0.00, 194.29),
('S20230103-00110', 'OUT002', 'EMP008', '2023-01-03 16:35:42', 'PayNow', 139.90, 11.19, 0.00, 151.09),
('S20230103-00111', 'OUT002', 'EMP009', '2023-01-03 17:20:27', 'Credit Card', 199.80, 15.98, 20.00, 195.78),
('S20230103-00112', 'OUT002', 'EMP009', '2023-01-03 18:10:53', 'Cash', 149.90, 11.99, 0.00, 161.89);

INSERT INTO sale_items (sale_id, sku, quantity, unit_price, discount, item_total)
VALUES
-- Transaction 1: One men's sports shoe
('S20230103-00101', 'SM-MS-001', 1, 149.90, 0.00, 149.90),

-- Transaction 2: One kids formal shoe
('S20230103-00102', 'SM-KF-002', 1, 99.90, 0.00, 99.90),

-- Transaction 3: Two pairs with $20 discount
('S20230103-00103', 'SM-MF-004', 1, 139.90, 10.00, 129.90),
('S20230103-00103', 'SM-WF-003', 1, 99.90, 10.00, 89.90),

-- Transaction 4: One women's sports shoe
('S20230103-00104', 'SM-WS-001', 1, 169.90, 0.00, 169.90),

-- Transaction 5: One men's casual shoe
('S20230103-00105', 'SM-MC-004', 1, 129.90, 0.00, 129.90),

-- Transaction 6: One men's formal shoe
('S20230103-00106', 'SM-MF-005', 1, 189.90, 0.00, 189.90),

-- Transaction 7: Two pairs with $25 discount
('S20230103-00107', 'SM-MS-004', 1, 129.90, 15.00, 114.90),
('S20230103-00107', 'SM-WS-002', 1, 139.90, 10.00, 129.90),

-- Transaction 8: One women's formal shoe
('S20230103-00108', 'SM-WF-004', 1, 159.90, 0.00, 159.90),

-- Transaction 9: One women's sports shoe
('S20230103-00109', 'SM-WS-004', 1, 179.90, 0.00, 179.90),

-- Transaction 10: One men's sports shoe
('S20230103-00110', 'SM-MS-005', 1, 139.90, 0.00, 139.90),

-- Transaction 11: Two pairs with $20 discount
('S20230103-00111', 'SM-MC-003', 1, 109.90, 10.00, 99.90),
('S20230103-00111', 'SM-KC-001', 1, 109.90, 10.00, 99.90),

-- Transaction 12: One men's casual shoe
('S20230103-00112', 'SM-MC-002', 1, 149.90, 0.00, 149.90);

-- **Wednesday (January 4)** - 11 transactions, 13 pairs sold, $1890.50 total
INSERT INTO sales (sale_id, outlet_id, employee_id, sale_date, payment_method, subtotal, gst_amount, discount_amount, total_amount)
VALUES
-- Morning transactions (EMP008)
('S20230104-00101', 'OUT002', 'EMP008', '2023-01-04 10:20:18', 'Credit Card', 129.90, 10.39, 0.00, 140.29),
('S20230104-00102', 'OUT002', 'EMP008', '2023-01-04 11:05:42', 'NETS', 169.90, 13.59, 0.00, 183.49),
('S20230104-00103', 'OUT002', 'EMP008', '2023-01-04 11:55:27', 'Cash', 199.80, 15.98, 20.00, 195.78),
('S20230104-00104', 'OUT002', 'EMP008', '2023-01-04 12:45:53', 'Credit Card', 149.90, 11.99, 0.00, 161.89),

-- Afternoon transactions (EMP009)
('S20230104-00105', 'OUT002', 'EMP009', '2023-01-04 13:35:15', 'PayNow', 99.90, 7.99, 0.00, 107.89),
('S20230104-00106', 'OUT002', 'EMP009', '2023-01-04 14:20:22', 'Credit Card', 229.80, 18.38, 25.00, 223.18),
('S20230104-00107', 'OUT002', 'EMP009', '2023-01-04 15:10:47', 'Cash', 179.90, 14.39, 0.00, 194.29),

-- Evening transactions (EMP008)
('S20230104-00108', 'OUT002', 'EMP008', '2023-01-04 16:05:33', 'NETS', 139.90, 11.19, 0.00, 151.09),
('S20230104-00109', 'OUT002', 'EMP008', '2023-01-04 17:00:18', 'Credit Card', 219.80, 17.58, 20.00, 217.38),
('S20230104-00110', 'OUT002', 'EMP008', '2023-01-04 18:05:42', 'PayNow', 159.90, 12.79, 0.00, 172.69),
('S20230104-00111', 'OUT002', 'EMP008', '2023-01-04 19:10:27', 'Cash', 149.90, 11.99, 0.00, 161.89);

INSERT INTO sale_items (sale_id, sku, quantity, unit_price, discount, item_total)
VALUES
-- Transaction 1: One men's formal shoe
('S20230104-00101', 'SM-MF-001', 1, 129.90, 0.00, 129.90),

-- Transaction 2: One women's sports shoe
('S20230104-00102', 'SM-WS-001', 1, 169.90, 0.00, 169.90),

-- Transaction 3: Two pairs with $20 discount
('S20230104-00103', 'SM-MS-001', 1, 109.90, 10.00, 99.90),
('S20230104-00103', 'SM-WC-001', 1, 109.90, 10.00, 99.90),

-- Transaction 4: One men's casual shoe
('S20230104-00104', 'SM-MC-003', 1, 149.90, 0.00, 149.90),

-- Transaction 5: One kids formal shoe
('S20230104-00105', 'SM-KF-001', 1, 99.90, 0.00, 99.90),

-- Transaction 6: Two pairs with $25 discount
('S20230104-00106', 'SM-MF-004', 1, 139.90, 15.00, 124.90),
('S20230104-00106', 'SM-WF-001', 1, 114.90, 10.00, 104.90),

-- Transaction 7: One women's sports shoe
('S20230104-00107', 'SM-WS-004', 1, 179.90, 0.00, 179.90),

-- Transaction 8: One men's sports shoe
('S20230104-00108', 'SM-MS-005', 1, 139.90, 0.00, 139.90),

-- Transaction 9: Two pairs with $20 discount
('S20230104-00109', 'SM-MF-003', 1, 119.90, 10.00, 109.90),
('S20230104-00109', 'SM-WC-004', 1, 119.90, 10.00, 109.90),

-- Transaction 10: One women's formal shoe
('S20230104-00110', 'SM-WF-004', 1, 159.90, 0.00, 159.90),

-- Transaction 11: One men's casual shoe
('S20230104-00111', 'SM-MC-002', 1, 149.90, 0.00, 149.90);

-- **Thursday (January 5)** - 11 transactions, 13 pairs sold, $1926.80 total
INSERT INTO sales (sale_id, outlet_id, employee_id, sale_date, payment_method, subtotal, gst_amount, discount_amount, total_amount)
VALUES
-- Morning transactions (EMP008)
('S20230105-00101', 'OUT002', 'EMP008', '2023-01-05 10:15:18', 'Credit Card', 139.90, 11.19, 0.00, 151.09),
('S20230105-00102', 'OUT002', 'EMP008', '2023-01-05 11:00:42', 'NETS', 109.90, 8.79, 0.00, 118.69),
('S20230105-00103', 'OUT002', 'EMP008', '2023-01-05 11:45:27', 'Cash', 239.80, 19.18, 25.00, 233.98),
('S20230105-00104', 'OUT002', 'EMP008', '2023-01-05 12:30:53', 'Credit Card', 199.80, 15.98, 20.00, 195.78),

-- Afternoon transactions (EMP009)
('S20230105-00105', 'OUT002', 'EMP009', '2023-01-05 13:15:15', 'PayNow', 179.90, 14.39, 0.00, 194.29),
('S20230105-00106', 'OUT002', 'EMP009', '2023-01-05 14:00:22', 'Credit Card', 89.90, 7.19, 0.00, 97.09),
('S20230105-00107', 'OUT002', 'EMP009', '2023-01-05 14:45:47', 'Cash', 169.90, 13.59, 0.00, 183.49),
('S20230105-00108', 'OUT002', 'EMP009', '2023-01-05 15:30:33', 'NETS', 149.90, 11.99, 0.00, 161.89),

-- Evening transactions (EMP008)
('S20230105-00109', 'OUT002', 'EMP008', '2023-01-05 16:15:18', 'Credit Card', 229.80, 18.38, 25.00, 223.18),
('S20230105-00110', 'OUT002', 'EMP008', '2023-01-05 17:00:42', 'PayNow', 179.90, 14.39, 0.00, 194.29),
('S20230105-00111', 'OUT002', 'EMP008', '2023-01-05 17:45:27', 'Cash', 189.90, 15.19, 0.00, 205.09);

INSERT INTO sale_items (sale_id, sku, quantity, unit_price, discount, item_total)
VALUES
-- Transaction 1: One men's sports shoe
('S20230105-00101', 'SM-MS-005', 1, 139.90, 0.00, 139.90),

-- Transaction 2: One kids sports shoe
('S20230105-00102', 'SM-KS-001', 1, 109.90, 0.00, 109.90),

-- Transaction 3: Two pairs with $25 discount
('S20230105-00103', 'SM-MS-003', 1, 139.90, 15.00, 124.90),
('S20230105-00103', 'SM-WS-002', 1, 124.90, 10.00, 114.90),

-- Transaction 4: Two pairs with $20 discount
('S20230105-00104', 'SM-MF-001', 1, 109.90, 10.00, 99.90),
('S20230105-00104', 'SM-WC-002', 1, 109.90, 10.00, 99.90),

-- Transaction 5: One women's sports shoe
('S20230105-00105', 'SM-WS-004', 1, 179.90, 0.00, 179.90),

-- Transaction 6: One women's formal shoe
('S20230105-00106', 'SM-WF-003', 1, 89.90, 0.00, 89.90),

-- Transaction 7: One women's sports shoe
('S20230105-00107', 'SM-WS-001', 1, 169.90, 0.00, 169.90),

-- Transaction 8: One men's casual shoe
('S20230105-00108', 'SM-MC-003', 1, 149.90, 0.00, 149.90),

-- Transaction 9: Two pairs with $25 discount
('S20230105-00109', 'SM-MF-004', 1, 139.90, 15.00, 124.90),
('S20230105-00109', 'SM-WF-001', 1, 114.90, 10.00, 104.90),

-- Transaction 10: One women's sports shoe
('S20230105-00110', 'SM-WS-004', 1, 179.90, 0.00, 179.90),

-- Transaction 11: One men's formal shoe
('S20230105-00111', 'SM-MF-002', 1, 189.90, 0.00, 189.90);

-- **Friday (January 6)** - 14 transactions, 17 pairs sold, $2323.40 total
INSERT INTO sales (sale_id, outlet_id, employee_id, sale_date, payment_method, subtotal, gst_amount, discount_amount, total_amount)
VALUES
-- Morning transactions (EMP008)
('S20230106-00101', 'OUT002', 'EMP008', '2023-01-06 10:10:18', 'Credit Card', 149.90, 11.99, 0.00, 161.89),
('S20230106-00102', 'OUT002', 'EMP008', '2023-01-06 10:45:42', 'NETS', 129.90, 10.39, 0.00, 140.29),
('S20230106-00103', 'OUT002', 'EMP008', '2023-01-06 11:20:27', 'Cash', 89.90, 7.19, 0.00, 97.09),
('S20230106-00104', 'OUT002', 'EMP008', '2023-01-06 11:55:53', 'Credit Card', 169.90, 13.59, 0.00, 183.49),
('S20230106-00105', 'OUT002', 'EMP008', '2023-01-06 12:30:15', 'PayNow', 99.90, 7.99, 0.00, 107.89),
('S20230106-00106', 'OUT002', 'EMP008', '2023-01-06 13:05:22', 'Credit Card', 219.80, 17.58, 20.00, 217.38),

-- Afternoon transactions (EMP009)
('S20230106-00107', 'OUT002', 'EMP009', '2023-01-06 13:40:47', 'Cash', 199.80, 15.98, 20.00, 195.78),
('S20230106-00108', 'OUT002', 'EMP009', '2023-01-06 14:15:33', 'NETS', 139.90, 11.19, 0.00, 151.09),
('S20230106-00109', 'OUT002', 'EMP009', '2023-01-06 14:50:18', 'Credit Card', 179.90, 14.39, 0.00, 194.29),
('S20230106-00110', 'OUT002', 'EMP009', '2023-01-06 15:25:42', 'PayNow', 249.80, 19.98, 25.00, 244.78),
('S20230106-00111', 'OUT002', 'EMP009', '2023-01-06 16:00:27', 'Cash', 229.80, 18.38, 25.00, 223.18),

-- Evening transactions (EMP008)
('S20230106-00112', 'OUT002', 'EMP008', '2023-01-06 16:35:53', 'Credit Card', 159.90, 12.79, 0.00, 172.69),
('S20230106-00113', 'OUT002', 'EMP008', '2023-01-06 17:10:15', 'NETS', 119.90, 9.59, 0.00, 129.49),
('S20230106-00114', 'OUT002', 'EMP008', '2023-01-06 17:45:22', 'Cash', 119.90, 9.59, 0.00, 129.49);

INSERT INTO sale_items (sale_id, sku, quantity, unit_price, discount, item_total)
VALUES
-- Transaction 1: One men's casual shoe
('S20230106-00101', 'SM-MC-003', 1, 149.90, 0.00, 149.90),

-- Transaction 2: One men's formal shoe
('S20230106-00102', 'SM-MF-001', 1, 129.90, 0.00, 129.90),

-- Transaction 3: One women's formal shoe
('S20230106-00103', 'SM-WF-003', 1, 89.90, 0.00, 89.90),

-- Transaction 4: One women's sports shoe
('S20230106-00104', 'SM-WS-001', 1, 169.90, 0.00, 169.90),

-- Transaction 5: One kids formal shoe
('S20230106-00105', 'SM-KF-001', 1, 99.90, 0.00, 99.90),

-- Transaction 6: Two pairs with $20 discount
('S20230106-00106', 'SM-MS-001', 1, 119.90, 10.00, 109.90),
('S20230106-00106', 'SM-WC-001', 1, 119.90, 10.00, 109.90),

-- Transaction 7: Two pairs with $20 discount
('S20230106-00107', 'SM-MF-003', 1, 109.90, 10.00, 99.90),
('S20230106-00107', 'SM-KC-001', 1, 109.90, 10.00, 99.90),

-- Transaction 8: One men's sports shoe
('S20230106-00108', 'SM-MS-005', 1, 139.90, 0.00, 139.90),

-- Transaction 9: One women's sports shoe
('S20230106-00109', 'SM-WS-004', 1, 179.90, 0.00, 179.90),

-- Transaction 10: Two pairs with $25 discount
('S20230106-00110', 'SM-MF-004', 1, 139.90, 15.00, 124.90),
('S20230106-00110', 'SM-WS-002', 1, 134.90, 10.00, 124.90),

-- Transaction 11: Two pairs with $25 discount
('S20230106-00111', 'SM-MS-003', 1, 129.90, 15.00, 114.90),
('S20230106-00111', 'SM-WF-001', 1, 124.90, 10.00, 114.90),

-- Transaction 12: One women's formal shoe
('S20230106-00112', 'SM-WF-004', 1, 159.90, 0.00, 159.90),

-- Transaction 13: One women's casual shoe
('S20230106-00113', 'SM-WC-003', 1, 119.90, 0.00, 119.90),

-- Transaction 14: One kids casual shoe
('S20230106-00114', 'SM-KC-001', 1, 119.90, 0.00, 119.90);

-- **Saturday (January 7)** - 17 transactions, 21 pairs sold, $2898.20 total
INSERT INTO sales (sale_id, outlet_id, employee_id, sale_date, payment_method, subtotal, gst_amount, discount_amount, total_amount)
VALUES
-- Morning transactions (EMP008 & part-timer EMP017)
('S20230107-00101', 'OUT002', 'EMP008', '2023-01-07 10:05:18', 'Credit Card', 149.90, 11.99, 0.00, 161.89),
('S20230107-00102', 'OUT002', 'EMP008', '2023-01-07 10:35:42', 'NETS', 129.90, 10.39, 0.00, 140.29),
('S20230107-00103', 'OUT002', 'EMP008', '2023-01-07 11:05:27', 'Cash', 219.80, 17.58, 20.00, 217.38),
('S20230107-00104', 'OUT002', 'EMP008', '2023-01-07 11:35:53', 'Credit Card', 169.90, 13.59, 0.00, 183.49),
('S20230107-00105', 'OUT002', 'EMP017', '2023-01-07 12:05:15', 'PayNow', 249.80, 19.98, 25.00, 244.78),
('S20230107-00106', 'OUT002', 'EMP017', '2023-01-07 12:35:22', 'Credit Card', 99.90, 7.99, 0.00, 107.89),
('S20230107-00107', 'OUT002', 'EMP017', '2023-01-07 13:05:47', 'Cash', 199.80, 15.98, 20.00, 195.78),

-- Midday transactions (EMP009 & part-timer EMP017)
('S20230107-00108', 'OUT002', 'EMP017', '2023-01-07 13:35:33', 'NETS', 119.90, 9.59, 0.00, 129.49),
('S20230107-00109', 'OUT002', 'EMP017', '2023-01-07 14:05:18', 'Credit Card', 159.90, 12.79, 0.00, 172.69),
('S20230107-00110', 'OUT002', 'EMP009', '2023-01-07 14:35:42', 'PayNow', 189.90, 15.19, 0.00, 205.09),
('S20230107-00111', 'OUT002', 'EMP009', '2023-01-07 15:05:27', 'Cash', 109.90, 8.79, 0.00, 118.69),
('S20230107-00112', 'OUT002', 'EMP009', '2023-01-07 15:35:53', 'Credit Card', 239.80, 19.18, 25.00, 233.98),

-- Afternoon/evening transactions (mixed staff)
('S20230107-00113', 'OUT002', 'EMP009', '2023-01-07 16:05:15', 'NETS', 179.90, 14.39, 0.00, 194.29),
('S20230107-00114', 'OUT002', 'EMP009', '2023-01-07 16:35:22', 'Cash', 229.80, 18.38, 25.00, 223.18),
('S20230107-00115', 'OUT002', 'EMP008', '2023-01-07 17:05:47', 'Credit Card', 139.90, 11.19, 0.00, 151.09),
('S20230107-00116', 'OUT002', 'EMP008', '2023-01-07 17:35:33', 'PayNow', 179.90, 14.39, 0.00, 194.29),
('S20230107-00117', 'OUT002', 'EMP008', '2023-01-07 18:05:18', 'Credit Card', 149.90, 11.99, 0.00, 161.89);

INSERT INTO sale_items (sale_id, sku, quantity, unit_price, discount, item_total)
VALUES
-- Transaction 1: One men's casual shoe
('S20230107-00101', 'SM-MC-003', 1, 149.90, 0.00, 149.90),

-- Transaction 2: One men's formal shoe
('S20230107-00102', 'SM-MF-001', 1, 129.90, 0.00, 129.90),

-- Transaction 3: Two pairs with $20 discount
('S20230107-00103', 'SM-MS-001', 1, 119.90, 10.00, 109.90),
('S20230107-00103', 'SM-WC-002', 1, 119.90, 10.00, 109.90),

-- Transaction 4: One women's sports shoe
('S20230107-00104', 'SM-WS-001', 1, 169.90, 0.00, 169.90),

-- Transaction 5: Two pairs with $25 discount
('S20230107-00105', 'SM-MF-004', 1, 139.90, 15.00, 124.90),
('S20230107-00105', 'SM-WF-001', 1, 134.90, 10.00, 124.90),

-- Transaction 6: One kids formal shoe
('S20230107-00106', 'SM-KF-001', 1, 99.90, 0.00, 99.90),

-- Transaction 7: Two pairs with $20 discount
('S20230107-00107', 'SM-MC-002', 1, 109.90, 10.00, 99.90),
('S20230107-00107', 'SM-KC-001', 1, 109.90, 10.00, 99.90),

-- Transaction 8: One women's casual shoe
('S20230107-00108', 'SM-WC-003', 1, 119.90, 0.00, 119.90),

-- Transaction 9: One women's formal shoe
('S20230107-00109', 'SM-WF-004', 1, 159.90, 0.00, 159.90),

-- Transaction 10: One men's formal shoe
('S20230107-00110', 'SM-MF-002', 1, 189.90, 0.00, 189.90),

-- Transaction 11: One kids sports shoe
('S20230107-00111', 'SM-KS-001', 1, 109.90, 0.00, 109.90),

-- Transaction 12: Two pairs with $25 discount
('S20230107-00112', 'SM-MS-003', 1, 139.90, 15.00, 124.90),
('S20230107-00112', 'SM-WS-002', 1, 124.90, 10.00, 114.90),

-- Transaction 13: One women's sports shoe
('S20230107-00113', 'SM-WS-004', 1, 179.90, 0.00, 179.90),

-- Transaction 14: Two pairs with $25 discount
('S20230107-00114', 'SM-MF-005', 1, 129.90, 15.00, 114.90),
('S20230107-00114', 'SM-WC-004', 1, 124.90, 10.00, 114.90),

-- Transaction 15: One men's sports shoe
('S20230107-00115', 'SM-MS-005', 1, 139.90, 0.00, 139.90),

-- Transaction 16: One women's sports shoe
('S20230107-00116', 'SM-WS-004', 1, 179.90, 0.00, 179.90),

-- Transaction 17: One men's casual shoe
('S20230107-00117', 'SM-MC-003', 1, 149.90, 0.00, 149.90);

-- **Sunday (January 8)** - 16 transactions, 19 pairs sold, $2723.40 total
INSERT INTO sales (sale_id, outlet_id, employee_id, sale_date, payment_method, subtotal, gst_amount, discount_amount, total_amount)
VALUES
-- Morning transactions (EMP008 & part-timer EMP017)
('S20230108-00101', 'OUT002', 'EMP008', '2023-01-08 11:10:18', 'Credit Card', 149.90, 11.99, 0.00, 161.89),
('S20230108-00102', 'OUT002', 'EMP008', '2023-01-08 11:40:42', 'NETS', 199.80, 15.98, 20.00, 195.78),
('S20230108-00103', 'OUT002', 'EMP008', '2023-01-08 12:10:27', 'Cash', 129.90, 10.39, 0.00, 140.29),
('S20230108-00104', 'OUT002', 'EMP008', '2023-01-08 12:40:53', 'Credit Card', 169.90, 13.59, 0.00, 183.49),
('S20230108-00105', 'OUT002', 'EMP017', '2023-01-08 13:10:15', 'PayNow', 99.90, 7.99, 0.00, 107.89),
('S20230108-00106', 'OUT002', 'EMP017', '2023-01-08 13:40:22', 'Credit Card', 229.80, 18.38, 25.00, 223.18),
('S20230108-00107', 'OUT002', 'EMP017', '2023-01-08 14:10:47', 'Cash', 179.90, 14.39, 0.00, 194.29),

-- Midday transactions (EMP009 & part-timer EMP017)
('S20230108-00108', 'OUT002', 'EMP017', '2023-01-08 14:40:33', 'NETS', 139.90, 11.19, 0.00, 151.09),
('S20230108-00109', 'OUT002', 'EMP009', '2023-01-08 15:10:18', 'Credit Card', 249.80, 19.98, 25.00, 244.78),
('S20230108-00110', 'OUT002', 'EMP009', '2023-01-08 15:40:42', 'PayNow', 119.90, 9.59, 0.00, 129.49),
('S20230108-00111', 'OUT002', 'EMP009', '2023-01-08 16:10:27', 'Cash', 189.90, 15.19, 0.00, 205.09),

-- Afternoon/evening transactions (mixed staff)
('S20230108-00112', 'OUT002', 'EMP009', '2023-01-08 16:40:53', 'Credit Card', 159.90, 12.79, 0.00, 172.69),
('S20230108-00113', 'OUT002', 'EMP009', '2023-01-08 17:10:15', 'NETS', 219.80, 17.58, 20.00, 217.38),
('S20230108-00114', 'OUT002', 'EMP008', '2023-01-08 17:40:22', 'Cash', 179.90, 14.39, 0.00, 194.29),
('S20230108-00115', 'OUT002', 'EMP008', '2023-01-08 18:10:47', 'Credit Card', 109.90, 8.79, 0.00, 118.69),
('S20230108-00116', 'OUT002', 'EMP008', '2023-01-08 18:40:33', 'PayNow', 139.90, 11.19, 0.00, 151.09);

INSERT INTO sale_items (sale_id, sku, quantity, unit_price, discount, item_total)
VALUES
-- Transaction 1: One men's casual shoe
('S20230108-00101', 'SM-MC-003', 1, 149.90, 0.00, 149.90),

-- Transaction 2: Two pairs with $20 discount
('S20230108-00102', 'SM-MS-001', 1, 109.90, 10.00, 99.90),
('S20230108-00102', 'SM-KC-001', 1, 109.90, 10.00, 99.90),

-- Transaction 3: One men's formal shoe
('S20230108-00103', 'SM-MF-001', 1, 129.90, 0.00, 129.90),

-- Transaction 4: One women's sports shoe
('S20230108-00104', 'SM-WS-001', 1, 169.90, 0.00, 169.90),

-- Transaction 5: One kids formal shoe
('S20230108-00105', 'SM-KF-001', 1, 99.90, 0.00, 99.90),

-- Transaction 6: Two pairs with $25 discount
('S20230108-00106', 'SM-MF-004', 1, 139.90, 15.00, 124.90),
('S20230108-00106', 'SM-WC-001', 1, 114.90, 10.00, 104.90),

-- Transaction 7: One women's sports shoe
('S20230108-00107', 'SM-WS-004', 1, 179.90, 0.00, 179.90),

-- Transaction 8: One men's sports shoe
('S20230108-00108', 'SM-MS-005', 1, 139.90, 0.00, 139.90),

-- Transaction 9: Two pairs with $25 discount
('S20230108-00109', 'SM-MS-003', 1, 139.90, 15.00, 124.90),
('S20230108-00109', 'SM-WF-001', 1, 134.90, 10.00, 124.90),

-- Transaction 10: One women's casual shoe
('S20230108-00110', 'SM-WC-003', 1, 119.90, 0.00, 119.90),

-- Transaction 11: One men's formal shoe
('S20230108-00111', 'SM-MF-002', 1, 189.90, 0.00, 189.90),

-- Transaction 12: One women's formal shoe
('S20230108-00112', 'SM-WF-004', 1, 159.90, 0.00, 159.90),

-- Transaction 13: Two pairs with $20 discount
('S20230108-00113', 'SM-MF-003', 1, 119.90, 10.00, 109.90),
('S20230108-00113', 'SM-WC-002', 1, 119.90, 10.00, 109.90),

-- Transaction 14: One women's sports shoe
('S20230108-00114', 'SM-WS-004', 1, 179.90, 0.00, 179.90),

-- Transaction 15: One kids sports shoe
('S20230108-00115', 'SM-KS-001', 1, 109.90, 0.00, 109.90),

-- Transaction 16: One men's sports shoe
('S20230108-00116', 'SM-MS-005', 1, 139.90, 0.00, 139.90);
