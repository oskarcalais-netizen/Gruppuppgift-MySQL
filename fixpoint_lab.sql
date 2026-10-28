-- SCRIPT RESET (ERASES EXISTING DATA)
DROP TABLE IF EXISTS job_parts;

DROP TABLE IF EXISTS repair_jobs;

DROP TABLE IF EXISTS devices;

DROP TABLE IF EXISTS technicians;

DROP TABLE IF EXISTS parts;

DROP TABLE IF EXISTS customers;

CREATE DATABASE IF NOT EXISTS fixpoint_lab;

USE fixpoint_lab;

-- 1. CUSTOMERS
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT,
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20),
    city VARCHAR(50),
    PRIMARY KEY (customer_id)
) ENGINE = InnoDB;
-- 1.1 CUSTOMER INSERT TEMPLATE
INSERT INTO
    customers (
        customer_id,
        customer_name,
        email,
        phone,
        city
    )
VALUES (
        1,
        'Emma Lind',
        'emma_lind1@example.com',
        '703001137',
        'Malmö'
    ),
    (
        2,
        'Lukas Berg',
        'lukas_berg2@example.com',
        '703002274',
        'Jönköping'
    ),
    (
        3,
        'Maja Sjöström',
        'maja_sjostrom3@example.com',
        '703003411',
        'Borås'
    ),
    (
        4,
        'Oscar Nyström',
        NULL,
        '703004548',
        'Skövde'
    ),
    (
        5,
        'Ella Holm',
        'ella_holm5@example.com',
        '703005685',
        'Uppsala'
    ),
    (
        6,
        'Ali Haddad',
        'ali_haddad6@example.com',
        '703006822',
        'Lund'
    ),
    (
        7,
        'Sara Lundqvist',
        'sara_lundqvist7@example.com',
        '',
        'Falköping'
    ),
    (
        8,
        'Noah Andersson',
        'noah_andersson8@example.com',
        '703009096',
        'Göteborg'
    ),
    (
        9,
        'Leila Farah',
        'leila_farah9@example.com',
        '703010233',
        'Stockholm'
    ),
    (
        10,
        'Felix Lindberg',
        'felix_lindberg10@example.com',
        '703011370',
        'Malmö'
    ),
    (
        11,
        'Clara Eklund',
        'clara_eklund11@example.com',
        '703012507',
        'Jönköping'
    ),
    (
        12,
        'Samir Osman',
        'samir_osman12@example.com',
        '703013644',
        'Borås'
    ),
    (
        13,
        'Hanna Åström',
        NULL,
        '703014781',
        'Skövde'
    ),
    (
        14,
        'Victor Nilsson',
        'victor_nilsson14@example.com',
        '703015918',
        'Uppsala'
    ),
    (
        15,
        'Amina Saleh',
        'amina_saleh15@example.com',
        '703017055',
        'Lund'
    ),
    (
        16,
        'Isak Dahl',
        'isak_dahl16@example.com',
        '703018192',
        'Falköping'
    ),
    (
        17,
        'Nora Vik',
        'nora_vik17@example.com',
        '703019329',
        'Göteborg'
    ),
    (
        18,
        'Simon Larsson',
        'simon_larsson18@example.com',
        '703020466',
        'Stockholm'
    ),
    (
        19,
        'Lina Jansson',
        'lina_jansson19@example.com',
        '',
        'Malmö'
    ),
    (
        20,
        'David Ekström',
        'david_ekstrom20@example.com',
        '703022740',
        'Jönköping'
    ),
    (
        21,
        'Alice Strand',
        'alice_strand21@example.com',
        '703023877',
        'Borås'
    ),
    (
        22,
        'Omar Hussein',
        NULL,
        '703025014',
        'Skövde'
    ),
    (
        23,
        'Julia Rosén',
        'julia_rosen23@example.com',
        '703026151',
        'Uppsala'
    ),
    (
        24,
        'Erik Wall',
        'erik_wall24@example.com',
        '703027288',
        'Lund'
    ),
    (
        25,
        'Yasmin Ali',
        'yasmin_ali25@example.com',
        '703028425',
        ''
    );

-- 2. DEVICES
CREATE TABLE devices (
    device_id INT AUTO_INCREMENT,
    customer_id INT NOT NULL,
    brand VARCHAR(50) NOT NULL,
    model VARCHAR(50) NOT NULL,
    serial_number VARCHAR(100) UNIQUE,
    PRIMARY KEY (device_id),
    CONSTRAINT fk_devices_customers FOREIGN KEY (customer_id) REFERENCES customers (customer_id) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB;
-- 2.1 DEVICES INSERT TEMPLATE
INSERT INTO
    devices (
        device_id,
        customer_id,
        brand,
        model,
        serial_number
    )
VALUES (
        1,
        1,
        'Apple',
        'iPhone 13',
        'FP-SN-0001'
    ),
    (
        2,
        2,
        'Samsung',
        'Galaxy S22',
        'FP-SN-0002'
    ),
    (
        3,
        3,
        'Lenovo',
        'ThinkPad T14',
        'FP-SN-0003'
    ),
    (
        4,
        4,
        'HP',
        'EliteBook 840',
        'FP-SN-0004'
    ),
    (
        5,
        5,
        'Apple',
        'MacBook Air',
        'FP-SN-0005'
    ),
    (
        6,
        6,
        'Dell',
        'Latitude 5420',
        'FP-SN-0006'
    ),
    (
        7,
        7,
        'Google',
        'Pixel 7',
        'FP-SN-0007'
    ),
    (
        8,
        8,
        'Samsung',
        'Galaxy A54',
        NULL
    ),
    (
        9,
        9,
        'Asus',
        'ZenBook 14',
        'FP-SN-0009'
    ),
    (
        10,
        10,
        'Acer',
        'Swift 3',
        'FP-SN-0010'
    ),
    (
        11,
        11,
        'Apple',
        'iPad Air',
        'FP-SN-0011'
    ),
    (
        12,
        12,
        'Motorola',
        'Edge 40',
        'FP-SN-0012'
    ),
    (
        13,
        13,
        'Sony',
        'Xperia 5',
        'FP-SN-0013'
    ),
    (
        14,
        14,
        'Lenovo',
        'Yoga 7',
        'FP-SN-0014'
    ),
    (
        15,
        15,
        'HP',
        'Pavilion 15',
        'FP-SN-0015'
    ),
    (
        16,
        16,
        'Apple',
        'iPhone 12',
        'FP-SN-0016'
    ),
    (
        17,
        17,
        'Samsung',
        'Galaxy S21',
        'FP-SN-0017'
    ),
    (
        18,
        18,
        'Dell',
        'Inspiron 15',
        'FP-SN-0018'
    ),
    (
        19,
        19,
        'Huawei',
        'MatePad 11',
        'FP-SN-0019'
    ),
    (
        20,
        20,
        'Asus',
        'ROG Zephyrus',
        'FP-SN-0020'
    ),
    (
        21,
        21,
        'Apple',
        'MacBook Pro',
        NULL
    ),
    (
        22,
        22,
        'Nokia',
        'G60',
        'FP-SN-0022'
    ),
    (
        23,
        23,
        'Lenovo',
        'IdeaPad 5',
        'FP-SN-0023'
    ),
    (
        24,
        24,
        'Samsung',
        'Tab S8',
        'FP-SN-0024'
    ),
    (
        25,
        25,
        'Google',
        'Pixel 8',
        'FP-SN-0025'
    );

-- 3. TECHNICIANS
CREATE TABLE technicians (
    technician_id INT AUTO_INCREMENT,
    technician_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    specialty VARCHAR(50),
    PRIMARY KEY (technician_id)
) ENGINE = InnoDB;

-- 3.1 TECHNICIANS INSERT TEMPLATE
INSERT INTO
    technicians (
        technician_id,
        technician_name,
        email,
        specialty
    )
VALUES (
        1,
        'Amir Karlsson',
        'amir_karlsson1@example.com',
        'Phones'
    ),
    (
        2,
        'Elin Persson',
        'elin_persson2@example.com',
        'Laptops'
    ),
    (
        3,
        'Mikael Holm',
        'mikael_holm3@example.com',
        'Tablets'
    ),
    (
        4,
        'Rania Farouk',
        'rania_farouk4@example.com',
        'Laptops'
    ),
    (
        5,
        'David Svensson',
        'david_svensson5@example.com',
        'Phones'
    ),
    (
        6,
        'Sofia Nyberg',
        'sofia_nyberg6@example.com',
        NULL
    ),
    (
        7,
        'Elias Lund',
        'elias_lund7@example.com',
        'Phones'
    ),
    (
        8,
        'Linda Bergström',
        'linda_bergstrom8@example.com',
        'Laptops'
    ),
    (
        9,
        'Oskar Sjödin',
        'oskar_sjodin9@example.com',
        'Phones'
    ),
    (
        10,
        'Nadine Karim',
        'nadine_karim10@example.com',
        'Laptops'
    );

-- 4. PARTS
CREATE TABLE parts (
    part_id INT AUTO_INCREMENT,
    part_name VARCHAR(100) NOT NULL UNIQUE,
    unit_price_sek DECIMAL(10, 2) NOT NULL DEFAULT 0.00,
    PRIMARY KEY (part_id)
) ENGINE = InnoDB;

INSERT INTO
    parts (
        part_id,
        part_name,
        unit_price_sek
    )
VALUES (
        999,
        'Unknown / Unspecified part',
        0.00
    )
ON DUPLICATE KEY UPDATE
    part_name = 'Unknown / Unspecified part';

-- 4.1 PARTS INSERT TEMPLATE
INSERT INTO
    parts (
        part_id,
        part_name,
        unit_price_sek
    )
VALUES (1, 'OLED screen', 1590.00),
    (2, 'Battery unit', 490.00),
    (
        3,
        'USB charging port',
        190.00
    ),
    (4, 'Keyboard module', 650.00),
    (5, 'Cooling fan', 320.00),
    (6, 'Speaker set', 240.00),
    (7, 'Camera module', 420.00),
    (8, 'SSD 512GB', 0.00),
    (9, 'WiFi card', 230.00),
    (
        10,
        'Microphone module',
        170.00
    ),
    (11, 'Touch panel', 820.00),
    (12, 'Thermal adhesive', 90.00);

-- 5. REPAIR JOBS
CREATE TABLE repair_jobs (
    job_id INT AUTO_INCREMENT,
    device_id INT NOT NULL,
    technician_id INT,
    fault_description TEXT,
    status VARCHAR(30) NOT NULL DEFAULT 'Received',
    labor_cost_sek DECIMAL(10, 2) NOT NULL DEFAULT 0.00,
    PRIMARY KEY (job_id),
    CONSTRAINT fk_jobs_devices FOREIGN KEY (device_id) REFERENCES devices (device_id) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_jobs_technicians FOREIGN KEY (technician_id) REFERENCES technicians (technician_id) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB;

ALTER TABLE repair_jobs MODIFY COLUMN device_id INT NULL;

-- 5.1 REPAIR JOBS INSERT TEMPLATE
INSERT INTO
    repair_jobs (
        job_id,
        device_id,
        technician_id,
        fault_description,
        status,
        labor_cost_sek
    )
VALUES (
        1001,
        4,
        2,
        'Screen cracked',
        'Received',
        350.00
    ),
    (
        1002,
        11,
        5,
        'Battery drains quickly',
        'Diagnosing',
        423.00
    ),
    (
        1003,
        18,
        8,
        'Keyboard keys not working',
        'Waiting for parts',
        496.00
    ),
    (
        1004,
        25,
        2,
        'Does not start',
        'In repair',
        569.00
    ),
    (
        1005,
        7,
        5,
        'Charging port damaged',
        'Ready',
        642.00
    ),
    (
        1006,
        14,
        NULL,
        'Speaker distorted',
        'Collected',
        715.00
    ),
    (
        1007,
        21,
        2,
        'Overheating',
        'Received',
        788.00
    ),
    (
        1008,
        3,
        5,
        NULL,
        'Diagnosing',
        861.00
    ),
    (
        1009,
        10,
        8,
        'Camera not focusing',
        'Waiting for parts',
        934.00
    ),
    (
        1010,
        17,
        2,
        'Blue screen on startup',
        'In repair',
        1007.00
    ),
    (
        1011,
        24,
        5,
        'Touch screen unresponsive',
        'Ready',
        1080.00
    ),
    (
        1012,
        6,
        8,
        'Strange fan noise',
        'Collected',
        1153.00
    ),
    (
        1013,
        13,
        2,
        'Charging slowly',
        'Recieved',
        1226.00
    ),
    (
        1014,
        20,
        5,
        'USB port not working',
        'Diagnosing',
        1299.00
    ),
    (
        1015,
        2,
        8,
        'Microphone not working',
        'Waiting for parts',
        1372.00
    ),
    (
        1016,
        9,
        2,
        'Screen cracked',
        'In repair',
        1445.00
    ),
    (
        1017,
        NULL,
        5,
        'Battery drains quickly',
        'Ready',
        368.00
    ),
    (
        1018,
        23,
        8,
        'Keyboard keys not working',
        'Collected',
        441.00
    ),
    (
        1019,
        5,
        2,
        'Does not start',
        'Received',
        514.00
    ),
    (
        1020,
        12,
        5,
        'Charging port damaged',
        'Diagnosing',
        587.00
    ),
    (
        1021,
        19,
        8,
        'Speaker distorted',
        'Waiting for parts',
        660.00
    ),
    (
        1022,
        1,
        2,
        'Overheating',
        'In repair',
        0.00
    ),
    (
        1023,
        8,
        5,
        'WiFi not connecting',
        'Ready',
        806.00
    ),
    (
        1024,
        15,
        8,
        'Camera not focusing',
        'Collected',
        879.00
    ),
    (
        1025,
        22,
        2,
        'Blue screen on startup',
        'Received',
        952.00
    ),
    (
        1026,
        4,
        5,
        'Touch screen unresponsive',
        'Recieved',
        1025.00
    ),
    (
        1027,
        11,
        8,
        'Strange fan noise',
        'Waiting for parts',
        1098.00
    ),
    (
        1028,
        18,
        2,
        'Charging slowly',
        'In repair',
        1171.00
    ),
    (
        1029,
        25,
        NULL,
        'USB port not working',
        'Ready',
        1244.00
    ),
    (
        1030,
        7,
        8,
        'Microphone not working',
        'Collected',
        1317.00
    ),
    (
        1031,
        14,
        2,
        NULL,
        'Received',
        1390.00
    ),
    (
        1032,
        21,
        5,
        'Battery drains quickly',
        'Diagnosing',
        1463.00
    ),
    (
        1033,
        3,
        8,
        'Keyboard keys not working',
        'Waiting for parts',
        386.00
    ),
    (
        1034,
        10,
        2,
        'Does not start',
        'In repair',
        459.00
    ),
    (
        1035,
        17,
        5,
        'Charging port damaged',
        'Ready',
        532.00
    );

-- 6. CONNECTION TABLE FOR JOBS -> PARTS
CREATE TABLE job_parts (
    job_id INT NOT NULL,
    part_id INT NOT NULL,
    quantity INT NOT NULL DEFAULT 1,
    PRIMARY KEY (job_id, part_id),
    CONSTRAINT fk_jp_jobs FOREIGN KEY (job_id) REFERENCES repair_jobs (job_id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_jp_parts FOREIGN KEY (part_id) REFERENCES parts (part_id) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB;
-- 6.1 CONNECTION TABLE FOR JOBS -> PARTS INSERT TEMPLATE
INSERT INTO
    job_parts (job_id, part_id, quantity)
VALUES (1004, 2, 1),
    (1015, 7, 1),
    (1003, 1, 1),
    (1014, 6, 1),
    (1002, 11, 1),
    (1013, 5, 1),
    (1001, 10, 1),
    (1012, 4, 2),
    (1023, 9, 1),
    (1011, 3, 1),
    (1022, 8, 1),
    (1010, 2, 2),
    (1021, 7, 1),
    (1009, 1, 1),
    (1020, 6, 1),
    (1008, 11, 1),
    (1019, 999, 1),
    (1007, 10, 1),
    (1018, 4, 1),
    (1006, 9, 1),
    (1017, 3, 1),
    (1005, 8, 1),
    (1016, 2, 1),
    (1004, 7, 1),
    (1015, 1, 1),
    (1003, 6, 2),
    (1014, 11, 1),
    (1002, 5, 1),
    (1013, 10, 1),
    (1001, 4, 1),
    (1012, 9, 1),
    (1023, 3, 1),
    (1011, 8, 1);

-- ADDS COLUMN FOR WARRANTY PERIOD IN MONTHS WITH STANDARD VALUE 3 MONTHS
ALTER TABLE repair_jobs
ADD COLUMN warranty_months INT NOT NULL DEFAULT 3 AFTER status,
ADD COLUMN internal_notes TEXT AFTER labor_cost_sek;

-- INSERT TEMPLATE

-- RUN SCRIPT (SHOW TABLE)
SELECT * FROM customers;

SELECT * FROM devices;

SELECT * FROM repair_jobs;