-- outlets.sql
-- Populates the `outlets` table with Singapore mall locations

USE shoemart;
GO

INSERT INTO outlets (outlet_id, outlet_name, location, address, postal_code, region)
VALUES 
('OUT001', 'ShoeMart Somerset', '313@somerset', '313 Orchard Road #B2-08/09', '238895', 'Central'),
('OUT002', 'ShoeMart VivoCity', 'VivoCity', '1 HarbourFront Walk #02-12/13', '098585', 'South'),
('OUT003', 'ShoeMart Jurong Point', 'Jurong Point', '1 Jurong West Central 2 #B1-45/46', '648886', 'West'),
('OUT004', 'ShoeMart NEX', 'NEX', '23 Serangoon Central #03-32', '556083', 'North East'),
('OUT005', 'ShoeMart Tampines Mall', 'Tampines Mall', '4 Tampines Central 5 #03-22', '529510', 'East');
