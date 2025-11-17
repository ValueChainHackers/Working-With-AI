using System;
using System.Collections.Generic;
using System.Linq;

namespace SupplyChainGen;

public class SupplyChainGenerator
{
    private readonly Random _random;
    private int _nodeCounter = 0;

    // Realistic data for generation
    private readonly string[] _countries = {
        "China", "USA", "South Korea", "Japan", "Taiwan", "Germany",
        "Indonesia", "Chile", "Australia", "Canada", "DRC", "Peru",
        "Vietnam", "Malaysia", "Thailand", "India", "Mexico", "Brazil"
    };

    private readonly string[] _materials = {
        "Copper", "Cobalt", "Lithium", "Nickel", "Rare Earth Elements",
        "Gold", "Silver", "Aluminum", "Silicon", "Tungsten", "Tantalum"
    };

    private readonly string[] _componentTypes = {
        "Battery Cell", "Display Panel", "Processor Chip", "Memory Module",
        "Camera Module", "Circuit Board", "Antenna", "Speaker", "Microphone",
        "Sensor", "Connector", "Capacitor", "Resistor", "Power Management IC"
    };

    private readonly Dictionary<int, string> _tierNames = new()
    {
        { 7, "Raw Materials" },
        { 6, "Processing & Refining" },
        { 5, "Material Production" },
        { 4, "Component Manufacturing" },
        { 3, "Subassembly Production" },
        { 2, "Module Assembly" },
        { 1, "Final Assembly" },
        { 0, "Brand/OEM" }
    };

    public SupplyChainGenerator(int seed = 12345)
    {
        _random = new Random(seed);
    }

    public SupplyChainGraph Generate(int complexityLevel = 5)
    {
        Console.WriteLine($"Generating supply chain with complexity level {complexityLevel}...");

        var graph = new SupplyChainGraph();
        var nodesByTier = new Dictionary<int, List<Node>>();

        // Calculate node counts based on complexity
        // Higher tiers have more nodes (pyramid structure)
        var baseCounts = new Dictionary<int, int>
        {
            { 7, complexityLevel * 15 },  // Mines
            { 6, complexityLevel * 12 },  // Processors
            { 5, complexityLevel * 10 },  // Material producers
            { 4, complexityLevel * 20 },  // Component manufacturers
            { 3, complexityLevel * 15 },  // Subassembly
            { 2, complexityLevel * 10 },  // Module assembly
            { 1, complexityLevel * 5 },   // Final assembly
            { 0, complexityLevel * 2 }    // OEMs
        };

        // Generate nodes tier by tier (bottom up)
        for (int tier = 7; tier >= 0; tier--)
        {
            Console.WriteLine($"  Generating Tier {tier} ({_tierNames[tier]})...");
            var nodes = GenerateTier(tier, baseCounts[tier]);
            nodesByTier[tier] = nodes;
            graph.Nodes.AddRange(nodes);
            Console.WriteLine($"    Created {nodes.Count} nodes");
        }

        // Generate relationships between tiers
        Console.WriteLine("Generating relationships...");
        for (int tier = 7; tier > 0; tier--)
        {
            var fromNodes = nodesByTier[tier];
            var toNodes = nodesByTier[tier - 1];

            var relationships = GenerateRelationships(fromNodes, toNodes, tier, complexityLevel);
            graph.Relationships.AddRange(relationships);

            Console.WriteLine($"    Tier {tier} → {tier - 1}: {relationships.Count} relationships");
        }

        graph.Metadata["generated_at"] = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
        graph.Metadata["complexity_level"] = complexityLevel.ToString();
        graph.Metadata["total_nodes"] = graph.Nodes.Count.ToString();
        graph.Metadata["total_relationships"] = graph.Relationships.Count.ToString();

        Console.WriteLine($"\nGeneration complete!");
        Console.WriteLine($"  Total Nodes: {graph.Nodes.Count}");
        Console.WriteLine($"  Total Relationships: {graph.Relationships.Count}");

        return graph;
    }

    private List<Node> GenerateTier(int tier, int count)
    {
        var nodes = new List<Node>();

        for (int i = 0; i < count; i++)
        {
            var node = tier switch
            {
                7 => GenerateMine(),
                6 => GenerateProcessor(),
                5 => GenerateMaterialProducer(),
                4 => GenerateComponentManufacturer(),
                3 => GenerateSubassemblyProducer(),
                2 => GenerateModuleAssembler(),
                1 => GenerateFinalAssembler(),
                0 => GenerateOEM(),
                _ => throw new ArgumentException($"Invalid tier: {tier}")
            };

            node.Tier = tier;
            nodes.Add(node);
        }

        return nodes;
    }

    private Node GenerateMine()
    {
        var material = _materials[_random.Next(_materials.Length)];
        var country = _countries[_random.Next(_countries.Length)];
        var id = $"MINE-{material.Replace(" ", "").ToUpper().Substring(0, Math.Min(3, material.Length))}-{++_nodeCounter:D4}";

        return new Node
        {
            Id = id,
            Label = "Mine",
            Properties = new Dictionary<string, object>
            {
                { "name", $"{country} {material} Mine #{_nodeCounter}" },
                { "country", country },
                { "material", material },
                { "capacity_tonnes_year", _random.Next(10000, 500000) },
                { "operating_since", _random.Next(1980, 2020) },
                { "latitude", _random.NextDouble() * 180 - 90 },
                { "longitude", _random.NextDouble() * 360 - 180 },
                { "ethical_certification", _random.Next(100) > 50 },
                { "environmental_score", _random.Next(1, 11) }
            }
        };
    }

    private Node GenerateProcessor()
    {
        var country = _countries[_random.Next(_countries.Length)];
        var id = $"PROC-{++_nodeCounter:D4}";

        return new Node
        {
            Id = id,
            Label = "Processor",
            Properties = new Dictionary<string, object>
            {
                { "name", $"{country} Processing Facility #{_nodeCounter}" },
                { "country", country },
                { "process_type", PickRandom("Smelting", "Refining", "Chemical Processing", "Purification") },
                { "capacity_tonnes_year", _random.Next(50000, 1000000) },
                { "purity_level", _random.NextDouble() * 0.1 + 0.9 },
                { "energy_source", PickRandom("Coal", "Natural Gas", "Renewable", "Nuclear", "Mixed") },
                { "iso_certified", _random.Next(100) > 30 }
            }
        };
    }

    private Node GenerateMaterialProducer()
    {
        var country = _countries[_random.Next(_countries.Length)];
        var id = $"MATP-{++_nodeCounter:D4}";

        return new Node
        {
            Id = id,
            Label = "MaterialProducer",
            Properties = new Dictionary<string, object>
            {
                { "name", $"{country} Materials Co. #{_nodeCounter}" },
                { "country", country },
                { "material_type", PickRandom("Alloy", "Compound", "Polymer", "Ceramic", "Composite") },
                { "production_capacity_tonnes", _random.Next(10000, 200000) },
                { "quality_grade", PickRandom("Industrial", "Commercial", "Premium", "Ultra-Pure") },
                { "certifications", new[] { "ISO9001", "ISO14001", "IATF16949" }.Where(_ => _random.Next(100) > 50).ToArray() }
            }
        };
    }

    private Node GenerateComponentManufacturer()
    {
        var country = _countries[_random.Next(_countries.Length)];
        var component = _componentTypes[_random.Next(_componentTypes.Length)];
        var id = $"COMP-{component.Replace(" ", "").ToUpper().Substring(0, Math.Min(4, component.Length))}-{++_nodeCounter:D4}";

        return new Node
        {
            Id = id,
            Label = "ComponentManufacturer",
            Properties = new Dictionary<string, object>
            {
                { "name", $"{country} {component} Manufacturer" },
                { "country", country },
                { "component_type", component },
                { "annual_production_units", _random.Next(1000000, 50000000) },
                { "technology_node", PickRandom("3nm", "5nm", "7nm", "14nm", "28nm", "N/A") },
                { "lead_time_days", _random.Next(30, 180) },
                { "quality_yield", _random.NextDouble() * 0.15 + 0.85 }
            }
        };
    }

    private Node GenerateSubassemblyProducer()
    {
        var country = _countries[_random.Next(_countries.Length)];
        var id = $"SUBA-{++_nodeCounter:D4}";

        return new Node
        {
            Id = id,
            Label = "SubassemblyProducer",
            Properties = new Dictionary<string, object>
            {
                { "name", $"{country} Subassembly Plant #{_nodeCounter}" },
                { "country", country },
                { "subassembly_type", PickRandom("Display Module", "Camera System", "Battery Pack", "Logic Board", "Power System") },
                { "production_capacity_units", _random.Next(500000, 10000000) },
                { "automation_level", _random.NextDouble() },
                { "employees", _random.Next(500, 5000) }
            }
        };
    }

    private Node GenerateModuleAssembler()
    {
        var country = _countries[_random.Next(_countries.Length)];
        var id = $"MODA-{++_nodeCounter:D4}";

        return new Node
        {
            Id = id,
            Label = "ModuleAssembler",
            Properties = new Dictionary<string, object>
            {
                { "name", $"{country} Module Assembly #{_nodeCounter}" },
                { "country", country },
                { "module_type", PickRandom("Complete Device Module", "Main Board Assembly", "Housing Assembly", "Testing Module") },
                { "capacity_units_day", _random.Next(10000, 500000) },
                { "quality_control_stages", _random.Next(3, 12) },
                { "certifications", new[] { "ISO9001", "ISO14001", "SA8000" }.Where(_ => _random.Next(100) > 40).ToArray() }
            }
        };
    }

    private Node GenerateFinalAssembler()
    {
        var country = _countries[_random.Next(_countries.Length)];
        var id = $"FINA-{++_nodeCounter:D4}";

        return new Node
        {
            Id = id,
            Label = "FinalAssembler",
            Properties = new Dictionary<string, object>
            {
                { "name", $"{country} Final Assembly #{_nodeCounter}" },
                { "country", country },
                { "factory_type", PickRandom("Contract Manufacturer", "ODM", "OEM Facility") },
                { "capacity_units_day", _random.Next(50000, 1000000) },
                { "workforce", _random.Next(5000, 200000) },
                { "main_customers", new[] { "Brand A", "Brand B", "Brand C" }.Where(_ => _random.Next(100) > 50).ToArray() }
            }
        };
    }

    private Node GenerateOEM()
    {
        var country = _countries[_random.Next(_countries.Length)];
        var id = $"OEM-{++_nodeCounter:D4}";

        return new Node
        {
            Id = id,
            Label = "OEM",
            Properties = new Dictionary<string, object>
            {
                { "name", $"Brand {(char)('A' + _nodeCounter % 26)} Corporation" },
                { "headquarters", country },
                { "brand_tier", PickRandom("Premium", "Mid-Range", "Budget", "Luxury") },
                { "annual_sales_millions", _random.Next(1000, 500000) },
                { "market_share_percent", _random.NextDouble() * 20 },
                { "founded_year", _random.Next(1960, 2015) },
                { "products", new[] { "Smartphones", "Tablets", "Laptops", "Wearables" }.Where(_ => _random.Next(100) > 50).ToArray() }
            }
        };
    }

    private List<Relationship> GenerateRelationships(List<Node> fromNodes, List<Node> toNodes, int fromTier, int complexityLevel)
    {
        var relationships = new List<Relationship>();

        // Each "to" node should have multiple suppliers from the tier above
        var suppliersPerNode = Math.Max(1, complexityLevel / 2);

        foreach (var toNode in toNodes)
        {
            // Select random suppliers
            var suppliers = fromNodes.OrderBy(_ => _random.Next()).Take(suppliersPerNode).ToList();

            foreach (var fromNode in suppliers)
            {
                var relType = fromTier switch
                {
                    7 => "SUPPLIES_ORE",
                    6 => "SUPPLIES_PROCESSED",
                    5 => "SUPPLIES_MATERIAL",
                    4 => "SUPPLIES_COMPONENT",
                    3 => "SUPPLIES_SUBASSEMBLY",
                    2 => "SUPPLIES_MODULE",
                    1 => "MANUFACTURES_FOR",
                    _ => "SUPPLIES"
                };

                var rel = new Relationship
                {
                    Type = relType,
                    FromNodeId = fromNode.Id,
                    ToNodeId = toNode.Id,
                    Properties = new Dictionary<string, object>
                    {
                        { "volume_units_year", _random.Next(10000, 5000000) },
                        { "contract_start_year", _random.Next(2015, 2024) },
                        { "lead_time_days", _random.Next(7, 120) },
                        { "quality_rating", _random.NextDouble() * 2 + 8 }, // 8-10 scale
                        { "primary_supplier", _random.Next(100) > 70 }
                    }
                };

                relationships.Add(rel);
            }
        }

        return relationships;
    }

    private string PickRandom(params string[] options)
    {
        return options[_random.Next(options.Length)];
    }
}
