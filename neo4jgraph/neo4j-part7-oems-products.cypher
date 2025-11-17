// ==================== PART 7: OEMs & FINAL PRODUCTS ====================
// Original Equipment Manufacturers and their flagship products

// Create indexes
CREATE INDEX oem_id IF NOT EXISTS FOR (o:OEM) ON (o.id);
CREATE INDEX product_id IF NOT EXISTS FOR (p:Product) ON (p.id);

// ==================== SMARTPHONE OEMs ====================

CREATE
// USA - Apple Inc.
(oem_apple:OEM {
  id: 'OEM-APPLE',
  name: 'Apple Inc.',
  country: 'USA',
  headquarters: 'Cupertino, California',
  coordinates: [37.3318, -122.0312],
  industry: 'Consumer Electronics',
  founded: 1976,
  founders: ['Steve Jobs', 'Steve Wozniak', 'Ronald Wayne'],
  ceo: 'Tim Cook',
  employees: 161000,
  business_model: 'Vertical integration + premium pricing',
  design_philosophy: 'In-house design, outsourced manufacturing',
  manufacturing_partners: ['Foxconn (primary)', 'Pegatron', 'Luxshare', 'Wistron'],
  assembly_locations: ['China (primary)', 'India (growing)', 'Vietnam (expansion)'],
  supply_chain_control: 'Extremely tight control',
  supplier_count: 186,
  supplier_audits_year: 1200,
  revenue_usd_billion_2023: 383,
  revenue_iphone_percent: 52,
  revenue_services_percent: 22,
  profit_margin_percent: 26,
  market_cap_usd_trillion: 3.0,
  r_and_d_usd_billion_year: 30,
  products: ['iPhone', 'iPad', 'Mac', 'Apple Watch', 'AirPods', 'Vision Pro'],
  ecosystem: 'Tightly integrated hardware + software + services',
  operating_systems: ['iOS', 'iPadOS', 'macOS', 'watchOS', 'visionOS'],
  services: ['App Store', 'iCloud', 'Apple Music', 'Apple TV+', 'Apple Pay'],
  chip_design: 'In-house (Apple Silicon)',
  processors_designed: ['A-series (iPhone)', 'M-series (Mac)', 'S-series (Watch)', 'H-series (AirPods)'],
  manufacturing_partner_chips: 'TSMC exclusive',
  sustainability_commitment: 'Carbon neutral by 2030',
  renewable_energy_percent: 100,
  recycled_materials_commitment: true,
  certifications: ['ISO 14001', 'RBA member'],
  privacy_focus: 'Core value proposition',
  security: 'Industry leading',
  brand_value_usd_billion: 482,
  brand_ranking: 1,
  customer_loyalty: 'Extremely high',
  ecosystem_lock_in: 'Strong',
  pricing_strategy: 'Premium',
  retail_presence: '500+ Apple Stores globally',
  geopolitical_exposure: 'China manufacturing dependence',
  diversification_efforts: 'India, Vietnam production',
  strategic_advantages: ['Brand', 'Ecosystem', 'Supply chain control', 'Silicon design'],
  competitive_moat: 'Very strong'
}),

// South Korea - Samsung Electronics
(oem_samsung:OEM {
  id: 'OEM-SAMSUNG',
  name: 'Samsung Electronics',
  parent_company: 'Samsung Group',
  country: 'South Korea',
  headquarters: 'Suwon, Gyeonggi',
  coordinates: [37.2636, 127.0286],
  industry: 'Consumer Electronics & Semiconductors',
  founded: 1969,
  ceo: 'Han Jong-hee (Vice Chairman)',
  employees: 270000,
  business_model: 'Vertical integration across entire value chain',
  manufacturing: 'In-house + contract manufacturing',
  manufacturing_locations: ['South Korea', 'Vietnam (primary phones)', 'India', 'Brazil', 'Indonesia'],
  vertical_integration_extent: 'Extreme - semiconductors to displays to batteries to assembly',
  revenue_usd_billion_2023: 234,
  revenue_mobile_percent: 30,
  revenue_semiconductors_percent: 38,
  revenue_display_percent: 12,
  profit_margin_percent: 11,
  market_cap_usd_billion: 350,
  r_and_d_usd_billion_year: 24,
  products_mobile: ['Galaxy S series (flagship)', 'Galaxy Z Fold/Flip (foldable)', 'Galaxy A series (mid-range)'],
  products_other: ['Tablets', 'Watches', 'Earbuds', 'TVs', 'Appliances'],
  business_divisions: ['Mobile Experience', 'Networks', 'Display', 'Memory', 'Foundry'],
  operating_system: 'Android (Google) + One UI',
  chip_design: 'In-house Exynos processors',
  chip_manufacturing: 'In-house Samsung Foundry',
  display_supply: 'In-house Samsung Display (world leader)',
  battery_supply: 'In-house Samsung SDI',
  memory_supply: 'In-house Samsung Memory (world leader)',
  camera_supply: 'In-house Samsung Electro-Mechanics',
  self_sufficiency_percent: 60,
  sustainability_target: 'Net zero carbon by 2050',
  renewable_energy_commitment: 'RE100 by 2050',
  certifications: ['ISO 14001', 'ISO 9001', 'ISO 45001'],
  brand_value_usd_billion: 99,
  brand_ranking: 5,
  innovation_focus: ['Foldable displays', 'AI', '5G/6G', 'Advanced semiconductors'],
  foldable_leadership: 'Market leader',
  competitive_advantages: ['Vertical integration', 'Technology breadth', 'Manufacturing scale'],
  geopolitical_position: 'Strategic ally of US',
  china_market_challenges: 'Lost share to local brands'
}),

// China - Xiaomi Corporation
(oem_xiaomi:OEM {
  id: 'OEM-XIAOMI',
  name: 'Xiaomi Corporation',
  country: 'China',
  headquarters: 'Beijing',
  coordinates: [39.9042, 116.4074],
  industry: 'Consumer Electronics & IoT',
  founded: 2010,
  founder: 'Lei Jun',
  ceo: 'Lei Jun',
  employees: 35000,
  business_model: 'Hardware + software + internet services',
  manufacturing: 'Outsourced (asset-light model)',
  manufacturing_partners: ['Foxconn', 'BYD Electronics', 'Flex', 'Inventec'],
  assembly_locations: ['China', 'India (major hub)', 'Indonesia', 'Turkey'],
  revenue_usd_billion_2023: 40,
  revenue_smartphones_percent: 62,
  revenue_iot_percent: 28,
  revenue_internet_services_percent: 10,
  profit_margin_percent: 5,
  market_cap_usd_billion: 45,
  r_and_d_usd_billion_year: 2.4,
  products: ['Xiaomi phones', 'Redmi phones', 'POCO phones', 'Mi Band', 'Smart home devices'],
  operating_system: 'Android + MIUI',
  chip_strategy: 'Qualcomm Snapdragon (primary), MediaTek',
  smartphone_shipments_million_2023: 146,
  market_position_global: 'Top 3',
  market_position_india: 'Leader',
  market_position_china: 'Top 2',
  pricing_strategy: 'Value for money',
  ecosystem: 'Mi Ecosystem (100+ IoT products)',
  iot_devices_connected_million: 650,
  sustainability_initiatives: ['Carbon reduction', 'Packaging reduction'],
  certifications: ['ISO 14001', 'ISO 9001'],
  innovation_focus: ['Camera technology', 'Fast charging', 'AI', 'Smart home'],
  fast_charging_wattage: 210,
  competitive_advantages: ['Price-performance ratio', 'IoT ecosystem', 'China/India markets'],
  geopolitical_challenges: 'US sanctions, India scrutiny',
  ev_entry: 'Xiaomi SU7 launched 2024'
}),

// China - Oppo (BBK Electronics)
(oem_oppo:OEM {
  id: 'OEM-OPPO',
  name: 'Oppo',
  parent_company: 'BBK Electronics',
  country: 'China',
  headquarters: 'Dongguan, Guangdong',
  coordinates: [23.0209, 113.7518],
  industry: 'Consumer Electronics',
  founded: 2004,
  founder: 'Tony Chen (BBK)',
  employees: 40000,
  business_model: 'Offline retail focus + innovation',
  manufacturing: 'Outsourced + some in-house',
  assembly_locations: ['China', 'India', 'Indonesia', 'Pakistan'],
  revenue_usd_billion_2023: 38,
  smartphone_shipments_million_2023: 103,
  market_position_global: 'Top 5',
  market_position_china: 'Top 3',
  products: ['Oppo Find (flagship)', 'Oppo Reno (mid-range)', 'Oppo A series'],
  operating_system: 'Android + ColorOS',
  chip_strategy: 'Qualcomm + MediaTek',
  innovation_focus: ['Camera technology', 'Fast charging', 'Design'],
  fast_charging_supervooc_wattage: 240,
  camera_partnership: 'Hasselblad',
  retail_strategy: 'Extensive offline presence',
  retail_stores_count: 200000,
  brand_ambassadors: 'Celebrity endorsements',
  sister_brands: 'Vivo, OnePlus, Realme (all BBK)',
  competitive_advantages: ['Offline distribution', 'Camera innovation', 'Brand marketing'],
  certifications: ['ISO 9001', 'ISO 14001']
}),

// USA - Google (Alphabet Inc.)
(oem_google:OEM {
  id: 'OEM-GOOGLE',
  name: 'Google (Alphabet Inc.)',
  country: 'USA',
  headquarters: 'Mountain View, California',
  coordinates: [37.4220, -122.0841],
  industry: 'Technology & Internet Services',
  founded: 1998,
  founders: ['Larry Page', 'Sergey Brin'],
  ceo_alphabet: 'Sundar Pichai',
  employees: 182000,
  business_model: 'Internet services + hardware',
  hardware_division: 'Google Devices & Services',
  manufacturing: 'Outsourced (Foxconn, Flex, Arima)',
  assembly_locations: ['China', 'Vietnam', 'Thailand'],
  revenue_usd_billion_2023: 307,
  revenue_advertising_percent: 79,
  revenue_cloud_percent: 11,
  revenue_hardware_percent: 3,
  market_cap_usd_trillion: 1.8,
  r_and_d_usd_billion_year: 45,
  products_hardware: ['Pixel phones', 'Pixel Watch', 'Pixel Buds', 'Nest smart home'],
  operating_system: 'Android (developed by Google)',
  android_market_share_percent: 72,
  chip_design: 'Google Tensor (in-house with Samsung)',
  tensor_manufacturing: 'Samsung Foundry',
  pixel_strategy: 'Showcase Android + AI capabilities',
  pixel_shipments_million_2023: 10,
  ai_integration: 'Deep (Google Assistant, Gemini AI)',
  services_integration: ['Google Photos', 'Gmail', 'Google Drive', 'YouTube'],
  competitive_advantages: ['AI leadership', 'Android ecosystem', 'Services integration'],
  sustainability: 'Carbon neutral since 2007',
  renewable_energy_percent: 100,
  certifications: ['ISO 14001', 'ISO 27001'],
  strategic_focus: 'AI-first products'
});

// ==================== FINAL PRODUCTS ====================

CREATE
// iPhone 15 Pro Max
(product_iphone15pro:Product {
  id: 'PROD-IPHONE15PM',
  name: 'Apple iPhone 15 Pro Max',
  manufacturer: 'Apple Inc.',
  oem_id: 'OEM-APPLE',
  category: 'Flagship Smartphone',
  launch_date: '2023-09-22',
  end_of_life: null,
  current_production: true,
  form_factor: 'Slab (candy bar)',
  dimensions_mm: [159.9, 76.7, 8.25],
  weight_grams: 221,
  materials: ['Titanium frame', 'Ceramic Shield front', 'Textured matte glass back'],
  colors: ['Natural Titanium', 'Blue Titanium', 'White Titanium', 'Black Titanium'],

  // Display
  display_type: 'Super Retina XDR OLED (LTPO)',
  display_size_inches: 6.7,
  display_resolution: [2796, 1290],
  display_ppi: 460,
  display_refresh_rate_hz: 120,
  display_brightness_nits: 2000,
  display_supplier: 'Samsung Display + LG Display',
  always_on_display: true,
  hdr_support: ['HDR10', 'Dolby Vision'],

  // Processor
  processor: 'Apple A17 Pro',
  process_node: '3nm (TSMC N3B)',
  cpu_cores: 6,
  cpu_config: '2P + 4E',
  gpu_cores: 6,
  neural_engine_cores: 16,
  ram_gb: 8,
  ram_type: 'LPDDR5',
  ram_supplier: 'Samsung + SK Hynix',

  // Storage
  storage_options_gb: [256, 512, 1024],
  storage_type: 'NVMe',
  storage_supplier: 'Kioxia + Samsung + SK Hynix',

  // Camera System
  camera_system: 'Triple camera + LiDAR',
  main_camera_mp: 48,
  main_camera_sensor: 'Sony IMX803',
  main_camera_aperture: 'f/1.78',
  main_camera_sensor_size: '1/1.28"',
  main_camera_stabilization: 'Sensor-shift OIS',
  ultrawide_camera_mp: 12,
  ultrawide_aperture: 'f/2.2',
  telephoto_camera_mp: 12,
  telephoto_zoom: '5x optical (tetraprism)',
  telephoto_aperture: 'f/2.8',
  lidar_scanner: true,
  front_camera_mp: 12,
  video_recording: '4K60 ProRes, 4K120 slow-mo',
  camera_module_supplier: 'LG Innotek',
  camera_sensor_supplier: 'Sony',

  // Battery
  battery_capacity_mah: 4441,
  battery_chemistry: 'Lithium-ion',
  battery_cell_supplier: 'LG Energy Solution + Samsung SDI',
  battery_configuration: 'L-shaped dual cell',
  wireless_charging: 'MagSafe 15W + Qi',
  fast_charging_wattage: 27,
  battery_life_video_playback_hours: 29,

  // Connectivity
  connectivity_5g: true,
  modem: 'Qualcomm Snapdragon X70',
  wifi_standard: 'Wi-Fi 6E',
  bluetooth_version: '5.3',
  nfc: true,
  uwb_chip: 'U2 (second-gen Ultra Wideband)',
  satellite_connectivity: 'Emergency SOS via satellite',

  // Other Features
  biometric_auth: 'Face ID (TrueDepth camera)',
  water_resistance: 'IP68 (6m for 30min)',
  audio: 'Stereo speakers, Spatial Audio',
  port: 'USB-C (USB 3.2 Gen 2)',
  action_button: true,

  // Software
  operating_system: 'iOS 17',
  os_updates_guaranteed_years: 5,

  // Pricing & Markets
  launch_price_usd: [1199, 1399, 1599],
  current_price_usd: [1199, 1399, 1599],
  target_market: 'Global premium',

  // Manufacturing
  assembled_by: 'Foxconn + Pegatron',
  assembly_locations: ['China (Zhengzhou)', 'India (Chennai)'],
  main_pcb_supplier: 'Unimicron + Compeq',

  // Supply Chain Summary
  component_count: 2847,
  supplier_count: 186,
  countries_of_origin: 43,

  // Sustainability
  recycled_materials_percent: 20,
  recycled_content: ['Recycled aluminum', 'Recycled cobalt', 'Recycled rare earth elements', 'Recycled gold'],
  carbon_footprint_kg: 73,
  packaging_plastic_free: true,
  energy_efficiency_rating: 'A+',
  repairability_score: 4.5,

  // Certifications
  certifications: ['FCC', 'CE', 'RoHS', 'REACH', 'Energy Star'],
  conflict_minerals_compliant: true,

  // Market Performance
  units_shipped_million_2023: 45,
  market_share_premium_percent: 75,
  customer_satisfaction_percent: 96,
  return_rate_percent: 1.2,

  // Strategic Importance
  flagship: true,
  profit_generator: 'Primary',
  halo_effect: 'Strong',
  ecosystem_anchor: true
}),

// Samsung Galaxy S24 Ultra
(product_galaxys24ultra:Product {
  id: 'PROD-GALAXYS24U',
  name: 'Samsung Galaxy S24 Ultra',
  manufacturer: 'Samsung Electronics',
  oem_id: 'OEM-SAMSUNG',
  category: 'Flagship Smartphone',
  launch_date: '2024-01-31',
  end_of_life: null,
  current_production: true,
  form_factor: 'Slab with S Pen',
  dimensions_mm: [162.3, 79.0, 8.6],
  weight_grams: 232,
  materials: ['Titanium frame', 'Gorilla Armor glass front', 'Glass back'],
  colors: ['Titanium Black', 'Titanium Gray', 'Titanium Violet', 'Titanium Yellow'],

  // Display
  display_type: 'Dynamic AMOLED 2X (LTPO)',
  display_size_inches: 6.8,
  display_resolution: [3088, 1440],
  display_ppi: 505,
  display_refresh_rate_hz: 120,
  display_brightness_nits: 2600,
  display_supplier: 'Samsung Display (in-house)',
  always_on_display: true,
  hdr_support: ['HDR10+'],

  // Processor
  processor: 'Snapdragon 8 Gen 3 for Galaxy',
  processor_custom: 'Overclocked exclusive variant',
  process_node: '4nm (TSMC N4P)',
  cpu_cores: 8,
  gpu: 'Adreno 750',
  ram_gb: 12,
  ram_type: 'LPDDR5X',
  ram_supplier: 'Samsung (in-house)',

  // Storage
  storage_options_gb: [256, 512, 1024],
  storage_type: 'UFS 4.0',
  storage_supplier: 'Samsung (in-house)',

  // Camera System
  camera_system: 'Quad camera',
  main_camera_mp: 200,
  main_camera_sensor: 'Samsung ISOCELL HP2',
  main_camera_sensor_size: '1/1.3"',
  main_camera_stabilization: 'OIS',
  ultrawide_camera_mp: 12,
  telephoto_1_mp: 10,
  telephoto_1_zoom: '3x optical',
  telephoto_2_mp: 50,
  telephoto_2_zoom: '5x optical',
  telephoto_2_aperture: 'f/3.4',
  periscope_telephoto: true,
  front_camera_mp: 12,
  video_recording: '8K30, 4K120',
  camera_module_supplier: 'Samsung Electro-Mechanics (in-house)',

  // Battery
  battery_capacity_mah: 5000,
  battery_chemistry: 'Lithium-ion',
  battery_cell_supplier: 'Samsung SDI (in-house)',
  wireless_charging_wattage: 15,
  fast_charging_wattage: 45,
  reverse_wireless_charging: true,
  battery_life_video_playback_hours: 30,

  // Connectivity
  connectivity_5g: true,
  modem: 'Snapdragon X75',
  wifi_standard: 'Wi-Fi 7',
  bluetooth_version: '5.3',
  nfc: true,
  uwb_chip: true,
  satellite_connectivity: false,

  // Other Features
  biometric_auth: 'Ultrasonic fingerprint + Face recognition',
  water_resistance: 'IP68',
  audio: 'Stereo speakers by AKG, Dolby Atmos',
  port: 'USB-C (USB 3.2 Gen 2)',
  stylus: 'S Pen (integrated)',

  // Software
  operating_system: 'Android 14 + One UI 6.1',
  os_updates_guaranteed_years: 7,
  ai_features: 'Galaxy AI (on-device + cloud)',

  // Pricing & Markets
  launch_price_usd: [1299, 1419, 1659],
  target_market: 'Global premium',

  // Manufacturing
  assembled_by: 'Samsung (in-house)',
  assembly_locations: ['Vietnam (primary)', 'South Korea'],
  vertical_integration_percent: 65,

  // Supply Chain Summary
  component_count: 2615,
  supplier_count: 142,
  in_house_components_percent: 65,

  // Sustainability
  recycled_materials_percent: 16,
  recycled_content: ['Recycled aluminum', 'Recycled glass', 'Recycled plastics'],
  carbon_footprint_kg: 81,
  packaging_plastic_percent: 0,

  // Certifications
  certifications: ['FCC', 'CE', 'RoHS', 'REACH'],
  conflict_minerals_compliant: true,

  // Market Performance
  units_shipped_million_2024_q1: 8,
  market_share_premium_percent: 18,
  customer_satisfaction_percent: 89,

  // Strategic Importance
  flagship: true,
  vertical_integration_showcase: true,
  component_technology_demonstration: true
}),

// Xiaomi 14 Ultra
(product_xiaomi14ultra:Product {
  id: 'PROD-XIAOMI14U',
  name: 'Xiaomi 14 Ultra',
  manufacturer: 'Xiaomi Corporation',
  oem_id: 'OEM-XIAOMI',
  category: 'Flagship Smartphone',
  launch_date: '2024-02-22',
  end_of_life: null,
  current_production: true,
  form_factor: 'Slab',
  dimensions_mm: [161.4, 75.3, 9.2],
  weight_grams: 219,
  materials: ['Aluminum frame', 'Gorilla Glass Victus 2', 'Eco leather / Glass back'],

  // Display
  display_type: 'AMOLED (LTPO)',
  display_size_inches: 6.73,
  display_resolution: [3200, 1440],
  display_ppi: 522,
  display_refresh_rate_hz: 120,
  display_brightness_nits: 3000,
  display_supplier: 'BOE + CSOT',
  hdr_support: ['HDR10+', 'Dolby Vision'],

  // Processor
  processor: 'Snapdragon 8 Gen 3',
  process_node: '4nm (TSMC)',
  ram_gb: 16,
  ram_type: 'LPDDR5X',
  ram_supplier: 'Samsung + Micron',

  // Storage
  storage_options_gb: [512, 1024],
  storage_type: 'UFS 4.0',
  storage_supplier: 'Samsung + SK Hynix',

  // Camera System (Leica partnership)
  camera_partnership: 'Leica',
  camera_system: 'Quad camera Leica Professional Photography',
  main_camera_mp: 50,
  main_camera_sensor: 'Sony LYT-900',
  main_camera_sensor_size: '1"',
  main_camera_aperture: 'f/1.6-f/4.0 variable',
  ultrawide_camera_mp: 50,
  telephoto_1_mp: 50,
  telephoto_1_zoom: '3.2x optical',
  telephoto_2_mp: 50,
  telephoto_2_zoom: '5x optical',
  video_recording: '8K24, 4K60',
  camera_module_supplier: 'Sunny Optical',

  // Battery
  battery_capacity_mah: 5300,
  battery_chemistry: 'Silicon-carbon anode',
  battery_cell_supplier: 'ATL + CATL',
  wireless_charging_wattage: 80,
  fast_charging_wattage: 90,

  // Connectivity
  connectivity_5g: true,
  modem: 'Snapdragon X75',
  wifi_standard: 'Wi-Fi 7',
  bluetooth_version: '5.4',

  // Software
  operating_system: 'Android 14 + HyperOS',
  os_updates_guaranteed_years: 4,

  // Pricing & Markets
  launch_price_usd: [1299, 1499],
  target_market: 'China, Europe, Asia',

  // Manufacturing
  assembled_by: 'Foxconn + BYD Electronics',
  assembly_locations: ['China', 'India'],

  // Strategic Importance
  flagship: true,
  camera_leadership_statement: true,
  premium_positioning: 'Compete with iPhone/Galaxy'
}),

// Google Pixel 8 Pro
(product_pixel8pro:Product {
  id: 'PROD-PIXEL8P',
  name: 'Google Pixel 8 Pro',
  manufacturer: 'Google (Alphabet Inc.)',
  oem_id: 'OEM-GOOGLE',
  category: 'Flagship Smartphone',
  launch_date: '2023-10-12',
  end_of_life: null,
  current_production: true,
  form_factor: 'Slab',
  dimensions_mm: [162.6, 76.5, 8.8],
  weight_grams: 213,
  materials: ['Aluminum frame', 'Gorilla Glass Victus 2', 'Glass back'],

  // Display
  display_type: 'LTPO OLED',
  display_size_inches: 6.7,
  display_resolution: [2992, 1344],
  display_ppi: 489,
  display_refresh_rate_hz: 120,
  display_brightness_nits: 2400,
  display_supplier: 'Samsung Display',

  // Processor
  processor: 'Google Tensor G3',
  chip_design: 'Google in-house',
  process_node: '4nm (Samsung Foundry)',
  cpu_cores: 9,
  tpu_cores: 'Dedicated AI accelerator',
  ram_gb: 12,
  ram_type: 'LPDDR5X',

  // Storage
  storage_options_gb: [128, 256, 512],
  storage_type: 'UFS 3.1',

  // Camera System
  camera_system: 'Triple camera + computational photography',
  main_camera_mp: 50,
  main_camera_sensor: 'Samsung GN2',
  ultrawide_camera_mp: 48,
  telephoto_camera_mp: 48,
  telephoto_zoom: '5x optical',
  video_recording: '4K60, 10-bit HDR',
  computational_photography: 'Magic Eraser, Best Take, Audio Magic Eraser',
  ai_photo_editing: 'Extensive',

  // Battery
  battery_capacity_mah: 5050,
  wireless_charging_wattage: 23,
  fast_charging_wattage: 30,

  // Connectivity
  connectivity_5g: true,
  wifi_standard: 'Wi-Fi 7',
  bluetooth_version: '5.3',

  // Software
  operating_system: 'Android 14 (stock)',
  os_updates_guaranteed_years: 7,
  security_updates_years: 7,
  ai_integration: 'Gemini AI, Google Assistant',
  exclusive_features: ['Call Screen', 'Hold for Me', 'Live Translate'],

  // Pricing & Markets
  launch_price_usd: [999, 1059, 1179],
  target_market: 'USA, Europe, Asia (select)',

  // Manufacturing
  assembled_by: 'Foxconn',
  assembly_locations: ['Vietnam'],

  // Strategic Importance
  flagship: true,
  android_reference_device: true,
  ai_showcase: true,
  google_services_integration: 'Deep'
});

// Success message
MATCH (n)
WHERE n:OEM OR n:Product
RETURN 'Part 7 Complete: Created ' + count(n) + ' OEM and Product nodes' as message;
