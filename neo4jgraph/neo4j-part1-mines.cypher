// ==================== PART 1: MINES & RAW EXTRACTION ====================
// Clear everything first
MATCH (n) DETACH DELETE n;

// Create index for performance
CREATE INDEX mine_id IF NOT EXISTS FOR (m:Mine) ON (m.id);
CREATE INDEX supplier_id IF NOT EXISTS FOR (s:Supplier) ON (s.id);

// ==================== COPPER MINES ====================
// These mines extract copper ore - the foundation for all electronics

CREATE
// Chile - World's largest copper producer
(mine_cu_escondida:Mine {
  id: 'MINE-CU-ESC',
  name: 'Escondida Mine',
  country: 'Chile',
  region: 'Atacama Desert',
  coordinates: [-24.2348, -69.0596],
  material: 'Copper Ore',
  ore_grade_percent: 0.58,
  annual_capacity_tonnes: 1200000,
  annual_production_tonnes: 1150000,
  operating_since: 1990,
  owner: 'BHP Group',
  ownership_percent: 57.5,
  workforce: 2900,
  mining_method: 'Open Pit',
  pit_depth_meters: 645,
  water_usage_m3_day: 85000,
  water_source: 'Desalination Plant',
  power_consumption_mw: 180,
  environmental_rating: 'B+',
  certifications: ['ISO 14001', 'ISO 45001'],
  co2_emissions_kt_year: 450,
  rehabilitation_fund_usd_million: 320,
  export_destinations: ['Japan', 'China', 'South Korea', 'Germany']
}),

(mine_cu_chuqui:Mine {
  id: 'MINE-CU-CHU',
  name: 'Chuquicamata Mine',
  country: 'Chile',
  region: 'Antofagasta',
  coordinates: [-22.2897, -68.9029],
  material: 'Copper Ore',
  ore_grade_percent: 0.62,
  annual_capacity_tonnes: 500000,
  annual_production_tonnes: 480000,
  operating_since: 1915,
  owner: 'Codelco',
  ownership_percent: 100,
  ownership_type: 'State-owned',
  workforce: 3200,
  mining_method: 'Underground (converted from Open Pit)',
  underground_conversion_year: 2019,
  tunnel_length_km: 142,
  environmental_rating: 'B',
  certifications: ['ISO 14001', 'OHSAS 18001'],
  heritage_site: true,
  tourist_visits_year: 50000
}),

// Indonesia - Grasberg, one of world's largest gold/copper mines
(mine_cu_grasberg:Mine {
  id: 'MINE-CU-GRA',
  name: 'Grasberg Mine',
  country: 'Indonesia',
  region: 'Papua Province',
  coordinates: [-4.0531, 137.1161],
  material: 'Copper-Gold Ore',
  ore_grade_copper_percent: 0.95,
  ore_grade_gold_g_t: 0.89,
  annual_capacity_tonnes: 700000,
  annual_production_copper_tonnes: 665000,
  annual_production_gold_oz: 1500000,
  operating_since: 1988,
  owner: 'Freeport-McMoRan',
  ownership_percent: 48.76,
  government_ownership_percent: 51.24,
  workforce: 24000,
  contractor_workforce: 13000,
  mining_method: 'Underground Block Cave',
  elevation_meters: 4200,
  altitude_challenges: true,
  water_usage_m3_day: 42000,
  environmental_rating: 'C+',
  environmental_controversies: ['Riverine tailings disposal', 'Deforestation'],
  certifications: ['ISO 14001'],
  indigenous_peoples_affected: ['Amungme', 'Kamoro'],
  community_investment_usd_million_year: 45
}),

// Mongolia - Oyu Tolgoi
(mine_cu_oyu:Mine {
  id: 'MINE-CU-OYU',
  name: 'Oyu Tolgoi Mine',
  country: 'Mongolia',
  region: 'South Gobi Desert',
  coordinates: [43.0014, 106.8500],
  material: 'Copper-Gold Ore',
  ore_grade_copper_percent: 0.51,
  ore_grade_gold_g_t: 0.31,
  annual_capacity_tonnes: 550000,
  annual_production_tonnes: 520000,
  operating_since: 2013,
  owner: 'Rio Tinto',
  ownership_percent: 66,
  government_ownership_percent: 34,
  workforce: 6500,
  mining_method: 'Open Pit & Underground',
  depth_meters: 1300,
  extreme_temperature: true,
  winter_temp_celsius: -40,
  summer_temp_celsius: 35,
  environmental_rating: 'A-',
  certifications: ['ISO 14001', 'ISO 45001', 'ISO 50001'],
  renewable_energy_percent: 15
}),

// DRC - Kamoa-Kakula (high grade, ethical concerns)
(mine_cu_kamoa:Mine {
  id: 'MINE-CU-KAM',
  name: 'Kamoa-Kakula Mine',
  country: 'Democratic Republic of Congo',
  region: 'Lualaba Province',
  coordinates: [-10.7833, 25.6833],
  material: 'Copper Ore',
  ore_grade_percent: 5.3,
  ore_grade_note: 'One of highest grade copper mines globally',
  annual_capacity_tonnes: 450000,
  annual_production_tonnes: 400000,
  operating_since: 2021,
  owner: 'Ivanhoe Mines',
  ownership_percent: 39.6,
  chinese_ownership_percent: 39.6,
  government_ownership_percent: 20,
  workforce: 7200,
  mining_method: 'Underground',
  environmental_rating: 'B',
  ethical_rating: 'B+',
  conflict_mineral_risk: 'Medium',
  artisanal_mining_proximity: true,
  certifications: ['RMI Compliant', 'ISO 14001'],
  human_rights_audits_year: 4,
  community_development_programs: ['Education', 'Healthcare', 'Agriculture'],
  local_employment_percent: 97
});

// ==================== LITHIUM MINES & BRINES ====================

CREATE
// Australia - Greenbushes (world's largest hard rock lithium)
(mine_li_greenbushes:Mine {
  id: 'MINE-LI-GRE',
  name: 'Greenbushes Lithium Mine',
  country: 'Australia',
  region: 'Western Australia',
  coordinates: [-33.8500, 116.0500],
  material: 'Lithium Spodumene',
  ore_grade_li2o_percent: 2.5,
  ore_grade_note: 'Among highest grade lithium mines globally',
  annual_capacity_tonnes: 1300000,
  annual_production_spodumene_tonnes: 1250000,
  operating_since: 1983,
  lithium_operations_since: 2007,
  owner: 'Talison Lithium',
  ownership_structure: 'JV: Albemarle 49%, Tianqi 51%',
  workforce: 650,
  mining_method: 'Open Pit',
  pit_depth_meters: 320,
  environmental_rating: 'A-',
  certifications: ['ISO 14001', 'ISO 45001'],
  water_usage_m3_day: 12000,
  water_recycling_percent: 75,
  rehabilitation_progressive: true,
  carbon_neutral_target_year: 2030,
  export_destinations: ['China', 'Japan', 'South Korea', 'USA']
}),

// Chile - Salar de Atacama (brine operations)
(brine_li_atacama:Brine {
  id: 'BRINE-LI-ATA',
  name: 'Salar de Atacama',
  country: 'Chile',
  region: 'Atacama Desert',
  coordinates: [-23.5000, -68.2500],
  material: 'Lithium Brine',
  lithium_concentration_ppm: 1400,
  concentration_note: 'Highest lithium concentration of any brine deposit',
  annual_capacity_lce_tonnes: 180000,
  annual_production_lce_tonnes: 175000,
  operating_since: 1984,
  operator_1: 'SQM',
  operator_1_quota_percent: 54,
  operator_2: 'Albemarle',
  operator_2_quota_percent: 46,
  workforce_sqm: 1200,
  workforce_albemarle: 850,
  extraction_method: 'Solar Evaporation',
  evaporation_ponds_hectares: 4500,
  evaporation_time_months: 18,
  altitude_meters: 2300,
  environmental_rating: 'C+',
  water_concerns: true,
  water_extraction_m3_hour: 442,
  impact_on_flamingos: 'Monitored',
  certifications: ['ISO 14001'],
  indigenous_communities: ['Atacameño'],
  community_agreements: true,
  royalty_to_communities_percent: 3.5
}),

// Australia - Mt Marion
(mine_li_marion:Mine {
  id: 'MINE-LI-MAR',
  name: 'Mt Marion Lithium Mine',
  country: 'Australia',
  region: 'Western Australia',
  coordinates: [-30.9500, 119.5800],
  material: 'Lithium Spodumene',
  ore_grade_li2o_percent: 1.4,
  annual_capacity_tonnes: 450000,
  annual_production_tonnes: 420000,
  operating_since: 2017,
  owner: 'Mineral Resources',
  ownership_percent: 50,
  chinese_ownership: 'Ganfeng Lithium',
  chinese_ownership_percent: 50,
  workforce: 280,
  mining_method: 'Open Pit',
  environmental_rating: 'A-',
  certifications: ['ISO 14001', 'ISO 45001'],
  indigenous_engagement: 'Heritage agreements in place'
});

// ==================== COBALT MINES ====================

CREATE
// DRC - Tenke Fungurume
(mine_co_tenke:Mine {
  id: 'MINE-CO-TEN',
  name: 'Tenke Fungurume Mine',
  country: 'Democratic Republic of Congo',
  region: 'Lualaba Province',
  coordinates: [-10.6000, 26.1000],
  material: 'Copper-Cobalt Ore',
  cobalt_grade_percent: 0.43,
  copper_grade_percent: 2.5,
  annual_capacity_cobalt_tonnes: 18000,
  annual_production_cobalt_tonnes: 16500,
  operating_since: 2009,
  owner: 'China Molybdenum (CMOC)',
  ownership_percent: 80,
  government_ownership_percent: 20,
  workforce: 8500,
  contractor_workforce: 3200,
  mining_method: 'Open Pit',
  environmental_rating: 'C+',
  ethical_rating: 'C',
  artisanal_mining_risk: 'High',
  child_labor_risk: 'High',
  conflict_mineral_certification: 'RMI Conformant',
  human_rights_concerns: ['Artisanal miner displacement', 'Child labor in supply chain'],
  audit_frequency_year: 6,
  independent_auditors: ['RCS Global', 'Pact'],
  traceability_blockchain: true,
  community_programs: ['School construction', 'Healthcare clinics', 'Water wells'],
  local_procurement_percent: 45
}),

// DRC - Kamoto Copper Company
(mine_co_kamoto:Mine {
  id: 'MINE-CO-KAM',
  name: 'Kamoto Copper Company',
  country: 'Democratic Republic of Congo',
  region: 'Lualaba Province',
  coordinates: [-10.7200, 25.4800],
  material: 'Copper-Cobalt Ore',
  cobalt_grade_percent: 0.52,
  annual_capacity_cobalt_tonnes: 22000,
  annual_production_cobalt_tonnes: 20000,
  operating_since: 2008,
  owner: 'Glencore',
  ownership_percent: 75,
  state_ownership_percent: 25,
  workforce: 12000,
  mining_method: 'Underground & Open Pit',
  environmental_rating: 'C',
  ethical_rating: 'C+',
  controversies: ['Acid spill 2019', 'Artisanal miner conflicts'],
  certifications: ['RMI', 'ISO 14001'],
  improvements_since_2020: ['Enhanced tailings management', 'Community engagement program']
}),

// Australia - Murrin Murrin (ethical alternative)
(mine_co_murrin:Mine {
  id: 'MINE-CO-MUR',
  name: 'Murrin Murrin Nickel-Cobalt',
  country: 'Australia',
  region: 'Western Australia',
  coordinates: [-28.7500, 121.4500],
  material: 'Nickel-Cobalt Laterite',
  cobalt_grade_percent: 0.08,
  nickel_grade_percent: 1.0,
  annual_capacity_cobalt_tonnes: 3500,
  annual_production_cobalt_tonnes: 3200,
  operating_since: 1999,
  owner: 'Glencore',
  ownership_percent: 100,
  workforce: 850,
  mining_method: 'Open Pit',
  environmental_rating: 'A',
  ethical_rating: 'A',
  conflict_free: true,
  certifications: ['ISO 14001', 'ISO 45001', 'RBA'],
  premium_pricing: true,
  premium_percent: 15,
  market_note: 'Preferred by OEMs requiring conflict-free cobalt'
});

// ==================== RARE EARTH ELEMENT MINES ====================

CREATE
// China - Bayan Obo (world's largest REE deposit)
(mine_ree_bayan:Mine {
  id: 'MINE-REE-BAY',
  name: 'Bayan Obo Mine',
  country: 'China',
  region: 'Inner Mongolia',
  coordinates: [41.7700, 109.9700],
  material: 'Iron-REE Ore',
  ree_grade_percent: 5.2,
  annual_capacity_ree_tonnes: 70000,
  annual_production_ree_tonnes: 65000,
  iron_production_mt_year: 15,
  operating_since: 1957,
  owner: 'China Northern Rare Earth Group',
  ownership_type: 'State-owned',
  workforce: 18000,
  mining_method: 'Open Pit',
  environmental_rating: 'D+',
  environmental_concerns: ['Radioactive tailings', 'Water pollution', 'Air pollution'],
  export_restrictions: true,
  strategic_resource: true,
  export_quota_system: true,
  domestic_priority: true
}),

// USA - Mountain Pass (only US REE mine)
(mine_ree_pass:Mine {
  id: 'MINE-REE-PAS',
  name: 'Mountain Pass Mine',
  country: 'USA',
  region: 'California',
  coordinates: [35.4800, -115.5300],
  material: 'Bastnaesite REE Ore',
  ree_grade_percent: 8.9,
  annual_capacity_ree_tonnes: 38000,
  annual_production_ree_tonnes: 35000,
  operating_since: 1952,
  closed_years: '2002-2017',
  reopened: 2017,
  owner: 'MP Materials',
  ownership_percent: 100,
  chinese_investment: 'Previously Shenghe Resources (divested 2020)',
  workforce: 450,
  mining_method: 'Open Pit',
  environmental_rating: 'B+',
  certifications: ['ISO 14001', 'ISO 45001'],
  strategic_importance: 'Only US REE producer',
  pentagon_contracts: true,
  separation_facility_status: 'Under construction',
  target_completion: 2025,
  goal: 'End reliance on China for REE processing'
});

// Success message
RETURN 'Part 1 Complete: Created ' + count(*) + ' mine/brine nodes with rich detail';
