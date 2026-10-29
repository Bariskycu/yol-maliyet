INSERT INTO roads (code, name, road_type_id, operator) VALUES
('K1', '15 Temmuz Şehitler ve FSM Köprüleri', (SELECT id FROM road_types WHERE name='Bridge'), 'KGM'),
('K2', 'Osmangazi Köprüsü', (SELECT id FROM road_types WHERE name='Bridge'), 'Otoyol Yatırım A.Ş.'),
('K3', 'Yavuz Sultan Selim Köprüsü', (SELECT id FROM road_types WHERE name='Bridge'), 'ICA'),
('K4', '1915 Çanakkale Köprüsü', (SELECT id FROM road_types WHERE name='Bridge'), 'ÇOK A.Ş.'),
('O1', 'Anadolu Otoyolu (Çamlıca-Akıncı)', (SELECT id FROM road_types WHERE name='Motorway'), 'KGM'),
('O2', 'Avrupa Otoyolu (Mahmutbey-Edirne)', (SELECT id FROM road_types WHERE name='Motorway'), 'KGM'),
('O3', 'İzmir-Çeşme Otoyolu', (SELECT id FROM road_types WHERE name='Motorway'), 'KGM'),
('O4', 'İzmir-Aydın Otoyolu', (SELECT id FROM road_types WHERE name='Motorway'), 'KGM'),
('O5', 'Çukurova Otoyolları', (SELECT id FROM road_types WHERE name='Motorway'), 'KGM'),
('O6', 'Gebze-Orhangazi-İzmir Otoyolu', (SELECT id FROM road_types WHERE name='Motorway'), 'Otoyol Yatırım A.Ş.'),
('O7', 'Kuzey Marmara Otoyolu', (SELECT id FROM road_types WHERE name='Motorway'), 'KMO İşletme'),
('O8', 'Ankara-Niğde Otoyolu', (SELECT id FROM road_types WHERE name='Motorway'), 'ERG Otoyol'),
('T1', 'Avrasya Tüneli', (SELECT id FROM road_types WHERE name='Tunnel'), 'ATAŞ')
ON CONFLICT (code) DO NOTHING;

-- SEGMENTLERİ EKLEME
INSERT INTO segments (road_id, segment_name, entry_point, exit_point, is_one_way) VALUES
((SELECT id FROM roads WHERE code='K1'), '15 Temmuz / FSM Köprüsü Geçişi', 'Avrupa', 'Anadolu', TRUE),
((SELECT id FROM roads WHERE code='K2'), 'Osmangazi Köprüsü Geçişi', 'Dilovası', 'Hersek', FALSE),
((SELECT id FROM roads WHERE code='K3'), 'Yavuz Sultan Selim Köprüsü Geçişi', 'Odayeri', 'Paşaköy', FALSE),
((SELECT id FROM roads WHERE code='K4'), '1915 Çanakkale Köprüsü Geçişi', 'Gelibolu', 'Lapseki', FALSE),
((SELECT id FROM roads WHERE code='T1'), 'Avrasya Tüneli Gündüz', 'Asya', 'Avrupa', FALSE),
((SELECT id FROM roads WHERE code='O1'), 'Anadolu Otoyolu Tam Parkur', 'Çamlıca', 'Akıncı', FALSE);

-- ÜCRETLERİ EKLEME (2024-2025 Güncel Tarifeler)
-- Not: tariff_period_id '1' olarak varsayılmıştır (2026 Official Tariff kaydı için).

-- 15 Temmuz ve FSM Köprüleri (Tek Yön Ücretlendirilir)
INSERT INTO toll_prices (segment_id, vehicle_class_id, tariff_period_id, price) VALUES
((SELECT id FROM segments WHERE segment_name='15 Temmuz / FSM Köprüsü Geçişi'), 1, 1, 24.00),
((SELECT id FROM segments WHERE segment_name='15 Temmuz / FSM Köprüsü Geçişi'), 2, 1, 30.00),
((SELECT id FROM segments WHERE segment_name='15 Temmuz / FSM Köprüsü Geçişi'), 6, 1, 10.00);

-- Osmangazi Köprüsü
INSERT INTO toll_prices (segment_id, vehicle_class_id, tariff_period_id, price) VALUES
((SELECT id FROM segments WHERE segment_name='Osmangazi Köprüsü Geçişi'), 1, 1, 399.00),
((SELECT id FROM segments WHERE segment_name='Osmangazi Köprüsü Geçişi'), 2, 1, 640.00),
((SELECT id FROM segments WHERE segment_name='Osmangazi Köprüsü Geçişi'), 6, 1, 280.00);

-- Yavuz Sultan Selim Köprüsü
INSERT INTO toll_prices (segment_id, vehicle_class_id, tariff_period_id, price) VALUES
((SELECT id FROM segments WHERE segment_name='Yavuz Sultan Selim Köprüsü Geçişi'), 1, 1, 49.00),
((SELECT id FROM segments WHERE segment_name='Yavuz Sultan Selim Köprüsü Geçişi'), 2, 1, 65.00),
((SELECT id FROM segments WHERE segment_name='Yavuz Sultan Selim Köprüsü Geçişi'), 6, 1, 35.00);

-- 1915 Çanakkale Köprüsü
INSERT INTO toll_prices (segment_id, vehicle_class_id, tariff_period_id, price) VALUES
((SELECT id FROM segments WHERE segment_name='1915 Çanakkale Köprüsü Geçişi'), 1, 1, 419.00),
((SELECT id FROM segments WHERE segment_name='1915 Çanakkale Köprüsü Geçişi'), 2, 1, 525.00),
((SELECT id FROM segments WHERE segment_name='1915 Çanakkale Köprüsü Geçişi'), 6, 1, 105.00);

-- Avrasya Tüneli (Gündüz/Gece Farkı)
INSERT INTO toll_prices (segment_id, vehicle_class_id, tariff_period_id, price, time_type) VALUES
((SELECT id FROM segments WHERE segment_name='Avrasya Tüneli Gündüz'), 1, 1, 80.00, 'DAY'),
((SELECT id FROM segments WHERE segment_name='Avrasya Tüneli Gündüz'), 1, 1, 40.00, 'NIGHT'),
((SELECT id FROM segments WHERE segment_name='Avrasya Tüneli Gündüz'), 2, 1, 120.00, 'DAY'),
((SELECT id FROM segments WHERE segment_name='Avrasya Tüneli Gündüz'), 2, 1, 60.00, 'NIGHT');

-- Anadolu Otoyolu (KGM İşletmesindeki Standart Otoyol Örneği)
INSERT INTO toll_prices (segment_id, vehicle_class_id, tariff_period_id, price) VALUES
((SELECT id FROM segments WHERE segment_name='Anadolu Otoyolu Tam Parkur'), 1, 1, 134.00),
((SELECT id FROM segments WHERE segment_name='Anadolu Otoyolu Tam Parkur'), 2, 1, 155.00);