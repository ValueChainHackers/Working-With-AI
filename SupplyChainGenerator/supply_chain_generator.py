#!/usr/bin/env python3
"""
Supply Chain Generator - Generates massive supply chains for Neo4j

Creates a realistic multi-tier supply chain with thousands of nodes and relationships,
outputting Neo4j-compatible Cypher statements.
"""

import random
import argparse
from datetime import datetime
from typing import List, Dict, Any, Tuple


class Node:
    """Represents a supply chain entity/node"""

    def __init__(self, id: str, label: str, tier: int, properties: Dict[str, Any]):
        self.id = id
        self.label = label
        self.tier = tier
        self.properties = properties

    def to_cypher(self) -> str:
        """Convert node to Cypher CREATE statement"""
        props = [f"id: '{self.id}'"]

        for key, value in self.properties.items():
            if isinstance(value, str):
                # Escape single quotes
                value_str = f"'{value.replace(chr(39), chr(92) + chr(39))}'"
            elif isinstance(value, bool):
                value_str = str(value).lower()
            elif isinstance(value, (int, float)):
                value_str = str(value)
            elif isinstance(value, list):
                # Array of strings
                escaped = [f"'{v.replace(chr(39), chr(92) + chr(39))}'" for v in value]
                value_str = f"[{', '.join(escaped)}]"
            else:
                value_str = f"'{value}'"

            props.append(f"{key}: {value_str}")

        props_str = ", ".join(props)
        return f"CREATE (:{self.label} {{{props_str}}})"


class Relationship:
    """Represents a relationship between nodes"""

    def __init__(self, rel_type: str, from_id: str, to_id: str, properties: Dict[str, Any]):
        self.type = rel_type
        self.from_id = from_id
        self.to_id = to_id
        self.properties = properties

    def to_cypher(self) -> str:
        """Convert relationship to Cypher CREATE statement"""
        if self.properties:
            props = []
            for key, value in self.properties.items():
                if isinstance(value, str):
                    value_str = f"'{value.replace(chr(39), chr(92) + chr(39))}'"
                elif isinstance(value, bool):
                    value_str = str(value).lower()
                elif isinstance(value, (int, float)):
                    value_str = str(value)
                else:
                    value_str = f"'{value}'"
                props.append(f"{key}: {value_str}")

            props_str = f" {{{', '.join(props)}}}"
        else:
            props_str = ""

        return f"MATCH (a {{id: '{self.from_id}'}}), (b {{id: '{self.to_id}'}}) CREATE (a)-[:{self.type}{props_str}]->(b)"


class SupplyChainGraph:
    """Container for the entire supply chain graph"""

    def __init__(self):
        self.nodes: List[Node] = []
        self.relationships: List[Relationship] = []
        self.metadata: Dict[str, str] = {}

    def to_cypher(self, clear_database: bool = False) -> str:
        """Export graph as Cypher statements"""
        lines = [
            f"// Supply Chain Graph - Generated {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}",
            f"// Total Nodes: {len(self.nodes)}",
            f"// Total Relationships: {len(self.relationships)}",
            ""
        ]

        if clear_database:
            lines.extend([
                "// Clear existing data",
                "MATCH (n) DETACH DELETE n;",
                ""
            ])

        # Create indexes
        lines.append("// Create indexes for performance")
        labels = set(node.label for node in self.nodes)
        for label in sorted(labels):
            lines.append(f"CREATE INDEX IF NOT EXISTS FOR (n:{label}) ON (n.id);")
        lines.append("")

        # Create nodes
        lines.append("// Create nodes")
        for node in self.nodes:
            lines.append(node.to_cypher() + ";")
        lines.append("")

        # Create relationships
        lines.append("// Create relationships")
        for rel in self.relationships:
            lines.append(rel.to_cypher() + ";")

        return "\n".join(lines)


class SupplyChainGenerator:
    """Generates realistic supply chain data"""

    # Realistic data pools
    COUNTRIES = [
        "China", "USA", "South Korea", "Japan", "Taiwan", "Germany",
        "Indonesia", "Chile", "Australia", "Canada", "DRC", "Peru",
        "Vietnam", "Malaysia", "Thailand", "India", "Mexico", "Brazil",
        "Philippines", "Poland", "Czech Republic", "Singapore"
    ]

    MATERIALS = [
        "Copper", "Cobalt", "Lithium", "Nickel", "Rare Earth Elements",
        "Gold", "Silver", "Aluminum", "Silicon", "Tungsten", "Tantalum",
        "Graphite", "Manganese", "Tin", "Platinum", "Palladium"
    ]

    COMPONENT_TYPES = [
        "Battery Cell", "Display Panel", "Processor Chip", "Memory Module",
        "Camera Module", "Circuit Board", "Antenna", "Speaker", "Microphone",
        "Sensor", "Connector", "Capacitor", "Resistor", "Power Management IC",
        "LED Driver", "Touch Controller", "Accelerometer", "Gyroscope"
    ]

    TIER_NAMES = {
        7: "Raw Materials",
        6: "Processing & Refining",
        5: "Material Production",
        4: "Component Manufacturing",
        3: "Subassembly Production",
        2: "Module Assembly",
        1: "Final Assembly",
        0: "Brand/OEM"
    }

    def __init__(self, seed: int = 12345):
        random.seed(seed)
        self.node_counter = 0

    def generate(self, complexity_level: int = 5) -> SupplyChainGraph:
        """
        Generate a complete supply chain graph

        Args:
            complexity_level: Scale from 1-10, controls number of entities

        Returns:
            Complete supply chain graph
        """
        print(f"Generating supply chain with complexity level {complexity_level}...")

        graph = SupplyChainGraph()
        nodes_by_tier: Dict[int, List[Node]] = {}

        # Calculate node counts - pyramid structure (more at bottom)
        base_counts = {
            7: complexity_level * 15,  # Mines
            6: complexity_level * 12,  # Processors
            5: complexity_level * 10,  # Material producers
            4: complexity_level * 20,  # Component manufacturers
            3: complexity_level * 15,  # Subassembly
            2: complexity_level * 10,  # Module assembly
            1: complexity_level * 5,   # Final assembly
            0: complexity_level * 2    # OEMs
        }

        # Generate nodes tier by tier (bottom up)
        for tier in range(7, -1, -1):
            print(f"  Generating Tier {tier} ({self.TIER_NAMES[tier]})...")
            nodes = self._generate_tier(tier, base_counts[tier])
            nodes_by_tier[tier] = nodes
            graph.nodes.extend(nodes)
            print(f"    Created {len(nodes)} nodes")

        # Generate relationships between adjacent tiers
        print("Generating relationships...")
        for tier in range(7, 0, -1):
            from_nodes = nodes_by_tier[tier]
            to_nodes = nodes_by_tier[tier - 1]

            relationships = self._generate_relationships(
                from_nodes, to_nodes, tier, complexity_level
            )
            graph.relationships.extend(relationships)

            print(f"    Tier {tier} -> {tier - 1}: {len(relationships)} relationships")

        # Add metadata
        graph.metadata = {
            "generated_at": datetime.now().isoformat(),
            "complexity_level": str(complexity_level),
            "total_nodes": str(len(graph.nodes)),
            "total_relationships": str(len(graph.relationships))
        }

        print(f"\nGeneration complete!")
        print(f"  Total Nodes: {len(graph.nodes)}")
        print(f"  Total Relationships: {len(graph.relationships)}")

        return graph

    def _generate_tier(self, tier: int, count: int) -> List[Node]:
        """Generate all nodes for a specific tier"""
        generators = {
            7: self._generate_mine,
            6: self._generate_processor,
            5: self._generate_material_producer,
            4: self._generate_component_manufacturer,
            3: self._generate_subassembly_producer,
            2: self._generate_module_assembler,
            1: self._generate_final_assembler,
            0: self._generate_oem
        }

        generator = generators[tier]
        return [generator() for _ in range(count)]

    def _generate_mine(self) -> Node:
        """Generate a mine node"""
        material = random.choice(self.MATERIALS)
        country = random.choice(self.COUNTRIES)
        self.node_counter += 1

        material_code = material.replace(" ", "").upper()[:3]
        node_id = f"MINE-{material_code}-{self.node_counter:04d}"

        return Node(
            id=node_id,
            label="Mine",
            tier=7,
            properties={
                "name": f"{country} {material} Mine #{self.node_counter}",
                "country": country,
                "material": material,
                "capacity_tonnes_year": random.randint(10000, 500000),
                "operating_since": random.randint(1980, 2020),
                "latitude": round(random.uniform(-90, 90), 6),
                "longitude": round(random.uniform(-180, 180), 6),
                "ethical_certification": random.random() > 0.5,
                "environmental_score": random.randint(1, 10)
            }
        )

    def _generate_processor(self) -> Node:
        """Generate a processing facility node"""
        country = random.choice(self.COUNTRIES)
        self.node_counter += 1

        return Node(
            id=f"PROC-{self.node_counter:04d}",
            label="Processor",
            tier=6,
            properties={
                "name": f"{country} Processing Facility #{self.node_counter}",
                "country": country,
                "process_type": random.choice([
                    "Smelting", "Refining", "Chemical Processing", "Purification", "Electrolysis"
                ]),
                "capacity_tonnes_year": random.randint(50000, 1000000),
                "purity_level": round(random.uniform(0.90, 0.9999), 4),
                "energy_source": random.choice(["Coal", "Natural Gas", "Renewable", "Nuclear", "Mixed"]),
                "iso_certified": random.random() > 0.3
            }
        )

    def _generate_material_producer(self) -> Node:
        """Generate a material production node"""
        country = random.choice(self.COUNTRIES)
        self.node_counter += 1

        certs = []
        if random.random() > 0.5:
            certs.append("ISO9001")
        if random.random() > 0.6:
            certs.append("ISO14001")
        if random.random() > 0.7:
            certs.append("IATF16949")

        return Node(
            id=f"MATP-{self.node_counter:04d}",
            label="MaterialProducer",
            tier=5,
            properties={
                "name": f"{country} Materials Co. #{self.node_counter}",
                "country": country,
                "material_type": random.choice([
                    "Alloy", "Compound", "Polymer", "Ceramic", "Composite", "Semiconductor Material"
                ]),
                "production_capacity_tonnes": random.randint(10000, 200000),
                "quality_grade": random.choice(["Industrial", "Commercial", "Premium", "Ultra-Pure"]),
                "certifications": certs
            }
        )

    def _generate_component_manufacturer(self) -> Node:
        """Generate a component manufacturer node"""
        country = random.choice(self.COUNTRIES)
        component = random.choice(self.COMPONENT_TYPES)
        self.node_counter += 1

        comp_code = component.replace(" ", "").upper()[:4]
        node_id = f"COMP-{comp_code}-{self.node_counter:04d}"

        return Node(
            id=node_id,
            label="ComponentManufacturer",
            tier=4,
            properties={
                "name": f"{country} {component} Manufacturer",
                "country": country,
                "component_type": component,
                "annual_production_units": random.randint(1000000, 50000000),
                "technology_node": random.choice(["3nm", "5nm", "7nm", "14nm", "28nm", "65nm", "N/A"]),
                "lead_time_days": random.randint(30, 180),
                "quality_yield": round(random.uniform(0.85, 0.99), 3)
            }
        )

    def _generate_subassembly_producer(self) -> Node:
        """Generate a subassembly producer node"""
        country = random.choice(self.COUNTRIES)
        self.node_counter += 1

        return Node(
            id=f"SUBA-{self.node_counter:04d}",
            label="SubassemblyProducer",
            tier=3,
            properties={
                "name": f"{country} Subassembly Plant #{self.node_counter}",
                "country": country,
                "subassembly_type": random.choice([
                    "Display Module", "Camera System", "Battery Pack", "Logic Board",
                    "Power System", "Cooling System", "Audio System"
                ]),
                "production_capacity_units": random.randint(500000, 10000000),
                "automation_level": round(random.uniform(0.3, 0.95), 2),
                "employees": random.randint(500, 5000)
            }
        )

    def _generate_module_assembler(self) -> Node:
        """Generate a module assembler node"""
        country = random.choice(self.COUNTRIES)
        self.node_counter += 1

        certs = []
        if random.random() > 0.4:
            certs.append("ISO9001")
        if random.random() > 0.5:
            certs.append("ISO14001")
        if random.random() > 0.6:
            certs.append("SA8000")

        return Node(
            id=f"MODA-{self.node_counter:04d}",
            label="ModuleAssembler",
            tier=2,
            properties={
                "name": f"{country} Module Assembly #{self.node_counter}",
                "country": country,
                "module_type": random.choice([
                    "Complete Device Module", "Main Board Assembly",
                    "Housing Assembly", "Testing Module", "Packaging Module"
                ]),
                "capacity_units_day": random.randint(10000, 500000),
                "quality_control_stages": random.randint(3, 12),
                "certifications": certs
            }
        )

    def _generate_final_assembler(self) -> Node:
        """Generate a final assembler node"""
        country = random.choice(self.COUNTRIES)
        self.node_counter += 1

        customers = []
        if random.random() > 0.5:
            customers.append("Brand A")
        if random.random() > 0.5:
            customers.append("Brand B")
        if random.random() > 0.5:
            customers.append("Brand C")

        return Node(
            id=f"FINA-{self.node_counter:04d}",
            label="FinalAssembler",
            tier=1,
            properties={
                "name": f"{country} Final Assembly #{self.node_counter}",
                "country": country,
                "factory_type": random.choice([
                    "Contract Manufacturer", "ODM", "OEM Facility", "EMS Provider"
                ]),
                "capacity_units_day": random.randint(50000, 1000000),
                "workforce": random.randint(5000, 200000),
                "main_customers": customers
            }
        )

    def _generate_oem(self) -> Node:
        """Generate an OEM/Brand node"""
        country = random.choice(self.COUNTRIES)
        self.node_counter += 1

        brand_letter = chr(65 + (self.node_counter % 26))  # A-Z

        products = []
        if random.random() > 0.5:
            products.append("Smartphones")
        if random.random() > 0.5:
            products.append("Tablets")
        if random.random() > 0.5:
            products.append("Laptops")
        if random.random() > 0.5:
            products.append("Wearables")

        return Node(
            id=f"OEM-{self.node_counter:04d}",
            label="OEM",
            tier=0,
            properties={
                "name": f"Brand {brand_letter} Corporation",
                "headquarters": country,
                "brand_tier": random.choice(["Premium", "Mid-Range", "Budget", "Luxury"]),
                "annual_sales_millions": random.randint(1000, 500000),
                "market_share_percent": round(random.uniform(0.5, 20.0), 2),
                "founded_year": random.randint(1960, 2015),
                "products": products if products else ["Smartphones"]
            }
        )

    def _generate_relationships(
        self,
        from_nodes: List[Node],
        to_nodes: List[Node],
        from_tier: int,
        complexity_level: int
    ) -> List[Relationship]:
        """Generate relationships between two tiers"""
        relationships = []

        # Each downstream node gets multiple suppliers
        suppliers_per_node = max(1, complexity_level // 2)

        # Relationship type based on tier
        rel_types = {
            7: "SUPPLIES_ORE",
            6: "SUPPLIES_PROCESSED",
            5: "SUPPLIES_MATERIAL",
            4: "SUPPLIES_COMPONENT",
            3: "SUPPLIES_SUBASSEMBLY",
            2: "SUPPLIES_MODULE",
            1: "MANUFACTURES_FOR"
        }
        rel_type = rel_types.get(from_tier, "SUPPLIES")

        for to_node in to_nodes:
            # Select random suppliers
            suppliers = random.sample(from_nodes, min(suppliers_per_node, len(from_nodes)))

            for from_node in suppliers:
                rel = Relationship(
                    rel_type=rel_type,
                    from_id=from_node.id,
                    to_id=to_node.id,
                    properties={
                        "volume_units_year": random.randint(10000, 5000000),
                        "contract_start_year": random.randint(2015, 2024),
                        "lead_time_days": random.randint(7, 120),
                        "quality_rating": round(random.uniform(8.0, 10.0), 2),
                        "primary_supplier": random.random() > 0.7
                    }
                )
                relationships.append(rel)

        return relationships


def main():
    """Main entry point"""
    parser = argparse.ArgumentParser(
        description="Generate massive supply chain graphs for Neo4j"
    )
    parser.add_argument(
        "-c", "--complexity",
        type=int,
        default=5,
        help="Complexity level (1-10, default: 5)"
    )
    parser.add_argument(
        "-s", "--seed",
        type=int,
        default=12345,
        help="Random seed for reproducibility (default: 12345)"
    )
    parser.add_argument(
        "-o", "--output",
        type=str,
        default="supply_chain.cypher",
        help="Output file path (default: supply_chain.cypher)"
    )
    parser.add_argument(
        "--clear",
        action="store_true",
        help="Include database clear statement"
    )

    args = parser.parse_args()

    # Validate complexity
    if not 1 <= args.complexity <= 10:
        print("Error: Complexity must be between 1 and 10")
        return 1

    print("=" * 70)
    print("Supply Chain Generator for Neo4j")
    print("=" * 70)
    print()

    # Generate graph
    generator = SupplyChainGenerator(seed=args.seed)
    graph = generator.generate(complexity_level=args.complexity)

    # Export to Cypher
    print(f"\nExporting to {args.output}...")
    cypher_output = graph.to_cypher(clear_database=args.clear)

    with open(args.output, 'w', encoding='utf-8') as f:
        f.write(cypher_output)

    print(f"[OK] Successfully wrote {len(cypher_output)} characters to {args.output}")
    print()
    print("To load into Neo4j:")
    print(f"  cat {args.output} | cypher-shell -u neo4j -p your-password")
    print()

    return 0


if __name__ == "__main__":
    exit(main())
