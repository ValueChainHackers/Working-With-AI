// CLEAR DATABASE
MATCH (n) DETACH DELETE n;

// ==================== TIER 5: MINING & EXTRACTION ====================

CREATE (mine1:Mine {id: 'MINE-001', name: 'Chuquicamata Copper Mine', country: 'Chile', material: 'Copper Ore', capacity_tonnes_year: 500000, latitude: -22.3, longitude: -68.9}),
(mine2:Mine {id: 'MINE-002', name: 'Greenbushes Lithium Mine', country: 'Australia', material: 'Lithium Ore', capacity_tonnes_year: 1300000, latitude: -33.85, longitude: 116.05}),
(mine3:Mine {id: 'MINE-003', name: 'Tenke Fungurume', country: 'DRC', material: 'Cobalt Ore', capacity_tonnes_year: 18000, latitude: -10.6, longitude: 26.1, ethical_concerns: true}),
(mine4:Mine {id: 'MINE-004', name: 'Bayan Obo', country: 'China', material: 'Rare Earth Elements', capacity_tonnes_year: 70000, latitude: 41.77, longitude: 109.97}),
(mine5:Mine {id: 'MINE-005', name: 'Kitimat Aluminum', country: 'Canada', material: 'Bauxite', capacity_tonnes_year: 432000, latitude: 54.05, longitude: -128.65}),
(mine6:Mine {id: 'MINE-006', name: 'Ural Platinum', country: 'Russia', material: 'Platinum Group Metals', capacity_tonnes_year: 800, latitude: 58.5, longitude: 59.8}),
(mine7:Mine {id: 'MINE-007', name: 'Kamoa-Kakula', country: 'DRC', material: 'Copper Ore', capacity_tonnes_year: 400000, latitude: -10.8, longitude: 25.7}),
(mine8:Mine {id: 'MINE-008', name: 'Mt Marion', country: 'Australia', material: 'Lithium Spodumene', capacity_tonnes_year: 450000, latitude: -30.95, longitude: 119.58}),
(mine9:Mine {id: 'MINE-009', name: 'Jiangxi Rare Earth', country: 'China', material: 'Heavy Rare Earths', capacity_tonnes_year: 5000, latitude: 25.5, longitude: 115.2}),
(mine10:Mine {id: 'MINE-010', name: 'Escondida', country: 'Chile', material: 'Copper Ore', capacity_tonnes_year: 1200000, latitude: -24.23, longitude: -69.06}),
(mine11:Mine {id: 'MINE-011', name: 'Oyu Tolgoi', country: 'Mongolia', material: 'Copper & Gold', capacity_tonnes_year: 550000, latitude: 43.0, longitude: 106.8}),
(mine12:Mine {id: 'MINE-012', name: 'Grasberg', country: 'Indonesia', material: 'Copper & Gold', capacity_tonnes_year: 700000, latitude: -4.05, longitude: 137.12}),
(mine13:Mine {id: 'MINE-013', name: 'Rössing Uranium', country: 'Namibia', material: 'Uranium', capacity_tonnes_year: 3000, latitude: -22.48, longitude: 14.98}),
(mine14:Mine {id: 'MINE-014', name: 'Pilbara Iron Ore', country: 'Australia', material: 'Iron Ore', capacity_tonnes_year: 290000000, latitude: -22.4, longitude: 117.8});

// ==================== TIER 4: RAW MATERIAL PROCESSING ====================

CREATE (processor1:Processor {id: 'PROC-001', name: 'Codelco Refinery', country: 'Chile', output: 'Copper Cathodes', purity: 99.99}),
(processor2:Processor {id: 'PROC-002', name: 'Tianqi Lithium', country: 'China', output: 'Battery-Grade Lithium Hydroxide', purity: 99.5}),
(processor3:Processor {id: 'PROC-003', name: 'Zhejiang Huayou Cobalt', country: 'China', output: 'Cobalt Sulfate', purity: 99.8}),
(processor4:Processor {id: 'PROC-004', name: 'Inner Mongolia Baotou Steel', country: 'China', output: 'Rare Earth Oxides', purity: 99.9}),
(processor5:Processor {id: 'PROC-005', name: 'Rio Tinto Aluminum', country: 'Canada', output: 'Aluminum Ingots', purity: 99.7}),
(processor6:Processor {id: 'PROC-006', name: 'Nornickel Refinery', country: 'Russia', output: 'Platinum & Palladium', purity: 99.95}),
(processor7:Processor {id: 'PROC-007', name: 'Albemarle Australia', country: 'Australia', output: 'Lithium Carbonate', purity: 99.5}),
(processor8:Processor {id: 'PROC-008', name: 'JX Nippon Mining', country: 'Japan', output: 'Copper Foil', thickness_microns: 8}),
(processor9:Processor {id: 'PROC-009', name: 'Freeport Smelting', country: 'Spain', output: 'Copper Wire Rod', diameter_mm: 8}),
(processor10:Processor {id: 'PROC-010', name: 'Ganfeng Lithium', country: 'China', output: 'Lithium Metal', purity: 99.9}),
(processor11:Processor {id: 'PROC-011', name: 'Umicore Cobalt Refinery', country: 'Belgium', output: 'Cobalt Powder', purity: 99.8}),
(processor12:Processor {id: 'PROC-012', name: 'MP Materials', country: 'USA', output: 'Rare Earth Concentrate', purity: 85.0}),
(processor13:Processor {id: 'PROC-013', name: 'China Molybdenum', country: 'China', output: 'Cobalt Hydroxide', purity: 98.5}),
(processor14:Processor {id: 'PROC-014', name: 'Mitsubishi Materials', country: 'Japan', output: 'Electrolytic Copper', purity: 99.999});

// ==================== TIER 3: SPECIALIZED MATERIAL SUPPLIERS ====================

CREATE (mat1:MaterialSupplier {id: 'MAT-001', name: 'Sumitomo Metal Mining', country: 'Japan', specialty: 'High-Purity Copper Products', certifications: ['ISO9001', 'ISO14001', 'IATF16949']}),
(mat2:MaterialSupplier {id: 'MAT-002', name: 'LG Chem Cathode Division', country: 'South Korea', specialty: 'NMC Battery Cathodes', certifications: ['ISO9001', 'ISO14001']}),
(mat3:MaterialSupplier {id: 'MAT-003', name: 'Schott Glass Advanced', country: 'Germany', specialty: 'Specialized Glass Substrates', certifications: ['ISO9001', 'ISO14001', 'ISO13485']}),
(mat4:MaterialSupplier {id: 'MAT-004', name: 'Shin-Etsu Chemical', country: 'Japan', specialty: 'Silicon Wafers 300mm', certifications: ['ISO9001', 'SEMI', 'ISO14001']}),
(mat5:MaterialSupplier {id: 'MAT-005', name: 'Kyocera Fine Ceramics', country: 'Japan', specialty: 'Advanced Ceramic Substrates', certifications: ['ISO9001', 'IATF16949']}),
(mat6:MaterialSupplier {id: 'MAT-006', name: 'Toray Carbon Fibers', country: 'Japan', specialty: 'Carbon Fiber Composites', certifications: ['ISO9001', 'AS9100']}),
(mat7:MaterialSupplier {id: 'MAT-007', name: 'BASF Chemicals', country: 'Germany', specialty: 'Polymer Electrolytes', certifications: ['ISO9001', 'ISO14001']}),
(mat8:MaterialSupplier {id: 'MAT-008', name: 'Corning Display Glass', country: 'USA', specialty: 'Gorilla Glass', certifications: ['ISO9001', 'ISO14001']}),
(mat9:MaterialSupplier {id: 'MAT-009', name: 'Showa Denko', country: 'Japan', specialty: 'Hard Disk Media & Chemicals', certifications: ['ISO9001']}),
(mat10:MaterialSupplier {id: 'MAT-010', name: 'Hitachi Metals', country: 'Japan', specialty: 'Rare Earth Magnets', certifications: ['ISO9001', 'IATF16949']}),
(mat11:MaterialSupplier {id: 'MAT-011', name: 'Celgard Separators', country: 'USA', specialty: 'Battery Separators', certifications: ['ISO9001', 'IATF16949']}),
(mat12:MaterialSupplier {id: 'MAT-012', name: 'Asahi Kasei', country: 'Japan', specialty: 'Polymer Films & Separators', certifications: ['ISO9001', 'ISO14001']}),
(mat13:MaterialSupplier {id: 'MAT-013', name: '3M Advanced Materials', country: 'USA', specialty: 'Conductive Adhesives', certifications: ['ISO9001', 'ISO14001']}),
(mat14:MaterialSupplier {id: 'MAT-014', name: 'Henkel Adhesives', country: 'Germany', specialty: 'Electronics Assembly Materials', certifications: ['ISO9001', 'ISO14001']}),
(mat15:MaterialSupplier {id: 'MAT-015', name: 'SK Innovation Battery', country: 'South Korea', specialty: 'Anode Materials', certifications: ['ISO9001', 'IATF16949']});

// ==================== TIER 2: COMPONENT MANUFACTURERS ====================

CREATE (comp1:ComponentMfg {id: 'COMP-001', name: 'Samsung Display', country: 'South Korea', product: 'AMOLED Display 6.8"', annual_capacity: 150000000, technology: 'LTPO OLED'}),
(comp2:ComponentMfg {id: 'COMP-002', name: 'CATL Battery', country: 'China', product: 'Li-ion Battery Cell 5000mAh', annual_capacity: 500000000, technology: 'NMC 811'}),
(comp3:ComponentMfg {id: 'COMP-003', name: 'TSMC Fab 18', country: 'Taiwan', product: 'SoC 3nm N3E', annual_capacity: 120000, technology: '3nm FinFET'}),
(comp4:ComponentMfg {id: 'COMP-004', name: 'Sony Semiconductor', country: 'Japan', product: 'Camera Sensor IMX989 1"', annual_capacity: 50000000, technology: 'Stacked CMOS'}),
(comp5:ComponentMfg {id: 'COMP-005', name: 'Murata Manufacturing', country: 'Japan', product: 'MLCC Capacitors', annual_capacity: 1000000000, technology: 'High-K Ceramic'}),
(comp6:ComponentMfg {id: 'COMP-006', name: 'TDK Inductors', country: 'Japan', product: 'Power Inductors', annual_capacity: 800000000, technology: 'Metal Alloy'}),
(comp7:ComponentMfg {id: 'COMP-007', name: 'Broadcom Wireless', country: 'USA', product: 'WiFi 7 & Bluetooth Chip', annual_capacity: 200000000, technology: '6nm'}),
(comp8:ComponentMfg {id: 'COMP-008', name: 'Qorvo RF', country: 'USA', product: '5G mmWave Frontend', annual_capacity: 150000000, technology: 'GaN'}),
(comp9:ComponentMfg {id: 'COMP-009', name: 'Skyworks Solutions', country: 'USA', product: 'Power Amplifier Module', annual_capacity: 180000000, technology: 'GaAs'}),
(comp10:ComponentMfg {id: 'COMP-010', name: 'Micron DRAM Fab', country: 'Taiwan', product: 'LPDDR5X 16GB', annual_capacity: 80000000, technology: '1-beta nm'}),
(comp11:ComponentMfg {id: 'COMP-011', name: 'SK Hynix NAND', country: 'South Korea', product: 'UFS 4.0 512GB', annual_capacity: 100000000, technology: '238-layer 3D NAND'}),
(comp12:ComponentMfg {id: 'COMP-012', name: 'Largan Precision', country: 'Taiwan', product: 'Camera Lens Module', annual_capacity: 120000000, technology: '8P Lens'}),
(comp13:ComponentMfg {id: 'COMP-013', name: 'AAC Technologies', country: 'China', product: 'Haptic Motor Linear Actuator', annual_capacity: 200000000, technology: 'X-axis Linear'}),
(comp14:ComponentMfg {id: 'COMP-014', name: 'Goertek Acoustics', country: 'China', product: 'Speaker & Microphone Module', annual_capacity: 300000000, technology: 'MEMS'}),
(comp15:ComponentMfg {id: 'COMP-015', name: 'Catcher Technology', country: 'Taiwan', product: 'Aluminum Unibody Chassis', annual_capacity: 80000000, technology: 'CNC Machined'}),
(comp16:ComponentMfg {id: 'COMP-016', name: 'Foxconn Interconnect', country: 'Taiwan', product: 'USB-C Port & Connectors', annual_capacity: 500000000, technology: 'Precision Stamping'}),
(comp17:ComponentMfg {id: 'COMP-017', name: 'Nidec Motor', country: 'Japan', product: 'Camera OIS Motor', annual_capacity: 150000000, technology: 'Voice Coil'}),
(comp18:ComponentMfg {id: 'COMP-018', name: 'Alps Alpine', country: 'Japan', product: 'Gyroscope & Accelerometer', annual_capacity: 250000000, technology: 'MEMS 6-axis'}),
(comp19:ComponentMfg {id: 'COMP-019', name: 'Bosch Sensortec', country: 'Germany', product: 'Environmental Sensors', annual_capacity: 300000000, technology: 'MEMS'}),
(comp20:ComponentMfg {id: 'COMP-020', name: 'Qualcomm Modem', country: 'USA', product: 'X75 5G Modem', annual_capacity: 100000000, technology: '4nm'}),
(comp21:ComponentMfg {id: 'COMP-021', name: 'NXP Secure Element', country: 'Netherlands', product: 'NFC & Secure Chip', annual_capacity: 200000000, technology: '40nm'}),
(comp22:ComponentMfg {id: 'COMP-022', name: 'STMicroelectronics PMIC', country: 'Italy', product: 'Power Management IC', annual_capacity: 250000000, technology: '55nm'}),
(comp23:ComponentMfg {id: 'COMP-023', name: 'Cirrus Logic Audio', country: 'USA', product: 'Audio Codec DAC', annual_capacity: 180000000, technology: '28nm'}),
(comp24:ComponentMfg {id: 'COMP-024', name: 'Texas Instruments Analog', country: 'USA', product: 'Analog Front-End ICs', annual_capacity: 300000000, technology: '65nm'}),
(comp25:ComponentMfg {id: 'COMP-025', name: 'InvenSense TDK', country: 'USA', product: 'IMU Motion Sensor', annual_capacity: 200000000, technology: 'MEMS'});

// ==================== TIER 1: MODULE ASSEMBLERS ====================

CREATE (mod1:ModuleAssembler {id: 'MOD-001', name: 'Foxconn Shenzhen', country: 'China', specialty: 'Display Module Assembly', employees: 50000}),
(mod2:ModuleAssembler {id: 'MOD-002', name: 'ATL Amperex', country: 'China', specialty: 'Battery Pack Assembly', employees: 20000}),
(mod3:ModuleAssembler {id: 'MOD-003', name: 'Pegatron Camera', country: 'Taiwan', specialty: 'Camera Module Integration', employees: 15000}),
(mod4:ModuleAssembler {id: 'MOD-004', name: 'Wistron PCB', country: 'Taiwan', specialty: 'Mainboard Assembly', employees: 35000}),
(mod5:ModuleAssembler {id: 'MOD-005', name: 'Luxshare Precision', country: 'China', specialty: 'Acoustic & Haptic Modules', employees: 25000}),
(mod6:ModuleAssembler {id: 'MOD-006', name: 'Jabil Circuit', country: 'China', specialty: 'RF Module Assembly', employees: 18000}),
(mod7:ModuleAssembler {id: 'MOD-007', name: 'Flex Manufacturing', country: 'China', specialty: 'Power Module Assembly', employees: 22000}),
(mod8:ModuleAssembler {id: 'MOD-008', name: 'Compal Electronics', country: 'Taiwan', specialty: 'Sensor Module Integration', employees: 28000}),
(mod9:ModuleAssembler {id: 'MOD-009', name: 'Quanta Computer', country: 'Taiwan', specialty: 'Memory Module Assembly', employees: 30000}),
(mod10:ModuleAssembler {id: 'MOD-010', name: 'BYD Electronics', country: 'China', specialty: 'Metal Frame Assembly', employees: 40000});

// ==================== TIER 0: FINAL ASSEMBLY & OEM ====================

CREATE (oem1:OEM {id: 'OEM-001', name: 'TechCorp Final Assembly Shenzhen', country: 'China', annual_output: 80000000, facility_size_sqm: 250000}),
(oem2:OEM {id: 'OEM-002', name: 'TechCorp Final Assembly India', country: 'India', annual_output: 25000000, facility_size_sqm: 150000}),
(oem3:OEM {id: 'OEM-003', name: 'TechCorp Final Assembly Vietnam', country: 'Vietnam', annual_output: 15000000, facility_size_sqm: 100000});

// ==================== PRODUCT ====================

CREATE (prod:Product {
  id: 'PROD-001',
  name: 'TechCorp Quantum Pro Max',
  category: 'Flagship Smartphone',
  price: 1299.99,
  launch_date: '2024-09-15',
  total_units_sold: 45000000,
  carbon_footprint_kg: 79.5
});

// ==================== DISTRIBUTION & LOGISTICS ====================

CREATE (log1:LogisticsHub {id: 'LOG-001', name: 'Shanghai Port Container Terminal', country: 'China', type: 'Seaport', capacity_teu: 43000000}),
(log2:LogisticsHub {id: 'LOG-002', name: 'Hong Kong International Airport', country: 'Hong Kong', type: 'Airport', capacity_tonnes: 5100000}),
(log3:LogisticsHub {id: 'LOG-003', name: 'Dubai Jebel Ali Port', country: 'UAE', type: 'Seaport', capacity_teu: 14000000}),
(log4:LogisticsHub {id: 'LOG-004', name: 'Singapore Changi Airport', country: 'Singapore', type: 'Airport', capacity_tonnes: 2000000}),
(log5:LogisticsHub {id: 'LOG-005', name: 'Rotterdam Port', country: 'Netherlands', type: 'Seaport', capacity_teu: 14800000}),
(log6:LogisticsHub {id: 'LOG-006', name: 'Memphis FedEx Hub', country: 'USA', type: 'Airport', capacity_tonnes: 4900000}),
(log7:LogisticsHub {id: 'LOG-007', name: 'Los Angeles Port', country: 'USA', type: 'Seaport', capacity_teu: 9500000});

CREATE (dist1:Distributor {id: 'DIST-001', name: 'TechCorp Americas Distribution', country: 'USA', coverage: ['North America', 'Latin America']}),
(dist2:Distributor {id: 'DIST-002', name: 'TechCorp EMEA Distribution', country: 'Netherlands', coverage: ['Europe', 'Middle East', 'Africa']}),
(dist3:Distributor {id: 'DIST-003', name: 'TechCorp APAC Distribution', country: 'Singapore', coverage: ['Asia Pacific', 'Oceania']});

CREATE (retail1:RetailChannel {id: 'RET-001', name: 'TechCorp Official Stores', type: 'Direct', store_count: 520}),
(retail2:RetailChannel {id: 'RET-002', name: 'Carrier Partners', type: 'Telecom', partner_count: 150}),
(retail3:RetailChannel {id: 'RET-003', name: 'Consumer Electronics Retailers', type: 'Third-Party', partner_count: 5000}),
(retail4:RetailChannel {id: 'RET-004', name: 'E-commerce Platforms', type: 'Online', platform_count: 25});

// ==================== TIER 5 -> TIER 4 RELATIONSHIPS ====================

CREATE (mine1)-[:SUPPLIES {volume_tonnes_year: 450000, contract_type: 'Long-term', price_per_tonne: 8500}]->(processor1),
(mine10)-[:SUPPLIES {volume_tonnes_year: 850000, contract_type: 'Long-term', price_per_tonne: 8200}]->(processor1),
(mine11)-[:SUPPLIES {volume_tonnes_year: 380000, contract_type: 'Spot', price_per_tonne: 8800}]->(processor9),
(mine12)-[:SUPPLIES {volume_tonnes_year: 520000, contract_type: 'Long-term', price_per_tonne: 8600}]->(processor14),
(mine7)-[:SUPPLIES {volume_tonnes_year: 350000, contract_type: 'Long-term', price_per_tonne: 8300}]->(processor8),

(mine2)-[:SUPPLIES {volume_tonnes_year: 900000, contract_type: 'Long-term', price_per_tonne: 850, traceability_certified: true}]->(processor2),
(mine8)-[:SUPPLIES {volume_tonnes_year: 350000, contract_type: 'Long-term', price_per_tonne: 820}]->(processor7),
(mine2)-[:SUPPLIES {volume_tonnes_year: 200000, contract_type: 'Spot', price_per_tonne: 900}]->(processor10),

(mine3)-[:SUPPLIES {volume_tonnes_year: 12000, contract_type: 'Long-term', price_per_tonne: 45000, ethical_audit_required: true}]->(processor3),
(mine3)-[:SUPPLIES {volume_tonnes_year: 5500, contract_type: 'Spot', price_per_tonne: 48000}]->(processor13),

(mine4)-[:SUPPLIES {volume_tonnes_year: 45000, contract_type: 'Long-term', price_per_tonne: 12000}]->(processor4),
(mine9)-[:SUPPLIES {volume_tonnes_year: 3500, contract_type: 'Long-term', price_per_tonne: 85000}]->(processor4),

(mine5)-[:SUPPLIES {volume_tonnes_year: 380000, contract_type: 'Long-term', price_per_tonne: 2400}]->(processor5),

(mine6)-[:SUPPLIES {volume_tonnes_year: 600, contract_type: 'Long-term', price_per_tonne: 32000000}]->(processor6),

(mine14)-[:SUPPLIES {volume_tonnes_year: 250000000, contract_type: 'Long-term', price_per_tonne: 120}]->(processor5);

// ==================== TIER 4 -> TIER 3 RELATIONSHIPS ====================

CREATE (processor1)-[:PROVIDES {product: 'Copper Cathodes', volume_tonnes_year: 380000, lead_time_days: 45}]->(mat1),
(processor8)-[:PROVIDES {product: 'Copper Foil 8μm', volume_tonnes_year: 85000, lead_time_days: 30}]->(mat1),
(processor9)-[:PROVIDES {product: 'Copper Wire', volume_tonnes_year: 120000, lead_time_days: 35}]->(mat1),
(processor14)-[:PROVIDES {product: 'Ultra-Pure Copper', volume_tonnes_year: 45000, lead_time_days: 50}]->(mat1),

(processor2)-[:PROVIDES {product: 'Lithium Hydroxide', volume_tonnes_year: 95000, lead_time_days: 40}]->(mat2),
(processor7)-[:PROVIDES {product: 'Lithium Carbonate', volume_tonnes_year: 35000, lead_time_days: 38}]->(mat2),
(processor10)-[:PROVIDES {product: 'Lithium Metal', volume_tonnes_year: 8000, lead_time_days: 42}]->(mat15),

(processor3)-[:PROVIDES {product: 'Cobalt Sulfate', volume_tonnes_year: 11000, lead_time_days: 55}]->(mat2),
(processor11)-[:PROVIDES {product: 'Cobalt Powder', volume_tonnes_year: 2500, lead_time_days: 48}]->(mat2),
(processor13)-[:PROVIDES {product: 'Cobalt Hydroxide', volume_tonnes_year: 5000, lead_time_days: 52}]->(mat2),

(processor4)-[:PROVIDES {product: 'Rare Earth Oxides', volume_tonnes_year: 42000, lead_time_days: 60}]->(mat10),
(processor12)-[:PROVIDES {product: 'Rare Earth Concentrate', volume_tonnes_year: 5000, lead_time_days: 55}]->(mat10),

(processor5)-[:PROVIDES {product: 'Aluminum Ingots', volume_tonnes_year: 350000, lead_time_days: 35}]->(mat6),

(processor6)-[:PROVIDES {product: 'Platinum & Palladium', volume_tonnes_year: 550, lead_time_days: 90}]->(mat13);

// ==================== TIER 3 -> TIER 2 RELATIONSHIPS ====================

CREATE (mat1)-[:SUPPLIES_COMPONENT {component: 'PCB Copper Layer', lead_time_days: 25, price_per_unit: 8.50}]->(comp3),
(mat1)-[:SUPPLIES_COMPONENT {component: 'Antenna Copper', lead_time_days: 20, price_per_unit: 2.30}]->(comp7),
(mat1)-[:SUPPLIES_COMPONENT {component: 'Flex Cable', lead_time_days: 18, price_per_unit: 1.80}]->(comp16),

(mat2)-[:SUPPLIES_COMPONENT {component: 'NMC811 Cathode', lead_time_days: 30, price_per_unit: 45.00}]->(comp2),
(mat15)-[:SUPPLIES_COMPONENT {component: 'Graphite Anode', lead_time_days: 28, price_per_unit: 18.50}]->(comp2),
(mat11)-[:SUPPLIES_COMPONENT {component: 'PE Separator', lead_time_days: 25, price_per_unit: 3.20}]->(comp2),
(mat12)-[:SUPPLIES_COMPONENT {component: 'Polymer Separator', lead_time_days: 26, price_per_unit: 3.80}]->(comp2),
(mat7)-[:SUPPLIES_COMPONENT {component: 'Electrolyte', lead_time_days: 22, price_per_unit: 5.50}]->(comp2),

(mat3)-[:SUPPLIES_COMPONENT {component: 'Glass Substrate', lead_time_days: 35, price_per_unit: 12.00}]->(comp1),
(mat8)-[:SUPPLIES_COMPONENT {component: 'Gorilla Glass Victus 2', lead_time_days: 32, price_per_unit: 18.50}]->(comp1),

(mat4)-[:SUPPLIES_COMPONENT {component: '300mm Silicon Wafer', lead_time_days: 60, price_per_unit: 850.00}]->(comp3),
(mat4)-[:SUPPLIES_COMPONENT {component: '300mm Silicon Wafer', lead_time_days: 60, price_per_unit: 850.00}]->(comp10),
(mat4)-[:SUPPLIES_COMPONENT {component: '300mm Silicon Wafer', lead_time_days: 60, price_per_unit: 850.00}]->(comp11),

(mat5)-[:SUPPLIES_COMPONENT {component: 'Ceramic Substrate', lead_time_days: 40, price_per_unit: 15.00}]->(comp5),
(mat5)-[:SUPPLIES_COMPONENT {component: 'Ceramic Substrate', lead_time_days: 40, price_per_unit: 22.00}]->(comp19),

(mat6)-[:SUPPLIES_COMPONENT {component: 'Carbon Fiber Frame', lead_time_days: 28, price_per_unit: 35.00}]->(comp15),

(mat10)-[:SUPPLIES_COMPONENT {component: 'NdFeB Magnets', lead_time_days: 45, price_per_unit: 28.00}]->(comp13),
(mat10)-[:SUPPLIES_COMPONENT {component: 'NdFeB Magnets', lead_time_days: 45, price_per_unit: 22.00}]->(comp14),
(mat10)-[:SUPPLIES_COMPONENT {component: 'SmCo Magnets', lead_time_days: 50, price_per_unit: 125.00}]->(comp17),

(mat9)-[:SUPPLIES_COMPONENT {component: 'Aluminum Disk Substrate', lead_time_days: 35, price_per_unit: 8.50}]->(comp11),

(mat13)-[:SUPPLIES_COMPONENT {component: 'Conductive Adhesive', lead_time_days: 20, price_per_unit: 12.00}]->(comp1),
(mat13)-[:SUPPLIES_COMPONENT {component: 'Silver Paste', lead_time_days: 22, price_per_unit: 85.00}]->(comp4),

(mat14)-[:SUPPLIES_COMPONENT {component: 'Thermal Interface Material', lead_time_days: 18, price_per_unit: 3.50}]->(comp3),
(mat14)-[:SUPPLIES_COMPONENT {component: 'Underfill Adhesive', lead_time_days: 19, price_per_unit: 4.20}]->(comp3);

// ==================== TIER 2 -> TIER 1 RELATIONSHIPS ====================

CREATE (comp1)-[:DELIVERS_TO {module: 'Display Assembly', quantity_per_unit: 1, lead_time_days: 15, price: 125.00}]->(mod1),
(comp2)-[:DELIVERS_TO {module: 'Battery Pack', quantity_per_unit: 1, lead_time_days: 12, price: 38.50}]->(mod2),
(comp3)-[:DELIVERS_TO {module: 'Main PCB', quantity_per_unit: 1, lead_time_days: 25, price: 185.00}]->(mod4),
(comp4)-[:DELIVERS_TO {module: 'Camera Module', quantity_per_unit: 3, lead_time_days: 18, price: 48.00}]->(mod3),
(comp12)-[:DELIVERS_TO {module: 'Camera Module', quantity_per_unit: 3, lead_time_days: 16, price: 22.00}]->(mod3),
(comp17)-[:DELIVERS_TO {module: 'Camera Module', quantity_per_unit: 3, lead_time_days: 14, price: 8.50}]->(mod3),

(comp5)-[:DELIVERS_TO {module: 'Main PCB', quantity_per_unit: 850, lead_time_days: 10, price: 0.08}]->(mod4),
(comp6)-[:DELIVERS_TO {module: 'Main PCB', quantity_per_unit: 120, lead_time_days: 10, price: 0.15}]->(mod4),
(comp7)-[:DELIVERS_TO {module: 'RF Module', quantity_per_unit: 1, lead_time_days: 20, price: 28.00}]->(mod6),
(comp8)-[:DELIVERS_TO {module: 'RF Module', quantity_per_unit: 1, lead_time_days: 22, price: 35.00}]->(mod6),
(comp9)-[:DELIVERS_TO {module: 'RF Module', quantity_per_unit: 4, lead_time_days: 18, price: 6.50}]->(mod6),

(comp10)-[:DELIVERS_TO {module: 'Memory Module', quantity_per_unit: 1, lead_time_days: 20, price: 45.00}]->(mod9),
(comp11)-[:DELIVERS_TO {module: 'Memory Module', quantity_per_unit: 1, lead_time_days: 22, price: 38.00}]->(mod9),

(comp13)-[:DELIVERS_TO {module: 'Haptic Module', quantity_per_unit: 1, lead_time_days: 12, price: 12.50}]->(mod5),
(comp14)-[:DELIVERS_TO {module: 'Audio Module', quantity_per_unit: 2, lead_time_days: 10, price: 8.00}]->(mod5),

(comp15)-[:DELIVERS_TO {module: 'Chassis Assembly', quantity_per_unit: 1, lead_time_days: 15, price: 55.00}]->(mod10),
(comp16)-[:DELIVERS_TO {module: 'Main PCB', quantity_per_unit: 15, lead_time_days: 8, price: 1.20}]->(mod4),

(comp18)-[:DELIVERS_TO {module: 'Sensor Array', quantity_per_unit: 1, lead_time_days: 12, price: 5.50}]->(mod8),
(comp19)-[:DELIVERS_TO {module: 'Sensor Array', quantity_per_unit: 5, lead_time_days: 10, price: 2.80}]->(mod8),
(comp25)-[:DELIVERS_TO {module: 'Sensor Array', quantity_per_unit: 1, lead_time_days: 11, price: 4.20}]->(mod8),

(comp20)-[:DELIVERS_TO {module: 'Main PCB', quantity_per_unit: 1, lead_time_days: 25, price: 68.00}]->(mod4),
(comp21)-[:DELIVERS_TO {module: 'Main PCB', quantity_per_unit: 1, lead_time_days: 15, price: 3.50}]->(mod4),
(comp22)-[:DELIVERS_TO {module: 'Power Module', quantity_per_unit: 5, lead_time_days: 12, price: 4.80}]->(mod7),
(comp23)-[:DELIVERS_TO {module: 'Audio Module', quantity_per_unit: 1, lead_time_days: 14, price: 6.20}]->(mod5),
(comp24)-[:DELIVERS_TO {module: 'Main PCB', quantity_per_unit: 25, lead_time_days: 10, price: 0.85}]->(mod4);

// ==================== TIER 1 -> TIER 0 RELATIONSHIPS ====================

CREATE (mod1)-[:SUPPLIES_MODULE {module: 'Display Assembly', lead_time_days: 8, price: 145.00}]->(oem1),
(mod1)-[:SUPPLIES_MODULE {module: 'Display Assembly', lead_time_days: 10, price: 145.00}]->(oem2),
(mod1)-[:SUPPLIES_MODULE {module: 'Display Assembly', lead_time_days: 12, price: 145.00}]->(oem3),

(mod2)-[:SUPPLIES_MODULE {module: 'Battery Pack', lead_time_days: 6, price: 42.00}]->(oem1),
(mod2)-[:SUPPLIES_MODULE {module: 'Battery Pack', lead_time_days: 8, price: 42.00}]->(oem2),
(mod2)-[:SUPPLIES_MODULE {module: 'Battery Pack', lead_time_days: 10, price: 42.00}]->(oem3),

(mod3)-[:SUPPLIES_MODULE {module: 'Camera Module', lead_time_days: 7, price: 95.00}]->(oem1),
(mod3)-[:SUPPLIES_MODULE {module: 'Camera Module', lead_time_days: 9, price: 95.00}]->(oem2),
(mod3)-[:SUPPLIES_MODULE {module: 'Camera Module', lead_time_days: 11, price: 95.00}]->(oem3),

(mod4)-[:SUPPLIES_MODULE {module: 'Main PCB', lead_time_days: 10, price: 285.00}]->(oem1),
(mod4)-[:SUPPLIES_MODULE {module: 'Main PCB', lead_time_days: 12, price: 285.00}]->(oem2),
(mod4)-[:SUPPLIES_MODULE {module: 'Main PCB', lead_time_days: 14, price: 285.00}]->(oem3),

(mod5)-[:SUPPLIES_MODULE {module: 'Audio & Haptics', lead_time_days: 5, price: 28.00}]->(oem1),
(mod5)-[:SUPPLIES_MODULE {module: 'Audio & Haptics', lead_time_days: 7, price: 28.00}]->(oem2),
(mod5)-[:SUPPLIES_MODULE {module: 'Audio & Haptics', lead_time_days: 9, price: 28.00}]->(oem3),

(mod6)-[:SUPPLIES_MODULE {module: 'RF Module', lead_time_days: 9, price: 78.00}]->(oem1),
(mod6)-[:SUPPLIES_MODULE {module: 'RF Module', lead_time_days: 11, price: 78.00}]->(oem2),
(mod6)-[:SUPPLIES_MODULE {module: 'RF Module', lead_time_days: 13, price: 78.00}]->(oem3),

(mod7)-[:SUPPLIES_MODULE {module: 'Power Management', lead_time_days: 6, price: 32.00}]->(oem1),
(mod7)-[:SUPPLIES_MODULE {module: 'Power Management', lead_time_days: 8, price: 32.00}]->(oem2),
(mod7)-[:SUPPLIES_MODULE {module: 'Power Management', lead_time_days: 10, price: 32.00}]->(oem3),

(mod8)-[:SUPPLIES_MODULE {module: 'Sensor Array', lead_time_days: 5, price: 18.50}]->(oem1),
(mod8)-[:SUPPLIES_MODULE {module: 'Sensor Array', lead_time_days: 7, price: 18.50}]->(oem2),
(mod8)-[:SUPPLIES_MODULE {module: 'Sensor Array', lead_time_days: 9, price: 18.50}]->(oem3),

(mod9)-[:SUPPLIES_MODULE {module: 'Memory Module', lead_time_days: 8, price: 88.00}]->(oem1),
(mod9)-[:SUPPLIES_MODULE {module: 'Memory Module', lead_time_days: 10, price: 88.00}]->(oem2),
(mod9)-[:SUPPLIES_MODULE {module: 'Memory Module', lead_time_days: 12, price: 88.00}]->(oem3),

(mod10)-[:SUPPLIES_MODULE {module: 'Chassis', lead_time_days: 7, price: 62.00}]->(oem1),
(mod10)-[:SUPPLIES_MODULE {module: 'Chassis', lead_time_days: 9, price: 62.00}]->(oem2),
(mod10)-[:SUPPLIES_MODULE {module: 'Chassis', lead_time_days: 11, price: 62.00}]->(oem3);

// ==================== OEM -> PRODUCT ====================

CREATE (oem1)-[:MANUFACTURES {units_per_year: 80000000, cost_per_unit: 873.50, assembly_time_minutes: 8}]->(prod),
(oem2)-[:MANUFACTURES {units_per_year: 25000000, cost_per_unit: 873.50, assembly_time_minutes: 9}]->(prod),
(oem3)-[:MANUFACTURES {units_per_year: 15000000, cost_per_unit: 873.50, assembly_time_minutes: 10}]->(prod);

// ==================== LOGISTICS RELATIONSHIPS ====================

CREATE (oem1)-[:SHIPS_THROUGH {transit_days: 2, cost_per_unit: 0.85}]->(log1),
(oem1)-[:SHIPS_THROUGH {transit_days: 1, cost_per_unit: 2.50}]->(log2),
(oem2)-[:SHIPS_THROUGH {transit_days: 3, cost_per_unit: 1.20}]->(log4),
(oem3)-[:SHIPS_THROUGH {transit_days: 2, cost_per_unit: 1.10}]->(log4),

(log1)-[:ROUTES_TO {transit_days: 28, cost_per_unit: 3.50, mode: 'Sea'}]->(log5),
(log1)-[:ROUTES_TO {transit_days: 25, cost_per_unit: 3.80, mode: 'Sea'}]->(log7),
(log1)-[:ROUTES_TO {transit_days: 18, cost_per_unit: 4.20, mode: 'Sea'}]->(log3),

(log2)-[:ROUTES_TO {transit_days: 3, cost_per_unit: 12.50, mode: 'Air'}]->(log6),
(log2)-[:ROUTES_TO {transit_days: 2, cost_per_unit: 11.00, mode: 'Air'}]->(log4),
(log2)-[:ROUTES_TO {transit_days: 4, cost_per_unit: 10.50, mode: 'Air'}]->(log3),

(log4)-[:ROUTES_TO {transit_days: 2, cost_per_unit: 11.50, mode: 'Air'}]->(log3),
(log4)-[:ROUTES_TO {transit_days: 3, cost_per_unit: 12.00, mode: 'Air'}]->(log6),
(log4)-[:ROUTES_TO {transit_days: 4, cost_per_unit: 13.50, mode: 'Air'}]->(log5),

(log3)-[:ROUTES_TO {transit_days: 2, cost_per_unit: 10.00, mode: 'Air'}]->(log5),
(log3)-[:ROUTES_TO {transit_days: 3, cost_per_unit: 11.00, mode: 'Air'}]->(log6),

(log5)-[:DELIVERS_TO {transit_days: 5, cost_per_unit: 2.50}]->(dist2),
(log6)-[:DELIVERS_TO {transit_days: 2, cost_per_unit: 1.80}]->(dist1),
(log7)-[:DELIVERS_TO {transit_days: 3, cost_per_unit: 1.50}]->(dist1),
(log4)-[:DELIVERS_TO {transit_days: 3, cost_per_unit: 2.00}]->(dist3);

// ==================== DISTRIBUTION -> RETAIL ====================

CREATE (dist1)-[:DISTRIBUTES_TO {lead_time_days: 3}]->(retail1),
(dist1)-[:DISTRIBUTES_TO {lead_time_days: 2}]->(retail2),
(dist1)-[:DISTRIBUTES_TO {lead_time_days: 5}]->(retail3),
(dist1)-[:DISTRIBUTES_TO {lead_time_days: 1}]->(retail4),

(dist2)-[:DISTRIBUTES_TO {lead_time_days: 4}]->(retail1),
(dist2)-[:DISTRIBUTES_TO {lead_time_days: 3}]->(retail2),
(dist2)-[:DISTRIBUTES_TO {lead_time_days: 6}]->(retail3),
(dist2)-[:DISTRIBUTES_TO {lead_time_days: 2}]->(retail4),

(dist3)-[:DISTRIBUTES_TO {lead_time_days: 3}]->(retail1),
(dist3)-[:DISTRIBUTES_TO {lead_time_days: 2}]->(retail2),
(dist3)-[:DISTRIBUTES_TO {lead_time_days: 5}]->(retail3),
(dist3)-[:DISTRIBUTES_TO {lead_time_days: 1}]->(retail4);

// ==================== COMPLIANCE & CERTIFICATION ====================

CREATE (cert1:Certification {id: 'CERT-001', name: 'RBA Responsible Business Alliance', type: 'Labor & Ethics'}),
(cert2:Certification {id: 'CERT-002', name: 'ISO 14001 Environmental', type: 'Environmental'}),
(cert3:Certification {id: 'CERT-003', name: 'Conflict Minerals Reporting', type: 'Compliance'}),
(cert4:Certification {id: 'CERT-004', name: 'REACH Compliance', type: 'Chemical Safety'}),
(cert5:Certification {id: 'CERT-005', name: 'RoHS Directive', type: 'Electronics Safety'}),
(cert6:Certification {id: 'CERT-006', name: 'IATF 16949 Automotive', type: 'Quality'}),
(cert7:Certification {id: 'CERT-007', name: 'Fair Labor Association', type: 'Labor Rights'});

CREATE (mine3)-[:REQUIRES_CERTIFICATION]->(cert3),
(mine3)-[:REQUIRES_CERTIFICATION]->(cert7),
(processor3)-[:CERTIFIED_BY]->(cert3),
(processor13)-[:CERTIFIED_BY]->(cert3),
(oem1)-[:CERTIFIED_BY]->(cert1),
(oem1)-[:CERTIFIED_BY]->(cert2),
(oem1)-[:CERTIFIED_BY]->(cert5),
(oem2)-[:CERTIFIED_BY]->(cert1),
(oem2)-[:CERTIFIED_BY]->(cert2),
(oem3)-[:CERTIFIED_BY]->(cert1);

// ==================== RISK NODES ====================

CREATE (risk1:Risk {id: 'RISK-001', type: 'Geopolitical', description: 'DRC Political Instability', severity: 'High', affected_material: 'Cobalt'}),
(risk2:Risk {id: 'RISK-002', type: 'Natural Disaster', description: 'Taiwan Earthquake Risk', severity: 'High', affected_components: ['Semiconductors', 'DRAM', 'Chassis']}),
(risk3:Risk {id: 'RISK-003', type: 'Trade Policy', description: 'US-China Trade Tensions', severity: 'Medium', tariff_risk: true}),
(risk4:Risk {id: 'RISK-004', type: 'Supply Shortage', description: 'Rare Earth Export Controls', severity: 'High', affected_material: 'Rare Earth Elements'}),
(risk5:Risk {id: 'RISK-005', type: 'Climate', description: 'Water Scarcity affecting Lithium Mining', severity: 'Medium', region: 'Chile & Australia'});

CREATE (mine3)-[:EXPOSED_TO]->(risk1),
(comp3)-[:EXPOSED_TO]->(risk2),
(comp10)-[:EXPOSED_TO]->(risk2),
(comp15)-[:EXPOSED_TO]->(risk2),
(oem1)-[:EXPOSED_TO]->(risk3),
(mine4)-[:EXPOSED_TO]->(risk4),
(mine9)-[:EXPOSED_TO]->(risk4),
(mine2)-[:EXPOSED_TO]->(risk5);

// ==================== ALTERNATIVE SUPPLIERS (REDUNDANCY) ====================

CREATE (alt1:AlternativeSupplier {id: 'ALT-001', name: 'Eramet Indonesia Nickel', country: 'Indonesia', material: 'Nickel for Battery', status: 'Qualified'}),
(alt2:AlternativeSupplier {id: 'ALT-002', name: 'Samsung Foundry', country: 'South Korea', product: 'SoC Alternative 3nm', status: 'Development'}),
(alt3:AlternativeSupplier {id: 'ALT-003', name: 'LG Display', country: 'South Korea', product: 'OLED Alternative', status: 'Qualified'}),
(alt4:AlternativeSupplier {id: 'ALT-004', name: 'Intel Fab', country: 'USA', product: 'SoC Alternative', status: 'Evaluation'});

CREATE (comp2)-[:HAS_ALTERNATIVE]->(alt1),
(comp3)-[:HAS_ALTERNATIVE]->(alt2),
(comp3)-[:HAS_ALTERNATIVE]->(alt4),
(comp1)-[:HAS_ALTERNATIVE]->(alt3);

// ==================== SUSTAINABILITY METRICS ====================

CREATE (sus1:SustainabilityMetric {id: 'SUS-001', metric: 'Carbon Footprint', scope: 'Product Lifecycle', value_kg_co2: 79.5}),
(sus2:SustainabilityMetric {id: 'SUS-002', metric: 'Water Usage', scope: 'Manufacturing', value_liters: 12500}),
(sus3:SustainabilityMetric {id: 'SUS-003', metric: 'Recyclable Content', scope: 'Materials', value_percentage: 68}),
(sus4:SustainabilityMetric {id: 'SUS-004', metric: 'Renewable Energy Usage', scope: 'Manufacturing', value_percentage: 45});

CREATE (prod)-[:HAS_METRIC]->(sus1),
(prod)-[:HAS_METRIC]->(sus2),
(prod)-[:HAS_METRIC]->(sus3),
(oem1)-[:ACHIEVES_METRIC]->(sus4);
