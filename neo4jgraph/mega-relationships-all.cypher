// ==================== MEGA RELATIONSHIPS FILE ====================
// This file contains ALL relationships connecting the entire supply chain
// from mines → processors → materials → components → assembly → OEMs → products
//
// Load order:
// 1. neo4j-part1-mines.cypher
// 2. neo4j-part2-processors.cypher
// 3. neo4j-part3-mine-processor-relationships.cypher (already has SUPPLIES relationships)
// 4. neo4j-part4-material-manufacturers.cypher
// 5. neo4j-part5-component-manufacturers.cypher
// 6. neo4j-part6-module-assemblers.cypher
// 7. neo4j-part7-oems-products.cypher
// 8. THIS FILE (mega-relationships-all.cypher)

// ==================== TIER 4→3: PROCESSORS → MATERIAL MANUFACTURERS ====================

// Copper smelters → Cathode materials (copper foil production)
MATCH (smelter:Smelter {id: 'SMELT-CU-VEN'}), (mat:MaterialMfg {id: 'MAT-ANODE-BTR'})
CREATE (smelter)-[:PROVIDES {
  material: 'Copper Cathode 99.99%',
  annual_volume_tonnes: 8500,
  end_use: 'Anode copper foil production',
  pricing_model: 'LME + premium',
  transport_method: 'Container ship',
  lead_time_days: 45,
  contract_type: 'Annual contract',
  relationship_since: 2015
}]->(mat);

MATCH (smelter:Smelter {id: 'SMELT-CU-ONA'}), (mat:MaterialMfg {id: 'MAT-ANODE-BTR'})
CREATE (smelter)-[:PROVIDES {
  material: 'Copper Cathode 99.99%',
  annual_volume_tonnes: 12000,
  end_use: 'Anode copper foil',
  lead_time_days: 25,
  relationship_since: 2018
}]->(mat);

MATCH (smelter:Smelter {id: 'SMELT-CU-ONS'}), (mat:MaterialMfg {id: 'MAT-ANODE-POSCO'})
CREATE (smelter)-[:PROVIDES {
  material: 'Copper Cathode',
  annual_volume_tonnes: 15000,
  end_use: 'Copper foil for batteries',
  geographic_proximity: 'Both in South Korea',
  lead_time_days: 7,
  relationship_since: 2012
}]->(mat);

// Lithium processors → Cathode materials
MATCH (proc:Processor {id: 'PROC-LI-TIA'}), (mat:MaterialMfg {id: 'MAT-CATH-CATL'})
CREATE (proc)-[:PROVIDES {
  material: 'Lithium Hydroxide Monohydrate Battery Grade',
  purity_percent: 99.5,
  annual_volume_tonnes: 28000,
  end_use: 'NMC 811 cathode production',
  pricing_model: 'Lithium hydroxide index linked',
  transport_method: 'Bulk bags via ship',
  shipping_route: 'Fremantle → Shanghai',
  lead_time_days: 22,
  contract_type: 'Long-term strategic',
  contract_years: 5,
  relationship_since: 2019,
  strategic_partnership: true
}]->(mat);

MATCH (proc:Processor {id: 'PROC-LI-SQM'}), (mat:MaterialMfg {id: 'MAT-CATH-LNF'})
CREATE (proc)-[:PROVIDES {
  material: 'Lithium Hydroxide',
  annual_volume_tonnes: 18000,
  end_use: 'High-nickel NCMA cathode',
  shipping_route: 'Antofagasta → Busan',
  lead_time_days: 38,
  relationship_since: 2016
}]->(mat);

MATCH (proc:Processor {id: 'PROC-LI-ALB'}), (mat:MaterialMfg {id: 'MAT-CATH-SUM'})
CREATE (proc)-[:PROVIDES {
  material: 'Lithium Hydroxide Battery Grade',
  annual_volume_tonnes: 15000,
  end_use: 'NCA cathode production',
  customer: 'Sumitomo for Panasonic supply chain',
  shipping_route: 'Antofagasta → Yokohama',
  lead_time_days: 42,
  relationship_since: 2018
}]->(mat);

MATCH (proc:Processor {id: 'PROC-LI-GAN'}), (mat:MaterialMfg {id: 'MAT-CATH-CATL'})
CREATE (proc)-[:PROVIDES {
  material: 'Lithium Carbonate + Lithium Hydroxide',
  annual_volume_tonnes: 35000,
  end_use: 'Multiple cathode chemistries',
  geographic_advantage: 'Both in China',
  lead_time_days: 5,
  just_in_time_delivery: true,
  relationship_since: 2014
}]->(mat);

MATCH (proc:Processor {id: 'PROC-LI-GAN'}), (mat:MaterialMfg {id: 'MAT-CATH-GEM'})
CREATE (proc)-[:PROVIDES {
  material: 'Lithium Compounds',
  annual_volume_tonnes: 22000,
  domestic_china_supply: true,
  lead_time_days: 3,
  relationship_since: 2017
}]->(mat);

// Cobalt refineries → Cathode materials
MATCH (ref:Refinery {id: 'REF-CO-UMI'}), (mat:MaterialMfg {id: 'MAT-CATH-LNF'})
CREATE (ref)-[:PROVIDES {
  material: 'Cobalt Sulfate Battery Grade',
  purity_percent: 99.95,
  annual_volume_tonnes: 4200,
  end_use: 'High-nickel cathodes',
  ethical_certification: 'RBA + RMI',
  traceability: 'Full blockchain tracking',
  conflict_free: true,
  pricing_premium_percent: 8,
  transport_method: 'ISO tanks via ship',
  shipping_route: 'Antwerp → Busan',
  lead_time_days: 35,
  contract_type: 'Long-term ethical sourcing',
  relationship_since: 2015,
  customer_approvals: ['Tesla', 'BMW', 'VW']
}]->(mat);

MATCH (ref:Refinery {id: 'REF-CO-UMI'}), (mat:MaterialMfg {id: 'MAT-CATH-SUM'})
CREATE (ref)-[:PROVIDES {
  material: 'Cobalt Sulfate Premium Grade',
  annual_volume_tonnes: 3800,
  end_use: 'NCA cathode for Panasonic',
  ethical_certification: 'Highest standards',
  shipping_route: 'Antwerp → Yokohama',
  lead_time_days: 38,
  relationship_since: 2012
}]->(mat);

MATCH (ref:Refinery {id: 'REF-CO-UMI'}), (mat:MaterialMfg {id: 'MAT-CATH-UMI'})
CREATE (ref)-[:PROVIDES {
  material: 'Cobalt Sulfate',
  annual_volume_tonnes: 6500,
  internal_umicore_supply: 'Same company vertical integration',
  lead_time_days: 1,
  relationship_since: 2006
}]->(mat);

MATCH (ref:Refinery {id: 'REF-CO-HUA'}), (mat:MaterialMfg {id: 'MAT-CATH-CATL'})
CREATE (ref)-[:PROVIDES {
  material: 'Cobalt Sulfate',
  annual_volume_tonnes: 24000,
  domestic_china_supply: true,
  cost_competitive: true,
  lead_time_days: 7,
  relationship_since: 2013
}]->(mat);

MATCH (ref:Refinery {id: 'REF-CO-HUA'}), (mat:MaterialMfg {id: 'MAT-CATH-GEM'})
CREATE (ref)-[:PROVIDES {
  material: 'Cobalt Sulfate',
  annual_volume_tonnes: 18000,
  domestic_china_supply: true,
  lead_time_days: 5,
  relationship_since: 2015
}]->(mat);

MATCH (ref:Refinery {id: 'REF-CO-TER'}), (mat:MaterialMfg {id: 'MAT-CATH-UMI'})
CREATE (ref)-[:PROVIDES {
  material: 'Cobalt Sulfate European Source',
  annual_volume_tonnes: 2800,
  conflict_free_eu_source: true,
  transport_method: 'Truck (intra-Europe)',
  lead_time_days: 5,
  relationship_since: 2022,
  strategic_importance: 'European battery supply chain independence'
}]->(mat);

// Silicon wafer suppliers → Semiconductor fabs (indirect, wafers used for chip production)
MATCH (mat:MaterialMfg {id: 'MAT-WAF-GLO'}), (comp:ComponentMfg {id: 'COMP-CHIP-TSMC'})
CREATE (mat)-[:SUPPLIES_WAFERS {
  material: '300mm silicon wafers',
  purity: '11N',
  annual_volume_million_wafers: 2.8,
  wafer_specifications: '775um thick, <0.5um TTV',
  transport_method: 'Cleanroom containers',
  delivery_frequency: 'Daily',
  lead_time_days: 7,
  quality_requirements: 'Semiconductor grade',
  relationship_since: 2015,
  strategic_supplier: true
}]->(comp);

MATCH (mat:MaterialMfg {id: 'MAT-WAF-SHI'}), (comp:ComponentMfg {id: 'COMP-CHIP-TSMC'})
CREATE (mat)-[:SUPPLIES_WAFERS {
  material: '300mm silicon wafers',
  annual_volume_million_wafers: 4.2,
  market_position: 'Primary supplier',
  lead_time_days: 5,
  relationship_since: 2008
}]->(comp);

MATCH (mat:MaterialMfg {id: 'MAT-WAF-SHI'}), (comp:ComponentMfg {id: 'COMP-CHIP-SAM'})
CREATE (mat)-[:SUPPLIES_WAFERS {
  material: '300mm silicon wafers',
  annual_volume_million_wafers: 1.5,
  lead_time_days: 12,
  relationship_since: 2010
}]->(comp);

MATCH (mat:MaterialMfg {id: 'MAT-WAF-SKS'}), (comp:ComponentMfg {id: 'COMP-CHIP-SAM'})
CREATE (mat)-[:SUPPLIES_WAFERS {
  material: '300mm silicon wafers',
  annual_volume_million_wafers: 1.8,
  domestic_korea_supply: true,
  sk_group_affiliation: 'Same conglomerate',
  lead_time_days: 3,
  relationship_since: 2007
}]->(comp);

MATCH (mat:MaterialMfg {id: 'MAT-WAF-GLO'}), (comp:ComponentMfg {id: 'COMP-CHIP-INT'})
CREATE (mat)-[:SUPPLIES_WAFERS {
  material: '300mm silicon wafers',
  annual_volume_million_wafers: 2.1,
  lead_time_days: 15,
  relationship_since: 2018
}]->(comp);

// Photoresist suppliers → Semiconductor fabs
MATCH (mat:MaterialMfg {id: 'MAT-PHOTO-DUP'}), (comp:ComponentMfg {id: 'COMP-CHIP-TSMC'})
CREATE (mat)-[:SUPPLIES_CHEMICALS {
  material: 'EUV Photoresist',
  process_nodes: ['3nm', '5nm', '7nm'],
  annual_volume_tonnes: 45,
  critical_material: true,
  export_controls: 'US regulations',
  transport_method: 'Temperature-controlled air freight',
  lead_time_days: 14,
  relationship_since: 2019,
  strategic_importance: 'Critical for advanced nodes'
}]->(comp);

MATCH (mat:MaterialMfg {id: 'MAT-PHOTO-JSR'}), (comp:ComponentMfg {id: 'COMP-CHIP-TSMC'})
CREATE (mat)-[:SUPPLIES_CHEMICALS {
  material: 'EUV Photoresist',
  annual_volume_tonnes: 52,
  market_leader: true,
  lead_time_days: 10,
  relationship_since: 2017
}]->(comp);

MATCH (mat:MaterialMfg {id: 'MAT-PHOTO-JSR'}), (comp:ComponentMfg {id: 'COMP-CHIP-SAM'})
CREATE (mat)-[:SUPPLIES_CHEMICALS {
  material: 'EUV + ArF Photoresist',
  annual_volume_tonnes: 38,
  lead_time_days: 8,
  relationship_since: 2016
}]->(comp);

// ==================== TIER 3→2: MATERIAL MANUFACTURERS → COMPONENT MANUFACTURERS ====================

// Cathode materials → Battery cell manufacturers
MATCH (mat:MaterialMfg {id: 'MAT-CATH-CATL'}), (comp:ComponentMfg {id: 'COMP-BAT-CATL'})
CREATE (mat)-[:SUPPLIES_COMPONENT {
  material: 'NMC 811 Cathode Active Material',
  annual_volume_tonnes: 78000,
  internal_supply: 'Same company division',
  transfer_pricing: true,
  lead_time_days: 1,
  just_in_time: true,
  relationship_since: 2011,
  vertical_integration: true
}]->(comp);

MATCH (mat:MaterialMfg {id: 'MAT-CATH-LNF'}), (comp:ComponentMfg {id: 'COMP-BAT-LGES'})
CREATE (mat)-[:SUPPLIES_COMPONENT {
  material: 'NCMA + NMC Cathode Materials',
  annual_volume_tonnes: 52000,
  exclusive_supplier: 'Primary cathode supplier',
  custom_formulation: 'L&F develops custom blends for LGES',
  transport_method: 'Truck (domestic Korea)',
  lead_time_days: 3,
  quality_agreement: 'Strict specifications',
  relationship_since: 2010,
  strategic_partnership: true
}]->(comp);

MATCH (mat:MaterialMfg {id: 'MAT-CATH-SUM'}), (comp:ComponentMfg {id: 'COMP-BAT-PAN'})
CREATE (mat)-[:SUPPLIES_COMPONENT {
  material: 'NCA Cathode Material',
  annual_volume_tonnes: 38000,
  end_customer: 'Tesla (via Panasonic)',
  purity_requirements: 'Extremely high',
  consistency_requirements: 'Critical for Tesla quality',
  transport_method: 'Ship',
  shipping_route: 'Japan → Nevada',
  lead_time_days: 28,
  relationship_since: 2012,
  tesla_supply_chain: true
}]->(comp);

MATCH (mat:MaterialMfg {id: 'MAT-CATH-GEM'}), (comp:ComponentMfg {id: 'COMP-BAT-CATL'})
CREATE (mat)-[:SUPPLIES_COMPONENT {
  material: 'Recycled NMC Cathode Materials',
  annual_volume_tonnes: 18000,
  recycled_content_percent: 100,
  circular_economy: true,
  cost_advantage: true,
  environmental_benefit: 'Lower carbon footprint',
  lead_time_days: 10,
  relationship_since: 2019
}]->(comp);

MATCH (mat:MaterialMfg {id: 'MAT-CATH-UMI'}), (comp:ComponentMfg {id: 'COMP-BAT-SDI'})
CREATE (mat)-[:SUPPLIES_COMPONENT {
  material: 'Custom NMC + NCA Cathodes',
  annual_volume_tonnes: 28000,
  ethical_sourcing: 'Fully traceable cobalt',
  premium_segment: 'For BMW, VW premium EVs',
  transport_method: 'Ship',
  shipping_route: 'Antwerp → Busan',
  lead_time_days: 35,
  relationship_since: 2014
}]->(comp);

// Anode materials → Battery cell manufacturers
MATCH (mat:MaterialMfg {id: 'MAT-ANODE-BTR'}), (comp:ComponentMfg {id: 'COMP-BAT-CATL'})
CREATE (mat)-[:SUPPLIES_COMPONENT {
  material: 'Artificial Graphite Anode',
  annual_volume_tonnes: 95000,
  capacity_mah_g: 365,
  domestic_china_supply: true,
  lead_time_days: 5,
  relationship_since: 2013,
  market_leader: true
}]->(comp);

MATCH (mat:MaterialMfg {id: 'MAT-ANODE-BTR'}), (comp:ComponentMfg {id: 'COMP-BAT-LGES'})
CREATE (mat)-[:SUPPLIES_COMPONENT {
  material: 'Artificial Graphite Anode',
  annual_volume_tonnes: 42000,
  shipping_route: 'Shanghai → Busan',
  lead_time_days: 8,
  relationship_since: 2016
}]->(comp);

MATCH (mat:MaterialMfg {id: 'MAT-ANODE-HIT'}), (comp:ComponentMfg {id: 'COMP-BAT-PAN'})
CREATE (mat)-[:SUPPLIES_COMPONENT {
  material: 'Silicon-Graphite Composite Anode',
  capacity_mah_g: 420,
  silicon_content_percent: 15,
  premium_product: true,
  end_customer: 'Tesla 4680 cells',
  lead_time_days: 25,
  relationship_since: 2020,
  next_gen_technology: true
}]->(comp);

MATCH (mat:MaterialMfg {id: 'MAT-ANODE-POS'}), (comp:ComponentMfg {id: 'COMP-BAT-LGES'})
CREATE (mat)-[:SUPPLIES_COMPONENT {
  material: 'Artificial Graphite',
  annual_volume_tonnes: 35000,
  domestic_korea_supply: true,
  lead_time_days: 2,
  relationship_since: 2018
}]->(comp);

MATCH (mat:MaterialMfg {id: 'MAT-ANODE-POS'}), (comp:ComponentMfg {id: 'COMP-BAT-SDI'})
CREATE (mat)-[:SUPPLIES_COMPONENT {
  material: 'Graphite Anode',
  annual_volume_tonnes: 28000,
  domestic_korea_supply: true,
  lead_time_days: 2,
  relationship_since: 2017
}]->(comp);

// Electrolyte → Battery cell manufacturers
MATCH (mat:MaterialMfg {id: 'MAT-ELEC-TIN'}), (comp:ComponentMfg {id: 'COMP-BAT-CATL'})
CREATE (mat)-[:SUPPLIES_COMPONENT {
  material: 'Electrolyte Solution + LiPF6',
  annual_volume_tonnes: 58000,
  custom_formulations: 'Different blends for NMC vs LFP',
  lead_time_days: 7,
  relationship_since: 2014,
  largest_customer: 'CATL is Tinci\'s largest customer'
}]->(comp);

MATCH (mat:MaterialMfg {id: 'MAT-ELEC-TIN'}), (comp:ComponentMfg {id: 'COMP-BAT-LGES'})
CREATE (mat)-[:SUPPLIES_COMPONENT {
  material: 'Electrolyte Solutions',
  annual_volume_tonnes: 32000,
  shipping_route: 'China → South Korea',
  lead_time_days: 10,
  relationship_since: 2016
}]->(comp);

MATCH (mat:MaterialMfg {id: 'MAT-ELEC-MIT'}), (comp:ComponentMfg {id: 'COMP-BAT-PAN'})
CREATE (mat)-[:SUPPLIES_COMPONENT {
  material: 'High-purity LiPF6 + Electrolyte',
  purity_percent: 99.995,
  premium_product: 'Highest quality for Tesla cells',
  lead_time_days: 15,
  relationship_since: 2012
}]->(comp);

MATCH (mat:MaterialMfg {id: 'MAT-ELEC-ENC'}), (comp:ComponentMfg {id: 'COMP-BAT-LGES'})
CREATE (mat)-[:SUPPLIES_COMPONENT {
  material: 'Electrolyte Solutions',
  annual_volume_tonnes: 28000,
  domestic_korea_supply: true,
  lead_time_days: 3,
  relationship_since: 2015
}]->(comp);

MATCH (mat:MaterialMfg {id: 'MAT-ELEC-ENC'}), (comp:ComponentMfg {id: 'COMP-BAT-SDI'})
CREATE (mat)-[:SUPPLIES_COMPONENT {
  material: 'Electrolyte + Additives',
  annual_volume_tonnes: 22000,
  domestic_korea_supply: true,
  lead_time_days: 3,
  relationship_since: 2016
}]->(comp);

// Separator → Battery cell manufacturers
MATCH (mat:MaterialMfg {id: 'MAT-SEP-SEN'}), (comp:ComponentMfg {id: 'COMP-BAT-CATL'})
CREATE (mat)-[:SUPPLIES_COMPONENT {
  material: 'Ceramic-coated PE Separator',
  thickness_um: 9,
  annual_volume_million_sqm: 580,
  coating: 'Al2O3',
  domestic_china_supply: true,
  lead_time_days: 5,
  relationship_since: 2016
}]->(comp);

MATCH (mat:MaterialMfg {id: 'MAT-SEP-SEN'}), (comp:ComponentMfg {id: 'COMP-BAT-BYD'})
CREATE (mat)-[:SUPPLIES_COMPONENT {
  material: 'Battery Separator',
  annual_volume_million_sqm: 420,
  domestic_china_supply: true,
  lead_time_days: 4,
  relationship_since: 2018
}]->(comp);

MATCH (mat:MaterialMfg {id: 'MAT-SEP-ASA'}), (comp:ComponentMfg {id: 'COMP-BAT-PAN'})
CREATE (mat)-[:SUPPLIES_COMPONENT {
  material: 'Hipore Wet-process Separator',
  thickness_um: 10,
  annual_volume_million_sqm: 280,
  safety_record: 'Industry leading',
  premium_pricing: true,
  shipping_route: 'Japan → Nevada',
  lead_time_days: 30,
  relationship_since: 2012,
  tesla_approved: true
}]->(comp);

MATCH (mat:MaterialMfg {id: 'MAT-SEP-ASA'}), (comp:ComponentMfg {id: 'COMP-BAT-LGES'})
CREATE (mat)-[:SUPPLIES_COMPONENT {
  material: 'Premium Separator',
  annual_volume_million_sqm: 220,
  shipping_route: 'Japan → South Korea',
  lead_time_days: 10,
  relationship_since: 2014
}]->(comp);

MATCH (mat:MaterialMfg {id: 'MAT-SEP-SK'}), (comp:ComponentMfg {id: 'COMP-BAT-LGES'})
CREATE (mat)-[:SUPPLIES_COMPONENT {
  material: 'Ceramic-coated Separator',
  annual_volume_million_sqm: 320,
  domestic_korea_supply: true,
  lead_time_days: 2,
  relationship_since: 2013
}]->(comp);

MATCH (mat:MaterialMfg {id: 'MAT-SEP-SK'}), (comp:ComponentMfg {id: 'COMP-BAT-SDI'})
CREATE (mat)-[:SUPPLIES_COMPONENT {
  material: 'High-voltage Separator',
  annual_volume_million_sqm: 180,
  sk_group_synergy: true,
  lead_time_days: 2,
  relationship_since: 2014
}]->(comp);

// Display panels → Phones (note: displays assembled by display companies themselves)
MATCH (comp:ComponentMfg {id: 'COMP-DISP-SAM'}), (asm:ModuleAssembler {id: 'ASM-DISP-SAM'})
CREATE (comp)-[:SUPPLIES_COMPONENT {
  material: 'AMOLED Display Panels',
  annual_volume_million_units: 320,
  internal_transfer: 'Same company',
  lead_time_days: 1,
  relationship_since: 2007
}]->(asm);

MATCH (comp:ComponentMfg {id: 'COMP-DISP-LG'}), (asm:ModuleAssembler {id: 'ASM-PHONE-FOX'})
CREATE (comp)-[:DELIVERS_TO {
  component: 'P-OLED Display Modules for iPhone',
  annual_volume_million_units: 45,
  end_customer: 'Apple',
  display_sizes: ['6.1"', '6.7"'],
  quality_requirements: 'Apple specifications',
  transport_method: 'Truck (to Foxconn China plants)',
  lead_time_days: 3,
  just_in_time_delivery: true,
  relationship_since: 2018,
  apple_certified: true
}]->(asm);

MATCH (comp:ComponentMfg {id: 'COMP-DISP-BOE'}), (asm:ModuleAssembler {id: 'ASM-PHONE-FOX'})
CREATE (comp)-[:DELIVERS_TO {
  component: 'AMOLED Display Modules for iPhone',
  annual_volume_million_units: 28,
  end_customer: 'Apple',
  certification_year: 2023,
  quality_improvements: 'Achieved Apple standards',
  lead_time_days: 2,
  relationship_since: 2020,
  strategic_importance: 'Diversification from Samsung'
}]->(asm);

// Camera modules → Phone assemblers
MATCH (comp:ComponentMfg {id: 'COMP-CAM-LGI'}), (asm:ModuleAssembler {id: 'ASM-PHONE-FOX'})
CREATE (comp)-[:DELIVERS_TO {
  component: 'iPhone Camera Modules (all variants)',
  annual_volume_million_sets: 180,
  end_customer: 'Apple',
  camera_types: ['Main 48MP', 'Ultra-wide 12MP', 'Telephoto periscope 12MP'],
  exclusive_supplier: 'Primary camera module supplier',
  transport_method: 'Truck',
  delivery_frequency: 'Daily',
  lead_time_hours: 24,
  just_in_time: true,
  buffer_inventory_days: 2,
  relationship_since: 2012,
  strategic_partnership: 'Critical Apple supplier'
}]->(asm);

MATCH (comp:ComponentMfg {id: 'COMP-CAM-SONY'}), (comp2:ComponentMfg {id: 'COMP-CAM-LGI'})
CREATE (comp)-[:SUPPLIES_COMPONENT {
  component: 'CMOS Image Sensors',
  sensor_models: ['IMX803 48MP', 'IMX903 12MP'],
  annual_volume_million_units: 540,
  end_use: 'iPhone camera modules',
  transport_method: 'Air freight',
  shipping_route: 'Japan → South Korea',
  lead_time_days: 7,
  relationship_since: 2016,
  apple_supply_chain: true
}]->(comp2);

MATCH (comp:ComponentMfg {id: 'COMP-CAM-SUN'}), (asm:ModuleAssembler {id: 'ASM-PHONE-LUX'})
CREATE (comp)-[:DELIVERS_TO {
  component: 'Camera Modules',
  annual_volume_million_sets: 85,
  customers: ['Xiaomi', 'Oppo', 'Huawei'],
  lead_time_days: 5,
  relationship_since: 2014
}]->(asm);

// Processors/SoCs → Phone assemblers
MATCH (comp:ComponentMfg {id: 'COMP-CHIP-TSMC'}), (asm:ModuleAssembler {id: 'ASM-PHONE-FOX'})
CREATE (comp)-[:DELIVERS_TO {
  component: 'Apple A17 Pro Processors',
  process_node: '3nm',
  annual_volume_million_units: 180,
  end_customer: 'Apple iPhone 15 Pro',
  exclusive_customer: 'Apple designs, TSMC manufactures',
  transport_method: 'Dedicated air freight',
  shipping_route: 'Taiwan → China assembly plants',
  lead_time_days: 5,
  security_measures: 'Extreme',
  relationship_since: 2014,
  strategic_partnership: 'Apple\'s exclusive fab partner'
}]->(asm);

MATCH (comp:ComponentMfg {id: 'COMP-CHIP-SAM'}), (asm:ModuleAssembler {id: 'ASM-DISP-SAM'})
CREATE (comp)-[:DELIVERS_TO {
  component: 'Exynos 2400 Processors',
  annual_volume_million_units: 42,
  internal_samsung_supply: true,
  end_product: 'Galaxy S24 series (select markets)',
  lead_time_days: 3,
  relationship_since: 2010
}]->(asm);

// Memory → Phone assemblers
MATCH (comp:ComponentMfg {id: 'COMP-MEM-SAM'}), (asm:ModuleAssembler {id: 'ASM-PHONE-FOX'})
CREATE (comp)-[:DELIVERS_TO {
  component: 'LPDDR5X DRAM + UFS 4.0 NAND for iPhone',
  dram_capacity_gb: [8, 16],
  nand_capacity_gb: [256, 512, 1024],
  annual_volume_million_sets: 90,
  end_customer: 'Apple',
  dual_source: 'Competes with SK Hynix',
  lead_time_days: 10,
  relationship_since: 2016
}]->(asm);

MATCH (comp:ComponentMfg {id: 'COMP-MEM-HYN'}), (asm:ModuleAssembler {id: 'ASM-PHONE-FOX'})
CREATE (comp)-[:DELIVERS_TO {
  component: 'LPDDR5X DRAM + NAND for iPhone',
  annual_volume_million_sets: 90,
  end_customer: 'Apple',
  dual_source: 'Competes with Samsung',
  lead_time_days: 12,
  relationship_since: 2018
}]->(asm);

MATCH (comp:ComponentMfg {id: 'COMP-MEM-MIC'}), (asm:ModuleAssembler {id: 'ASM-PHONE-FOX'})
CREATE (comp)-[:DELIVERS_TO {
  component: 'LPDDR5X DRAM for iPhone',
  annual_volume_million_units: 35,
  end_customer: 'Apple',
  us_supplier_advantage: 'Geopolitical diversification',
  lead_time_days: 18,
  relationship_since: 2020
}]->(asm);

// Battery cells → Phone assemblers
MATCH (comp:ComponentMfg {id: 'COMP-BAT-LGES'}), (asm:ModuleAssembler {id: 'ASM-PHONE-FOX'})
CREATE (comp)-[:DELIVERS_TO {
  component: 'Li-ion Battery Cells for iPhone',
  battery_capacity_mah: 4441,
  chemistry: 'NMC pouch cells',
  configuration: 'L-shaped dual cell',
  annual_volume_million_units: 95,
  end_customer: 'Apple iPhone 15 Pro Max',
  quality_requirements: 'Extremely stringent',
  cycle_life_requirement: 1000,
  transport_method: 'Air freight (hazmat)',
  lead_time_days: 7,
  buffer_stock: 'Required due to safety',
  relationship_since: 2015,
  apple_certified: true
}]->(asm);

MATCH (comp:ComponentMfg {id: 'COMP-BAT-SDI'}), (asm:ModuleAssembler {id: 'ASM-PHONE-FOX'})
CREATE (comp)-[:DELIVERS_TO {
  component: 'Li-ion Battery Cells for iPhone',
  annual_volume_million_units: 85,
  end_customer: 'Apple',
  dual_source: true,
  lead_time_days: 8,
  relationship_since: 2017
}]->(asm);

MATCH (comp:ComponentMfg {id: 'COMP-BAT-CATL'}), (asm:ModuleAssembler {id: 'ASM-PHONE-LUX'})
CREATE (comp)-[:DELIVERS_TO {
  component: 'Li-ion Battery Cells',
  annual_volume_million_units: 120,
  customers: ['Xiaomi', 'Oppo', 'Vivo', 'Apple (some models)'],
  domestic_china_advantage: true,
  lead_time_days: 3,
  relationship_since: 2016
}]->(asm);

// PCB → Phone assemblers
MATCH (asm:ModuleAssembler {id: 'ASM-PCB-UNI'}), (asm2:ModuleAssembler {id: 'ASM-PHONE-FOX'})
CREATE (asm)-[:DELIVERS_TO {
  component: 'iPhone Mainboard PCB (HDI)',
  pcb_layers: 12,
  technology: 'Any-layer HDI',
  annual_volume_million_units: 180,
  end_customer: 'Apple',
  critical_component: 'Motherboard foundation',
  lead_time_days: 14,
  relationship_since: 2012,
  apple_certified: true
}]->(asm2);

MATCH (asm:ModuleAssembler {id: 'ASM-PCB-COM'}), (asm2:ModuleAssembler {id: 'ASM-PHONE-FOX'})
CREATE (asm)-[:DELIVERS_TO {
  component: 'iPhone PCBs',
  annual_volume_million_units: 75,
  dual_source: true,
  lead_time_days: 15,
  relationship_since: 2014
}]->(asm2);

// ==================== TIER 2→1: MODULE ASSEMBLERS → OEMs ====================

// Phone assemblers → OEMs (final assembly)
MATCH (asm:ModuleAssembler {id: 'ASM-PHONE-FOX'}), (oem:OEM {id: 'OEM-APPLE'})
CREATE (asm)-[:MANUFACTURES {
  product: 'iPhone 15 Series (all models)',
  annual_volume_million_units: 180,
  assembly_locations: ['Zhengzhou China (iPhone City)', 'Chennai India', 'Bangalore India'],
  zhengzhou_capacity_percent: 70,
  india_capacity_percent: 20,
  vietnam_capacity_percent: 10,
  assembly_time_minutes: 3,
  quality_control: 'Apple standards (extremely rigorous)',
  defect_rate_ppm: 25,
  yield_rate_percent: 98.5,
  workforce_dedicated: 350000,
  relationship_since: 2007,
  primary_partner: true,
  revenue_from_apple_usd_billion: 132,
  revenue_dependence_percent: 60,
  strategic_importance: 'Apple\'s most critical manufacturing partner',
  contract_type: 'Long-term strategic partnership',
  diversification_efforts: 'India expansion, Vietnam growth'
}]->(oem);

MATCH (asm:ModuleAssembler {id: 'ASM-PHONE-PEG'}), (oem:OEM {id: 'OEM-APPLE'})
CREATE (asm)-[:MANUFACTURES {
  product: 'iPhone 15 / iPhone 15 Plus',
  annual_volume_million_units: 55,
  assembly_locations: ['China', 'India'],
  relationship_since: 2011,
  secondary_partner: true,
  revenue_from_apple_percent: 70,
  strategic_role: 'Diversification from Foxconn'
}]->(oem);

MATCH (asm:ModuleAssembler {id: 'ASM-PHONE-LUX'}), (oem:OEM {id: 'OEM-APPLE'})
CREATE (asm)-[:MANUFACTURES {
  product: 'iPhone 15 Pro / Pro Max (growing share)',
  annual_volume_million_units: 35,
  assembly_locations: ['China', 'India (expanding)'],
  share_growth: 'Rapidly increasing',
  relationship_since: 2020,
  strategic_importance: 'Apple diversifying from Foxconn/Pegatron',
  quality_improvements: 'Achieved parity with Foxconn'
}]->(oem);

MATCH (asm:ModuleAssembler {id: 'ASM-DISP-SAM'}), (oem:OEM {id: 'OEM-SAMSUNG'})
CREATE (asm)-[:MANUFACTURES {
  product: 'Galaxy S24 Series',
  annual_volume_million_units: 35,
  assembly_locations: ['Vietnam (primary)', 'South Korea'],
  internal_samsung: true,
  vertical_integration: 'Components + Assembly',
  relationship_since: 2010
}]->(oem);

MATCH (asm:ModuleAssembler {id: 'ASM-PHONE-FOX'}), (oem:OEM {id: 'OEM-GOOGLE'})
CREATE (asm)-[:MANUFACTURES {
  product: 'Google Pixel 8 Series',
  annual_volume_million_units: 8,
  assembly_locations: ['Vietnam', 'China'],
  relationship_since: 2016,
  google_partnership: true
}]->(oem);

MATCH (asm:ModuleAssembler {id: 'ASM-PHONE-FOX'}), (oem:OEM {id: 'OEM-XIAOMI'})
CREATE (asm)-[:MANUFACTURES {
  product: 'Xiaomi 14 Series',
  annual_volume_million_units: 18,
  assembly_locations: ['China', 'India'],
  relationship_since: 2012
}]->(oem);

MATCH (asm:ModuleAssembler {id: 'ASM-PHONE-LUX'}), (oem:OEM {id: 'OEM-XIAOMI'})
CREATE (asm)-[:MANUFACTURES {
  product: 'Xiaomi flagship devices',
  annual_volume_million_units: 22,
  assembly_locations: ['China', 'India'],
  relationship_since: 2015
}]->(oem);

MATCH (asm:ModuleAssembler {id: 'ASM-PHONE-BYD'}), (oem:OEM {id: 'OEM-OPPO'})
CREATE (asm)-[:MANUFACTURES {
  product: 'Oppo Find X Series + Components',
  annual_volume_million_units: 28,
  assembly_locations: ['China', 'India'],
  relationship_since: 2013
}]->(oem);

// ==================== TIER 1→0: OEMs → PRODUCTS ====================

MATCH (oem:OEM {id: 'OEM-APPLE'}), (prod:Product {id: 'PROD-IPHONE15PM'})
CREATE (oem)-[:MANUFACTURES {
  product_name: 'iPhone 15 Pro Max',
  model_year: 2023,
  production_status: 'Active',
  launch_date: '2023-09-22',
  production_volume_million_2023: 45,
  production_volume_million_2024_estimate: 52,
  assembly_partners: ['Foxconn (primary)', 'Pegatron', 'Luxshare'],
  assembly_locations: ['China 70%', 'India 25%', 'Vietnam 5%'],
  target_markets: ['Global'],
  pricing_strategy: 'Premium',
  profit_margin_percent: 45,
  strategic_importance: 'Flagship product, primary revenue driver',
  ecosystem_anchor: true,
  successor_model: 'iPhone 16 Pro Max (2024)'
}]->(prod);

MATCH (oem:OEM {id: 'OEM-SAMSUNG'}), (prod:Product {id: 'PROD-GALAXYS24U'})
CREATE (oem)-[:MANUFACTURES {
  product_name: 'Galaxy S24 Ultra',
  model_year: 2024,
  production_status: 'Active',
  launch_date: '2024-01-31',
  production_volume_million_2024_estimate: 12,
  assembly_locations: ['Vietnam (primary)', 'South Korea'],
  in_house_assembly: true,
  vertical_integration_showcase: true,
  target_markets: ['Global'],
  pricing_strategy: 'Premium',
  strategic_importance: 'Flagship, competes with iPhone Pro Max'
}]->(prod);

MATCH (oem:OEM {id: 'OEM-XIAOMI'}), (prod:Product {id: 'PROD-XIAOMI14U'})
CREATE (oem)-[:MANUFACTURES {
  product_name: 'Xiaomi 14 Ultra',
  model_year: 2024,
  production_status: 'Active',
  launch_date: '2024-02-22',
  production_volume_million_2024_estimate: 3,
  assembly_partners: ['Foxconn', 'BYD Electronics'],
  assembly_locations: ['China', 'India'],
  target_markets: ['China', 'Europe', 'Asia'],
  pricing_strategy: 'Premium (for Xiaomi)',
  strategic_importance: 'Premium positioning, Leica partnership showcase'
}]->(prod);

MATCH (oem:OEM {id: 'OEM-GOOGLE'}), (prod:Product {id: 'PROD-PIXEL8P'})
CREATE (oem)-[:MANUFACTURES {
  product_name: 'Google Pixel 8 Pro',
  model_year: 2023,
  production_status: 'Active',
  launch_date: '2023-10-12',
  production_volume_million_2023: 3,
  production_volume_million_2024_estimate: 4,
  assembly_partners: ['Foxconn'],
  assembly_locations: ['Vietnam'],
  target_markets: ['USA', 'Europe', 'Japan', 'Australia'],
  pricing_strategy: 'Premium',
  strategic_importance: 'Android showcase, AI demonstration, Tensor chip validation'
}]->(prod);

// Success message
MATCH ()-[r]->()
WHERE type(r) IN ['PROVIDES', 'SUPPLIES_WAFERS', 'SUPPLIES_CHEMICALS', 'SUPPLIES_COMPONENT', 'DELIVERS_TO', 'MANUFACTURES']
WITH type(r) as relationship_type, count(r) as count
RETURN 'Mega Relationships Complete!' as message,
       collect({type: relationship_type, count: count}) as relationship_summary;
