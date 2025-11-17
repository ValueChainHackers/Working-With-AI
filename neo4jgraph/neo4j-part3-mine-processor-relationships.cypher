// ==================== PART 3: MINE → PROCESSOR RELATIONSHIPS ====================
// Connect raw material sources to their processing facilities
// This creates the SUPPLIES relationships with logistics and contract details

// ==================== COPPER MINE → SMELTER FLOWS ====================

// Escondida → Multiple smelters (diversified export strategy)
MATCH (mine:Mine {id: 'MINE-CU-ESC'}), (smelter:Smelter {id: 'SMELT-CU-VEN'})
CREATE (mine)-[:SUPPLIES {
  material: 'Copper Concentrate',
  concentrate_grade_percent: 28,
  annual_volume_tonnes: 180000,
  contract_type: 'Long-term offtake',
  contract_years: 5,
  pricing_model: 'LME linked + treatment charges',
  treatment_charge_usd_tonne: 65,
  refining_charge_usd_lb: 6.5,
  transport_method: 'Slurry pipeline + truck',
  pipeline_length_km: 170,
  port: 'Coloso',
  lead_time_days: 3,
  payment_terms: 'Net 30',
  quality_spec: 'Min 27% Cu',
  penalty_below_spec: true,
  relationship_since: 1990
}]->(smelter);

MATCH (mine:Mine {id: 'MINE-CU-ESC'}), (smelter:Smelter {id: 'SMELT-CU-ONA'})
CREATE (mine)-[:SUPPLIES {
  material: 'Copper Concentrate',
  concentrate_grade_percent: 28,
  annual_volume_tonnes: 320000,
  contract_type: 'Long-term offtake',
  contract_years: 10,
  transport_method: 'Bulk carrier ship',
  shipping_route: 'Coloso → Onahama',
  shipping_distance_km: 17500,
  shipping_time_days: 35,
  incoterms: 'CIF Onahama',
  vessel_type: 'Handymax',
  vessel_capacity_tonnes: 40000,
  shipments_per_year: 8,
  freight_cost_usd_tonne: 45,
  insurance_cost_usd_tonne: 2.5,
  lead_time_days: 45,
  payment_terms: 'LC at sight',
  relationship_since: 1995,
  strategic_partnership: true
}]->(smelter);

MATCH (mine:Mine {id: 'MINE-CU-ESC'}), (smelter:Smelter {id: 'SMELT-CU-GUI'})
CREATE (mine)-[:SUPPLIES {
  material: 'Copper Concentrate',
  annual_volume_tonnes: 450000,
  contract_type: 'Long-term offtake',
  contract_years: 8,
  transport_method: 'Bulk carrier ship',
  shipping_route: 'Coloso → Shanghai → Guixi',
  port_destination: 'Shanghai',
  inland_transport: 'Barge + truck',
  shipping_time_days: 42,
  total_lead_time_days: 50,
  pricing_model: 'LME benchmark',
  relationship_since: 2005,
  volume_growth_trend: 'Increasing'
}]->(smelter);

// Chuquicamata → Ventanas (domestic processing)
MATCH (mine:Mine {id: 'MINE-CU-CHU'}), (smelter:Smelter {id: 'SMELT-CU-VEN'})
CREATE (mine)-[:SUPPLIES {
  material: 'Copper Concentrate',
  concentrate_grade_percent: 30,
  annual_volume_tonnes: 140000,
  contract_type: 'Internal transfer',
  same_owner: true,
  owner: 'Codelco',
  transport_method: 'Rail + truck',
  distance_km: 1350,
  transport_time_days: 4,
  transport_cost_usd_tonne: 28,
  priority_processing: true,
  relationship_since: 1915,
  historic_partnership: true
}]->(smelter);

// Grasberg → Gresik (dedicated processing)
MATCH (mine:Mine {id: 'MINE-CU-GRA'}), (smelter:Smelter {id: 'SMELT-CU-GRE'})
CREATE (mine)-[:SUPPLIES {
  material: 'Copper-Gold Concentrate',
  concentrate_grade_copper_percent: 28,
  concentrate_grade_gold_g_t: 25,
  annual_volume_tonnes: 600000,
  contract_type: 'Dedicated offtake',
  ownership_alignment: 'Freeport owns 25% of smelter',
  transport_method: 'Slurry pipeline + ship',
  pipeline_length_km: 115,
  pipeline_route: 'Mine (4200m elevation) → Amamapare port',
  port_origin: 'Amamapare',
  port_destination: 'Gresik',
  shipping_distance_km: 2200,
  shipping_time_days: 7,
  total_lead_time_days: 10,
  ore_export_ban_compliance: true,
  domestic_processing_mandate: 'Indonesian law requires domestic smelting',
  gold_payment: 'Separate gold credit',
  environmental_monitoring: 'Required by law',
  relationship_since: 1998,
  strategic_importance: 'Critical for Freeport\'s Indonesia operations'
}]->(smelter);

MATCH (mine:Mine {id: 'MINE-CU-GRA'}), (smelter:Smelter {id: 'SMELT-CU-GUI'})
CREATE (mine)-[:SUPPLIES {
  material: 'Copper Concentrate',
  annual_volume_tonnes: 65000,
  contract_type: 'Spot market',
  transport_method: 'Bulk carrier',
  shipping_route: 'Amamapare → Shanghai',
  opportunistic_sales: true,
  price_premium: 'Gold credits',
  relationship_since: 2015
}]->(smelter);

// Oyu Tolgoi → Asian smelters
MATCH (mine:Mine {id: 'MINE-CU-OYU'}), (smelter:Smelter {id: 'SMELT-CU-GUI'})
CREATE (mine)-[:SUPPLIES {
  material: 'Copper-Gold Concentrate',
  concentrate_grade_copper_percent: 24,
  annual_volume_tonnes: 380000,
  contract_type: 'Long-term offtake',
  contract_years: 15,
  transport_method: 'Truck → rail → ship',
  trucking_route: 'Mine → China border (550km)',
  border_crossing: 'Gashuun Sukhait',
  extreme_conditions: true,
  winter_challenges: 'Temperatures to -40°C',
  rail_destination: 'Tianjin port',
  rail_distance_km: 2400,
  shipping_route: 'Tianjin → Shanghai',
  total_lead_time_days: 21,
  relationship_since: 2013,
  rio_tinto_relationship: 'Strategic customer',
  payment_terms: 'Provisional + final settlement'
}]->(smelter);

MATCH (mine:Mine {id: 'MINE-CU-OYU'}), (smelter:Smelter {id: 'SMELT-CU-ONS'})
CREATE (mine)-[:SUPPLIES {
  material: 'Copper Concentrate',
  annual_volume_tonnes: 140000,
  contract_type: 'Long-term offtake',
  transport_method: 'Truck → rail → ship',
  border_crossing: 'Gashuun Sukhait',
  shipping_route: 'Tianjin → Onsan',
  shipping_distance_km: 950,
  relationship_since: 2014,
  strategic_diversification: true
}]->(smelter);

// Kamoa-Kakula → Chinese smelters (high-grade ore)
MATCH (mine:Mine {id: 'MINE-CU-KAM'}), (smelter:Smelter {id: 'SMELT-CU-GUI'})
CREATE (mine)-[:SUPPLIES {
  material: 'Copper Concentrate',
  concentrate_grade_percent: 45,
  concentrate_grade_note: 'Exceptionally high grade',
  annual_volume_tonnes: 320000,
  contract_type: 'Offtake agreement',
  contract_years: 10,
  chinese_ownership_link: 'CITIC Metal 39.6% owner',
  transport_method: 'Truck → rail → ship',
  trucking_route: 'Mine → Lobito port (Angola)',
  trucking_distance_km: 1850,
  rail_alternative: 'Planned Lobito Corridor railway',
  railway_completion_expected: 2026,
  port_origin: 'Lobito, Angola',
  shipping_route: 'Lobito → Shanghai',
  shipping_distance_km: 14500,
  shipping_time_days: 38,
  total_lead_time_days: 52,
  conflict_mineral_certification: 'RMI',
  ethical_sourcing_audit: 'Annual',
  treatment_charge_premium: 'High grade premium',
  relationship_since: 2021,
  strategic_importance: 'Chinese EV supply chain'
}]->(smelter);

// ==================== LITHIUM SOURCES → PROCESSORS ====================

// Greenbushes → Tianqi Kwinana (integrated ownership)
MATCH (mine:Mine {id: 'MINE-LI-GRE'}), (processor:Processor {id: 'PROC-LI-TIA'})
CREATE (mine)-[:SUPPLIES {
  material: 'Lithium Spodumene Concentrate',
  concentrate_grade_li2o_percent: 6.0,
  annual_volume_tonnes: 580000,
  contract_type: 'Internal transfer',
  ownership_link: 'Tianqi owns 51% of Talison (mine owner)',
  transport_method: 'Truck',
  distance_km: 270,
  transport_time_hours: 5,
  transport_cost_usd_tonne: 12,
  delivery_frequency: 'Daily',
  inventory_strategy: 'Just-in-time',
  quality_consistency: 'Very high',
  relationship_since: 2019,
  vertical_integration: true
}]->(processor);

// Greenbushes → Albemarle (JV partner)
MATCH (mine:Mine {id: 'MINE-LI-GRE'}), (processor:Processor {id: 'PROC-LI-ALB'})
CREATE (mine)-[:SUPPLIES {
  material: 'Lithium Spodumene Concentrate',
  concentrate_grade_li2o_percent: 6.0,
  annual_volume_tonnes: 520000,
  contract_type: 'JV offtake rights',
  ownership_link: 'Albemarle owns 49% of Talison',
  transport_method: 'Bulk carrier ship',
  trucking_to_port: 'Bunbury port 160km',
  shipping_route: 'Bunbury → Antofagasta, Chile',
  shipping_distance_km: 11800,
  shipping_time_days: 32,
  vessel_type: 'Handysize',
  shipments_per_year: 14,
  freight_cost_usd_tonne: 85,
  total_lead_time_days: 40,
  strategic_allocation: 'JV agreement',
  relationship_since: 2007
}]->(processor);

// Greenbushes → Ganfeng (Chinese offtake)
MATCH (mine:Mine {id: 'MINE-LI-GRE'}), (processor:Processor {id: 'PROC-LI-GAN'})
CREATE (mine)-[:SUPPLIES {
  material: 'Lithium Spodumene Concentrate',
  annual_volume_tonnes: 150000,
  contract_type: 'Long-term offtake',
  contract_years: 5,
  transport_method: 'Bulk carrier ship',
  shipping_route: 'Fremantle → Shanghai',
  shipping_distance_km: 5900,
  shipping_time_days: 18,
  relationship_since: 2018,
  pricing_model: 'Spodumene index linked'
}]->(processor);

// Salar de Atacama → SQM processing
MATCH (brine:Brine {id: 'BRINE-LI-ATA'}), (processor:Processor {id: 'PROC-LI-SQM'})
CREATE (brine)-[:SUPPLIES {
  material: 'Lithium Brine',
  lithium_concentration_ppm: 1400,
  annual_volume_m3: 125000000,
  contract_type: 'Extraction rights',
  concession_holder: 'SQM',
  extraction_quota_lce_tonnes: 216000,
  quota_authority: 'CORFO',
  quota_valid_until: 2030,
  transport_method: 'Pipeline',
  pipeline_network: 'Salar → evaporation ponds → processing plant',
  evaporation_ponds_area_hectares: 2400,
  evaporation_time_months: 18,
  concentration_factor: '50x',
  environmental_restrictions: true,
  water_extraction_limit_enforced: true,
  indigenous_consultation_required: true,
  royalty_percent: 7,
  relationship_since: 1984,
  strategic_asset: 'World\'s highest grade brine'
}]->(processor);

// Salar de Atacama → Albemarle processing
MATCH (brine:Brine {id: 'BRINE-LI-ATA'}), (processor:Processor {id: 'PROC-LI-ALB'})
CREATE (brine)-[:SUPPLIES {
  material: 'Lithium Brine',
  lithium_concentration_ppm: 1400,
  annual_volume_m3: 62000000,
  contract_type: 'Extraction rights',
  concession_holder: 'Albemarle',
  extraction_quota_lce_tonnes: 80000,
  quota_authority: 'CORFO',
  quota_expansion_application: 'Pending',
  transport_method: 'Pipeline',
  evaporation_ponds_area_hectares: 2100,
  environmental_monitoring: 'Continuous',
  flamingo_population_monitoring: true,
  indigenous_agreements: 'Atacameño communities',
  relationship_since: 1984,
  former_owner: 'Rockwood Lithium (acquired 2014)'
}]->(processor);

// Mt Marion → Ganfeng (JV partner)
MATCH (mine:Mine {id: 'MINE-LI-MAR'}), (processor:Processor {id: 'PROC-LI-GAN'})
CREATE (mine)-[:SUPPLIES {
  material: 'Lithium Spodumene Concentrate',
  concentrate_grade_li2o_percent: 6.0,
  annual_volume_tonnes: 420000,
  contract_type: 'JV offtake',
  ownership_link: 'Ganfeng owns 50% of mine',
  transport_method: 'Truck → ship',
  trucking_distance_km: 560,
  port_origin: 'Kwinana',
  shipping_route: 'Kwinana → Shanghai',
  shipping_distance_km: 5850,
  shipping_time_days: 17,
  total_lead_time_days: 20,
  relationship_since: 2017,
  vertical_integration: true,
  guaranteed_supply: true
}]->(processor);

// ==================== COBALT MINES → REFINERIES ====================

// Tenke Fungurume → Umicore (ethical refining)
MATCH (mine:Mine {id: 'MINE-CO-TEN'}), (refinery:Refinery {id: 'REF-CO-UMI'})
CREATE (mine)-[:SUPPLIES {
  material: 'Cobalt Hydroxide',
  cobalt_content_percent: 28,
  annual_volume_tonnes: 8500,
  contract_type: 'Long-term offtake',
  contract_years: 7,
  transport_method: 'Truck → rail → ship',
  inland_route: 'Tenke → Dar es Salaam port, Tanzania',
  inland_distance_km: 2100,
  transport_time_days: 12,
  shipping_route: 'Dar es Salaam → Antwerp',
  shipping_distance_km: 9500,
  shipping_time_days: 28,
  total_lead_time_days: 45,
  ethical_certification: 'RMI Conformant',
  blockchain_tracking: true,
  audit_trail: 'Complete mine to refinery',
  child_labor_monitoring: 'Third-party audits quarterly',
  artisanal_mining_exclusion: 'Verified',
  payment_terms: 'Provisional + final assay',
  pricing_model: 'LME + premium for certification',
  ethical_premium_percent: 8,
  relationship_since: 2012,
  strategic_partnership: true,
  customer_visibility: 'Full traceability to OEMs'
}]->(refinery);

// Tenke Fungurume → Huayou (Chinese supply chain)
MATCH (mine:Mine {id: 'MINE-CO-TEN'}), (refinery:Refinery {id: 'REF-CO-HUA'})
CREATE (mine)-[:SUPPLIES {
  material: 'Cobalt Hydroxide',
  annual_volume_tonnes: 7200,
  contract_type: 'Long-term offtake',
  ownership_link: 'CMOC (mine owner) partnership',
  transport_method: 'Truck → ship',
  port_origin: 'Dar es Salaam',
  shipping_route: 'Dar es Salaam → Shanghai',
  shipping_distance_km: 11200,
  shipping_time_days: 32,
  total_lead_time_days: 48,
  certification: 'RMI',
  relationship_since: 2016,
  volume_trend: 'Increasing',
  strategic_importance: 'Chinese EV battery supply'
}]->(refinery);

// Kamoto → Umicore
MATCH (mine:Mine {id: 'MINE-CO-KAM'}), (refinery:Refinery {id: 'REF-CO-UMI'})
CREATE (mine)-[:SUPPLIES {
  material: 'Cobalt Hydroxide',
  cobalt_content_percent: 30,
  annual_volume_tonnes: 12000,
  contract_type: 'Long-term offtake',
  ownership_link: 'Glencore (mine owner) - Umicore partnership',
  transport_method: 'Truck → rail → ship',
  shipping_route: 'Dar es Salaam → Antwerp',
  total_lead_time_days: 42,
  responsible_sourcing: 'Enhanced due diligence post-2020',
  improvements: 'Tailings management + community programs',
  audit_frequency_year: 6,
  certification: 'RMI',
  relationship_since: 2008,
  relationship_notes: 'Strengthened after controversies'
}]->(refinery);

// Kamoto → Huayou
MATCH (mine:Mine {id: 'MINE-CO-KAM'}), (refinery:Refinery {id: 'REF-CO-HUA'})
CREATE (mine)-[:SUPPLIES {
  material: 'Cobalt Hydroxide',
  annual_volume_tonnes: 8000,
  contract_type: 'Offtake agreement',
  transport_method: 'Ship',
  shipping_route: 'Dar es Salaam → Shanghai',
  relationship_since: 2010,
  certification: 'RMI'
}]->(refinery);

// Murrin Murrin → Umicore (premium ethical source)
MATCH (mine:Mine {id: 'MINE-CO-MUR'}), (refinery:Refinery {id: 'REF-CO-UMI'})
CREATE (mine)-[:SUPPLIES {
  material: 'Cobalt Sulfate',
  cobalt_content_percent: 21,
  annual_volume_tonnes: 3200,
  contract_type: 'Premium offtake',
  transport_method: 'Ship',
  port_origin: 'Esperance',
  shipping_route: 'Esperance → Antwerp',
  shipping_distance_km: 15500,
  shipping_time_days: 38,
  conflict_free_certification: true,
  ethical_rating: 'A',
  premium_pricing: true,
  premium_percent: 15,
  premium_justification: 'Conflict-free Australian origin',
  target_customers: 'Premium OEMs requiring ethical sourcing',
  oem_approvals: ['Tesla', 'BMW', 'VW'],
  relationship_since: 2018,
  strategic_value: 'Diversification from DRC'
}]->(refinery);

// Murrin Murrin → Terrafame (ethical to ethical)
MATCH (mine:Mine {id: 'MINE-CO-MUR'}), (refinery:Refinery {id: 'REF-CO-TER'})
CREATE (mine)-[:SUPPLIES {
  material: 'Nickel-Cobalt Intermediate',
  annual_volume_tonnes: 0,
  contract_type: 'No current relationship',
  potential_future: 'Both ethical sources, potential synergy',
  notes: 'Terrafame processes own mine, but could blend for capacity'
}]->(refinery);

// ==================== RARE EARTH MINES → PROCESSORS ====================

// Bayan Obo → Baotou Steel (integrated domestic)
MATCH (mine:Mine {id: 'MINE-REE-BAY'}), (processor:Processor {id: 'PROC-REE-BAO'})
CREATE (mine)-[:SUPPLIES {
  material: 'Rare Earth Concentrate',
  ree_content_percent: 50,
  annual_volume_tonnes: 130000,
  contract_type: 'Internal transfer',
  same_owner: 'China Northern Rare Earth Group',
  transport_method: 'Conveyor → truck',
  distance_km: 145,
  transport_time_hours: 3,
  vertical_integration: true,
  strategic_resource: 'National importance',
  export_restrictions: 'Processing kept domestic',
  relationship_since: 1957,
  monopoly_position: 'Dominant global supplier',
  military_applications: true,
  civilian_applications: ['EV motors', 'Wind turbines', 'Electronics']
}]->(processor);

// Mountain Pass → Currently exports to China (temporary)
MATCH (mine:Mine {id: 'MINE-REE-PAS'}), (processor:Processor {id: 'PROC-REE-BAO'})
CREATE (mine)-[:SUPPLIES {
  material: 'Rare Earth Concentrate',
  ree_content_percent: 60,
  annual_volume_tonnes: 38000,
  contract_type: 'Commercial offtake',
  contract_status: 'Temporary until US facility complete',
  transport_method: 'Truck → rail → ship',
  port_origin: 'Long Beach',
  shipping_route: 'Long Beach → Shanghai',
  shipping_distance_km: 10500,
  shipping_time_days: 22,
  strategic_contradiction: true,
  notes: 'US mine shipping to China due to lack of domestic separation capacity',
  planned_end_date: 2025,
  relationship_since: 2017,
  geopolitical_concern: 'Dependence on China despite US mine'
}]->(processor);

// Mountain Pass → Lynas Malaysia (alternative for partial processing)
MATCH (mine:Mine {id: 'MINE-REE-PAS'}), (processor:Processor {id: 'PROC-REE-LYN'})
CREATE (mine)-[:SUPPLIES {
  material: 'Rare Earth Concentrate',
  annual_volume_tonnes: 0,
  contract_type: 'No current relationship',
  potential_future: 'Possible partnership',
  notes: 'Lynas processes own Australian ore, but toll processing possible',
  strategic_alignment: 'Both non-Chinese sources'
}]->(processor);

// Mountain Pass → Own facility (planned 2025)
MATCH (mine:Mine {id: 'MINE-REE-PAS'}), (processor:Processor {id: 'PROC-REE-MP'})
CREATE (mine)-[:SUPPLIES {
  material: 'Rare Earth Concentrate',
  annual_volume_tonnes_planned: 40000,
  contract_type: 'Internal transfer (planned)',
  vertical_integration: 'Same company',
  transport_method: 'On-site',
  distance_km: 0,
  facility_status: 'Under construction',
  completion_expected: 2025,
  strategic_goal: 'End dependence on China',
  pentagon_support: true,
  national_security_importance: 'Critical',
  current_status: 'Concentrate still exported to China',
  transition_plan: '2025: bring processing back to US'
}]->(processor);

// Success message
MATCH ()-[r:SUPPLIES]->()
RETURN 'Part 3 Complete: Created ' + count(r) + ' SUPPLIES relationships connecting mines to processors' as message;
