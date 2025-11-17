// ==================== PART 6: MODULE ASSEMBLERS & INTEGRATION ====================
// Companies that integrate components into assemblies and modules
// for final assembly by OEMs

// Create indexes
CREATE INDEX module_id IF NOT EXISTS FOR (m:ModuleAssembler) ON (m.id);

// ==================== SMARTPHONE ASSEMBLY (ODM/EMS) ====================
// Original Design Manufacturers and Electronics Manufacturing Services

CREATE
// Taiwan - Foxconn (Hon Hai Precision Industry)
(asm_phone_foxconn:ModuleAssembler {
  id: 'ASM-PHONE-FOX',
  name: 'Foxconn Technology Group (Hon Hai Precision Industry)',
  country: 'Taiwan',
  headquarters: 'New Taipei City',
  coordinates: [25.0330, 121.4654],
  assembly_type: 'Full Device Assembly & Integration',
  specialty: 'Premium smartphone final assembly',
  services: ['Design', 'Engineering', 'Manufacturing', 'Assembly', 'Logistics'],
  products_assembled: ['iPhone (all models)', 'iPad', 'MacBook', 'Google Pixel', 'Amazon devices'],
  annual_capacity_million_units: 280,
  iphone_capacity_million_units: 180,
  operating_since: 1974,
  electronics_manufacturing_since: 1988,
  workforce_global: 1200000,
  facilities_count: 32,
  facility_locations: ['China (18)', 'Taiwan (5)', 'Vietnam (3)', 'India (4)', 'Brazil (1)', 'Mexico (1)'],
  major_campuses: ['Zhengzhou (iPhone City)', 'Shenzhen Longhua', 'Chengdu', 'Chennai India'],
  zhengzhou_workforce: 350000,
  zhengzhou_capacity_iphones_per_day: 500000,
  certifications: ['ISO 9001', 'ISO 14001', 'ISO 45001', 'IATF 16949', 'RBA'],
  customer_base: ['Apple (60% revenue)', 'Sony', 'Google', 'Amazon', 'Cisco', 'Dell', 'HP'],
  apple_dependence_percent: 60,
  market_position: 'World\'s largest electronics manufacturer',
  revenue_usd_billion_2023: 220,
  revenue_apple_usd_billion: 132,
  profit_margin_percent: 2.5,
  assembly_time_iphone_minutes: 3,
  quality_control: 'Rigorous inspection protocols',
  defect_rate_ppm: 25,
  r_and_d_centers: 12,
  automation_level: 'High',
  robots_deployed: 110000,
  diversification_strategy: ['EV manufacturing', 'Semiconductors', 'India expansion'],
  ev_partnerships: ['Fisker', 'Lordstown', 'Foxtron EV brand'],
  geopolitical_concerns: 'China concentration',
  india_expansion_investment_usd_billion: 1.5,
  vietnam_expansion: 'Growing',
  labor_controversies: 'Historic issues, improvements made',
  rba_compliance: 'Audited annually',
  environmental_rating: 'B+',
  renewable_energy_percent: 15,
  carbon_neutral_target_year: 2050,
  strategic_importance: 'Apple\'s primary manufacturing partner'
}),

// Taiwan - Pegatron
(asm_phone_pegatron:ModuleAssembler {
  id: 'ASM-PHONE-PEG',
  name: 'Pegatron Corporation',
  country: 'Taiwan',
  headquarters: 'Taipei',
  coordinates: [25.0330, 121.5654],
  assembly_type: 'Full Device Assembly',
  specialty: 'iPhone assembly (secondary supplier)',
  products_assembled: ['iPhone (select models)', 'ASUS products', 'Microsoft Surface', 'Game consoles'],
  annual_capacity_million_units: 95,
  iphone_capacity_million_units: 55,
  operating_since: 2008,
  spun_off_from: 'ASUS (2008)',
  workforce_global: 180000,
  facilities_count: 12,
  facility_locations: ['China (8)', 'Taiwan (2)', 'Czech Republic (1)', 'Mexico (1)'],
  certifications: ['ISO 9001', 'ISO 14001', 'ISO 45001', 'RBA'],
  customer_base: ['Apple (70%)', 'ASUS', 'Microsoft', 'Sony', 'Nintendo'],
  market_position: 'Apple\'s 2nd largest iPhone assembler',
  revenue_usd_billion_2023: 42,
  apple_revenue_percent: 70,
  profit_margin_percent: 1.8,
  quality_rating: 'High',
  defect_rate_ppm: 30,
  automation_investment: 'Increasing',
  diversification: 'EV components, enterprise hardware',
  environmental_rating: 'B+',
  rba_audits: 'Regular compliance checks'
}),

// Taiwan - Wistron
(asm_phone_wistron:ModuleAssembler {
  id: 'ASM-PHONE-WIS',
  name: 'Wistron Corporation',
  country: 'Taiwan',
  headquarters: 'New Taipei City',
  coordinates: [25.0642, 121.5272],
  assembly_type: 'Full Device Assembly',
  specialty: 'Smartphones & PCs',
  products_assembled: ['iPhone (legacy models)', 'Smartphones for various brands', 'Laptops', 'Servers'],
  annual_capacity_million_units: 72,
  operating_since: 2001,
  spun_off_from: 'Acer (2001)',
  workforce_global: 85000,
  facilities_count: 10,
  facility_locations: ['China (5)', 'Taiwan (2)', 'India (2)', 'Mexico (1)'],
  certifications: ['ISO 9001', 'ISO 14001', 'ISO 45001', 'RBA'],
  customer_base: ['Apple (declining)', 'Microsoft', 'HP', 'Dell', 'Lenovo'],
  apple_transition: 'Reducing iPhone assembly',
  tata_acquisition: 'Tata Group acquiring India operations (2023)',
  revenue_usd_billion_2023: 28,
  diversification_focus: 'Enterprise IT hardware',
  environmental_rating: 'B+'
}),

// China - Luxshare Precision
(asm_phone_luxshare:ModuleAssembler {
  id: 'ASM-PHONE-LUX',
  name: 'Luxshare Precision Industry',
  country: 'China',
  headquarters: 'Shenzhen, Guangdong',
  coordinates: [22.5431, 114.0579],
  assembly_type: 'Full Device Assembly & Components',
  specialty: 'iPhone assembly + AirPods + Apple Watch',
  products_assembled: ['iPhone (growing share)', 'AirPods', 'Apple Watch', 'Connectors', 'Acoustic components'],
  annual_capacity_million_units_iphone: 35,
  airpods_capacity_million_units: 180,
  operating_since: 2004,
  workforce: 150000,
  facilities_count: 18,
  facility_locations: ['China (15)', 'Vietnam (2)', 'India (1 planned)'],
  certifications: ['ISO 9001', 'ISO 14001', 'ISO 45001', 'IATF 16949', 'RBA'],
  customer_base: ['Apple (85%)', 'Amazon', 'Meta', 'HP'],
  apple_strategic_supplier: true,
  iphone_assembly_entry: 2020,
  iphone_share_growth: 'Rapidly increasing (taking share from Pegatron/Wistron)',
  market_position: 'Rising star in Apple supply chain',
  revenue_usd_billion_2023: 22,
  apple_revenue_percent: 85,
  profit_margin_percent: 4.2,
  quality_rating: 'Improving rapidly',
  vertical_integration: 'Components to assembly',
  acquisitions: ['Catcher Technology stake (chassis)', 'BizLink (cables)'],
  strategic_advantage: 'Chinese champion with Apple trust',
  geopolitical_factor: 'China-US tensions',
  diversification_geography: 'Expanding to Vietnam, India',
  environmental_rating: 'B+',
  automation_level: 'High'
}),

// China - BYD Electronics
(asm_phone_byd_elec:ModuleAssembler {
  id: 'ASM-PHONE-BYD',
  name: 'BYD Electronics',
  parent_company: 'BYD Company Limited',
  country: 'China',
  headquarters: 'Shenzhen, Guangdong',
  coordinates: [22.5431, 114.0579],
  assembly_type: 'Components & Assembly',
  specialty: 'Metal chassis, glass backs, assembly services',
  products_assembled: ['iPhone components', 'Huawei phones', 'Xiaomi devices', 'Metal/glass housings'],
  annual_capacity_million_units: 85,
  operating_since: 2007,
  workforce: 95000,
  facilities_count: 14,
  facility_locations: ['China (12)', 'India (1)', 'Vietnam (1)'],
  certifications: ['ISO 9001', 'ISO 14001', 'ISO 45001', 'RBA'],
  customer_base: ['Apple', 'Huawei', 'Xiaomi', 'Samsung'],
  specialty_capabilities: ['Metal injection molding', 'Glass precision processing', '3D glass'],
  market_position: 'Major structural components supplier',
  revenue_usd_billion_2023: 11,
  byd_group_synergies: 'Manufacturing expertise from auto division',
  environmental_rating: 'B+'
});

// ==================== DISPLAY MODULE ASSEMBLY ====================

CREATE
// South Korea - Samsung Display Module Assembly
(asm_display_samsung:ModuleAssembler {
  id: 'ASM-DISP-SAM',
  name: 'Samsung Display Module Assembly Division',
  parent_company: 'Samsung Display',
  country: 'South Korea',
  region: 'Asan',
  coordinates: [36.7836, 127.0045],
  assembly_type: 'Display Module Assembly',
  specialty: 'OLED display module integration',
  products: ['Complete OLED display modules', 'Touch-integrated displays', 'Foldable display assemblies'],
  components_integrated: ['OLED panel', 'Touch sensor', 'Digitizer', 'Protective glass', 'Adhesives', 'Flex cables'],
  annual_capacity_million_modules: 550,
  operating_since: 2007,
  workforce: 12000,
  facilities_count: 3,
  facility_locations: ['South Korea (2)', 'Vietnam (1)'],
  integration_process: 'Panel → Touch bonding → Testing → Packaging',
  touch_technology: 'Y-OCTA (On-Cell Touch AMOLED)',
  yield_rate_percent: 92,
  testing_procedures: ['Visual inspection', 'Touch response', 'Color calibration', 'Burn-in test'],
  certifications: ['ISO 9001', 'ISO 14001', 'ISO 45001'],
  customer_base: ['Apple', 'Samsung Mobile', 'Google', 'Xiaomi'],
  market_position: 'Largest OLED module assembler',
  just_in_time_delivery: true,
  proximity_to_customers: 'Co-located with final assembly',
  environmental_rating: 'A-',
  defect_rate_ppm: 18
}),

// China - Tianma Module Assembly
(asm_display_tianma:ModuleAssembler {
  id: 'ASM-DISP-TIA',
  name: 'Tianma Microelectronics Module Division',
  country: 'China',
  region: 'Shenzhen, Guangdong',
  coordinates: [22.5431, 114.0579],
  assembly_type: 'Display Module Assembly',
  products: ['LCD modules', 'OLED modules', 'In-cell touch displays'],
  annual_capacity_million_modules: 320,
  operating_since: 1983,
  workforce: 28000,
  facilities_count: 8,
  facility_locations: ['China (7)', 'Japan (1)'],
  certifications: ['ISO 9001', 'ISO 14001'],
  customer_base: ['Xiaomi', 'Oppo', 'Vivo', 'Samsung', 'Transsion'],
  market_segment: 'Mid-range smartphones',
  environmental_rating: 'B+'
});

// ==================== CAMERA MODULE ASSEMBLY ====================

CREATE
// Taiwan/China - Largan Precision (Lens) + Assembly Partners
(asm_camera_largan:ModuleAssembler {
  id: 'ASM-CAM-LAR',
  name: 'Largan Precision',
  country: 'Taiwan',
  region: 'Taichung',
  coordinates: [24.1477, 120.6736],
  assembly_type: 'Camera Lens & Module Assembly',
  specialty: 'Premium smartphone camera lenses',
  products: ['Multi-element lens assemblies', 'Complete camera modules'],
  lens_elements_per_module: 7,
  lens_types: ['Wide', 'Ultra-wide', 'Telephoto', 'Periscope'],
  precision_level_um: 1,
  annual_capacity_million_sets: 520,
  operating_since: 1987,
  workforce: 18000,
  facilities_count: 4,
  facility_locations: ['Taiwan (3)', 'China (1)'],
  manufacturing_process: ['Injection molding', 'Precision grinding', 'Multi-layer coating', 'Assembly', 'Testing'],
  coating_technology: 'Multi-layer anti-reflective',
  quality_control: 'Automated optical inspection',
  defect_rate_ppm: 8,
  certifications: ['ISO 9001', 'ISO 14001', 'ISO 45001'],
  customer_base: ['Apple (70%)', 'Samsung', 'Xiaomi', 'Huawei'],
  market_position: 'World\'s largest lens manufacturer',
  market_share_percent: 35,
  revenue_usd_billion_2023: 2.8,
  profit_margin_percent: 28,
  technological_leadership: 'Industry leading precision',
  r_and_d_investment_percent_revenue: 8,
  patents: 1200,
  competitive_moat: 'Difficult to replicate precision',
  environmental_rating: 'A-'
}),

// Japan - Kantatsu (Voice Coil Motor for OIS)
(asm_camera_kantatsu:ModuleAssembler {
  id: 'ASM-CAM-KAN',
  name: 'Kantatsu Co. Ltd',
  country: 'Japan',
  region: 'Fukushima',
  coordinates: [37.7500, 140.4667],
  assembly_type: 'Camera Actuator & Module Assembly',
  specialty: 'Optical Image Stabilization (OIS) actuators',
  products: ['Voice Coil Motors (VCM)', 'OIS actuators', 'Autofocus mechanisms'],
  technology: 'Ball-bearing VCM',
  precision_um: 0.5,
  response_time_ms: 5,
  annual_capacity_million_units: 380,
  operating_since: 1945,
  camera_actuators_since: 2005,
  workforce: 8500,
  facilities_count: 6,
  facility_locations: ['Japan (2)', 'China (3)', 'Vietnam (1)'],
  certifications: ['ISO 9001', 'ISO 14001', 'ISO 45001'],
  customer_base: ['LG Innotek (Apple)', 'Samsung Electro-Mechanics', 'Sony', 'Sharp'],
  market_position: 'Leading OIS actuator supplier',
  quality_rating: 'Premium',
  environmental_rating: 'A'
});

// ==================== PCB ASSEMBLY & INTEGRATION ====================

CREATE
// Taiwan - Unimicron (PCB manufacturer)
(asm_pcb_unimicron:ModuleAssembler {
  id: 'ASM-PCB-UNI',
  name: 'Unimicron Technology Corporation',
  country: 'Taiwan',
  region: 'Taoyuan',
  coordinates: [24.9936, 121.3010],
  assembly_type: 'Printed Circuit Board Manufacturing',
  specialty: 'High-density interconnect (HDI) PCBs',
  products: ['Smartphone mainboards', 'Laptop PCBs', 'Automotive PCBs', 'IC substrates'],
  pcb_types: ['HDI PCBs', 'Any-layer HDI', 'Rigid-flex PCBs', 'IC substrates'],
  layer_count_max: 30,
  minimum_line_width_um: 25,
  minimum_via_diameter_um: 75,
  annual_capacity_million_sqm: 18,
  operating_since: 1990,
  workforce: 28000,
  facilities_count: 12,
  facility_locations: ['Taiwan (5)', 'China (6)', 'Thailand (1)'],
  certifications: ['ISO 9001', 'IATF 16949', 'ISO 14001', 'ISO 45001'],
  customer_base: ['Apple (iPhone/MacBook PCBs)', 'Huawei', 'Xiaomi', 'Intel', 'AMD', 'NVIDIA'],
  market_position: 'Top 5 global PCB manufacturer',
  revenue_usd_billion_2023: 5.2,
  technology_leadership: 'Advanced HDI and substrates',
  apple_certification: 'Tier 1 supplier',
  environmental_rating: 'A-',
  chemical_management: 'Strict controls'
}),

// Taiwan - Compeq (PCB)
(asm_pcb_compeq:ModuleAssembler {
  id: 'ASM-PCB-COM',
  name: 'Compeq Manufacturing',
  country: 'Taiwan',
  region: 'Hsinchu',
  coordinates: [24.8138, 120.9675],
  assembly_type: 'PCB Manufacturing',
  products: ['HDI PCBs', 'Rigid-flex PCBs', 'Mainboards'],
  annual_capacity_million_sqm: 8.5,
  operating_since: 1977,
  workforce: 12000,
  facilities_count: 6,
  facility_locations: ['Taiwan (2)', 'China (3)', 'Malaysia (1)'],
  certifications: ['ISO 9001', 'IATF 16949', 'ISO 14001'],
  customer_base: ['Apple', 'Dell', 'HP', 'Lenovo'],
  revenue_usd_billion_2023: 1.8,
  environmental_rating: 'B+'
}),

// China - AT&S (Austria Technologie & Systemtechnik) - China facilities
(asm_pcb_ats:ModuleAssembler {
  id: 'ASM-PCB-ATS',
  name: 'AT&S (Austria Technologie & Systemtechnik)',
  country: 'Austria',
  headquarters: 'Leoben, Austria',
  asia_facilities: 'China & India',
  coordinates: [47.3769, 15.0964],
  assembly_type: 'High-end PCB & IC Substrates',
  specialty: 'IC substrates for advanced packaging',
  products: ['IC substrates', 'HDI PCBs', 'Embedded component PCBs'],
  annual_capacity_million_sqm: 6.2,
  operating_since: 1987,
  workforce: 13500,
  facilities_count: 7,
  facility_locations: ['Austria (2)', 'India (1)', 'China Chongqing (2)', 'South Korea (1)', 'Malaysia (1)'],
  certifications: ['ISO 9001', 'IATF 16949', 'ISO 14001', 'ISO 45001'],
  customer_base: ['Intel', 'Qualcomm', 'MediaTek', 'AMD', 'Apple'],
  market_position: 'Leading European PCB maker',
  revenue_usd_billion_2023: 1.5,
  technology_focus: 'Advanced IC substrates for chiplets',
  environmental_rating: 'A',
  sustainability_leader: 'European environmental standards'
});

// ==================== FINAL INTEGRATION & TESTING ====================

CREATE
// Global - Flex Ltd (formerly Flextronics)
(asm_integration_flex:ModuleAssembler {
  id: 'ASM-INT-FLEX',
  name: 'Flex Ltd (formerly Flextronics)',
  country: 'Singapore',
  headquarters: 'Singapore',
  coordinates: [1.3521, 103.8198],
  assembly_type: 'Electronics Manufacturing Services',
  specialty: 'Design, engineering, manufacturing',
  products_assembled: ['Smartphones (mid-tier)', 'Wearables', 'IoT devices', 'Automotive electronics'],
  annual_capacity_million_units: 125,
  operating_since: 1969,
  workforce_global: 160000,
  facilities_count: 100,
  facility_locations: '30 countries across Americas, Asia, Europe',
  certifications: ['ISO 9001', 'ISO 14001', 'ISO 45001', 'IATF 16949', 'RBA'],
  customer_base: ['Microsoft', 'Google', 'Lenovo', 'Motorola', 'Nike', 'automotive OEMs'],
  market_position: 'Top 5 global EMS provider',
  revenue_usd_billion_2023: 26,
  services: ['Design', 'New product introduction', 'Manufacturing', 'Logistics', 'After-sales'],
  verticals: ['Consumer devices', 'Automotive', 'Health solutions', 'Industrial'],
  environmental_rating: 'A-',
  carbon_neutral_target_year: 2040
}),

// Taiwan - Inventec
(asm_integration_inventec:ModuleAssembler {
  id: 'ASM-INT-INV',
  name: 'Inventec Corporation',
  country: 'Taiwan',
  headquarters: 'Taipei',
  coordinates: [25.0330, 121.5654],
  assembly_type: 'Electronics Manufacturing Services',
  specialty: 'Notebooks, servers, smartphones',
  products_assembled: ['Laptops', 'Servers', 'Smartphones (ODM)', 'IoT devices'],
  annual_capacity_million_units: 62,
  operating_since: 1975,
  workforce: 82000,
  facilities_count: 18,
  facility_locations: ['Taiwan (4)', 'China (10)', 'Mexico (2)', 'Czech Republic (1)', 'UK (1)'],
  certifications: ['ISO 9001', 'ISO 14001', 'ISO 45001', 'RBA'],
  customer_base: ['HP', 'Toshiba', 'Acer', 'NEC', 'Xiaomi'],
  revenue_usd_billion_2023: 18,
  environmental_rating: 'B+'
});

// Success message
MATCH (n:ModuleAssembler)
RETURN 'Part 6 Complete: Created ' + count(n) + ' module assembler nodes' as message;
