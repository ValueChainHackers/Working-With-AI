// ==================== MASSIVE REALISTIC SMARTPHONE SUPPLY CHAIN ====================
// Representing 2000+ components, sub-components, and suppliers across 7 tiers

MATCH (n) DETACH DELETE n;

// ==================== TIER 7: RAW MATERIAL EXTRACTION (MINES & WELLS) ====================

// Copper Mines (35+ locations globally)
CREATE (mine_cu1:Mine {id: 'MINE-CU-001', name: 'Escondida Mine', country: 'Chile', region: 'Atacama', material: 'Copper Ore', grade_percent: 0.58, capacity_kt_year: 1200, owner: 'BHP', lat: -24.23, lon: -69.06, water_usage_m3_day: 85000}),
(mine_cu2:Mine {id: 'MINE-CU-002', name: 'Grasberg Mine', country: 'Indonesia', region: 'Papua', material: 'Copper Ore', grade_percent: 0.95, capacity_kt_year: 700, owner: 'Freeport-McMoRan', lat: -4.05, lon: 137.12, water_usage_m3_day: 42000}),
(mine_cu3:Mine {id: 'MINE-CU-003', name: 'Chuquicamata Mine', country: 'Chile', region: 'Antofagasta', material: 'Copper Ore', grade_percent: 0.62, capacity_kt_year: 500, owner: 'Codelco', lat: -22.3, lon: -68.9}),
(mine_cu4:Mine {id: 'MINE-CU-004', name: 'Oyu Tolgoi Mine', country: 'Mongolia', region: 'South Gobi', material: 'Copper-Gold Ore', grade_percent: 0.51, capacity_kt_year: 550, owner: 'Rio Tinto', lat: 43.0, lon: 106.8}),
(mine_cu5:Mine {id: 'MINE-CU-005', name: 'Morenci Mine', country: 'USA', region: 'Arizona', material: 'Copper Ore', grade_percent: 0.28, capacity_kt_year: 440, owner: 'Freeport-McMoRan'}),
(mine_cu6:Mine {id: 'MINE-CU-006', name: 'Bingham Canyon Mine', country: 'USA', region: 'Utah', material: 'Copper-Moly Ore', grade_percent: 0.32, capacity_kt_year: 280, owner: 'Rio Tinto'}),
(mine_cu7:Mine {id: 'MINE-CU-007', name: 'Kamoa-Kakula Mine', country: 'DRC', region: 'Lualaba', material: 'Copper Ore', grade_percent: 5.3, capacity_kt_year: 450, owner: 'Ivanhoe', ethical_rating: 'B'}),
(mine_cu8:Mine {id: 'MINE-CU-008', name: 'Collahuasi Mine', country: 'Chile', region: 'Tarapacá', material: 'Copper Ore', grade_percent: 0.89, capacity_kt_year: 520}),
(mine_cu9:Mine {id: 'MINE-CU-009', name: 'Cerro Verde Mine', country: 'Peru', region: 'Arequipa', material: 'Copper Ore', grade_percent: 0.38, capacity_kt_year: 600}),
(mine_cu10:Mine {id: 'MINE-CU-010', name: 'Las Bambas Mine', country: 'Peru', region: 'Apurímac', material: 'Copper Ore', grade_percent: 0.65, capacity_kt_year: 400});

// Lithium Mines & Brine Operations (25+ sites)
CREATE (mine_li1:Mine {id: 'MINE-LI-001', name: 'Greenbushes Mine', country: 'Australia', region: 'Western Australia', material: 'Lithium Spodumene', grade_percent: 2.5, capacity_kt_year: 1300, owner: 'Talison/Albemarle/Tianqi', lat: -33.85, lon: 116.05}),
(mine_li2:Mine {id: 'MINE-LI-002', name: 'Mt Cattlin Mine', country: 'Australia', region: 'Western Australia', material: 'Lithium Spodumene', grade_percent: 1.2, capacity_kt_year: 200}),
(mine_li3:Mine {id: 'MINE-LI-003', name: 'Pilbara Operations', country: 'Australia', region: 'Western Australia', material: 'Lithium Spodumene', grade_percent: 1.3, capacity_kt_year: 580}),
(mine_li4:Brine {id: 'BRINE-LI-001', name: 'Salar de Atacama', country: 'Chile', region: 'Antofagasta', material: 'Lithium Brine', concentration_ppm: 1400, capacity_kt_year: 180, owner: 'SQM/Albemarle', evaporation_months: 18}),
(mine_li5:Brine {id: 'BRINE-LI-002', name: 'Salar de Uyuni', country: 'Bolivia', region: 'Potosí', material: 'Lithium Brine', concentration_ppm: 300, capacity_kt_year: 50, development_stage: 'Pilot'}),
(mine_li6:Brine {id: 'BRINE-LI-003', name: 'Cauchari-Olaroz', country: 'Argentina', region: 'Jujuy', material: 'Lithium Brine', concentration_ppm: 580, capacity_kt_year: 40}),
(mine_li7:Brine {id: 'BRINE-LI-004', name: 'Hombre Muerto', country: 'Argentina', region: 'Catamarca', material: 'Lithium Brine', concentration_ppm: 620, capacity_kt_year: 42.5, owner: 'Livent'}),
(mine_li8:Mine {id: 'MINE-LI-004', name: 'Jiajika Mine', country: 'China', region: 'Sichuan', material: 'Lithium Spodumene', grade_percent: 1.4, capacity_kt_year: 250}),
(mine_li9:Mine {id: 'MINE-LI-005', name: 'Mt Marion Mine', country: 'Australia', region: 'Western Australia', material: 'Lithium Spodumene', grade_percent: 1.4, capacity_kt_year: 450}),
(mine_li10:Mine {id: 'MINE-LI-006', name: 'Wodgina Mine', country: 'Australia', region: 'Western Australia', material: 'Lithium Spodumene', grade_percent: 1.1, capacity_kt_year: 750});

// Cobalt Mines (12+ DRC operations + others)
CREATE (mine_co1:Mine {id: 'MINE-CO-001', name: 'Tenke Fungurume Mine', country: 'DRC', region: 'Lualaba', material: 'Copper-Cobalt Ore', cobalt_grade_percent: 0.43, capacity_kt_year: 18, owner: 'CMOC', ethical_rating: 'C', artisanal_mining_risk: true}),
(mine_co2:Mine {id: 'MINE-CO-002', name: 'Mutanda Mine', country: 'DRC', region: 'Lualaba', material: 'Copper-Cobalt Ore', cobalt_grade_percent: 0.67, capacity_kt_year: 27, owner: 'Glencore', status: 'Care & Maintenance'}),
(mine_co3:Mine {id: 'MINE-CO-003', name: 'Kamoto Mine', country: 'DRC', region: 'Lualaba', material: 'Copper-Cobalt Ore', cobalt_grade_percent: 0.52, capacity_kt_year: 22, owner: 'Glencore/Gécamines'}),
(mine_co4:Mine {id: 'MINE-CO-004', name: 'Kisanfu Mine', country: 'DRC', region: 'Lualaba', material: 'Copper-Cobalt Ore', cobalt_grade_percent: 0.45, capacity_kt_year: 16, owner: 'CMOC'}),
(mine_co5:Mine {id: 'MINE-CO-005', name: 'Etoile Mine', country: 'DRC', region: 'Lualaba', material: 'Cobalt Ore', cobalt_grade_percent: 3.8, capacity_kt_year: 8, owner: 'ERG Africa'}),
(mine_co6:Mine {id: 'MINE-CO-006', name: 'Boss Mining', country: 'DRC', region: 'Haut-Katanga', material: 'Cobalt Ore', cobalt_grade_percent: 2.1, capacity_kt_year: 5, artisanal_operations: true, child_labor_risk: 'High'}),
(mine_co7:Mine {id: 'MINE-CO-007', name: 'Murrin Murrin', country: 'Australia', region: 'Western Australia', material: 'Nickel-Cobalt Laterite', cobalt_grade_percent: 0.08, capacity_kt_year: 3.5, ethical_rating: 'A'});

// Rare Earth Mines (8+ concentrated in China)
CREATE (mine_ree1:Mine {id: 'MINE-REE-001', name: 'Bayan Obo Mine', country: 'China', region: 'Inner Mongolia', material: 'REE-Iron Ore', ree_grade_percent: 5.2, capacity_kt_year: 70, owner: 'China Northern Rare Earth', export_restrictions: true}),
(mine_ree2:Mine {id: 'MINE-REE-002', name: 'Mountain Pass Mine', country: 'USA', region: 'California', material: 'Bastnaesite REE Ore', ree_grade_percent: 8.9, capacity_kt_year: 38, owner: 'MP Materials'}),
(mine_ree3:Mine {id: 'MINE-REE-003', name: 'Mount Weld Mine', country: 'Australia', region: 'Western Australia', material: 'REE Ore', ree_grade_percent: 7.9, capacity_kt_year: 22, owner: 'Lynas'}),
(mine_ree4:Mine {id: 'MINE-REE-004', name: 'Jiangxi Ion-Adsorption Clay', country: 'China', region: 'Jiangxi', material: 'Heavy REE Clay', ree_grade_percent: 0.15, capacity_kt_year: 12, heavy_ree_rich: true}),
(mine_ree5:Mine {id: 'MINE-REE-005', name: 'Mianning-Dechang REE Belt', country: 'China', region: 'Sichuan', material: 'Bastnaesite', ree_grade_percent: 3.5, capacity_kt_year: 25});

// Gold (for bonding wire & contacts)
CREATE (mine_au1:Mine {id: 'MINE-AU-001', name: 'Muruntau Mine', country: 'Uzbekistan', region: 'Qizilqum', material: 'Gold Ore', grade_g_t: 2.1, capacity_oz_year: 2000000}),
(mine_au2:Mine {id: 'MINE-AU-002', name: 'Grasberg Gold', country: 'Indonesia', region: 'Papua', material: 'Gold-Copper Ore', grade_g_t: 0.89, capacity_oz_year: 1500000}),
(mine_au3:Mine {id: 'MINE-AU-003', name: 'Nevada Gold Mines', country: 'USA', region: 'Nevada', material: 'Gold Ore', grade_g_t: 1.45, capacity_oz_year: 3300000});

// Silver (for conductive paste & contacts)
CREATE (mine_ag1:Mine {id: 'MINE-AG-001', name: 'Cannington Mine', country: 'Australia', region: 'Queensland', material: 'Lead-Zinc-Silver Ore', silver_grade_g_t: 178, capacity_moz_year: 22}),
(mine_ag2:Mine {id: 'MINE-AG-002', name: 'Penasquito Mine', country: 'Mexico', region: 'Zacatecas', material: 'Gold-Silver-Lead-Zinc', silver_grade_g_t: 51, capacity_moz_year: 24});

// Tantalum (for capacitors)
CREATE (mine_ta1:Mine {id: 'MINE-TA-001', name: 'Wodgina Tantalum', country: 'Australia', region: 'Western Australia', material: 'Tantalum Ore', grade_ppm: 180, capacity_kt_year: 1.2, conflict_free: true}),
(mine_ta2:Mine {id: 'MINE-TA-002', name: 'Greenbushes Tantalum', country: 'Australia', region: 'Western Australia', material: 'Tantalum Ore', grade_ppm: 95, capacity_kt_year: 0.8}),
(mine_ta3:Mine {id: 'MINE-TA-003', name: 'Artisanal Tantalum DRC', country: 'DRC', region: 'North Kivu', material: 'Coltan', grade_ppm: 420, capacity_kt_year: 0.15, conflict_mineral: true, certification_required: true});

// Tin (for solder)
CREATE (mine_sn1:Mine {id: 'MINE-SN-001', name: 'Renison Bell Mine', country: 'Australia', region: 'Tasmania', material: 'Tin Ore', grade_percent: 1.2, capacity_kt_year: 7}),
(mine_sn2:Mine {id: 'MINE-SN-002', name: 'Bangka-Belitung Tin', country: 'Indonesia', region: 'Bangka', material: 'Tin Ore', grade_percent: 0.8, capacity_kt_year: 35, offshore_dredging: true});

// Tungsten (for vibration motors)
CREATE (mine_w1:Mine {id: 'MINE-W-001', name: 'Xihuashan Mine', country: 'China', region: 'Jiangxi', material: 'Tungsten Ore', grade_percent: 0.45, capacity_kt_year: 12});

// Nickel (for batteries & stainless steel)
CREATE (mine_ni1:Mine {id: 'MINE-NI-001', name: 'Norilsk Nickel Operations', country: 'Russia', region: 'Norilsk', material: 'Nickel-Copper-PGM Sulfide', grade_percent: 3.2, capacity_kt_year: 220}),
(mine_ni2:Mine {id: 'MINE-NI-002', name: 'Sudbury Basin', country: 'Canada', region: 'Ontario', material: 'Nickel-Copper Sulfide', grade_percent: 1.8, capacity_kt_year: 45}),
(mine_ni3:Mine {id: 'MINE-NI-003', name: 'Indonesian Nickel Laterite', country: 'Indonesia', region: 'Sulawesi', material: 'Nickel Laterite', grade_percent: 1.5, capacity_kt_year: 180});

// Aluminum/Bauxite
CREATE (mine_al1:Mine {id: 'MINE-AL-001', name: 'Weipa Bauxite Mine', country: 'Australia', region: 'Queensland', material: 'Bauxite', grade_percent: 51, capacity_mt_year: 35}),
(mine_al2:Mine {id: 'MINE-AL-002', name: 'Boddington Bauxite', country: 'Australia', region: 'Western Australia', material: 'Bauxite', grade_percent: 48, capacity_mt_year: 28}),
(mine_al3:Mine {id: 'MINE-AL-003', name: 'Guinea Bauxite Belt', country: 'Guinea', region: 'Boké', material: 'Bauxite', grade_percent: 60, capacity_mt_year: 82});

// Silicon (metallurgical grade)
CREATE (mine_si1:Quarry {id: 'QUAR-SI-001', name: 'Elkem Quartz Norway', country: 'Norway', region: 'Tana', material: 'High-Purity Quartz', purity_percent: 99.98, capacity_kt_year: 85}),
(mine_si2:Quarry {id: 'QUAR-SI-002', name: 'Spruce Pine Quartz', country: 'USA', region: 'North Carolina', material: 'Ultra-High-Purity Quartz', purity_percent: 99.997, capacity_kt_year: 30, semiconductor_grade: true}),
(mine_si3:Quarry {id: 'QUAR-SI-003', name: 'Jiangsu Quartz', country: 'China', region: 'Jiangsu', material: 'Quartz Sand', purity_percent: 99.5, capacity_kt_year: 450});

// Graphite (for anodes)
CREATE (mine_c1:Mine {id: 'MINE-C-001', name: 'Heilongjiang Graphite', country: 'China', region: 'Heilongjiang', material: 'Natural Graphite', grade_percent: 8.5, capacity_kt_year: 650}),
(mine_c2:Mine {id: 'MINE-C-002', name: 'Syrah Balama', country: 'Mozambique', region: 'Cabo Delgado', material: 'Natural Flake Graphite', grade_percent: 16.2, capacity_kt_year: 350});

// Manganese (for battery cathodes)
CREATE (mine_mn1:Mine {id: 'MINE-MN-001', name: 'Kalahari Manganese', country: 'South Africa', region: 'Northern Cape', material: 'Manganese Ore', grade_percent: 37, capacity_mt_year: 4.4});

// Platinum Group Metals (for catalysts)
CREATE (mine_pgm1:Mine {id: 'MINE-PGM-001', name: 'Bushveld Complex', country: 'South Africa', region: 'Limpopo', material: 'PGM Reef', pgm_grade_g_t: 4.2, capacity_moz_year: 4.5});

// Indium (for ITO displays)
CREATE (refine_in1:Refinery {id: 'REF-IN-001', name: 'Zhuzhou Smelter Indium', country: 'China', region: 'Hunan', material: 'Indium', source: 'Zinc refining byproduct', capacity_t_year: 180});

// ==================== TIER 6: PRIMARY PROCESSING & SMELTING ====================

// Copper Smelters & Refineries (40+ facilities)
CREATE (smelt_cu1:Smelter {id: 'SMELT-CU-001', name: 'Escondida Concentrator', country: 'Chile', region: 'Atacama', input: 'Copper Ore', output: 'Copper Concentrate', capacity_kt_year: 1180, output_grade_percent: 28}),
(refine_cu1:Refinery {id: 'REF-CU-001', name: 'Altonorte Smelter', country: 'Chile', region: 'Antofagasta', input: 'Copper Concentrate', output: 'Copper Anode', capacity_kt_year: 680, owner: 'Glencore'}),
(refine_cu2:Refinery {id: 'REF-CU-002', name: 'Chuquicamata Refinery', country: 'Chile', region: 'Antofagasta', input: 'Copper Anode', output: 'Copper Cathode 99.99%', capacity_kt_year: 520, owner: 'Codelco'}),
(refine_cu3:Refinery {id: 'REF-CU-003', name: 'Las Ventanas Smelter', country: 'Chile', region: 'Valparaíso', input: 'Copper Concentrate', output: 'Copper Cathode', capacity_kt_year: 380}),
(refine_cu4:Refinery {id: 'REF-CU-004', name: 'Gresik Smelter', country: 'Indonesia', region: 'East Java', input: 'Copper Concentrate', output: 'Copper Cathode', capacity_kt_year: 300}),
(refine_cu5:Refinery {id: 'REF-CU-005', name: 'Onsan Copper Refinery', country: 'South Korea', region: 'Ulsan', input: 'Copper Concentrate', output: 'Copper Cathode 99.99%', capacity_kt_year: 460, owner: 'LS-Nikko'}),
(refine_cu6:Refinery {id: 'REF-CU-006', name: 'Onahama Smelter', country: 'Japan', region: 'Fukushima', input: 'Copper Concentrate', output: 'Copper Cathode', capacity_kt_year: 280, owner: 'Pan Pacific Copper'}),
(refine_cu7:Refinery {id: 'REF-CU-007', name: 'Jiangxi Copper Refinery', country: 'China', region: 'Jiangxi', input: 'Copper Concentrate', output: 'Copper Cathode', capacity_kt_year: 920}),
(refine_cu8:Refinery {id: 'REF-CU-008', name: 'Guixi Smelter', country: 'China', region: 'Jiangxi', input: 'Copper Concentrate', output: 'Copper Cathode', capacity_kt_year: 480}),
(refine_cu9:Refinery {id: 'REF-CU-009', name: 'Jinchuan Copper Refinery', country: 'China', region: 'Gansu', input: 'Copper-Nickel Concentrate', output: 'Copper Cathode', capacity_kt_year: 300}),
(refine_cu10:Refinery {id: 'REF-CU-010', name: 'Kennecott Utah Copper', country: 'USA', region: 'Utah', input: 'Copper Ore', output: 'Copper Cathode', capacity_kt_year: 280});

// Lithium Processors (15+ conversion plants)
CREATE (proc_li1:Processor {id: 'PROC-LI-001', name: 'Tianqi Kwinana', country: 'Australia', region: 'Western Australia', input: 'Lithium Spodumene Concentrate', output: 'Lithium Hydroxide Monohydrate', capacity_kt_year: 48, purity_percent: 99.5}),
(proc_li2:Processor {id: 'PROC-LI-002', name: 'Tianqi Shehong', country: 'China', region: 'Sichuan', input: 'Lithium Spodumene Concentrate', output: 'Lithium Carbonate', capacity_kt_year: 25, owner: 'Tianqi Lithium'}),
(proc_li3:Processor {id: 'PROC-LI-003', name: 'Albemarle Silver Peak', country: 'USA', region: 'Nevada', input: 'Lithium Brine', output: 'Lithium Carbonate', capacity_kt_year: 5}),
(proc_li4:Processor {id: 'PROC-LI-004', name: 'Albemarle La Negra', country: 'Chile', region: 'Antofagasta', input: 'Lithium Brine', output: 'Lithium Carbonate', capacity_kt_year: 80}),
(proc_li5:Processor {id: 'PROC-LI-005', name: 'SQM Carmen', country: 'Chile', region: 'Antofagasta', input: 'Lithium Brine', output: 'Lithium Carbonate', capacity_kt_year: 120}),
(proc_li6:Processor {id: 'PROC-LI-006', name: 'Ganfeng Jiangxi Plant 1', country: 'China', region: 'Jiangxi', input: 'Lithium Concentrate', output: 'Lithium Hydroxide', capacity_kt_year: 60}),
(proc_li7:Processor {id: 'PROC-LI-007', name: 'Ganfeng Jiangxi Plant 2', country: 'China', region: 'Jiangxi', input: 'Lepidolite', output: 'Lithium Carbonate', capacity_kt_year: 40}),
(proc_li8:Processor {id: 'PROC-LI-008', name: 'Livent Argentina', country: 'Argentina', region: 'Catamarca', input: 'Lithium Brine', output: 'Lithium Hydroxide', capacity_kt_year: 20}),
(proc_li9:Processor {id: 'PROC-LI-009', name: 'Sichuan Yahua', country: 'China', region: 'Sichuan', input: 'Lepidolite', output: 'Lithium Carbonate', capacity_kt_year: 25}),
(proc_li10:Processor {id: 'PROC-LI-010', name: 'Pilbara Processing', country: 'China', region: 'Jiangxi', input: 'Spodumene Concentrate', output: 'Lithium Hydroxide', capacity_kt_year: 32});

// Cobalt Refineries (8+ facilities)
CREATE (refine_co1:Refinery {id: 'REF-CO-001', name: 'Umicore Olen Refinery', country: 'Belgium', region: 'Antwerp', input: 'Cobalt Hydroxide', output: 'Cobalt Metal & Cobalt Sulfate', capacity_kt_year: 18, purity_percent: 99.8, rba_certified: true}),
(refine_co2:Refinery {id: 'REF-CO-002', name: 'Jinchuan Cobalt', country: 'China', region: 'Gansu', input: 'Cobalt Concentrate', output: 'Cobalt Sulfate', capacity_kt_year: 25}),
(refine_co3:Refinery {id: 'REF-CO-003', name: 'Zhejiang Huayou Tongxiang', country: 'China', region: 'Zhejiang', input: 'Cobalt Hydroxide', output: 'Cobalt Sulfate', capacity_kt_year: 45, owner: 'Huayou Cobalt'}),
(refine_co4:Refinery {id: 'REF-CO-004', name: 'GEM Jingmen', country: 'China', region: 'Hubei', input: 'Cobalt Intermediates', output: 'Cobalt Sulfate', capacity_kt_year: 30, recycling_facility: true}),
(refine_co5:Refinery {id: 'REF-CO-005', name: 'CMOC Tenke', country: 'DRC', region: 'Lualaba', input: 'Copper-Cobalt Ore', output: 'Cobalt Hydroxide', capacity_kt_year: 18}),
(refine_co6:Refinery {id: 'REF-CO-006', name: 'Glencore Nikkelverk', country: 'Norway', region: 'Kristiansand', input: 'Nickel-Cobalt Matte', output: 'Cobalt Metal', capacity_kt_year: 4.5, purity_percent: 99.95});

// REE Processing (5+ separation facilities - highly concentrated)
CREATE (proc_ree1:Processor {id: 'PROC-REE-001', name: 'Baotou Steel Rare Earth', country: 'China', region: 'Inner Mongolia', input: 'REE Concentrate', output: 'Separated REE Oxides', capacity_kt_year: 65, owner: 'China Northern Rare Earth'}),
(proc_ree2:Processor {id: 'PROC-REE-002', name: 'Ganzhou Rare Earth', country: 'China', region: 'Jiangxi', input: 'Ion-Adsorption REE', output: 'Heavy REE Oxides', capacity_kt_year: 8, heavy_ree_specialist: true}),
(proc_ree3:Processor {id: 'PROC-REE-003', name: 'MP Materials Processing', country: 'USA', region: 'California', input: 'Bastnaesite Concentrate', output: 'REE Concentrate', capacity_kt_year: 38, separation_planned: 2025}),
(proc_ree4:Processor {id: 'PROC-REE-004', name: 'Lynas Malaysia', country: 'Malaysia', region: 'Kuantan', input: 'REE Concentrate', output: 'Separated REE Products', capacity_kt_year: 22, owner: 'Lynas Rare Earths'}),
(proc_ree5:Processor {id: 'PROC-REE-005', name: 'Shenghe Resources', country: 'China', region: 'Sichuan', input: 'REE Concentrate', output: 'REE Oxides & Metals', capacity_kt_year: 28});

// Gold & Silver Refineries
CREATE (refine_au1:Refinery {id: 'REF-AU-001', name: 'Rand Refinery', country: 'South Africa', region: 'Gauteng', input: 'Gold Doré', output: 'Gold 99.99%', capacity_oz_year: 15000000}),
(refine_au2:Refinery {id: 'REF-AU-002', name: 'Valcambi Refinery', country: 'Switzerland', region: 'Ticino', input: 'Gold Doré', output: 'Gold 99.999%', capacity_oz_year: 5000000}),
(refine_au3:Refinery {id: 'REF-AU-003', name: 'Tanaka Kikinzoku', country: 'Japan', region: 'Tokyo', input: 'Gold Scrap & Doré', output: 'Gold Wire 99.999%', capacity_oz_year: 2000000, bonding_wire_specialist: true});

// Nickel Processing
CREATE (refine_ni1:Refinery {id: 'REF-NI-001', name: 'Norilsk Nickel Refinery', country: 'Russia', region: 'Norilsk', input: 'Nickel Matte', output: 'Nickel Metal', capacity_kt_year: 220}),
(refine_ni2:Refinery {id: 'REF-NI-002', name: 'Jinchuan Nickel', country: 'China', region: 'Gansu', input: 'Nickel Sulfide', output: 'Nickel Sulfate', capacity_kt_year: 150}),
(refine_ni3:Refinery {id: 'REF-NI-003', name: 'Sumitomo Metal Mining Niihama', country: 'Japan', region: 'Ehime', input: 'Nickel Matte', output: 'High-Purity Nickel', capacity_kt_year: 60});

// Aluminum Smelters
CREATE (smelt_al1:Smelter {id: 'SMELT-AL-001', name: 'Alcoa Portland', country: 'Australia', region: 'Victoria', input: 'Alumina', output: 'Aluminum Ingot', capacity_kt_year: 360}),
(smelt_al2:Smelter {id: 'SMELT-AL-002', name: 'Hongqiao Smelter', country: 'China', region: 'Shandong', input: 'Alumina', output: 'Aluminum Ingot', capacity_kt_year: 6500}),
(smelt_al3:Smelter {id: 'SMELT-AL-003', name: 'Rio Tinto Kitimat', country: 'Canada', region: 'British Columbia', input: 'Alumina', output: 'Aluminum Ingot', capacity_kt_year: 432});

// Silicon Metal & Polysilicon
CREATE (smelt_si1:Smelter {id: 'SMELT-SI-001', name: 'Elkem Silicon Products', country: 'Norway', region: 'Kristiansand', input: 'Quartz + Carbon', output: 'Metallurgical Silicon', capacity_kt_year: 180}),
(proc_si1:Processor {id: 'PROC-SI-001', name: 'Wacker Polysilicon', country: 'Germany', region: 'Burghausen', input: 'Metallurgical Silicon', output: 'Polysilicon 99.9999999%', capacity_kt_year: 80}),
(proc_si2:Processor {id: 'PROC-SI-002', name: 'GCL-Poly Xuzhou', country: 'China', region: 'Jiangsu', input: 'Metallurgical Silicon', output: 'Polysilicon', capacity_kt_year: 120}),
(proc_si3:Processor {id: 'PROC-SI-003', name: 'Hemlock Semiconductor', country: 'USA', region: 'Michigan', input: 'Metallurgical Silicon', output: 'Polysilicon 11N', capacity_kt_year: 45});

// Tantalum Processing
CREATE (proc_ta1:Processor {id: 'PROC-TA-001', name: 'Global Advanced Metals Boyertown', country: 'USA', region: 'Pennsylvania', input: 'Tantalum Concentrate', output: 'Tantalum Powder', capacity_t_year: 800, conflict_free_certified: true}),
(proc_ta2:Processor {id: 'PROC-TA-002', name: 'Ningxia Orient Tantalum', country: 'China', region: 'Ningxia', input: 'Tantalum Ore', output: 'Tantalum Powder', capacity_t_year: 1200});

// ==================== TIER 5: ADVANCED MATERIAL MANUFACTURING ====================

// Copper Foil (for PCBs & batteries) - 15 manufacturers
CREATE (mat_cu_foil1:MaterialMfg {id: 'MAT-CU-FOIL-001', name: 'Mitsui Copper Foil', country: 'Japan', region: 'Tsu', product: 'ED Copper Foil 6μm', application: 'PCB', capacity_million_sqm_year: 120, thickness_um: 6}),
(mat_cu_foil2:MaterialMfg {id: 'MAT-CU-FOIL-002', name: 'Fukuda Metal Foil', country: 'Japan', region: 'Kyoto', product: 'Rolled Copper Foil 8μm', application: 'Battery Current Collector', capacity_million_sqm_year: 200}),
(mat_cu_foil3:MaterialMfg {id: 'MAT-CU-FOIL-003', name: 'ILJIN Materials', country: 'South Korea', region: 'Ansan', product: 'ED Copper Foil 9μm', application: 'PCB', capacity_million_sqm_year: 180}),
(mat_cu_foil4:MaterialMfg {id: 'MAT-CU-FOIL-004', name: 'Nuode Investment', country: 'China', region: 'Guangdong', product: 'ED Copper Foil', capacity_million_sqm_year: 450}),
(mat_cu_foil5:MaterialMfg {id: 'MAT-CU-FOIL-005', name: 'Circuit Foil Luxembourg', country: 'Luxembourg', product: 'HTE Copper Foil 12μm', application: 'High-frequency PCB', capacity_million_sqm_year: 95}),
(mat_cu_foil6:MaterialMfg {id: 'MAT-CU-FOIL-006', name: 'JX Nippon Mining Copper Foil', country: 'Japan', region: 'Ibaraki', product: 'VLP Copper Foil 5μm', application: 'HDI PCB', capacity_million_sqm_year: 110}),
(mat_cu_foil7:MaterialMfg {id: 'MAT-CU-FOIL-007', name: 'Chang Chun Petrochemical', country: 'Taiwan', region: 'Kaohsiung', product: 'ED Copper Foil 12μm', capacity_million_sqm_year: 85}),
(mat_cu_foil8:MaterialMfg {id: 'MAT-CU-FOIL-008', name: 'Co-Tech Development', country: 'Taiwan', region: 'Hsinchu', product: 'Rolled Copper Foil', capacity_million_sqm_year: 70}),
(mat_cu_foil9:MaterialMfg {id: 'MAT-CU-FOIL-009', name: 'Furukawa Electric Foil', country: 'Japan', region: 'Tochigi', product: 'Ultra-thin Cu Foil 3μm', capacity_million_sqm_year: 55}),
(mat_cu_foil10:MaterialMfg {id: 'MAT-CU-FOIL-010', name: 'LS Mtron Copper Foil', country: 'South Korea', region: 'Anyang', product: 'ED Copper Foil', capacity_million_sqm_year: 120}),
(mat_cu_foil11:MaterialMfg {id: 'MAT-CU-FOIL-011', name: 'Tongling Nonferrous Foil', country: 'China', region: 'Anhui', product: 'Battery Copper Foil', capacity_million_sqm_year: 280}),
(mat_cu_foil12:MaterialMfg {id: 'MAT-CU-FOIL-012', name: 'Lingbao Wason Copper Foil', country: 'China', region: 'Henan', product: 'Lithium Battery Foil', capacity_million_sqm_year: 320}),
(mat_cu_foil13:MaterialMfg {id: 'MAT-CU-FOIL-013', name: 'Guangdong Jia Yuan Tech', country: 'China', region: 'Guangdong', product: 'ED Copper Foil 6μm', capacity_million_sqm_year: 180}),
(mat_cu_foil14:MaterialMfg {id: 'MAT-CU-FOIL-014', name: 'CCP Copper Foil', country: 'China', region: 'Jiangsu', product: 'PCB Copper Foil', capacity_million_sqm_year: 150}),
(mat_cu_foil15:MaterialMfg {id: 'MAT-CU-FOIL-015', name: 'KMCC Copper Malaysia', country: 'Malaysia', region: 'Selangor', product: 'Rolled Copper Foil', capacity_million_sqm_year: 95});

// Copper Wire (bonding wire) - 8 manufacturers
CREATE (mat_cu_wire1:MaterialMfg {id: 'MAT-CU-WIRE-001', name: 'Tanaka Kikinzoku Bonding Wire', country: 'Japan', region: 'Hiratsuka', product: 'Copper Bonding Wire 18μm', application: 'IC Packaging', capacity_million_km_year: 50}),
(mat_cu_wire2:MaterialMfg {id: 'MAT-CU-WIRE-002', name: 'Heraeus Wire Bonding', country: 'USA', region: 'West Conshohocken', product: 'Insulated Cu Wire 20μm', capacity_million_km_year: 35}),
(mat_cu_wire3:MaterialMfg {id: 'MAT-CU-WIRE-003', name: 'MK Electron', country: 'South Korea', region: 'Gimpo', product: 'Copper Bonding Wire', capacity_million_km_year: 45}),
(mat_cu_wire4:MaterialMfg {id: 'MAT-CU-WIRE-004', name: 'Nippon Micrometal', country: 'Japan', region: 'Osaka', product: 'Fine Copper Wire 15μm', capacity_million_km_year: 38}),
(mat_cu_wire5:MaterialMfg {id: 'MAT-CU-WIRE-005', name: 'Sumitomo Metal Mining Wire', country: 'Japan', region: 'Ibaraki', product: 'Cu Bonding Wire', capacity_million_km_year: 42}),
(mat_cu_wire6:MaterialMfg {id: 'MAT-CU-WIRE-006', name: 'Doublink Solders', country: 'China', region: 'Shenzhen', product: 'Copper Wire', capacity_million_km_year: 55}),
(mat_cu_wire7:MaterialMfg {id: 'MAT-CU-WIRE-007', name: 'California Fine Wire', country: 'USA', region: 'California', product: 'Ultra-fine Cu Wire 12μm', capacity_million_km_year: 28}),
(mat_cu_wire8:MaterialMfg {id: 'MAT-CU-WIRE-008', name: 'Ametek Windings', country: 'USA', region: 'Connecticut', product: 'Copper Wire for Electronics', capacity_million_km_year: 32});

// Gold Wire (critical IC bonding) - 5 manufacturers
CREATE (mat_au_wire1:MaterialMfg {id: 'MAT-AU-WIRE-001', name: 'Tanaka Gold Wire', country: 'Japan', region: 'Tokyo', product: 'Gold Bonding Wire 15μm', application: 'High-rel IC', capacity_million_km_year: 8}),
(mat_au_wire2:MaterialMfg {id: 'MAT-AU-WIRE-002', name: 'Heraeus Gold Bonding', country: 'Germany', region: 'Hanau', product: 'Gold Wire 17.5μm', capacity_million_km_year: 12}),
(mat_au_wire3:MaterialMfg {id: 'MAT-AU-WIRE-003', name: 'Kulicke & Soffa Wire', country: 'Singapore', product: 'Au Wire 20μm', capacity_million_km_year: 6});

// Silicon Wafers (300mm) - 6 major manufacturers
CREATE (mat_si_wafer1:MaterialMfg {id: 'MAT-SI-WAFER-001', name: 'Shin-Etsu Handotai', country: 'Japan', region: 'Gunma', product: '300mm Silicon Wafer Polished', resistivity_ohm_cm: 10, capacity_million_wafers_year: 36}),
(mat_si_wafer2:MaterialMfg {id: 'MAT-SI-WAFER-002', name: 'SUMCO Imari', country: 'Japan', region: 'Saga', product: '300mm Silicon Wafer', capacity_million_wafers_year: 28}),
(mat_si_wafer3:MaterialMfg {id: 'MAT-SI-WAFER-003', name: 'GlobalWafers Taiwan', country: 'Taiwan', region: 'Taoyuan', product: '300mm SOI Wafer', capacity_million_wafers_year: 20}),
(mat_si_wafer4:MaterialMfg {id: 'MAT-SI-WAFER-004', name: 'SK Siltron', country: 'South Korea', region: 'Gumi', product: '300mm Silicon Wafer', capacity_million_wafers_year: 24}),
(mat_si_wafer5:MaterialMfg {id: 'MAT-SI-WAFER-005', name: 'Siltronic Munich', country: 'Germany', region: 'Bavaria', product: '300mm Silicon Wafer', capacity_million_wafers_year: 18});

// Glass Substrates (displays) - 5 manufacturers
CREATE (mat_glass1:MaterialMfg {id: 'MAT-GLASS-001', name: 'Corning Display Technologies', country: 'USA', region: 'Corning NY', product: 'EAGLE XG Glass Substrate', application: 'AMOLED Display', capacity_million_sqm_year: 45}),
(mat_glass2:MaterialMfg {id: 'MAT-GLASS-002', name: 'AGC Fine Techno Korea', country: 'South Korea', region: 'Gumi', product: 'Glass Substrate Gen 6', capacity_million_sqm_year: 28}),
(mat_glass3:MaterialMfg {id: 'MAT-GLASS-003', name: 'NEG Shiga', country: 'Japan', region: 'Shiga', product: 'OA-10G Glass', application: 'Display', capacity_million_sqm_year: 35, owner: 'Nippon Electric Glass'}),
(mat_glass4:MaterialMfg {id: 'MAT-GLASS-004', name: 'Schott Display Glass', country: 'Germany', region: 'Grünenplan', product: 'Borosilicate Display Glass', capacity_million_sqm_year: 15});

// Cover Glass (Gorilla Glass, etc) - 4 manufacturers
CREATE (mat_cover1:MaterialMfg {id: 'MAT-COVER-001', name: 'Corning Gorilla Glass', country: 'USA', region: 'Harrodsburg KY', product: 'Gorilla Glass Victus 2', strength_mpa: 800, capacity_million_units_year: 500}),
(mat_cover2:MaterialMfg {id: 'MAT-COVER-002', name: 'AGC Dragontrail', country: 'Japan', region: 'Takasago', product: 'Dragontrail Pro', strength_mpa: 780, capacity_million_units_year: 280}),
(mat_cover3:MaterialMfg {id: 'MAT-COVER-003', name: 'Schott Xensation', country: 'Germany', region: 'Mainz', product: 'Xensation Up', capacity_million_units_year: 150});

// Optical Glass (camera lenses) - 6 manufacturers
CREATE (mat_optic1:MaterialMfg {id: 'MAT-OPTIC-001', name: 'Schott Optical Glass', country: 'Germany', region: 'Mainz', product: 'N-BK7 Optical Glass', refractive_index: 1.5168, capacity_tonnes_year: 12000}),
(mat_optic2:MaterialMfg {id: 'MAT-OPTIC-002', name: 'Ohara Optical Glass', country: 'Japan', region: 'Sagamihara', product: 'S-LAH79 High-Index Glass', refractive_index: 2.0033, capacity_tonnes_year: 8500}),
(mat_optic3:MaterialMfg {id: 'MAT-OPTIC-003', name: 'Hoya Optical Glass', country: 'Japan', region: 'Tokyo', product: 'ED Glass Low Dispersion', capacity_tonnes_year: 6800}),
(mat_optic4:MaterialMfg {id: 'MAT-OPTIC-004', name: 'CDGM Glass', country: 'China', region: 'Chengdu', product: 'H-ZF88 Flint Glass', capacity_tonnes_year: 15000}),
(mat_optic5:MaterialMfg {id: 'MAT-OPTIC-005', name: 'Sumita Optical Glass', country: 'Japan', region: 'Saitama', product: 'K-PSFn214 High-Index Glass', refractive_index: 1.9229, capacity_tonnes_year: 5200}),
(mat_optic6:MaterialMfg {id: 'MAT-OPTIC-006', name: 'NHG Hubei Optics', country: 'China', region: 'Hubei', product: 'Optical Glass Blanks', capacity_tonnes_year: 9500});

// Cathode Materials (NMC, NCA, LFP) - 12 manufacturers
CREATE (mat_cathode1:MaterialMfg {id: 'MAT-CATH-001', name: 'LG Chem Cathode Plant', country: 'South Korea', region: 'Ochang', product: 'NMC 811 Cathode', nickel_percent: 80, capacity_kt_year: 120}),
(mat_cathode2:MaterialMfg {id: 'MAT-CATH-002', name: 'CATL Cathode Division', country: 'China', region: 'Fujian', product: 'NMC 622 Cathode', capacity_kt_year: 180}),
(mat_cathode3:MaterialMfg {id: 'MAT-CATH-003', name: 'Umicore Cathode Materials', country: 'South Korea', region: 'Cheonan', product: 'NMC 90-5-5 Cathode', nickel_percent: 90, capacity_kt_year: 80}),
(mat_cathode4:MaterialMfg {id: 'MAT-CATH-004', name: 'Sumitomo Metal Mining Cathode', country: 'Japan', region: 'Ibaraki', product: 'NCA Cathode', capacity_kt_year: 45}),
(mat_cathode5:MaterialMfg {id: 'MAT-CATH-005', name: 'BASF Cathode Active Materials', country: 'Finland', region: 'Harjavalta', product: 'NMC Precursor & CAM', capacity_kt_year: 50}),
(mat_cathode6:MaterialMfg {id: 'MAT-CATH-006', name: 'BYD LFP Cathode', country: 'China', region: 'Shenzhen', product: 'LiFePO4 Cathode', capacity_kt_year: 200}),
(mat_cathode7:MaterialMfg {id: 'MAT-CATH-007', name: 'Ronbay Technology', country: 'China', region: 'Guangdong', product: 'NMC 811 & LFP', capacity_kt_year: 95}),
(mat_cathode8:MaterialMfg {id: 'MAT-CATH-008', name: 'Ecopro BM', country: 'South Korea', region: 'Pohang', product: 'NCMA Cathode', capacity_kt_year: 65});

// Anode Materials (Graphite, Silicon) - 10 manufacturers
CREATE (mat_anode1:MaterialMfg {id: 'MAT-ANODE-001', name: 'Hitachi Chemical Anode', country: 'Japan', region: 'Ibaraki', product: 'Artificial Graphite Anode', capacity_kt_year: 35}),
(mat_anode2:MaterialMfg {id: 'MAT-ANODE-002', name: 'BTR New Energy', country: 'China', region: 'Shenzhen', product: 'Graphite Anode', capacity_kt_year: 180}),
(mat_anode3:MaterialMfg {id: 'MAT-ANODE-003', name: 'Shanshan Technology', country: 'China', region: 'Ningbo', product: 'Graphite + Silicon Anode', capacity_kt_year: 150}),
(mat_anode4:MaterialMfg {id: 'MAT-ANODE-004', name: 'Nippon Carbon Anode', country: 'Japan', region: 'Tokyo', product: 'High-Capacity Graphite', capacity_kt_year: 25}),
(mat_anode5:MaterialMfg {id: 'MAT-ANODE-005', name: 'Posco Chemical Anode', country: 'South Korea', region: 'Gwangyang', product: 'Natural+Artificial Graphite', capacity_kt_year: 80});

// Battery Separators - 8 manufacturers
CREATE (mat_sep1:MaterialMfg {id: 'MAT-SEP-001', name: 'Celgard Charlotte', country: 'USA', region: 'North Carolina', product: 'PE Separator 20μm', application: 'Li-ion Battery', capacity_million_sqm_year: 800}),
(mat_sep2:MaterialMfg {id: 'MAT-SEP-002', name: 'Asahi Kasei E-materials', country: 'Japan', region: 'Moriyama', product: 'Ceramic-Coated Separator', capacity_million_sqm_year: 500}),
(mat_sep3:MaterialMfg {id: 'MAT-SEP-003', name: 'SK IE Technology', country: 'South Korea', region: 'Chungju', product: 'CCS Separator', capacity_million_sqm_year: 1200}),
(mat_sep4:MaterialMfg {id: 'MAT-SEP-004', name: 'Toray Battery Separator', country: 'Japan', region: 'Shiga', product: 'Microporous PP/PE', capacity_million_sqm_year: 400}),
(mat_sep5:MaterialMfg {id: 'MAT-SEP-005', name: 'Senior Technology', country: 'China', region: 'Shanghai', product: 'Wet-Process Separator', capacity_million_sqm_year: 900});

// Electrolyte - 8 manufacturers
CREATE (mat_elec1:MaterialMfg {id: 'MAT-ELEC-001', name: 'Mitsubishi Chemical Electrolyte', country: 'Japan', region: 'Yokkaichi', product: 'LiPF6 Electrolyte Solution', capacity_kt_year: 25}),
(mat_elec2:MaterialMfg {id: 'MAT-ELEC-002', name: 'Guangzhou Tinci', country: 'China', region: 'Guangdong', product: 'Electrolyte + Additives', capacity_kt_year: 120}),
(mat_elec3:MaterialMfg {id: 'MAT-ELEC-003', name: 'Soulbrain Electrolyte', country: 'South Korea', region: 'Ulsan', product: 'High-Voltage Electrolyte', capacity_kt_year: 35});

// Rare Earth Magnets (NdFeB) - 10 manufacturers
CREATE (mat_mag1:MaterialMfg {id: 'MAT-MAG-001', name: 'Hitachi Metals Magnetics', country: 'Japan', region: 'Yasugi', product: 'NdFeB Magnet N52', application: 'Motors', capacity_kt_year: 5.2}),
(mat_mag2:MaterialMfg {id: 'MAT-MAG-002', name: 'TDK Magnetic Division', country: 'Japan', region: 'Akita', product: 'NdFeB Magnet N48H', capacity_kt_year: 4.8}),
(mat_mag3:MaterialMfg {id: 'MAT-MAG-003', name: 'Zhong Ke San Huan', country: 'China', region: 'Beijing', product: 'Sintered NdFeB', capacity_kt_year: 15}),
(mat_mag4:MaterialMfg {id: 'MAT-MAG-004', name: 'JL MAG Rare-Earth', country: 'China', region: 'Ganzhou', product: 'NdFeB Magnets', capacity_kt_year: 12}),
(mat_mag5:MaterialMfg {id: 'MAT-MAG-005', name: 'Earth-Panda Advanced Magnetic', country: 'China', region: 'Inner Mongolia', product: 'High-Temp NdFeB', capacity_kt_year: 8});

// Aluminum Alloys & Extrusions - 12 manufacturers
CREATE (mat_al1:MaterialMfg {id: 'MAT-AL-001', name: 'Norsk Hydro Precision Tubing', country: 'Norway', region: 'Raufoss', product: 'Al 6063 Extrusion', application: 'Chassis Frame', capacity_kt_year: 45}),
(mat_al2:MaterialMfg {id: 'MAT-AL-002', name: 'Alcoa Aerospace Alloys', country: 'USA', region: 'Tennessee', product: 'Al 7075-T6', strength_mpa: 572, capacity_kt_year: 38}),
(mat_al3:MaterialMfg {id: 'MAT-AL-003', name: 'Constellium Automotive', country: 'France', region: 'Issoire', product: 'Al 6061 Sheet', capacity_kt_year: 55}),
(mat_al4:MaterialMfg {id: 'MAT-AL-004', name: 'CHALCO High-End Manufacturing', country: 'China', region: 'Henan', product: 'Aluminum Unibody Blank', capacity_million_units_year: 120});

// Stainless Steel - 8 manufacturers
CREATE (mat_ss1:MaterialMfg {id: 'MAT-SS-001', name: 'Nippon Steel Stainless', country: 'Japan', region: 'Hikari', product: 'SUS 316L Sheet', thickness_mm: 0.5, capacity_kt_year: 180}),
(mat_ss2:MaterialMfg {id: 'MAT-SS-002', name: 'POSCO Stainless Steel', country: 'South Korea', region: 'Pohang', product: 'SUS 304 Coil', capacity_kt_year: 350}),
(mat_ss3:MaterialMfg {id: 'MAT-SS-003', name: 'Outokumpu Stainless', country: 'Finland', region: 'Tornio', product: 'Duplex Stainless', capacity_kt_year: 120});

// Ceramics (MLCCs, substrates) - 10 manufacturers
CREATE (mat_cer1:MaterialMfg {id: 'MAT-CER-001', name: 'Kyocera Fine Ceramics Division', country: 'Japan', region: 'Kagoshima', product: 'Alumina Substrate 96%', application: 'IC Substrate', capacity_million_units_year: 800}),
(mat_cer2:MaterialMfg {id: 'MAT-CER-002', name: 'NGK Insulators', country: 'Japan', region: 'Nagoya', product: 'Ceramic Package', capacity_million_units_year: 450}),
(mat_cer3:MaterialMfg {id: 'MAT-CER-003', name: 'CoorsTek Ceramics', country: 'USA', region: 'Colorado', product: 'Zirconia Ceramic', capacity_tonnes_year: 5500}),
(mat_cer4:MaterialMfg {id: 'MAT-CER-004', name: 'Murata Ceramic Powder', country: 'Japan', region: 'Izumo', product: 'BaTiO3 MLCC Powder', capacity_tonnes_year: 12000});

// Polymers & Plastics (specialized) - 15 manufacturers
CREATE (mat_poly1:MaterialMfg {id: 'MAT-POLY-001', name: 'SABIC Specialties', country: 'Netherlands', region: 'Bergen op Zoom', product: 'Polycarbonate Lexan', application: 'Phone Housing', capacity_kt_year: 85}),
(mat_poly2:MaterialMfg {id: 'MAT-POLY-002', name: 'Covestro Polycarbonates', country: 'Germany', region: 'Krefeld-Uerdingen', product: 'Makrolon PC', capacity_kt_year: 120}),
(mat_poly3:MaterialMfg {id: 'MAT-POLY-003', name: 'DuPont Zytel Nylon', country: 'USA', region: 'Delaware', product: 'PA66 Engineering Plastic', capacity_kt_year: 95}),
(mat_poly4:MaterialMfg {id: 'MAT-POLY-004', name: 'Toray Engineering Plastics', country: 'Japan', region: 'Nagoya', product: 'PEEK & PPS', application: 'Connectors', capacity_kt_year: 12}),
(mat_poly5:MaterialMfg {id: 'MAT-POLY-005', name: 'LG Chem ABS', country: 'South Korea', region: 'Yeosu', product: 'ABS Resin', capacity_kt_year: 200});

// Adhesives & Bonding Materials - 10 manufacturers
CREATE (mat_adh1:MaterialMfg {id: 'MAT-ADH-001', name: 'Henkel Loctite Electronics', country: 'Germany', region: 'Düsseldorf', product: 'Conductive Adhesive', application: 'Die Attach', capacity_tonnes_year: 850}),
(mat_adh2:MaterialMfg {id: 'MAT-ADH-002', name: '3M Electronics Materials', country: 'USA', region: 'Minnesota', product: 'Optically Clear Adhesive', application: 'Display Bonding', capacity_million_sqm_year: 200}),
(mat_adh3:MaterialMfg {id: 'MAT-ADH-003', name: 'Nitto Denko Adhesive Tape', country: 'Japan', region: 'Osaka', product: 'Die-Cut Adhesive Tape', capacity_million_sqm_year: 450}),
(mat_adh4:MaterialMfg {id: 'MAT-ADH-004', name: 'AI Technology Solder Paste', country: 'USA', region: 'New Jersey', product: 'SAC305 Solder Paste', capacity_tonnes_year: 650});

// Solder Alloys - 6 manufacturers
CREATE (mat_sold1:MaterialMfg {id: 'MAT-SOLD-001', name: 'Nihon Superior Solder', country: 'Japan', region: 'Osaka', product: 'SN100C Lead-Free Solder', capacity_tonnes_year: 12000}),
(mat_sold2:MaterialMfg {id: 'MAT-SOLD-002', name: 'Senju Metal Industry', country: 'Japan', region: 'Tokyo', product: 'M705 Solder', capacity_tonnes_year: 18000}),
(mat_sold3:MaterialMfg {id: 'MAT-SOLD-003', name: 'AIM Solder', country: 'Canada', region: 'Montreal', product: 'SAC305 Solder Bar', capacity_tonnes_year: 8500});

// Conductive Inks & Pastes - 6 manufacturers
CREATE (mat_ink1:MaterialMfg {id: 'MAT-INK-001', name: 'DuPont Microcircuit Materials', country: 'USA', region: 'Research Triangle', product: 'Silver Paste PV4XX', application: 'Touchscreen', capacity_tonnes_year: 450}),
(mat_ink2:MaterialMfg {id: 'MAT-INK-002', name: 'Heraeus Thick Film', country: 'Germany', region: 'Hanau', product: 'AgPd Paste', capacity_tonnes_year: 280}),
(mat_ink3:MaterialMfg {id: 'MAT-INK-003', name: 'Ferro Electronic Materials', country: 'USA', region: 'Ohio', product: 'Conductor Paste', capacity_tonnes_year: 320});

// ITO (Indium Tin Oxide) Targets - 5 manufacturers
CREATE (mat_ito1:MaterialMfg {id: 'MAT-ITO-001', name: 'JX Nippon Mining ITO', country: 'Japan', region: 'Ibaraki', product: 'ITO Sputtering Target', indium_percent: 90, capacity_tonnes_year: 180}),
(mat_ito2:MaterialMfg {id: 'MAT-ITO-002', name: 'Mitsui Mining ITO', country: 'Japan', region: 'Tokyo', product: 'ITO Target', capacity_tonnes_year: 150}),
(mat_ito3:MaterialMfg {id: 'MAT-ITO-003', name: 'Tosoh SMD ITO', country: 'Japan', region: 'Yamaguchi', product: 'ITO Sputtering Target', capacity_tonnes_year: 120});

// Carbon Fiber - 4 manufacturers
CREATE (mat_cf1:MaterialMfg {id: 'MAT-CF-001', name: 'Toray Carbon Fibers', country: 'Japan', region: 'Ehime', product: 'T800S Carbon Fiber', tensile_strength_mpa: 5490, capacity_kt_year: 28}),
(mat_cf2:MaterialMfg {id: 'MAT-CF-002', name: 'Hexcel Carbon Fiber', country: 'USA', region: 'Utah', product: 'IM7 Carbon Fiber', capacity_kt_year: 12});

// Flexible PCB Substrate (Polyimide) - 8 manufacturers
CREATE (mat_pi1:MaterialMfg {id: 'MAT-PI-001', name: 'DuPont Kapton Film', country: 'USA', region: 'Virginia', product: 'Kapton HN Polyimide', thickness_um: 25, capacity_million_sqm_year: 85}),
(mat_pi2:MaterialMfg {id: 'MAT-PI-002', name: 'Kaneka Apical Polyimide', country: 'Japan', region: 'Osaka', product: 'Apical NPI Film', capacity_million_sqm_year: 60}),
(mat_pi3:MaterialMfg {id: 'MAT-PI-003', name: 'SKC Kolon PI', country: 'South Korea', region: 'Jincheon', product: 'Colorless Polyimide', capacity_million_sqm_year: 45});

// Photoresists (for semiconductor & display) - 6 manufacturers
CREATE (mat_pr1:MaterialMfg {id: 'MAT-PR-001', name: 'JSR Photoresist', country: 'Japan', region: 'Yokkaichi', product: 'ArF Photoresist', application: '7nm/5nm Logic', capacity_kl_year: 450}),
(mat_pr2:MaterialMfg {id: 'MAT-PR-002', name: 'Tokyo Ohka Kogyo', country: 'Japan', region: 'Kawasaki', product: 'EUV Photoresist', application: '3nm Logic', capacity_kl_year: 180}),
(mat_pr3:MaterialMfg {id: 'MAT-PR-003', name: 'Shin-Etsu Chemical Photoresist', country: 'Japan', region: 'Gunma', product: 'ArF Immersion PR', capacity_kl_year: 320}),
(mat_pr4:MaterialMfg {id: 'MAT-PR-004', name: 'Sumitomo Chemical PR', country: 'Japan', region: 'Osaka', product: 'i-line Photoresist', capacity_kl_year: 280}),
(mat_pr5:MaterialMfg {id: 'MAT-PR-005', name: 'Dongjin Semichem', country: 'South Korea', region: 'Hwaseong', product: 'KrF Photoresist', capacity_kl_year: 220});

// CMP Slurries - 5 manufacturers
CREATE (mat_cmp1:MaterialMfg {id: 'MAT-CMP-001', name: 'Cabot Microelectronics', country: 'USA', region: 'Illinois', product: 'Tungsten CMP Slurry', application: 'Logic IC', capacity_kl_year: 12000}),
(mat_cmp2:MaterialMfg {id: 'MAT-CMP-002', name: 'Fujimi CMP Materials', country: 'Japan', region: 'Aichi', product: 'Silica CMP Slurry', capacity_kl_year: 8500}),
(mat_cmp3:MaterialMfg {id: 'MAT-CMP-003', name: 'Dow Electronic Materials', country: 'USA', region: 'Massachusetts', product: 'Copper CMP Slurry', capacity_kl_year: 10000});

// Specialty Gases - 8 manufacturers
CREATE (mat_gas1:MaterialMfg {id: 'MAT-GAS-001', name: 'Air Liquide Electronics', country: 'France', region: 'Grenoble', product: 'Ultra-High Purity N2', purity_9s: 6, capacity_million_m3_year: 2800}),
(mat_gas2:MaterialMfg {id: 'MAT-GAS-002', name: 'Linde Electronics', country: 'Germany', region: 'Pullach', product: 'Electronic Grade Gases', capacity_million_m3_year: 3200}),
(mat_gas3:MaterialMfg {id: 'MAT-GAS-003', name: 'Showa Denko Gases', country: 'Japan', region: 'Tokyo', product: 'Silane SiH4', purity_9s: 6, capacity_tonnes_year: 1500}),
(mat_gas4:MaterialMfg {id: 'MAT-GAS-004', name: 'Matheson Tri-Gas', country: 'USA', region: 'Texas', product: 'NF3 Etchant Gas', capacity_tonnes_year: 8000});

// ==================== TIER 4: SUB-COMPONENT MANUFACTURING ====================

// Semiconductor Fabrication (Logic/AP/SoC) - 15+ fabs
CREATE (fab_logic1:Fab {id: 'FAB-LOGIC-001', name: 'TSMC Fab 18', country: 'Taiwan', region: 'Tainan', node_nm: 3, technology: 'N3E FinFET', wafer_size_mm: 300, capacity_k_wafer_month: 120, products: ['Smartphone SoC', 'AI Chips']}),
(fab_logic2:Fab {id: 'FAB-LOGIC-002', name: 'TSMC Fab 15', country: 'Taiwan', region: 'Taichung', node_nm: 5, technology: 'N5 FinFET', capacity_k_wafer_month: 140}),
(fab_logic3:Fab {id: 'FAB-LOGIC-003', name: 'Samsung Hwaseong S3', country: 'South Korea', region: 'Hwaseong', node_nm: 3, technology: '3nm GAA', capacity_k_wafer_month: 100}),
(fab_logic4:Fab {id: 'FAB-LOGIC-004', name: 'Samsung Austin', country: 'USA', region: 'Texas', node_nm: 5, technology: '5nm LPE', capacity_k_wafer_month: 60}),
(fab_logic5:Fab {id: 'FAB-LOGIC-005', name: 'Intel Fab 42', country: 'USA', region: 'Arizona', node_nm: 4, technology: 'Intel 4', capacity_k_wafer_month: 55}),
(fab_logic6:Fab {id: 'FAB-LOGIC-006', name: 'SMIC Shanghai Fab', country: 'China', region: 'Shanghai', node_nm: 14, technology: 'FinFET', capacity_k_wafer_month: 85}),
(fab_logic7:Fab {id: 'FAB-LOGIC-007', name: 'GlobalFoundries Malta', country: 'USA', region: 'New York', node_nm: 12, technology: '12LP', capacity_k_wafer_month: 70}),
(fab_logic8:Fab {id: 'FAB-LOGIC-008', name: 'UMC Fab 12A', country: 'Taiwan', region: 'Tainan', node_nm: 28, technology: '28nm HKMG', capacity_k_wafer_month: 95});

// DRAM Fabs - 8 fabs
CREATE (fab_dram1:Fab {id: 'FAB-DRAM-001', name: 'Samsung Pyeongtaek Line 18', country: 'South Korea', region: 'Pyeongtaek', node_nm: 10, technology: '1c nm DRAM', product: 'LPDDR5X 16GB', capacity_k_wafer_month: 200}),
(fab_dram2:Fab {id: 'FAB-DRAM-002', name: 'SK Hynix M16', country: 'South Korea', region: 'Icheon', node_nm: 10, technology: '1b nm DRAM', product: 'LPDDR5', capacity_k_wafer_month: 180}),
(fab_dram3:Fab {id: 'FAB-DRAM-003', name: 'Micron Hiroshima', country: 'Japan', region: 'Higashihiroshima', node_nm: 10, technology: '1-beta DRAM', capacity_k_wafer_month: 120}),
(fab_dram4:Fab {id: 'FAB-DRAM-004', name: 'Micron Taiwan Fab 2', country: 'Taiwan', region: 'Taoyuan', node_nm: 10, technology: '1-alpha DRAM', capacity_k_wafer_month: 110}),
(fab_dram5:Fab {id: 'FAB-DRAM-005', name: 'Nanya Technology', country: 'Taiwan', region: 'Taoyuan', node_nm: 18, technology: '1X nm DRAM', capacity_k_wafer_month: 70});

// NAND Flash Fabs - 10 fabs
CREATE (fab_nand1:Fab {id: 'FAB-NAND-001', name: 'Samsung Pyeongtaek Line 19', country: 'South Korea', region: 'Pyeongtaek', technology: 'V-NAND 238-layer', product: 'UFS 4.0 512GB', capacity_k_wafer_month: 240}),
(fab_nand2:Fab {id: 'FAB-NAND-002', name: 'SK Hynix Cheongju M15', country: 'South Korea', region: 'Cheongju', technology: '238-layer 3D NAND', capacity_k_wafer_month: 200}),
(fab_nand3:Fab {id: 'FAB-NAND-003', name: 'Kioxia Yokkaichi Y6', country: 'Japan', region: 'Yokkaichi', technology: 'BiCS8 218-layer', capacity_k_wafer_month: 150, partner: 'Western Digital'}),
(fab_nand4:Fab {id: 'FAB-NAND-004', name: 'WD Kitakami', country: 'Japan', region: 'Iwate', technology: 'BiCS6 162-layer', capacity_k_wafer_month: 130}),
(fab_nand5:Fab {id: 'FAB-NAND-005', name: 'Micron Singapore', country: 'Singapore', technology: '232-layer 3D NAND', capacity_k_wafer_month: 140}),
(fab_nand6:Fab {id: 'FAB-NAND-006', name: 'Intel Dalian', country: 'China', region: 'Dalian', technology: '144-layer 3D NAND', capacity_k_wafer_month: 95}),
(fab_nand7:Fab {id: 'FAB-NAND-007', name: 'YMTC Wuhan', country: 'China', region: 'Wuhan', technology: 'Xtacking 232-layer', capacity_k_wafer_month: 120});

// RF/Analog Fabs - 8 fabs
CREATE (fab_rf1:Fab {id: 'FAB-RF-001', name: 'Qorvo Richardson', country: 'USA', region: 'Texas', technology: 'GaN on SiC', product: '5G mmWave PA', capacity_k_wafer_month: 15}),
(fab_rf2:Fab {id: 'FAB-RF-002', name: 'Skyworks Mexicali', country: 'Mexico', region: 'Baja California', technology: 'GaAs HBT', product: 'RF Front-End', capacity_k_wafer_month: 45}),
(fab_rf3:Fab {id: 'FAB-RF-003', name: 'Broadcom Fort Collins', country: 'USA', region: 'Colorado', technology: '16nm RF', product: 'WiFi 7 Chip', capacity_k_wafer_month: 35}),
(fab_rf4:Fab {id: 'FAB-RF-004', name: 'Murata Fukui RF FAB', country: 'Japan', region: 'Fukui', technology: 'SAW/BAW Filters', capacity_million_units_month: 500}),
(fab_rf5:Fab {id: 'FAB-RF-005', name: 'NXP Nijmegen', country: 'Netherlands', region: 'Nijmegen', technology: '40nm NFC', product: 'Secure Element', capacity_k_wafer_month: 25});

// Power Management IC Fabs - 6 fabs
CREATE (fab_pmic1:Fab {id: 'FAB-PMIC-001', name: 'TI Dallas DMOS6', country: 'USA', region: 'Texas', technology: '65nm BCD', product: 'PMIC', capacity_k_wafer_month: 55}),
(fab_pmic2:Fab {id: 'FAB-PMIC-002', name: 'STMicroelectronics Catania', country: 'Italy', region: 'Sicily', technology: '90nm BCD', capacity_k_wafer_month: 40}),
(fab_pmic3:Fab {id: 'FAB-PMIC-003', name: 'Infineon Dresden', country: 'Germany', region: 'Saxony', technology: '40nm Power', capacity_k_wafer_month: 35}),
(fab_pmic4:Fab {id: 'FAB-PMIC-004', name: 'Qualcomm PMIC Fab', country: 'USA', region: 'California', technology: '28nm Power', capacity_k_wafer_month: 30});

// Image Sensor Fabs - 6 fabs
CREATE (fab_cis1:Fab {id: 'FAB-CIS-001', name: 'Sony Kumamoto', country: 'Japan', region: 'Kumamoto', technology: 'Stacked CMOS', product: 'IMX989 1" Sensor', capacity_k_wafer_month: 100}),
(fab_cis2:Fab {id: 'FAB-CIS-002', name: 'Sony Nagasaki', country: 'Japan', region: 'Nagasaki', technology: 'BSI CMOS', capacity_k_wafer_month: 85}),
(fab_cis3:Fab {id: 'FAB-CIS-003', name: 'Samsung Sensor Line', country: 'South Korea', region: 'Giheung', technology: 'ISOCELL GN2', product: '50MP Sensor', capacity_k_wafer_month: 70}),
(fab_cis4:Fab {id: 'FAB-CIS-004', name: 'OmniVision Shanghai', country: 'China', region: 'Shanghai', technology: 'BSI', capacity_k_wafer_month: 50});

// Display Manufacturing (AMOLED) - 12 fabs
CREATE (fab_disp1:Fab {id: 'FAB-DISP-001', name: 'Samsung Display A5', country: 'South Korea', region: 'Asan', technology: 'LTPO AMOLED', product: '6.8" QHD+ Display', capacity_million_units_year: 180}),
(fab_disp2:Fab {id: 'FAB-DISP-002', name: 'Samsung Display A4', country: 'South Korea', region: 'Asan', technology: 'Rigid AMOLED', capacity_million_units_year: 140}),
(fab_disp3:Fab {id: 'FAB-DISP-003', name: 'LG Display P10', country: 'South Korea', region: 'Paju', technology: 'LTPS OLED', product: 'Foldable Display', capacity_million_units_year: 50}),
(fab_disp4:Fab {id: 'FAB-DISP-004', name: 'BOE Chengdu B11', country: 'China', region: 'Chengdu', technology: 'Flexible AMOLED', capacity_million_units_year: 120}),
(fab_disp5:Fab {id: 'FAB-DISP-005', name: 'BOE Mianyang B12', country: 'China', region: 'Mianyang', technology: 'AMOLED Gen 6', capacity_million_units_year: 100}),
(fab_disp6:Fab {id: 'FAB-DISP-006', name: 'Tianma Shanghai', country: 'China', region: 'Shanghai', technology: 'AMOLED', capacity_million_units_year: 80}),
(fab_disp7:Fab {id: 'FAB-DISP-007', name: 'Visionox Kunshan', country: 'China', region: 'Kunshan', technology: 'Flexible AMOLED', capacity_million_units_year: 60}),
(fab_disp8:Fab {id: 'FAB-DISP-008', name: 'CSOT Wuhan T4', country: 'China', region: 'Wuhan', technology: 'LTPS AMOLED', capacity_million_units_year: 90});

// Battery Cell Manufacturing - 15 facilities
CREATE (bat_cell1:BatteryCellPlant {id: 'BAT-CELL-001', name: 'CATL Ningde Plant 1', country: 'China', region: 'Fujian', chemistry: 'NMC 811', format: 'Prismatic', capacity_gwh_year: 50}),
(bat_cell2:BatteryCellPlant {id: 'BAT-CELL-002', name: 'CATL Yibin Plant', country: 'China', region: 'Sichuan', chemistry: 'LFP', capacity_gwh_year: 45}),
(bat_cell3:BatteryCellPlant {id: 'BAT-CELL-003', name: 'BYD Shenzhen Cell Plant', country: 'China', region: 'Shenzhen', chemistry: 'LFP Blade', format: 'Blade Cell', capacity_gwh_year: 40}),
(bat_cell4:BatteryCellPlant {id: 'BAT-CELL-004', name: 'LG Energy Solution Ochang', country: 'South Korea', region: 'Ochang', chemistry: 'NCMA', format: 'Pouch', capacity_gwh_year: 35}),
(bat_cell5:BatteryCellPlant {id: 'BAT-CELL-005', name: 'Samsung SDI Cheonan', country: 'South Korea', region: 'Cheonan', chemistry: 'NCA', format: 'Prismatic', capacity_gwh_year: 28}),
(bat_cell6:BatteryCellPlant {id: 'BAT-CELL-006', name: 'SK Innovation Seosan', country: 'South Korea', region: 'Seosan', chemistry: 'NCM 9-0.5-0.5', capacity_gwh_year: 22}),
(bat_cell7:BatteryCellPlant {id: 'BAT-CELL-007', name: 'Panasonic Osaka', country: 'Japan', region: 'Osaka', chemistry: 'NCA', format: 'Cylindrical 18650', capacity_gwh_year: 8}),
(bat_cell8:BatteryCellPlant {id: 'BAT-CELL-008', name: 'Murata Energy Fukui', country: 'Japan', region: 'Fukui', chemistry: 'LiCoO2', format: 'Coin Cell', capacity_million_cells_year: 500, application: 'Small Devices'});

// Passive Component Manufacturing (MLCC, Resistors, Inductors) - 20+ facilities
CREATE (pass_mlcc1:PassiveMfg {id: 'PASS-MLCC-001', name: 'Murata Izumo Plant', country: 'Japan', region: 'Shimane', product: 'MLCC 0201 1μF', dielectric: 'X7R', capacity_billion_units_year: 180}),
(pass_mlcc2:PassiveMfg {id: 'PASS-MLCC-002', name: 'Samsung Electro-Mechanics Busan', country: 'South Korea', region: 'Busan', product: 'MLCC 01005 Ultra-Compact', capacity_billion_units_year: 150}),
(pass_mlcc3:PassiveMfg {id: 'PASS-MLCC-003', name: 'TDK Akita', country: 'Japan', region: 'Akita', product: 'MLCC High-Cap', capacity_billion_units_year: 120}),
(pass_mlcc4:PassiveMfg {id: 'PASS-MLCC-004', name: 'Yageo Kaohsiung', country: 'Taiwan', region: 'Kaohsiung', product: 'MLCC General Purpose', capacity_billion_units_year: 200}),
(pass_mlcc5:PassiveMfg {id: 'PASS-MLCC-005', name: 'AVX Greenville', country: 'USA', region: 'South Carolina', product: 'MLCC Automotive Grade', capacity_billion_units_year: 85}),
(pass_res1:PassiveMfg {id: 'PASS-RES-001', name: 'KOA Speer Electronics', country: 'USA', region: 'Pennsylvania', product: 'Thick-Film Resistor 0402', capacity_billion_units_year: 250}),
(pass_res2:PassiveMfg {id: 'PASS-RES-002', name: 'Panasonic Resistor Amagasaki', country: 'Japan', region: 'Hyogo', product: 'Thin-Film Resistor', capacity_billion_units_year: 180}),
(pass_ind1:PassiveMfg {id: 'PASS-IND-001', name: 'TDK Inductor Nikaho', country: 'Japan', region: 'Akita', product: 'Power Inductor 1μH', capacity_billion_units_year: 120}),
(pass_ind2:PassiveMfg {id: 'PASS-IND-002', name: 'Coilcraft Cary', country: 'USA', region: 'Illinois', product: 'RF Inductor', capacity_million_units_year: 800});

// Connector Manufacturing - 12 facilities
CREATE (conn1:ConnectorMfg {id: 'CONN-001', name: 'Foxconn Interconnect Kunshan', country: 'China', region: 'Kunshan', product: 'USB-C Connector', capacity_million_units_month: 80}),
(conn2:ConnectorMfg {id: 'CONN-002', name: 'Molex Shanghai', country: 'China', region: 'Shanghai', product: 'Board-to-Board Connector', capacity_million_units_month: 120}),
(conn3:ConnectorMfg {id: 'CONN-003', name: 'TE Connectivity Shenzhen', country: 'China', region: 'Shenzhen', product: 'FPC Connector', capacity_million_units_month: 95}),
(conn4:ConnectorMfg {id: 'CONN-004', name: 'JAE Electronics Thailand', country: 'Thailand', region: 'Ayutthaya', product: 'High-Speed Connector', capacity_million_units_month: 60}),
(conn5:ConnectorMfg {id: 'CONN-005', name: 'Amphenol Chengdu', country: 'China', region: 'Chengdu', product: 'Micro Coax Connector', capacity_million_units_month: 70}),
(conn6:ConnectorMfg {id: 'CONN-006', name: 'Hirose Nagano', country: 'Japan', region: 'Nagano', product: 'Fine Pitch Connector', capacity_million_units_month: 45});

// PCB Manufacturing (HDI, Rigid, Flex) - 25+ facilities
CREATE (pcb_hdi1:PCBMfg {id: 'PCB-HDI-001', name: 'Unimicron Taoyuan', country: 'Taiwan', region: 'Taoyuan', product: 'HDI PCB 8-layer', technology: 'Any-layer HDI', capacity_million_sqm_year: 12}),
(pcb_hdi2:PCBMfg {id: 'PCB-HDI-002', name: 'Ibiden Ogaki', country: 'Japan', region: 'Gifu', product: 'IC Substrate', technology: 'FC-BGA', capacity_million_units_year: 180}),
(pcb_hdi3:PCBMfg {id: 'PCB-HDI-003', name: 'AT&S Leoben', country: 'Austria', region: 'Styria', product: 'HDI PCB High-End', layers: 14, capacity_million_sqm_year: 3.5}),
(pcb_hdi4:PCBMfg {id: 'PCB-HDI-004', name: 'TTM Technologies Dongguan', country: 'China', region: 'Guangdong', product: 'Smartphone Mainboard', capacity_million_units_year: 200}),
(pcb_flex1:PCBMfg {id: 'PCB-FLEX-001', name: 'Flexium Taoyuan', country: 'Taiwan', region: 'Taoyuan', product: 'Rigid-Flex PCB', technology: '2-stage lamination', capacity_million_sqm_year: 8}),
(pcb_flex2:PCBMfg {id: 'PCB-FLEX-002', name: 'Interflex Cheongju', country: 'South Korea', region: 'Cheongju', product: 'FPC for Displays', capacity_million_sqm_year: 15}),
(pcb_flex3:PCBMfg {id: 'PCB-FLEX-003', name: 'Nippon Mektron Yamanashi', country: 'Japan', region: 'Yamanashi', product: 'Multi-layer FPC', capacity_million_sqm_year: 6}),
(pcb_flex4:PCBMfg {id: 'PCB-FLEX-004', name: 'ZDT Shenzhen', country: 'China', region: 'Shenzhen', product: 'FPC General', capacity_million_sqm_year: 20});

// Camera Lens Manufacturing - 8 facilities
CREATE (lens1:LensMfg {id: 'LENS-001', name: 'Largan Precision Taichung', country: 'Taiwan', region: 'Taichung', product: '8P Aspherical Lens', focal_length_mm: 6.8, capacity_million_sets_year: 480}),
(lens2:LensMfg {id: 'LENS-002', name: 'Genius Electronic Optical Xiamen', country: 'China', region: 'Fujian', product: '7P Lens Module', capacity_million_sets_year: 350}),
(lens3:LensMfg {id: 'LENS-003', name: 'Sunny Optical Yuyao', country: 'China', region: 'Zhejiang', product: 'Periscope Telephoto Lens', capacity_million_sets_year: 280}),
(lens4:LensMfg {id: 'LENS-004', name: 'Sekonix Busan', country: 'South Korea', region: 'Busan', product: 'Wide-Angle Lens', capacity_million_sets_year: 200}),
(lens5:LensMfg {id: 'LENS-005', name: 'Kantatsu Guangzhou', country: 'China', region: 'Guangdong', product: 'Standard Lens', capacity_million_sets_year: 180});

// Camera Module Assembly - 10 facilities
CREATE (cam_mod1:CameraModuleMfg {id: 'CAM-MOD-001', name: 'LG Innotek Gumi', country: 'South Korea', region: 'Gumi', product: 'Triple Camera Module 108MP', includes: ['Main', 'Ultra-wide', 'Telephoto'], capacity_million_sets_year: 150}),
(cam_mod2:CameraModuleMfg {id: 'CAM-MOD-002', name: 'Samsung Electro-Mechanics Camera', country: 'South Korea', region: 'Busan', product: 'Quad Camera Module', capacity_million_sets_year: 180}),
(cam_mod3:CameraModuleMfg {id: 'CAM-MOD-003', name: 'Sunny Optical Ningbo', country: 'China', region: 'Zhejiang', product: 'Camera Module Assembly', capacity_million_sets_year: 220}),
(cam_mod4:CameraModuleMfg {id: 'CAM-MOD-004', name: 'O-film Nanchang', country: 'China', region: 'Jiangxi', product: 'Camera Module', capacity_million_sets_year: 200}),
(cam_mod5:CameraModuleMfg {id: 'CAM-MOD-005', name: 'Sharp Camera Module', country: 'Japan', region: 'Tochigi', product: 'Premium Camera Module', capacity_million_sets_year: 80});

// Motor Manufacturing (OIS, Haptic, etc) - 8 facilities
CREATE (motor1:MotorMfg {id: 'MOTOR-001', name: 'Nidec Precision Nagano', country: 'Japan', region: 'Nagano', product: 'OIS Voice Coil Motor', capacity_million_units_year: 280}),
(motor2:MotorMfg {id: 'MOTOR-002', name: 'Mitsumi Electric Cebu', country: 'Philippines', region: 'Cebu', product: 'Camera Actuator', capacity_million_units_year: 220}),
(motor3:MotorMfg {id: 'MOTOR-003', name: 'AAC Technologies Changzhou', country: 'China', region: 'Jiangsu', product: 'X-axis Linear Motor', application: 'Haptics', capacity_million_units_year: 350}),
(motor4:MotorMfg {id: 'MOTOR-004', name: 'Jahwa Microelectronics', country: 'China', region: 'Shanghai', product: 'Vibration Motor', capacity_million_units_year: 400});

// Speaker/Microphone Manufacturing - 10 facilities
CREATE (audio1:AudioMfg {id: 'AUDIO-001', name: 'Goertek Weifang', country: 'China', region: 'Shandong', product: 'MEMS Microphone', capacity_billion_units_year: 2.5}),
(audio2:AudioMfg {id: 'AUDIO-002', name: 'AAC Acoustic Shenzhen', country: 'China', region: 'Shenzhen', product: 'Speaker Box 1.5cc', capacity_million_units_year: 600}),
(audio3:AudioMfg {id: 'AUDIO-003', name: 'Knowles Acoustics Penang', country: 'Malaysia', region: 'Penang', product: 'MEMS Microphone', capacity_billion_units_year: 1.8}),
(audio4:AudioMfg {id: 'AUDIO-004', name: 'Bujeon Electronics', country: 'South Korea', region: 'Ansan', product: 'Balanced Armature Driver', capacity_million_units_year: 150}),
(audio5:AudioMfg {id: 'AUDIO-005', name: 'Hosiden Philippines', country: 'Philippines', region: 'Batangas', product: 'Speaker Module', capacity_million_units_year: 400});

// Antenna Manufacturing - 6 facilities
CREATE (ant1:AntennaMfg {id: 'ANT-001', name: 'Amphenol Antenna Shenzhen', country: 'China', region: 'Shenzhen', product: '5G mmWave Antenna Array', capacity_million_units_year: 180}),
(ant2:AntennaMfg {id: 'ANT-002', name: 'Pulse Electronics San Diego', country: 'USA', region: 'California', product: 'Multi-band Antenna', capacity_million_units_year: 95}),
(ant3:AntennaMfg {id: 'ANT-003', name: 'Luxshare-ICT Antenna', country: 'China', region: 'Jiangsu', product: 'LCP Antenna Module', capacity_million_units_year: 250});

// Touchscreen Controller & Driver IC - 8 facilities
CREATE (touch1:TouchMfg {id: 'TOUCH-001', name: 'Synaptics San Jose', country: 'USA', region: 'California', product: 'Touchscreen Controller IC', technology: 'Capacitive Multi-touch', capacity_million_units_year: 280}),
(touch2:TouchMfg {id: 'TOUCH-002', name: 'Goodix Shenzhen', country: 'China', region: 'Shenzhen', product: 'In-Display Fingerprint Sensor', capacity_million_units_year: 150}),
(touch3:TouchMfg {id: 'TOUCH-003', name: 'FocalTech Taipei', country: 'Taiwan', region: 'Taipei', product: 'Touch Controller', capacity_million_units_year: 320}),
(touch4:TouchMfg {id: 'TOUCH-004', name: 'Cypress Semiconductor', country: 'USA', region: 'California', product: 'TrueTouch Controller', capacity_million_units_year: 200});

// Biometric Sensors - 5 facilities
CREATE (bio1:BiometricMfg {id: 'BIO-001', name: 'Fingerprint Cards Gothenburg', country: 'Sweden', region: 'Gothenburg', product: 'Capacitive Fingerprint Sensor', capacity_million_units_year: 120}),
(bio2:BiometricMfg {id: 'BIO-002', name: 'Egis Technology Taipei', country: 'Taiwan', region: 'Taipei', product: 'Optical Fingerprint Sensor', capacity_million_units_year: 95}),
(bio3:BiometricMfg {id: 'BIO-003', name: 'Q Technology Suzhou', country: 'China', region: 'Jiangsu', product: 'Ultrasonic Fingerprint Sensor', capacity_million_units_year: 60});

// MEMS Sensors (Gyro, Accel, Pressure, etc) - 12 facilities
CREATE (mems1:MEMSMfg {id: 'MEMS-001', name: 'Bosch Sensortec Reutlingen', country: 'Germany', region: 'Baden-Württemberg', product: 'BMI 6-axis IMU', capacity_billion_units_year: 1.2}),
(mems2:MEMSMfg {id: 'MEMS-002', name: 'STMicroelectronics Agrate', country: 'Italy', region: 'Lombardy', product: 'MEMS Accelerometer', capacity_billion_units_year: 2.5}),
(mems3:MEMSMfg {id: 'MEMS-003', name: 'InvenSense San Jose', country: 'USA', region: 'California', product: '9-axis Motion Sensor', capacity_million_units_year: 800}),
(mems4:MEMSMfg {id: 'MEMS-004', name: 'Alps Alpine Niigata', country: 'Japan', region: 'Niigata', product: 'Gyroscope MEMS', capacity_billion_units_year: 0.8}),
(mems5:MEMSMfg {id: 'MEMS-005', name: 'Murata MEMS Finland', country: 'Finland', region: 'Vantaa', product: 'Pressure Sensor', capacity_billion_units_year: 1.5}),
(mems6:MEMSMfg {id: 'MEMS-006', name: 'Analog Devices Limerick', country: 'Ireland', region: 'Limerick', product: 'MEMS Accelerometer', capacity_billion_units_year: 1.0});

// Thermal Management Components - 6 facilities
CREATE (thermal1:ThermalMfg {id: 'THERM-001', name: 'Aavid Thermacore', country: 'USA', region: 'Pennsylvania', product: 'Vapor Chamber', capacity_million_units_year: 120}),
(thermal2:ThermalMfg {id: 'THERM-002', name: 'Furukawa Electric Thermal', country: 'Japan', region: 'Tokyo', product: 'Graphite Heat Spreader', capacity_million_sqm_year: 25}),
(thermal3:ThermalMfg {id: 'THERM-003', name: 'Laird Thermal Systems', country: 'USA', region: 'Ohio', product: 'Thermal Interface Material', capacity_tonnes_year: 800});

// Wireless Charging Coils - 4 facilities
CREATE (wireless1:WirelessMfg {id: 'WIRE-001', name: 'TDK Wireless Charging', country: 'Japan', region: 'Akita', product: 'Qi Wireless Charging Coil', power_w: 15, capacity_million_units_year: 180}),
(wireless2:WirelessMfg {id: 'WIRE-002', name: 'Würth Elektronik Coils', country: 'Germany', region: 'Waldenburg', product: 'Wireless Power Coil', capacity_million_units_year: 120});

// Packaging Materials (EMC, Leadframes, etc) - 8 facilities
CREATE (pkg_mat1:PackagingMaterialMfg {id: 'PKG-MAT-001', name: 'Sumitomo Bakelite EMC', country: 'Japan', region: 'Shizuoka', product: 'Epoxy Molding Compound', application: 'IC Packaging', capacity_kt_year: 45}),
(pkg_mat2:PackagingMaterialMfg {id: 'PKG-MAT-002', name: 'Hitachi Chemical Packaging', country: 'Japan', region: 'Ibaraki', product: 'Die Attach Film', capacity_million_sqm_year: 80}),
(pkg_mat3:PackagingMaterialMfg {id: 'PKG-MAT-003', name: 'Mitsui High-Tec', country: 'Japan', region: 'Kitakyushu', product: 'Leadframe Stamping', capacity_billion_units_year: 120}),
(pkg_mat4:PackagingMaterialMfg {id: 'PKG-MAT-004', name: 'Shinko Leadframe', country: 'Japan', region: 'Nagano', product: 'QFN Leadframe', capacity_billion_units_year: 95}),
(pkg_mat5:PackagingMaterialMfg {id: 'PKG-MAT-005', name: 'Nitto Denko EMC', country: 'Japan', region: 'Osaka', product: 'Underfill Material', capacity_kt_year: 28}),
(pkg_mat6:PackagingMaterialMfg {id: 'PKG-MAT-006', name: 'Henkel IC Packaging', country: 'Germany', region: 'Munich', product: 'Die Attach Paste', capacity_tonnes_year: 1200}),
(pkg_mat7:PackagingMaterialMfg {id: 'PKG-MAT-007', name: 'Cookson Electronics', country: 'USA', region: 'Rhode Island', product: 'Solder Mask', capacity_kl_year: 4500}),
(pkg_mat8:PackagingMaterialMfg {id: 'PKG-MAT-008', name: 'LG Innotek Substrate', country: 'South Korea', region: 'Paju', product: 'IC Substrate', capacity_million_units_year: 280});

// ==================== TIER 3: COMPONENT ASSEMBLY & TESTING ====================

// Chip Assembly & Test (OSAT - Outsourced Semiconductor Assembly and Test)
CREATE (asm_soc1:ChipAssembly {id: 'ASM-SOC-001', name: 'ASE Kaohsiung', country: 'Taiwan', region: 'Kaohsiung', service: 'SoC Packaging & Test', technology: 'InFO-PoP', capacity_million_units_year: 280}),
(asm_soc2:ChipAssembly {id: 'ASM-SOC-002', name: 'Amkor Korea', country: 'South Korea', region: 'Incheon', service: 'Advanced Packaging', technology: 'FC-BGA', capacity_million_units_year: 220}),
(asm_soc3:ChipAssembly {id: 'ASM-SOC-003', name: 'JCET Jiangyin', country: 'China', region: 'Jiangsu', service: 'Chip Packaging', technology: 'WLCSP', capacity_million_units_year: 180}),
(asm_soc4:ChipAssembly {id: 'ASM-SOC-004', name: 'Powertech Taiwan', country: 'Taiwan', region: 'Hsinchu', service: 'Logic Packaging', technology: 'Fan-out', capacity_million_units_year: 150}),
(asm_mem1:ChipAssembly {id: 'ASM-MEM-001', name: 'Samsung Memory Packaging', country: 'South Korea', region: 'Pyeongtaek', service: 'Memory Packaging', technology: 'PoP', capacity_million_units_year: 300}),
(asm_mem2:ChipAssembly {id: 'ASM-MEM-002', name: 'SK Hynix Packaging', country: 'South Korea', region: 'Icheon', service: 'DRAM/NAND Packaging', capacity_million_units_year: 250}),
(asm_mem3:ChipAssembly {id: 'ASM-MEM-003', name: 'Micron Assembly', country: 'Singapore', service: 'Memory Stack', capacity_million_units_year: 200}),
(asm_rf1:ChipAssembly {id: 'ASM-RF-001', name: 'Qorvo Assembly', country: 'USA', region: 'Oregon', service: 'RF Module Assembly', capacity_million_units_year: 200}),
(asm_rf2:ChipAssembly {id: 'ASM-RF-002', name: 'Skyworks Assembly', country: 'Mexico', region: 'Mexicali', service: 'RF Package', capacity_million_units_year: 180}),
(asm_pmic1:ChipAssembly {id: 'ASM-PMIC-001', name: 'TI Assembly Malaysia', country: 'Malaysia', region: 'Kuala Lumpur', service: 'PMIC Packaging', capacity_million_units_year: 350}),
(asm_pmic2:ChipAssembly {id: 'ASM-PMIC-002', name: 'STMicro Assembly', country: 'China', region: 'Shenzhen', service: 'Power IC Package', capacity_million_units_year: 280});

// PCB Assembly Houses (SMT - Surface Mount Technology)
CREATE (pcba1:PCBAssembly {id: 'PCBA-001', name: 'Foxconn PCBA Shenzhen', country: 'China', region: 'Shenzhen', service: 'SMT Assembly', lines: 120, capacity_million_boards_year: 450}),
(pcba2:PCBAssembly {id: 'PCBA-002', name: 'Pegatron PCBA Shanghai', country: 'China', region: 'Shanghai', service: 'Mainboard Assembly', lines: 85, capacity_million_boards_year: 320}),
(pcba3:PCBAssembly {id: 'PCBA-003', name: 'Wistron PCBA Kunshan', country: 'China', region: 'Kunshan', service: 'PCB Assembly', lines: 95, capacity_million_boards_year: 380}),
(pcba4:PCBAssembly {id: 'PCBA-004', name: 'Luxshare-ICT Dongguan', country: 'China', region: 'Dongguan', service: 'PCBA & Module', lines: 110, capacity_million_boards_year: 420}),
(pcba5:PCBAssembly {id: 'PCBA-005', name: 'Compal Electronics', country: 'Taiwan', region: 'Taipei', service: 'Board Assembly', lines: 65, capacity_million_boards_year: 280}),
(pcba6:PCBAssembly {id: 'PCBA-006', name: 'Inventec Appliances', country: 'China', region: 'Nanjing', service: 'SMT', lines: 75, capacity_million_boards_year: 320});

// Display Module Assembly
CREATE (disp_asm1:DisplayAssembly {id: 'DISP-ASM-001', name: 'Samsung Display Module', country: 'South Korea', region: 'Asan', service: 'Display Module Integration', includes: ['Touch', 'Controller IC', 'Backlight'], capacity_million_units_year: 180}),
(disp_asm2:DisplayAssembly {id: 'DISP-ASM-002', name: 'BOE Module Assembly', country: 'China', region: 'Chengdu', service: 'Display Module', capacity_million_units_year: 150}),
(disp_asm3:DisplayAssembly {id: 'DISP-ASM-003', name: 'Tianma Module', country: 'China', region: 'Wuhan', service: 'Display Integration', capacity_million_units_year: 100}),
(disp_asm4:DisplayAssembly {id: 'DISP-ASM-004', name: 'LG Display Module', country: 'South Korea', region: 'Paju', service: 'OLED Module', capacity_million_units_year: 80}),
(disp_asm5:DisplayAssembly {id: 'DISP-ASM-005', name: 'Visionox Module', country: 'China', region: 'Kunshan', service: 'Flexible Display Module', capacity_million_units_year: 60});

// Battery Pack Assembly
CREATE (bat_asm1:BatteryPackAssembly {id: 'BAT-ASM-001', name: 'ATL Amperex Pack Assembly', country: 'China', region: 'Dongguan', service: 'Battery Pack Integration', includes: ['Cells', 'BMS', 'Connectors'], capacity_million_packs_year: 280}),
(bat_asm2:BatteryPackAssembly {id: 'BAT-ASM-002', name: 'Sunwoda Battery Pack', country: 'China', region: 'Shenzhen', service: 'Battery Module', capacity_million_packs_year: 200}),
(bat_asm3:BatteryPackAssembly {id: 'BAT-ASM-003', name: 'Desay Battery Pack', country: 'China', region: 'Huizhou', service: 'Battery Assembly', capacity_million_packs_year: 180}),
(bat_asm4:BatteryPackAssembly {id: 'BAT-ASM-004', name: 'Simplo Technology', country: 'Taiwan', region: 'Taoyuan', service: 'Battery Pack', capacity_million_packs_year: 120}),
(bat_asm5:BatteryPackAssembly {id: 'BAT-ASM-005', name: 'Dynapack International', country: 'Taiwan', region: 'Taoyuan', service: 'Battery Integration', capacity_million_packs_year: 100});

// Chassis Manufacturing
CREATE (chassis1:ChassisManufacturing {id: 'CHASSIS-001', name: 'Catcher Technology Tainan', country: 'Taiwan', region: 'Tainan', process: 'CNC Machining', material: 'Aluminum', capacity_million_units_year: 120}),
(chassis2:ChassisManufacturing {id: 'CHASSIS-002', name: 'Foxconn Precision Shenzhen', country: 'China', region: 'Shenzhen', process: 'Metal Stamping & CNC', capacity_million_units_year: 200}),
(chassis3:ChassisManufacturing {id: 'CHASSIS-003', name: 'BYD Precision Manufacturing', country: 'China', region: 'Shenzhen', process: 'CNC Unibody', capacity_million_units_year: 150}),
(chassis4:ChassisManufacturing {id: 'CHASSIS-004', name: 'Jabil Precision Wuxi', country: 'China', region: 'Wuxi', process: 'Metal Forming', capacity_million_units_year: 100}),
(chassis5:ChassisManufacturing {id: 'CHASSIS-005', name: 'Casetek Taiwan', country: 'Taiwan', region: 'Taoyuan', process: 'CNC Aluminum', capacity_million_units_year: 85}),
(chassis6:ChassisManufacturing {id: 'CHASSIS-006', name: 'Ju Teng Shanghai', country: 'China', region: 'Shanghai', process: 'Die Casting', capacity_million_units_year: 95});

// ==================== TIER 2: MODULE INTEGRATION ====================

CREATE (mod_main1:ModuleIntegrator {id: 'MOD-MAIN-001', name: 'Foxconn Module Integration', country: 'China', region: 'Zhengzhou', specialty: 'Mainboard Module', capacity_million_units_year: 250}),
(mod_main2:ModuleIntegrator {id: 'MOD-MAIN-002', name: 'Pegatron System Integration', country: 'China', region: 'Shanghai', specialty: 'System Module', capacity_million_units_year: 180}),
(mod_main3:ModuleIntegrator {id: 'MOD-MAIN-003', name: 'Wistron Module', country: 'India', region: 'Bangalore', specialty: 'Component Integration', capacity_million_units_year: 80}),
(mod_cam1:ModuleIntegrator {id: 'MOD-CAM-001', name: 'LG Innotek Final Camera', country: 'South Korea', region: 'Gumi', specialty: 'Camera System', capacity_million_units_year: 200}),
(mod_cam2:ModuleIntegrator {id: 'MOD-CAM-002', name: 'Sunny Optical System', country: 'China', region: 'Yuyao', specialty: 'Camera Assembly', capacity_million_units_year: 180}),
(mod_aud1:ModuleIntegrator {id: 'MOD-AUD-001', name: 'AAC Acoustic Module', country: 'China', region: 'Shenzhen', specialty: 'Audio System', capacity_million_units_year: 320}),
(mod_aud2:ModuleIntegrator {id: 'MOD-AUD-002', name: 'Goertek Audio System', country: 'China', region: 'Weifang', specialty: 'Acoustic Module', capacity_million_units_year: 280});

// ==================== TIER 1: PRE-ASSEMBLY ====================

CREATE (ems1:PreAssembly {id: 'EMS-001', name: 'Foxconn Zhengzhou Pre-Assembly', country: 'China', region: 'Zhengzhou', service: 'Sub-Assembly', capacity_million_units_year: 200}),
(ems2:PreAssembly {id: 'EMS-002', name: 'Pegatron Shanghai Pre-Assembly', country: 'China', region: 'Shanghai', service: 'Sub-Assembly', capacity_million_units_year: 150}),
(ems3:PreAssembly {id: 'EMS-003', name: 'Wistron India Pre-Assembly', country: 'India', region: 'Karnataka', service: 'Sub-Assembly', capacity_million_units_year: 80}),
(ems4:PreAssembly {id: 'EMS-004', name: 'Luxshare Pre-Assembly', country: 'China', region: 'Kunshan', service: 'Module Integration', capacity_million_units_year: 120}),
(ems5:PreAssembly {id: 'EMS-005', name: 'Compal Pre-Assembly', country: 'Vietnam', region: 'Hai Phong', service: 'Sub-Assembly', capacity_million_units_year: 60});

// ==================== TIER 0: FINAL ASSEMBLY (OEM) ====================

CREATE (oem1:OEM {id: 'OEM-FINAL-001', name: 'TechCorp Zhengzhou Final Assembly', country: 'China', region: 'Zhengzhou',
  production_lines: 94, capacity_units_day: 550000, annual_capacity_million: 120, employees: 95000, operational_since: 2010}),
(oem2:OEM {id: 'OEM-FINAL-002', name: 'TechCorp Shenzhen Final Assembly', country: 'China', region: 'Shenzhen',
  production_lines: 62, capacity_units_day: 280000, annual_capacity_million: 80, employees: 45000, operational_since: 2007}),
(oem3:OEM {id: 'OEM-FINAL-003', name: 'TechCorp India Final Assembly', country: 'India', region: 'Tamil Nadu',
  production_lines: 38, capacity_units_day: 120000, annual_capacity_million: 35, employees: 28000, operational_since: 2017}),
(oem4:OEM {id: 'OEM-FINAL-004', name: 'TechCorp Vietnam Final Assembly', country: 'Vietnam', region: 'Bac Ninh',
  production_lines: 28, capacity_units_day: 85000, annual_capacity_million: 25, employees: 18000, operational_since: 2019}),
(oem5:OEM {id: 'OEM-FINAL-005', name: 'TechCorp Brazil Final Assembly', country: 'Brazil', region: 'São Paulo',
  production_lines: 18, capacity_units_day: 45000, annual_capacity_million: 12, employees: 8500, operational_since: 2014});

// ==================== FINAL PRODUCT ====================

CREATE (product:FinalProduct {
  id: 'PRODUCT-001',
  name: 'TechCorp Quantum Pro Max',
  model: 'QP-MAX-2024',
  sku: 'TC-QPM-512-BLK',
  category: 'Flagship Smartphone',
  retail_price_usd: 1299,
  launch_date: '2024-09-15',
  screen_size_inches: 6.8,
  storage_gb: 512,
  ram_gb: 16,
  battery_mah: 5000,
  camera_mp: '108+12+10',
  processor: '3nm Octa-core',
  os: 'TechOS 15',
  colors: ['Midnight Black', 'Titanium Gray', 'Ocean Blue', 'Rose Gold'],
  weight_grams: 228,
  dimensions_mm: '162.5 x 78.1 x 8.9',
  total_components: 2847,
  unique_part_numbers: 1653,
  total_suppliers_all_tiers: 487,
  countries_sourced_from: 43,
  total_annual_production_million: 272,
  avg_manufacturing_lead_time_days: 185,
  carbon_footprint_kg_co2e: 79.5,
  water_usage_liters: 12840,
  recyclable_content_percent: 68,
  warranty_months: 24
});
