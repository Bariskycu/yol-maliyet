-- ============================================================
-- lojistik_platform – PostgreSQL Production Schema
-- ============================================================

-- ================================
-- 1. ARAÇ SINIFLARI
-- ================================

CREATE TABLE IF NOT EXISTS vehicle_classes (
    id INT PRIMARY KEY,
    code VARCHAR(10) UNIQUE NOT NULL,
    description TEXT NOT NULL
);

INSERT INTO vehicle_classes (id, code, description) VALUES
(1, 'Class1', 'Otomobil / Binek'),
(2, 'Class2', 'Minibüs / Hafif ticari'),
(3, 'Class3', 'Otobüs / 3 aks'),
(4, 'Class4', 'Kamyon / 4 aks'),
(5, 'Class5', 'Ağır kamyon / Tır / 5+ aks'),
(6, 'Class6', 'Motosiklet')
ON CONFLICT (id) DO NOTHING;


-- ================================
-- 2. YOL TİPLERİ
-- ================================

CREATE TABLE IF NOT EXISTS road_types (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL
);

INSERT INTO road_types (name) VALUES
('Bridge'),
('Motorway'),
('Tunnel')
ON CONFLICT (name) DO NOTHING;


-- ================================
-- 3. YOLLAR
-- ================================

CREATE TABLE IF NOT EXISTS roads (
    id SERIAL PRIMARY KEY,
    code VARCHAR(50) UNIQUE NOT NULL,
    name TEXT NOT NULL,
    road_type_id INT NOT NULL REFERENCES road_types(id),
    operator TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX IF NOT EXISTS idx_roads_code ON roads(code);


-- ================================
-- 4. SEGMENTLER
-- ================================

CREATE TABLE IF NOT EXISTS segments (
    id SERIAL PRIMARY KEY,
    road_id INT NOT NULL REFERENCES roads(id) ON DELETE CASCADE,
    segment_name TEXT NOT NULL,
    entry_point TEXT,
    exit_point TEXT,
    is_one_way BOOLEAN DEFAULT FALSE,
    distance_km NUMERIC(8,2)
);

CREATE INDEX IF NOT EXISTS idx_segments_road ON segments(road_id);


-- ================================
-- 5. TARİFE DÖNEMLERİ
-- ================================

CREATE TABLE IF NOT EXISTS tariff_periods (
    id SERIAL PRIMARY KEY,
    start_date DATE NOT NULL,
    end_date DATE,
    description TEXT
);

INSERT INTO tariff_periods (start_date, end_date, description)
VALUES ('2026-01-01', NULL, '2026 Official Tariff')
ON CONFLICT DO NOTHING;


-- ================================
-- 6. ZAMAN ENUM
-- ================================

DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'time_type_enum') THEN
        CREATE TYPE time_type_enum AS ENUM ('STANDARD','DAY','NIGHT');
    END IF;
END$$;


-- ================================
-- 7. ÜCRET TABLOSU
-- ================================

CREATE TABLE IF NOT EXISTS toll_prices (
    id SERIAL PRIMARY KEY,
    segment_id INT NOT NULL REFERENCES segments(id) ON DELETE CASCADE,
    vehicle_class_id INT NOT NULL REFERENCES vehicle_classes(id),
    tariff_period_id INT NOT NULL REFERENCES tariff_periods(id),
    price NUMERIC(12,2) NOT NULL,
    time_type time_type_enum DEFAULT 'STANDARD',
    currency VARCHAR(10) DEFAULT 'TRY',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(segment_id, vehicle_class_id, tariff_period_id, time_type)
);

CREATE INDEX IF NOT EXISTS idx_toll_segment ON toll_prices(segment_id);
CREATE INDEX IF NOT EXISTS idx_toll_vehicle ON toll_prices(vehicle_class_id);
