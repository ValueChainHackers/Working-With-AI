#!/usr/bin/env python3
"""
Analyze a generated supply chain Cypher file and display statistics
"""

import sys
import re
from collections import Counter, defaultdict


def analyze_cypher_file(filepath):
    """Analyze a Cypher file and extract statistics"""
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()

    stats = {
        'file_size': len(content),
        'line_count': content.count('\n'),
        'node_count': 0,
        'relationship_count': 0,
        'nodes_by_label': Counter(),
        'relationships_by_type': Counter(),
        'countries': Counter(),
        'materials': Counter(),
        'components': Counter(),
    }

    # Extract metadata from header
    metadata_match = re.search(r'// Total Nodes: (\d+)', content)
    if metadata_match:
        stats['node_count'] = int(metadata_match.group(1))

    metadata_match = re.search(r'// Total Relationships: (\d+)', content)
    if metadata_match:
        stats['relationship_count'] = int(metadata_match.group(1))

    # Count nodes by label
    for label in ['Mine', 'Processor', 'MaterialProducer', 'ComponentManufacturer',
                  'SubassemblyProducer', 'ModuleAssembler', 'FinalAssembler', 'OEM']:
        count = content.count(f'(:{label} ')
        stats['nodes_by_label'][label] = count

    # Count relationships by type
    rel_types = ['SUPPLIES_ORE', 'SUPPLIES_PROCESSED', 'SUPPLIES_MATERIAL',
                 'SUPPLIES_COMPONENT', 'SUPPLIES_SUBASSEMBLY', 'SUPPLIES_MODULE',
                 'MANUFACTURES_FOR']
    for rel_type in rel_types:
        count = content.count(f'[:{rel_type} ')
        stats['relationships_by_type'][rel_type] = count

    # Extract countries (sample - not all)
    country_pattern = r"country: '([^']+)'"
    countries = re.findall(country_pattern, content)
    stats['countries'] = Counter(countries)

    # Extract materials
    material_pattern = r"material: '([^']+)'"
    materials = re.findall(material_pattern, content)
    stats['materials'] = Counter(materials)

    # Extract component types
    component_pattern = r"component_type: '([^']+)'"
    components = re.findall(component_pattern, content)
    stats['components'] = Counter(components)

    return stats


def display_stats(stats, filepath):
    """Display statistics in a nice format"""
    print("=" * 70)
    print(f"Supply Chain Analysis: {filepath}")
    print("=" * 70)
    print()

    print("OVERALL STATISTICS")
    print("-" * 70)
    print(f"File Size:         {stats['file_size']:,} bytes ({stats['file_size'] / 1024:.1f} KB)")
    print(f"Line Count:        {stats['line_count']:,}")
    print(f"Total Nodes:       {stats['node_count']:,}")
    print(f"Total Relationships: {stats['relationship_count']:,}")
    print()

    print("NODES BY TIER")
    print("-" * 70)
    tier_info = [
        (7, "Mine", "Raw Materials"),
        (6, "Processor", "Processing & Refining"),
        (5, "MaterialProducer", "Material Production"),
        (4, "ComponentManufacturer", "Component Manufacturing"),
        (3, "SubassemblyProducer", "Subassembly Production"),
        (2, "ModuleAssembler", "Module Assembly"),
        (1, "FinalAssembler", "Final Assembly"),
        (0, "OEM", "Brand/OEM")
    ]

    for tier, label, name in tier_info:
        count = stats['nodes_by_label'][label]
        bar = "#" * min(50, count // 2)
        print(f"Tier {tier} ({name:25s}): {count:4d} {bar}")
    print()

    print("RELATIONSHIPS BY TYPE")
    print("-" * 70)
    for rel_type, count in stats['relationships_by_type'].most_common():
        bar = "#" * min(50, count // 20)
        print(f"{rel_type:25s}: {count:4d} {bar}")
    print()

    if stats['countries']:
        print("TOP 10 COUNTRIES")
        print("-" * 70)
        for country, count in stats['countries'].most_common(10):
            bar = "#" * min(40, count // 5)
            print(f"{country:20s}: {count:4d} {bar}")
        print()

    if stats['materials']:
        print("TOP MATERIALS")
        print("-" * 70)
        for material, count in stats['materials'].most_common(10):
            bar = "#" * min(40, count // 2)
            print(f"{material:25s}: {count:4d} {bar}")
        print()

    if stats['components']:
        print("TOP COMPONENT TYPES")
        print("-" * 70)
        for component, count in stats['components'].most_common(10):
            bar = "#" * min(40, count // 2)
            print(f"{component:30s}: {count:4d} {bar}")
        print()

    # Complexity estimate
    avg_suppliers = stats['relationship_count'] / max(1, stats['node_count']) if stats['node_count'] > 0 else 0
    print("COMPLEXITY METRICS")
    print("-" * 70)
    print(f"Average Suppliers per Node: {avg_suppliers:.2f}")
    print(f"Graph Density: {avg_suppliers / stats['node_count'] * 100:.4f}%" if stats['node_count'] > 0 else "N/A")
    print()


def main():
    if len(sys.argv) < 2:
        print("Usage: python analyze_chain.py <cypher_file>")
        print()
        print("Example:")
        print("  python analyze_chain.py supply_chain.cypher")
        sys.exit(1)

    filepath = sys.argv[1]

    try:
        stats = analyze_cypher_file(filepath)
        display_stats(stats, filepath)
    except FileNotFoundError:
        print(f"Error: File '{filepath}' not found")
        sys.exit(1)
    except Exception as e:
        print(f"Error analyzing file: {e}")
        sys.exit(1)


if __name__ == "__main__":
    main()
