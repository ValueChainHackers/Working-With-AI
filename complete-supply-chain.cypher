// ==================== COMPLETE SMARTPHONE SUPPLY CHAIN ====================
// From mine to finished product with ALL tiers

// First run mega-supply-chain.cypher to create all nodes
// Then run mega-relationships.cypher for Tier 7-4 relationships
// Then run this file for Tier 3-0 (final assembly)

// ==================== TIER 3: COMPONENT ASSEMBLY & TESTING ====================

// Create Tier 3 assemblers (these take sub-components and create finished modules)
CREATE (asm_soc1:ChipAssembly {id: 'ASM-SOC-001', name: 'ASE Kaohsiung', country: 'Taiwan', service: 'SoC Packaging & Test', technology: 'InFO-PoP', capacity_million_units_year: 280}),
(asm_soc2:ChipAssembly {id: 'ASM-SOC-002', name: 'Amkor Korea', country: 'South Korea', service: 'Advanced Packaging', technology: 'FC-BGA', capacity_million_units_year: 220}),
(asm_soc3:ChipAssembly {id: 'ASM-SOC-003', name: 'JCET Jiangyin', country: 'China', service: 'Chip Packaging', technology: 'WLCSP', capacity_million_units_year: 180}),
(asm_mem1:ChipAssembly {id: 'ASM-MEM-001', name: 'Samsung Memory Packaging', country: 'South Korea', region: 'Pyeongtaek', service: 'Memory Packaging', technology: 'PoP', capacity_million_units_year: 300}),
(asm_mem2:ChipAssembly {id: 'ASM-MEM-002', name: 'SK Hynix Packaging', country: 'South Korea', service: 'DRAM/NAND Packaging', capacity_million_units_year: 250}),
(asm_rf1:ChipAssembly {id: 'ASM-RF-001', name: 'Qorvo Assembly', country: 'USA', region: 'Oregon', service: 'RF Module Assembly', capacity_million_units_year: 200}),
(asm_pmic1:ChipAssembly {id: 'ASM-PMIC-001', name: 'TI Assembly Malaysia', country: 'Malaysia', service: 'PMIC Packaging', capacity_million_units_year: 350});

// PCB Assembly Houses (PCBA - put chips on PCBs)
CREATE (pcba1:PCBAssembly {id: 'PCBA-001', name: 'Foxconn PCBA Shenzhen', country: 'China', region: 'Shenzhen', service: 'SMT Assembly', lines: 120, capacity_million_boards_year: 450}),
(pcba2:PCBAssembly {id: 'PCBA-002', name: 'Pegatron PCBA Shanghai', country: 'China', region: 'Shanghai', service: 'Mainboard Assembly', lines: 85, capacity_million_boards_year: 320}),
(pcba3:PCBAssembly {id: 'PCBA-003', name: 'Wistron PCBA Kunshan', country: 'China', region: 'Kunshan', service: 'PCB Assembly', lines: 95, capacity_million_boards_year: 380}),
(pcba4:PCBAssembly {id: 'PCBA-004', name: 'Luxshare-ICT Dongguan', country: 'China', region: 'Dongguan', service: 'PCBA & Module', lines: 110, capacity_million_boards_year: 420});

// Display Module Assembly (add touch layer, controller, backlight)
CREATE (disp_asm1:DisplayAssembly {id: 'DISP-ASM-001', name: 'Samsung Display Module', country: 'South Korea', region: 'Asan', service: 'Display Module Integration', includes: ['Touch', 'Controller IC', 'Backlight'], capacity_million_units_year: 180}),
(disp_asm2:DisplayAssembly {id: 'DISP-ASM-002', name: 'BOE Module Assembly', country: 'China', region: 'Chengdu', service: 'Display Module', capacity_million_units_year: 150}),
(disp_asm3:DisplayAssembly {id: 'DISP-ASM-003', name: 'Tianma Module', country: 'China', region: 'Wuhan', service: 'Display Integration', capacity_million_units_year: 100});

// Battery Pack Assembly
CREATE (bat_asm1:BatteryPackAssembly {id: 'BAT-ASM-001', name: 'ATL Amperex Pack Assembly', country: 'China', region: 'Dongguan', service: 'Battery Pack Integration', includes: ['Cells', 'BMS', 'Connectors'], capacity_million_packs_year: 280}),
(bat_asm2:BatteryPackAssembly {id: 'BAT-ASM-002', name: 'Sunwoda Battery Pack', country: 'China', region: 'Shenzhen', service: 'Battery Module', capacity_million_packs_year: 200}),
(bat_asm3:BatteryPackAssembly {id: 'BAT-ASM-003', name: 'Desay Battery Pack', country: 'China', region: 'Huizhou', service: 'Battery Assembly', capacity_million_packs_year: 180});

// Camera Module Final Assembly (already have cam_mod1-5 from tier 4, these are final integrators)

// Chassis Manufacturing (stamping/CNC of aluminum frames)
CREATE (chassis1:ChassisManufacturing {id: 'CHASSIS-001', name: 'Catcher Technology Tainan', country: 'Taiwan', region: 'Tainan', process: 'CNC Machining', material: 'Aluminum', capacity_million_units_year: 120}),
(chassis2:ChassisManufacturing {id: 'CHASSIS-002', name: 'Foxconn Precision Shenzhen', country: 'China', region: 'Shenzhen', process: 'Metal Stamping & CNC', capacity_million_units_year: 200}),
(chassis3:ChassisManufacturing {id: 'CHASSIS-003', name: 'BYD Precision Manufacturing', country: 'China', region: 'Shenzhen', process: 'CNC Unibody', capacity_million_units_year: 150}),
(chassis4:ChassisManufacturing {id: 'CHASSIS-004', name: 'Jabil Precision Wuxi', country: 'China', region: 'Wuxi', process: 'Metal Forming', capacity_million_units_year: 100});

// ==================== TIER 3 RELATIONSHIPS (Tier 4 -> Tier 3) ====================

// Fab wafers to chip packaging/assembly
MATCH (fab:Fab {id: 'FAB-LOGIC-001'}), (asm:ChipAssembly {id: 'ASM-SOC-001'})
CREATE (fab)-[:PRODUCES_DIE {product: 'SoC Die 3nm', quantity_million_die_year: 3500}]->(asm);

MATCH (fab:Fab {id: 'FAB-LOGIC-002'}), (asm:ChipAssembly {id: 'ASM-SOC-002'})
CREATE (fab)-[:PRODUCES_DIE {product: 'SoC Die 5nm', quantity_million_die_year: 4200}]->(asm);

MATCH (fab:Fab {id: 'FAB-LOGIC-003'}), (asm:ChipAssembly {id: 'ASM-SOC-001'})
CREATE (fab)-[:PRODUCES_DIE {product: 'SoC Die 3nm GAA', quantity_million_die_year: 2800}]->(asm);

// DRAM to memory packaging
MATCH (fab:Fab {id: 'FAB-DRAM-001'}), (asm:ChipAssembly {id: 'ASM-MEM-001'})
CREATE (fab)-[:PRODUCES_DIE {product: 'LPDDR5X Die', quantity_million_die_year: 12000}]->(asm);

MATCH (fab:Fab {id: 'FAB-DRAM-002'}), (asm:ChipAssembly {id: 'ASM-MEM-002'})
CREATE (fab)-[:PRODUCES_DIE {product: 'LPDDR5 Die', quantity_million_die_year: 10000}]->(asm);

// NAND to memory packaging
MATCH (fab:Fab {id: 'FAB-NAND-001'}), (asm:ChipAssembly {id: 'ASM-MEM-001'})
CREATE (fab)-[:PRODUCES_DIE {product: 'UFS 4.0 Die', quantity_million_die_year: 15000}]->(asm);

MATCH (fab:Fab {id: 'FAB-NAND-002'}), (asm:ChipAssembly {id: 'ASM-MEM-002'})
CREATE (fab)-[:PRODUCES_DIE {product: '3D NAND Die', quantity_million_die_year: 12000}]->(asm);

// RF fabs to RF assembly
MATCH (fab:Fab {id: 'FAB-RF-001'}), (asm:ChipAssembly {id: 'ASM-RF-001'})
CREATE (fab)-[:PRODUCES_DIE {product: '5G mmWave PA Die', quantity_million_die_year: 800}]->(asm);

MATCH (fab:Fab {id: 'FAB-RF-003'}), (asm:ChipAssembly {id: 'ASM-RF-001'})
CREATE (fab)-[:PRODUCES_DIE {product: 'WiFi 7 Die', quantity_million_die_year: 1200}]->(asm);

// PMIC fabs to PMIC assembly
MATCH (fab:Fab {id: 'FAB-PMIC-001'}), (asm:ChipAssembly {id: 'ASM-PMIC-001'})
CREATE (fab)-[:PRODUCES_DIE {product: 'PMIC Die', quantity_million_die_year: 3500}]->(asm);

// Display panel to display assembly
MATCH (fab:Fab {id: 'FAB-DISP-001'}), (asm:DisplayAssembly {id: 'DISP-ASM-001'})
CREATE (fab)-[:PRODUCES_PANEL {product: 'LTPO AMOLED Panel', quantity_million_units_year: 180}]->(asm);

MATCH (fab:Fab {id: 'FAB-DISP-004'}), (asm:DisplayAssembly {id: 'DISP-ASM-002'})
CREATE (fab)-[:PRODUCES_PANEL {product: 'Flexible AMOLED Panel', quantity_million_units_year: 120}]->(asm);

MATCH (fab:Fab {id: 'FAB-DISP-006'}), (asm:DisplayAssembly {id: 'DISP-ASM-003'})
CREATE (fab)-[:PRODUCES_PANEL {product: 'AMOLED Panel', quantity_million_units_year: 80}]->(asm);

// Battery cells to battery pack assembly
MATCH (cell:BatteryCellPlant {id: 'BAT-CELL-001'}), (pack:BatteryPackAssembly {id: 'BAT-ASM-001'})
CREATE (cell)-[:SUPPLIES_CELLS {quantity_million_cells_year: 350, format: 'Prismatic'}]->(pack);

MATCH (cell:BatteryCellPlant {id: 'BAT-CELL-003'}), (pack:BatteryPackAssembly {id: 'BAT-ASM-002'})
CREATE (cell)-[:SUPPLIES_CELLS {quantity_million_cells_year: 280, format: 'Blade'}]->(pack);

MATCH (cell:BatteryCellPlant {id: 'BAT-CELL-004'}), (pack:BatteryPackAssembly {id: 'BAT-ASM-003'})
CREATE (cell)-[:SUPPLIES_CELLS {quantity_million_cells_year: 250, format: 'Pouch'}]->(pack);

// PCB to PCBA (PCB Assembly houses receive bare PCBs)
MATCH (pcb:PCBMfg {id: 'PCB-HDI-001'}), (asm:PCBAssembly {id: 'PCBA-001'})
CREATE (pcb)-[:SUPPLIES_PCB {product: 'Smartphone Mainboard HDI', quantity_million_units_year: 180}]->(asm);

MATCH (pcb:PCBMfg {id: 'PCB-HDI-004'}), (asm:PCBAssembly {id: 'PCBA-002'})
CREATE (pcb)-[:SUPPLIES_PCB {product: 'Mainboard 8-layer', quantity_million_units_year: 150}]->(asm);

MATCH (pcb:PCBMfg {id: 'PCB-FLEX-002'}), (asm:PCBAssembly {id: 'PCBA-003'})
CREATE (pcb)-[:SUPPLIES_PCB {product: 'FPC for Display', quantity_million_units_year: 200}]->(asm);

// Passive components to PCBA
MATCH (mlcc:PassiveMfg {id: 'PASS-MLCC-001'}), (asm:PCBAssembly {id: 'PCBA-001'})
CREATE (mlcc)-[:SUPPLIES_COMPONENT {product: 'MLCC 0201', quantity_per_board: 850, annual_quantity_billion: 153}]->(asm);

MATCH (mlcc:PassiveMfg {id: 'PASS-MLCC-002'}), (asm:PCBAssembly {id: 'PCBA-002'})
CREATE (mlcc)-[:SUPPLIES_COMPONENT {product: 'MLCC 01005', quantity_per_board: 420}]->(asm);

MATCH (res:PassiveMfg {id: 'PASS-RES-001'}), (asm:PCBAssembly {id: 'PCBA-001'})
CREATE (res)-[:SUPPLIES_COMPONENT {product: 'Resistor 0402', quantity_per_board: 320}]->(asm);

MATCH (ind:PassiveMfg {id: 'PASS-IND-001'}), (asm:PCBAssembly {id: 'PCBA-001'})
CREATE (ind)-[:SUPPLIES_COMPONENT {product: 'Power Inductor', quantity_per_board: 28}]->(asm);

// Connectors to PCBA
MATCH (conn:ConnectorMfg {id: 'CONN-001'}), (asm:PCBAssembly {id: 'PCBA-001'})
CREATE (conn)-[:SUPPLIES_COMPONENT {product: 'USB-C Connector', quantity_per_board: 1}]->(asm);

MATCH (conn:ConnectorMfg {id: 'CONN-003'}), (asm:PCBAssembly {id: 'PCBA-001'})
CREATE (conn)-[:SUPPLIES_COMPONENT {product: 'FPC Connector', quantity_per_board: 8}]->(asm);

// Aluminum blanks to chassis manufacturing
MATCH (al:MaterialMfg {id: 'MAT-AL-004'}), (ch:ChassisManufacturing {id: 'CHASSIS-001'})
CREATE (al)-[:SUPPLIES {product: 'Aluminum Blank', quantity_million_units_year: 120}]->(ch);

MATCH (al:MaterialMfg {id: 'MAT-AL-004'}), (ch:ChassisManufacturing {id: 'CHASSIS-002'})
CREATE (al)-[:SUPPLIES {product: 'Aluminum Blank', quantity_million_units_year: 200}]->(ch);

// ==================== TIER 2: MODULE INTEGRATION ====================

// Tier 2 integrates Tier 3 assemblies into major subsystems
CREATE (mod_main1:ModuleIntegrator {id: 'MOD-MAIN-001', name: 'Foxconn Module Integration', country: 'China', region: 'Zhengzhou', specialty: 'Mainboard Module', capacity_million_units_year: 250}),
(mod_main2:ModuleIntegrator {id: 'MOD-MAIN-002', name: 'Pegatron System Integration', country: 'China', region: 'Shanghai', specialty: 'System Module', capacity_million_units_year: 180}),
(mod_cam1:ModuleIntegrator {id: 'MOD-CAM-001', name: 'LG Innotek Final Camera', country: 'South Korea', region: 'Gumi', specialty: 'Camera System', capacity_million_units_year: 200}),
(mod_aud1:ModuleIntegrator {id: 'MOD-AUD-001', name: 'AAC Acoustic Module', country: 'China', region: 'Shenzhen', specialty: 'Audio System', capacity_million_units_year: 320});

// ==================== TIER 2 RELATIONSHIPS (Tier 3 -> Tier 2) ====================

// Packaged chips to mainboard assembly
MATCH (chip:ChipAssembly {id: 'ASM-SOC-001'}), (pcba:PCBAssembly {id: 'PCBA-001'})
CREATE (chip)-[:SUPPLIES_CHIP {product: 'Packaged SoC', quantity_million_units_year: 180}]->(pcba);

MATCH (mem:ChipAssembly {id: 'ASM-MEM-001'}), (pcba:PCBAssembly {id: 'PCBA-001'})
CREATE (mem)-[:SUPPLIES_CHIP {product: 'LPDDR5X Package', quantity_million_units_year: 180}]->(pcba);

MATCH (mem:ChipAssembly {id: 'ASM-MEM-001'}), (pcba:PCBAssembly {id: 'PCBA-001'})
CREATE (mem)-[:SUPPLIES_CHIP {product: 'UFS 4.0 Package', quantity_million_units_year: 180}]->(pcba);

MATCH (rf:ChipAssembly {id: 'ASM-RF-001'}), (pcba:PCBAssembly {id: 'PCBA-001'})
CREATE (rf)-[:SUPPLIES_CHIP {product: 'RF Module', quantity_million_units_year: 180}]->(pcba);

MATCH (pmic:ChipAssembly {id: 'ASM-PMIC-001'}), (pcba:PCBAssembly {id: 'PCBA-001'})
CREATE (pmic)-[:SUPPLIES_CHIP {product: 'PMIC Package', quantity_per_board: 5}]->(pcba);

// PCBA to module integrators (completed mainboards)
MATCH (pcba:PCBAssembly {id: 'PCBA-001'}), (mod:ModuleIntegrator {id: 'MOD-MAIN-001'})
CREATE (pcba)-[:DELIVERS_MAINBOARD {product: 'Assembled Mainboard', quantity_million_units_year: 220}]->(mod);

MATCH (pcba:PCBAssembly {id: 'PCBA-002'}), (mod:ModuleIntegrator {id: 'MOD-MAIN-002'})
CREATE (pcba)-[:DELIVERS_MAINBOARD {product: 'Assembled Mainboard', quantity_million_units_year: 160}]->(mod);

// Display modules to module integrators
MATCH (disp:DisplayAssembly {id: 'DISP-ASM-001'}), (mod:ModuleIntegrator {id: 'MOD-MAIN-001'})
CREATE (disp)-[:DELIVERS_DISPLAY {product: 'Display Module Complete', quantity_million_units_year: 150}]->(mod);

MATCH (disp:DisplayAssembly {id: 'DISP-ASM-002'}), (mod:ModuleIntegrator {id: 'MOD-MAIN-002'})
CREATE (disp)-[:DELIVERS_DISPLAY {product: 'Display Module', quantity_million_units_year: 100}]->(mod);

// Battery packs to module integrators
MATCH (bat:BatteryPackAssembly {id: 'BAT-ASM-001'}), (mod:ModuleIntegrator {id: 'MOD-MAIN-001'})
CREATE (bat)-[:DELIVERS_BATTERY {product: 'Battery Pack 5000mAh', quantity_million_units_year: 180}]->(mod);

MATCH (bat:BatteryPackAssembly {id: 'BAT-ASM-002'}), (mod:ModuleIntegrator {id: 'MOD-MAIN-002'})
CREATE (bat)-[:DELIVERS_BATTERY {product: 'Battery Pack', quantity_million_units_year: 120}]->(mod);

// Camera modules to camera system integrators
MATCH (cam:CameraModuleMfg {id: 'CAM-MOD-001'}), (mod:ModuleIntegrator {id: 'MOD-CAM-001'})
CREATE (cam)-[:DELIVERS_CAMERA {product: 'Triple Camera Module', quantity_million_sets_year: 150}]->(mod);

MATCH (cam:CameraModuleMfg {id: 'CAM-MOD-003'}), (mod:ModuleIntegrator {id: 'MOD-CAM-001'})
CREATE (cam)-[:DELIVERS_CAMERA {product: 'Camera Module', quantity_million_sets_year: 100}]->(mod);

// Audio components to audio system
MATCH (aud:AudioMfg {id: 'AUDIO-001'}), (mod:ModuleIntegrator {id: 'MOD-AUD-001'})
CREATE (aud)-[:DELIVERS_AUDIO {product: 'MEMS Microphone', quantity_per_phone: 3}]->(mod);

MATCH (aud:AudioMfg {id: 'AUDIO-002'}), (mod:ModuleIntegrator {id: 'MOD-AUD-001'})
CREATE (aud)-[:DELIVERS_AUDIO {product: 'Speaker Box', quantity_per_phone: 2}]->(mod);

// Motors to camera module
MATCH (motor:MotorMfg {id: 'MOTOR-001'}), (cam:ModuleIntegrator {id: 'MOD-CAM-001'})
CREATE (motor)-[:DELIVERS_MOTOR {product: 'OIS Motor', quantity_per_phone: 1}]->(cam);

MATCH (motor:MotorMfg {id: 'MOTOR-003'}), (mod:ModuleIntegrator {id: 'MOD-MAIN-001'})
CREATE (motor)-[:DELIVERS_MOTOR {product: 'Haptic Motor', quantity_per_phone: 1}]->(mod);

// Chassis to module integrators
MATCH (ch:ChassisManufacturing {id: 'CHASSIS-001'}), (mod:ModuleIntegrator {id: 'MOD-MAIN-001'})
CREATE (ch)-[:DELIVERS_CHASSIS {product: 'Aluminum Frame', quantity_million_units_year: 100}]->(mod);

MATCH (ch:ChassisManufacturing {id: 'CHASSIS-002'}), (mod:ModuleIntegrator {id: 'MOD-MAIN-001'})
CREATE (ch)-[:DELIVERS_CHASSIS {product: 'Metal Frame', quantity_million_units_year: 120}]->(mod);

// ==================== TIER 1: PRE-ASSEMBLY ====================

// These are the EMS (Electronics Manufacturing Services) that do pre-assembly
CREATE (ems1:PreAssembly {id: 'EMS-001', name: 'Foxconn Zhengzhou Pre-Assembly', country: 'China', region: 'Zhengzhou', service: 'Sub-Assembly', capacity_million_units_year: 200}),
(ems2:PreAssembly {id: 'EMS-002', name: 'Pegatron Shanghai Pre-Assembly', country: 'China', region: 'Shanghai', service: 'Sub-Assembly', capacity_million_units_year: 150}),
(ems3:PreAssembly {id: 'EMS-003', name: 'Wistron India Pre-Assembly', country: 'India', region: 'Karnataka', service: 'Sub-Assembly', capacity_million_units_year: 80});

// ==================== TIER 1 RELATIONSHIPS (Tier 2 -> Tier 1) ====================

MATCH (mod:ModuleIntegrator {id: 'MOD-MAIN-001'}), (ems:PreAssembly {id: 'EMS-001'})
CREATE (mod)-[:DELIVERS_MODULES {modules: ['Mainboard', 'Display', 'Battery', 'Chassis'], quantity_million_kits_year: 180}]->(ems);

MATCH (mod:ModuleIntegrator {id: 'MOD-MAIN-002'}), (ems:PreAssembly {id: 'EMS-002'})
CREATE (mod)-[:DELIVERS_MODULES {modules: ['Mainboard', 'Display', 'Battery'], quantity_million_kits_year: 120}]->(ems);

MATCH (mod:ModuleIntegrator {id: 'MOD-CAM-001'}), (ems:PreAssembly {id: 'EMS-001'})
CREATE (mod)-[:DELIVERS_MODULES {modules: ['Camera System'], quantity_million_units_year: 180}]->(ems);

MATCH (mod:ModuleIntegrator {id: 'MOD-AUD-001'}), (ems:PreAssembly {id: 'EMS-001'})
CREATE (mod)-[:DELIVERS_MODULES {modules: ['Audio System'], quantity_million_units_year: 180}]->(ems);

// ==================== TIER 0: FINAL ASSEMBLY (OEM) ====================

CREATE (oem1:OEM {id: 'OEM-FINAL-001', name: 'TechCorp Zhengzhou Final Assembly', country: 'China', region: 'Zhengzhou',
  production_lines: 94, capacity_units_day: 550000, annual_capacity_million: 120, employees: 95000}),
(oem2:OEM {id: 'OEM-FINAL-002', name: 'TechCorp Shenzhen Final Assembly', country: 'China', region: 'Shenzhen',
  production_lines: 62, capacity_units_day: 280000, annual_capacity_million: 80, employees: 45000}),
(oem3:OEM {id: 'OEM-FINAL-003', name: 'TechCorp India Final Assembly', country: 'India', region: 'Tamil Nadu',
  production_lines: 38, capacity_units_day: 120000, annual_capacity_million: 35, employees: 28000}),
(oem4:OEM {id: 'OEM-FINAL-004', name: 'TechCorp Vietnam Final Assembly', country: 'Vietnam', region: 'Bac Ninh',
  production_lines: 28, capacity_units_day: 85000, annual_capacity_million: 25, employees: 18000});

// ==================== TIER 0 RELATIONSHIPS (Tier 1 -> Final Product) ====================

MATCH (ems:PreAssembly {id: 'EMS-001'}), (oem:OEM {id: 'OEM-FINAL-001'})
CREATE (ems)-[:DELIVERS_PRE_ASSEMBLED {quantity_million_units_year: 110}]->(oem);

MATCH (ems:PreAssembly {id: 'EMS-002'}), (oem:OEM {id: 'OEM-FINAL-002'})
CREATE (ems)-[:DELIVERS_PRE_ASSEMBLED {quantity_million_units_year: 75}]->(oem);

MATCH (ems:PreAssembly {id: 'EMS-003'}), (oem:OEM {id: 'OEM-FINAL-003'})
CREATE (ems)-[:DELIVERS_PRE_ASSEMBLED {quantity_million_units_year: 30}]->(oem);

// ==================== FINAL PRODUCT ====================

CREATE (product:FinalProduct {
  id: 'PRODUCT-001',
  name: 'TechCorp Quantum Pro Max',
  model: 'QP-MAX-2024',
  category: 'Flagship Smartphone',
  retail_price_usd: 1299,
  launch_date: '2024-09-15',
  total_components: 2847,
  unique_parts: 1653,
  total_suppliers_all_tiers: 487,
  countries_sourced_from: 43,
  total_annual_production_million: 250,
  avg_lead_time_days: 185,
  carbon_footprint_kg: 79.5,
  water_usage_liters: 12840,
  recyclable_content_percent: 68
});

// ==================== OEM TO PRODUCT ====================

MATCH (oem:OEM {id: 'OEM-FINAL-001'}), (p:FinalProduct {id: 'PRODUCT-001'})
CREATE (oem)-[:MANUFACTURES {
  units_per_year_million: 120,
  assembly_time_minutes: 8,
  quality_yield_percent: 98.7,
  cost_per_unit: 487.50
}]->(p);

MATCH (oem:OEM {id: 'OEM-FINAL-002'}), (p:FinalProduct {id: 'PRODUCT-001'})
CREATE (oem)-[:MANUFACTURES {
  units_per_year_million: 80,
  assembly_time_minutes: 8.5,
  quality_yield_percent: 98.4,
  cost_per_unit: 489.20
}]->(p);

MATCH (oem:OEM {id: 'OEM-FINAL-003'}), (p:FinalProduct {id: 'PRODUCT-001'})
CREATE (oem)-[:MANUFACTURES {
  units_per_year_million: 35,
  assembly_time_minutes: 9.2,
  quality_yield_percent: 97.8,
  cost_per_unit: 492.80
}]->(p);

MATCH (oem:OEM {id: 'OEM-FINAL-004'}), (p:FinalProduct {id: 'PRODUCT-001'})
CREATE (oem)-[:MANUFACTURES {
  units_per_year_million: 25,
  assembly_time_minutes: 9.5,
  quality_yield_percent: 97.5,
  cost_per_unit: 494.50
}]->(p);

// ==================== SUCCESS MESSAGE ====================
// When this completes, you have a complete 8-tier supply chain:
// Tier 7: Mines (60+ locations)
// Tier 6: Refineries/Processors (40+)
// Tier 5: Advanced Materials (150+)
// Tier 4: Sub-components (200+)
// Tier 3: Component Assembly (40+)
// Tier 2: Module Integration (10+)
// Tier 1: Pre-Assembly (3)
// Tier 0: Final Assembly (4 OEMs)
// Product: 1 flagship smartphone

// Total: 500+ nodes, 2000+ relationships
// Representing the true complexity of modern electronics manufacturing