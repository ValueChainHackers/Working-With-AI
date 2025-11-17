# Supply Chain Generator - Design Document

## Overview
A Terminal.Gui v2 application that generates realistic, complex supply chain graphs for Neo4j databases. The application uses templates, data models, and configurable parameters to create accurate supply chains without manual coding.

## Problem Statement
Manually creating complex supply chain Cypher files is:
- Time-consuming and error-prone
- Difficult to maintain consistency across thousands of nodes
- Hard to validate relationships between tiers
- Prone to ID mismatches and broken references
- Not reusable for different industries or scenarios

## Solution
A data-driven generator that:
1. Defines supply chain templates (smartphone, automotive, electronics, etc.)
2. Uses data files (JSON/YAML) for company/mine information
3. Validates relationships and IDs automatically
4. Generates consistent, correct Cypher output
5. Provides visual feedback and progress tracking
6. Allows customization and extension

## Architecture

### High-Level Components

```
┌─────────────────────────────────────────────────────────┐
│                    Terminal.Gui UI                      │
│  ┌─────────────┐  ┌──────────────┐  ┌───────────────┐ │
│  │   Template  │  │     Data     │  │   Generate    │ │
│  │   Selector  │  │   Editor     │  │   & Export    │ │
│  └─────────────┘  └──────────────┘  └───────────────┘ │
└─────────────────────────────────────────────────────────┘
                            │
        ┌───────────────────┼───────────────────┐
        ▼                   ▼                   ▼
┌──────────────┐    ┌──────────────┐    ┌──────────────┐
│   Template   │    │     Data     │    │   Cypher     │
│    Engine    │    │   Manager    │    │  Generator   │
└──────────────┘    └──────────────┘    └──────────────┘
        │                   │                   │
        └───────────────────┼───────────────────┘
                            ▼
                    ┌──────────────┐
                    │  Validator   │
                    └──────────────┘
                            │
                            ▼
                    ┌──────────────┐
                    │ File Output  │
                    └──────────────┘
```

### Data Model

#### 1. Supply Chain Template
Defines the structure of a supply chain type.

```csharp
class SupplyChainTemplate
{
    string Name { get; set; }                    // "Smartphone", "Automotive", etc.
    string Description { get; set; }
    List<Tier> Tiers { get; set; }              // Ordered tiers (7 → 0)
    List<RelationshipRule> RelationshipRules { get; set; }
}

class Tier
{
    int TierNumber { get; set; }                 // 7, 6, 5, ... 0
    string Name { get; set; }                    // "Raw Materials", "Processing", etc.
    List<NodeType> NodeTypes { get; set; }       // What kinds of nodes exist here
}

class NodeType
{
    string Label { get; set; }                   // "Mine", "Smelter", "ComponentMfg", etc.
    List<PropertyDefinition> Properties { get; set; }
    int MinCount { get; set; }                   // Minimum instances
    int MaxCount { get; set; }                   // Maximum instances
}

class PropertyDefinition
{
    string Name { get; set; }
    PropertyType Type { get; set; }              // String, Number, Boolean, Array, etc.
    bool Required { get; set; }
    object DefaultValue { get; set; }
    List<string> PossibleValues { get; set; }    // For enums
    string GenerationStrategy { get; set; }      // "FromData", "Random", "Calculated"
}

class RelationshipRule
{
    string Name { get; set; }                    // "SUPPLIES", "MANUFACTURES", etc.
    int FromTier { get; set; }
    string FromNodeType { get; set; }
    int ToTier { get; set; }
    string ToNodeType { get; set; }
    RelationshipCardinality Cardinality { get; set; }  // OneToOne, OneToMany, ManyToMany
    List<PropertyDefinition> Properties { get; set; }
    List<string> ValidationRules { get; set; }   // "Must be in same country", etc.
}
```

#### 2. Data Repository
Stores real-world data about companies, mines, facilities.

```csharp
class DataRepository
{
    Dictionary<string, List<CompanyData>> CompaniesByIndustry { get; set; }
    Dictionary<string, List<MineData>> MinesByMaterial { get; set; }
    Dictionary<string, List<FacilityData>> FacilitiesByType { get; set; }
    Dictionary<string, CountryData> Countries { get; set; }
}

class CompanyData
{
    string Name { get; set; }
    string Country { get; set; }
    string Headquarters { get; set; }
    decimal[] Coordinates { get; set; }
    string Industry { get; set; }
    Dictionary<string, object> Properties { get; set; }  // Flexible properties
    List<string> Products { get; set; }
    List<string> Customers { get; set; }
    List<string> Certifications { get; set; }
}

class MineData
{
    string Name { get; set; }
    string Country { get; set; }
    string Material { get; set; }
    decimal[] Coordinates { get; set; }
    Dictionary<string, object> Properties { get; set; }
}
```

#### 3. Generated Graph Model
The in-memory representation before Cypher generation.

```csharp
class SupplyChainGraph
{
    List<Node> Nodes { get; set; }
    List<Relationship> Relationships { get; set; }
    Dictionary<string, string> Metadata { get; set; }

    void Validate();
    string ToCypher();
}

class Node
{
    string Id { get; set; }                      // Generated unique ID
    string Label { get; set; }                   // "Mine", "Smelter", etc.
    int Tier { get; set; }
    Dictionary<string, object> Properties { get; set; }
}

class Relationship
{
    string Type { get; set; }                    // "SUPPLIES", etc.
    string FromNodeId { get; set; }
    string ToNodeId { get; set; }
    Dictionary<string, object> Properties { get; set; }
}
```

### Core Engines

#### 1. Template Engine
```csharp
class TemplateEngine
{
    SupplyChainTemplate LoadTemplate(string path);
    void ValidateTemplate(SupplyChainTemplate template);
    List<string> GetAvailableTemplates();
}
```

#### 2. Data Manager
```csharp
class DataManager
{
    DataRepository LoadRepository(string path);
    void SaveRepository(DataRepository repo, string path);
    void AddCompany(CompanyData company);
    void AddMine(MineData mine);
    List<CompanyData> SearchCompanies(string industry, string country);
    List<MineData> SearchMines(string material);
}
```

#### 3. Graph Generator
```csharp
class GraphGenerator
{
    SupplyChainGraph Generate(SupplyChainTemplate template, DataRepository data, GenerationOptions options);

    // Internal methods
    private List<Node> GenerateTier(Tier tier, DataRepository data);
    private List<Relationship> GenerateRelationships(List<Node> fromNodes, List<Node> toNodes, RelationshipRule rule);
    private void ApplyBusinessRules(SupplyChainGraph graph);
}

class GenerationOptions
{
    int Complexity { get; set; }                 // 1-10 scale
    bool IncludeEthicalData { get; set; }
    bool IncludeGeopoliticalRisks { get; set; }
    List<string> FocusCountries { get; set; }
    int RandomSeed { get; set; }                 // For reproducibility
}
```

#### 4. Validator
```csharp
class Validator
{
    ValidationResult ValidateGraph(SupplyChainGraph graph);

    // Validation checks
    private List<ValidationError> CheckOrphanNodes();
    private List<ValidationError> CheckBrokenReferences();
    private List<ValidationError> CheckBusinessLogic();
    private List<ValidationError> CheckIdUniqueness();
}

class ValidationResult
{
    bool IsValid { get; set; }
    List<ValidationError> Errors { get; set; }
    List<ValidationWarning> Warnings { get; set; }
}
```

#### 5. Cypher Generator
```csharp
class CypherGenerator
{
    string GenerateCypher(SupplyChainGraph graph, CypherOptions options);

    // Output formats
    string GenerateNodesOnly();
    string GenerateRelationshipsOnly();
    string GeneratePartitionedOutput(int partitionSize);  // Multiple files
}

class CypherOptions
{
    bool CreateIndexes { get; set; }
    bool ClearDatabase { get; set; }
    bool UseParameters { get; set; }
    int NodesPerFile { get; set; }               // For splitting large outputs
    string OutputFormat { get; set; }            // "Single", "ByTier", "ByNodeType"
}
```

## User Interface (Terminal.Gui)

### Main Window Layout

```
┌─ Supply Chain Generator ────────────────────────────────────┐
│ File  Edit  Generate  Validate  Export  Help                │
├──────────────────────────────────────────────────────────────┤
│ ┌─ Template ────────┐ ┌─ Configuration ──────────────────┐ │
│ │ ○ Smartphone      │ │ Complexity: [====    ] 7/10     │ │
│ │ ○ Automotive      │ │                                  │ │
│ │ ○ Solar Panel     │ │ ☑ Include ethical data          │ │
│ │ ○ Electronics     │ │ ☑ Include geopolitical risks    │ │
│ │ ○ Custom...       │ │ ☐ Include sustainability        │ │
│ └───────────────────┘ │                                  │ │
│                       │ Focus Countries:                 │ │
│ ┌─ Data Source ─────┐ │ [China, USA, South Korea]       │ │
│ │ Repository:       │ │                                  │ │
│ │ [./data/mines.json│ │ Random Seed: [12345    ]        │ │
│ │                   │ │                                  │ │
│ │ [Browse...] [Edit]│ │ Output Format:                  │ │
│ └───────────────────┘ │ ○ Single file                   │ │
│                       │ ○ By tier (8 files)             │ │
│ ┌─ Preview ─────────┐ │ ○ By node type                  │ │
│ │ Tier 7: 65 mines  │ │                                  │ │
│ │ Tier 6: 42 proc.  │ │ Output Path:                    │ │
│ │ Tier 5: 28 mats   │ │ [./output/supply-chain.cypher ] │ │
│ │ Tier 4: 85 comps  │ │                                  │ │
│ │ ...               │ │ [Generate] [Validate] [Export] │ │
│ └───────────────────┘ └──────────────────────────────────┘ │
│                                                              │
│ ┌─ Log / Output ──────────────────────────────────────────┐ │
│ │ [INFO] Loaded template: Smartphone                     │ │
│ │ [INFO] Loaded data: 156 companies, 89 mines            │ │
│ │ [INFO] Generating Tier 7 (Mines): 65 nodes...          │ │
│ │ [INFO] Generating Tier 6 (Processors): 42 nodes...     │ │
│ │ [WARN] No cobalt mine data for Canada                  │ │
│ │ [INFO] Generating relationships: SUPPLIES (127)        │ │
│ │ [SUCCESS] Generated 487 nodes, 1243 relationships      │ │
│ │                                                         │ │
│ └─────────────────────────────────────────────────────────┘ │
└──────────────────────────────────────────────────────────────┘
 Status: Ready | Nodes: 487 | Relationships: 1243 | Valid ✓
```

### Data Editor Window

```
┌─ Data Repository Editor ─────────────────────────────────────┐
│ Category: [Companies ▼] [Mines] [Facilities] [Countries]    │
├──────────────────────────────────────────────────────────────┤
│ ┌─ Companies ──────────────────┐ ┌─ Details ───────────────┐ │
│ │ ☐ CATL                       │ │ Name: CATL              │ │
│ │ ☐ LG Energy Solution         │ │ Full Name:              │ │
│ │ ☑ Samsung SDI                │ │ Contemporary Amperex... │ │
│ │ ☐ Panasonic Energy           │ │                         │ │
│ │ ☐ BYD Battery                │ │ Country: [China     ▼] │ │
│ │ ☐ TSMC                       │ │ HQ: Ningde, Fujian     │ │
│ │ ☐ Foxconn                    │ │ Coordinates:           │ │
│ │ ...                          │ │   Lat: [26.6617]       │ │
│ │                              │ │   Lon: [119.5478]      │ │
│ │ [New] [Delete] [Import CSV] │ │                         │ │
│ └──────────────────────────────┘ │ Industry:              │ │
│                                   │ [Battery Cells     ▼] │ │
│ ┌─ Search / Filter ─────────────┐ │                         │ │
│ │ Search: [____________________]│ │ Products:              │ │
│ │ Country: [All ▼]              │ │ • NMC 811 cells       │ │
│ │ Industry: [All ▼]             │ │ • LFP cells           │ │
│ │                               │ │ • CTP battery packs   │ │
│ │ [Search]                      │ │                         │ │
│ └───────────────────────────────┘ │ [Add Product]          │ │
│                                   │                         │ │
│                                   │ Capacity:              │ │
│                                   │ [450] GWh/year         │ │
│                                   │                         │ │
│                                   │ [Save] [Cancel] [Copy] │ │
│                                   └─────────────────────────┘ │
└──────────────────────────────────────────────────────────────┘
```

## File Structure

```
SupplyChainGenerator/
├── README.md
├── DESIGN.md                          # This file
├── TASKS.md                           # Task breakdown
├── SupplyChainGenerator.sln
├── src/
│   ├── SupplyChainGenerator/
│   │   ├── Program.cs
│   │   ├── SupplyChainGenerator.csproj
│   │   ├── Models/
│   │   │   ├── Template.cs
│   │   │   ├── DataRepository.cs
│   │   │   ├── Graph.cs
│   │   │   └── Configuration.cs
│   │   ├── Engines/
│   │   │   ├── TemplateEngine.cs
│   │   │   ├── DataManager.cs
│   │   │   ├── GraphGenerator.cs
│   │   │   ├── Validator.cs
│   │   │   └── CypherGenerator.cs
│   │   ├── UI/
│   │   │   ├── MainWindow.cs
│   │   │   ├── DataEditorWindow.cs
│   │   │   ├── TemplateEditorWindow.cs
│   │   │   └── ExportDialog.cs
│   │   └── Utils/
│   │       ├── IdGenerator.cs
│   │       ├── Logger.cs
│   │       └── FileUtils.cs
│   └── SupplyChainGenerator.Tests/
│       ├── SupplyChainGenerator.Tests.csproj
│       ├── TemplateEngineTests.cs
│       ├── GraphGeneratorTests.cs
│       └── ValidatorTests.cs
├── data/
│   ├── templates/
│   │   ├── smartphone.json
│   │   ├── automotive.json
│   │   └── electronics.json
│   ├── companies/
│   │   ├── battery-manufacturers.json
│   │   ├── semiconductor-manufacturers.json
│   │   ├── display-manufacturers.json
│   │   └── assemblers.json
│   ├── facilities/
│   │   ├── mines.json
│   │   ├── smelters.json
│   │   └── refineries.json
│   └── reference/
│       ├── countries.json
│       └── certifications.json
└── output/
    └── .gitkeep
```

## Key Features

### 1. Template System
- Pre-built templates for common supply chains
- Custom template creation via UI or JSON
- Template validation and testing
- Template versioning

### 2. Data Management
- CSV/JSON import for bulk data
- Interactive data editor
- Data validation (coordinates, names, IDs)
- Reference data (countries, industries, certifications)

### 3. Generation
- Complexity scaling (simple to extremely detailed)
- Smart relationship generation based on business logic
- Randomization with seed for reproducibility
- Progressive generation with live preview

### 4. Validation
- Orphan node detection
- Broken reference detection
- Business rule validation (e.g., "DRC cobalt must have ethical certification")
- Duplicate ID detection
- Cardinality validation

### 5. Export
- Single file or partitioned output
- Neo4j-ready Cypher
- GraphML export
- JSON export for other tools
- Documentation generation

### 6. Extensibility
- Plugin system for custom validators
- Custom relationship rules
- Custom property generators
- Template inheritance

## Benefits

1. **Accuracy**: Automated ID generation prevents mismatches
2. **Maintainability**: Update data files, not thousands of lines of Cypher
3. **Reusability**: Templates work for any industry
4. **Scalability**: Generate 100 or 10,000 nodes with same effort
5. **Validation**: Catch errors before loading to Neo4j
6. **Speed**: Generate complex graphs in seconds
7. **Documentation**: Self-documenting with metadata

## Next Steps
1. Create detailed task breakdown (TASKS.md)
2. Write pseudocode for core engines
3. Implement MVP with Terminal.Gui
4. Test with smartphone supply chain
5. Extend with additional templates
