#!/bin/bash
# Example usage of the Supply Chain Generator

echo "Supply Chain Generator - Examples"
echo "=================================="
echo ""

# Example 1: Small test chain
echo "1. Generating small test chain (complexity 2)..."
python supply_chain_generator.py -c 2 -o examples/small_chain.cypher
echo ""

# Example 2: Medium chain for development
echo "2. Generating medium chain (complexity 5, default)..."
python supply_chain_generator.py -o examples/medium_chain.cypher
echo ""

# Example 3: Large production chain
echo "3. Generating large chain (complexity 8)..."
python supply_chain_generator.py -c 8 -o examples/large_chain.cypher
echo ""

# Example 4: Massive chain with database clear
echo "4. Generating massive chain (complexity 10, with DB clear)..."
python supply_chain_generator.py -c 10 -o examples/massive_chain.cypher --clear
echo ""

# Example 5: Reproducible chain with custom seed
echo "5. Generating reproducible chain (custom seed)..."
python supply_chain_generator.py -c 5 -s 99999 -o examples/reproducible_chain.cypher
echo ""

echo "All examples generated successfully!"
echo ""
echo "To load into Neo4j:"
echo "  cat examples/small_chain.cypher | cypher-shell -u neo4j -p password"
