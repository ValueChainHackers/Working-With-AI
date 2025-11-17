# Supply Chain Generator for Neo4j

A Python-based tool that generates massive, realistic supply chain graphs with thousands of nodes and relationships, outputting Neo4j-compatible Cypher statements.

## Features

- **Multi-tier supply chain**: Generates 8 tiers from raw materials (mines) to OEMs
- **Realistic data**: Uses real country names, materials, component types, and business attributes
- **Scalable complexity**: Choose complexity levels 1-10 to generate small or massive supply chains
- **Reproducible**: Set random seeds for consistent output
- **Neo4j ready**: Outputs Cypher CREATE statements that can be directly imported

## Supply Chain Tiers

The generator creates a realistic pyramid structure with these tiers:

| Tier | Name | Description | Node Label |
|------|------|-------------|------------|
| 7 | Raw Materials | Mines extracting copper, lithium, cobalt, etc. | `Mine` |
| 6 | Processing & Refining | Smelters, refineries, chemical processors | `Processor` |
| 5 | Material Production | Alloy producers, compound manufacturers | `MaterialProducer` |
| 4 | Component Manufacturing | Battery cells, chips, displays, sensors | `ComponentManufacturer` |
| 3 | Subassembly Production | Battery packs, camera systems, logic boards | `SubassemblyProducer` |
| 2 | Module Assembly | Complete device modules, board assemblies | `ModuleAssembler` |
| 1 | Final Assembly | Contract manufacturers, ODMs | `FinalAssembler` |
| 0 | Brand/OEM | Consumer brands | `OEM` |

## Installation

No dependencies required! Uses only Python standard library.

```bash
# Just download the script
git clone <repo>
cd SupplyChainGenerator
```

## Usage

### Basic Usage

Generate a supply chain with default settings (complexity 5):

```bash
python supply_chain_generator.py
```

This creates `supply_chain.cypher` with ~435 nodes and ~1,850 relationships.

### Custom Complexity

Generate a massive supply chain:

```bash
python supply_chain_generator.py -c 10 -o massive.cypher
```

Generate a small test supply chain:

```bash
python supply_chain_generator.py -c 2 -o small.cypher
```

### All Options

```bash
python supply_chain_generator.py \
  --complexity 8 \
  --seed 99999 \
  --output my_chain.cypher \
  --clear
```

**Options:**
- `-c, --complexity` : Complexity level 1-10 (default: 5)
  - Level 1: ~89 nodes, ~74 relationships
  - Level 5: ~445 nodes, ~1,850 relationships
  - Level 10: ~890 nodes, ~3,700 relationships
- `-s, --seed` : Random seed for reproducibility (default: 12345)
- `-o, --output` : Output file path (default: supply_chain.cypher)
- `--clear` : Include `MATCH (n) DETACH DELETE n;` at start of output

## Loading into Neo4j

### Method 1: cypher-shell (Command Line)

```bash
cat supply_chain.cypher | cypher-shell -u neo4j -p your-password
```

### Method 2: Neo4j Browser

1. Open Neo4j Browser
2. Copy contents of the .cypher file
3. Paste into query box
4. Run (may need to run in batches if very large)

### Method 3: Python neo4j driver

```python
from neo4j import GraphDatabase

driver = GraphDatabase.driver("bolt://localhost:7687", auth=("neo4j", "password"))

with open("supply_chain.cypher", "r") as f:
    cypher = f.read()

with driver.session() as session:
    # Split into statements and execute
    statements = [s.strip() + ";" for s in cypher.split(";") if s.strip() and not s.strip().startswith("//")]
    for stmt in statements:
        session.run(stmt)
```

## Example Queries

After loading the data into Neo4j, try these queries:

### Find all mines supplying a specific OEM

```cypher
MATCH path = (m:Mine)-[*]->(oem:OEM {name: "Brand A Corporation"})
RETURN path
LIMIT 50
```

### Find the longest supply chain path

```cypher
MATCH path = (m:Mine)-[*]->(oem:OEM)
RETURN path, length(path) as pathLength
ORDER BY pathLength DESC
LIMIT 1
```

### Count nodes by tier

```cypher
MATCH (m:Mine) RETURN "Tier 7: Mines" as tier, count(m) as count
UNION
MATCH (p:Processor) RETURN "Tier 6: Processors" as tier, count(p) as count
UNION
MATCH (mp:MaterialProducer) RETURN "Tier 5: Material Producers" as tier, count(mp) as count
UNION
MATCH (c:ComponentManufacturer) RETURN "Tier 4: Component Manufacturers" as tier, count(c) as count
UNION
MATCH (s:SubassemblyProducer) RETURN "Tier 3: Subassembly Producers" as tier, count(s) as count
UNION
MATCH (ma:ModuleAssembler) RETURN "Tier 2: Module Assemblers" as tier, count(ma) as count
UNION
MATCH (fa:FinalAssembler) RETURN "Tier 1: Final Assemblers" as tier, count(fa) as count
UNION
MATCH (o:OEM) RETURN "Tier 0: OEMs" as tier, count(o) as count
ORDER BY tier DESC
```

### Find suppliers by country

```cypher
MATCH (n)
WHERE n.country IS NOT NULL
RETURN n.country as country, labels(n)[0] as type, count(*) as count
ORDER BY country, type
```

### Find ethical mines

```cypher
MATCH (m:Mine)
WHERE m.ethical_certification = true
RETURN m.name, m.country, m.material, m.environmental_score
ORDER BY m.environmental_score DESC
```

## Output Format

The generated Cypher file contains:

1. **Header comments**: Metadata about generation
2. **Index creation**: For performance
3. **Node creation**: All entities with properties
4. **Relationship creation**: Connections between tiers

Example output structure:

```cypher
// Supply Chain Graph - Generated 2025-11-17 17:14:35
// Total Nodes: 890
// Total Relationships: 3700

// Create indexes for performance
CREATE INDEX IF NOT EXISTS FOR (n:Mine) ON (n.id);
...

// Create nodes
CREATE (:Mine {id: 'MINE-COP-0001', name: 'Chile Copper Mine #1', ...});
...

// Create relationships
MATCH (a {id: 'MINE-COP-0001'}), (b {id: 'PROC-0042'})
CREATE (a)-[:SUPPLIES_ORE {volume_units_year: 125000, ...}]->(b);
...
```

## Node Properties

Each node type has realistic properties:

**Mine:**
- name, country, material
- capacity_tonnes_year, operating_since
- latitude, longitude
- ethical_certification, environmental_score

**Processor:**
- name, country, process_type
- capacity_tonnes_year, purity_level
- energy_source, iso_certified

**ComponentManufacturer:**
- name, country, component_type
- annual_production_units, technology_node
- lead_time_days, quality_yield

**OEM:**
- name, headquarters, brand_tier
- annual_sales_millions, market_share_percent
- founded_year, products[]

## Relationship Properties

All relationships include:
- volume_units_year
- contract_start_year
- lead_time_days
- quality_rating (8.0-10.0)
- primary_supplier (boolean)

## Performance

| Complexity | Nodes | Relationships | File Size | Generation Time |
|------------|-------|---------------|-----------|-----------------|
| 1 | ~89 | ~74 | ~37 KB | <1s |
| 3 | ~267 | ~222 | ~111 KB | <1s |
| 5 | ~445 | ~370 | ~185 KB | ~1s |
| 10 | ~890 | ~3,700 | ~1 MB | ~2s |

## Architecture

The generator uses a simple but effective architecture:

1. **Models**: `Node`, `Relationship`, `SupplyChainGraph`
2. **Generator**: Creates nodes tier-by-tier (bottom-up)
3. **Relationships**: Connects adjacent tiers with realistic cardinality
4. **Exporter**: Converts to Cypher format

## Future Enhancements

Potential additions:
- [ ] JSON template support for custom supply chains
- [ ] Geographic clustering (suppliers near customers)
- [ ] Time-series data (capacity changes over time)
- [ ] Risk factors (geopolitical, environmental)
- [ ] GraphML export format
- [ ] Interactive TUI with `rich` or `textual`

## License

MIT

## Contributing

Contributions welcome! Some ideas:
- Add more realistic business logic
- Implement additional node types
- Add validation constraints
- Create visualization tools
