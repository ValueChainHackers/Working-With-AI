# Supply Chain Generator - Task Breakdown

## Phase 1: Foundation & Core Models (MVP)

### Task 1.1: Project Setup
- [ ] Create .NET 8 console application
- [ ] Add Terminal.Gui v2 NuGet package
- [ ] Add System.Text.Json for JSON handling
- [ ] Set up project structure (Models, Engines, UI, Utils)
- [ ] Create .gitignore
- [ ] Initialize README.md

**Estimated Time**: 30 minutes

---

### Task 1.2: Core Data Models
- [ ] Create `Node.cs` - represents a supply chain entity
- [ ] Create `Relationship.cs` - represents connections between nodes
- [ ] Create `SupplyChainGraph.cs` - container for nodes and relationships
- [ ] Create `PropertyDefinition.cs` - defines node/relationship properties
- [ ] Create `NodeType.cs` - template for types of nodes
- [ ] Create `RelationshipRule.cs` - rules for generating relationships

**Files to Create**:
```
Models/
├── Node.cs
├── Relationship.cs
├── SupplyChainGraph.cs
├── PropertyDefinition.cs
├── NodeType.cs
└── RelationshipRule.cs
```

**Estimated Time**: 1 hour

---

### Task 1.3: Template Model
- [ ] Create `SupplyChainTemplate.cs`
- [ ] Create `Tier.cs` - represents supply chain tier
- [ ] Create `RelationshipCardinality` enum
- [ ] Create `PropertyType` enum
- [ ] Add template validation logic
- [ ] Add JSON serialization attributes

**Files to Create**:
```
Models/
├── Template/
│   ├── SupplyChainTemplate.cs
│   ├── Tier.cs
│   └── Enums.cs
```

**Estimated Time**: 1 hour

---

### Task 1.4: Data Repository Model
- [ ] Create `DataRepository.cs` - container for all data
- [ ] Create `CompanyData.cs` - company information
- [ ] Create `MineData.cs` - mine/facility information
- [ ] Create `FacilityData.cs` - generic facility data
- [ ] Create `CountryData.cs` - country reference data
- [ ] Add indexing for fast lookups

**Files to Create**:
```
Models/
├── Data/
│   ├── DataRepository.cs
│   ├── CompanyData.cs
│   ├── MineData.cs
│   ├── FacilityData.cs
│   └── CountryData.cs
```

**Estimated Time**: 1 hour

---

## Phase 2: Core Engines

### Task 2.1: ID Generator Utility
- [ ] Create `IdGenerator.cs`
- [ ] Implement ID generation strategy (e.g., "MINE-CU-ESC")
- [ ] Ensure uniqueness checking
- [ ] Add ID prefix configuration per node type

**Files to Create**:
```
Utils/
└── IdGenerator.cs
```

**Estimated Time**: 30 minutes

---

### Task 2.2: Template Engine
- [ ] Create `TemplateEngine.cs`
- [ ] Implement `LoadTemplate(string path)` - load from JSON
- [ ] Implement `ValidateTemplate()` - check template consistency
- [ ] Implement `GetAvailableTemplates()` - scan template directory
- [ ] Add error handling and logging

**Files to Create**:
```
Engines/
└── TemplateEngine.cs
```

**Estimated Time**: 1.5 hours

---

### Task 2.3: Data Manager
- [ ] Create `DataManager.cs`
- [ ] Implement `LoadRepository(string path)` - load from JSON
- [ ] Implement `SaveRepository()` - save to JSON
- [ ] Implement `SearchCompanies()` - query by criteria
- [ ] Implement `SearchMines()` - query by material
- [ ] Add caching for performance

**Files to Create**:
```
Engines/
└── DataManager.cs
```

**Estimated Time**: 2 hours

---

### Task 2.4: Graph Generator (Core Logic)
- [ ] Create `GraphGenerator.cs`
- [ ] Implement `Generate()` - main generation method
- [ ] Implement `GenerateTier()` - create nodes for a tier
- [ ] Implement `GenerateRelationships()` - create relationships based on rules
- [ ] Implement `ApplyBusinessRules()` - apply constraints (e.g., geographic proximity)
- [ ] Add randomization with seed support
- [ ] Add progress callbacks for UI

**Files to Create**:
```
Engines/
└── GraphGenerator.cs
```

**Key Algorithms**:
```
GenerateTier(tier, dataRepository):
    1. For each NodeType in tier:
        a. Determine count (between MinCount and MaxCount)
        b. Select data from repository (mines, companies, etc.)
        c. Create Node instances with generated IDs
        d. Populate properties from data + template
    2. Return list of nodes

GenerateRelationships(fromNodes, toNodes, rule):
    1. Based on cardinality (OneToMany, ManyToMany):
        a. For each fromNode:
            - Find compatible toNodes (same country, material type, etc.)
            - Create 1-N relationships based on cardinality
            - Populate relationship properties (volume, lead time, etc.)
    2. Return list of relationships

ApplyBusinessRules(graph):
    1. Geographic proximity checks
    2. Material compatibility checks
    3. Capacity balancing (supplier capacity ≥ customer demand)
    4. Ethical sourcing validation
```

**Estimated Time**: 4 hours

---

### Task 2.5: Validator
- [ ] Create `Validator.cs`
- [ ] Create `ValidationResult.cs`
- [ ] Create `ValidationError.cs`
- [ ] Implement `ValidateGraph()` - main validation
- [ ] Implement `CheckOrphanNodes()` - find unconnected nodes
- [ ] Implement `CheckBrokenReferences()` - verify relationship IDs
- [ ] Implement `CheckBusinessLogic()` - custom rules
- [ ] Implement `CheckIdUniqueness()` - ensure no duplicate IDs

**Files to Create**:
```
Engines/
├── Validator.cs
└── ValidationResult.cs
```

**Estimated Time**: 2 hours

---

### Task 2.6: Cypher Generator
- [ ] Create `CypherGenerator.cs`
- [ ] Create `CypherOptions.cs`
- [ ] Implement `GenerateCypher()` - main export method
- [ ] Implement node creation Cypher generation
- [ ] Implement relationship creation Cypher generation
- [ ] Implement index creation statements
- [ ] Implement file partitioning (split large outputs)
- [ ] Add formatting and comments

**Files to Create**:
```
Engines/
├── CypherGenerator.cs
└── CypherOptions.cs
```

**Cypher Generation Strategy**:
```
Output Format:
1. Header comment (metadata, timestamp, config)
2. Database clearing (optional): MATCH (n) DETACH DELETE n;
3. Index creation: CREATE INDEX FOR (n:NodeType) ON (n.id);
4. Node creation: CREATE (n:Label {id: 'ID', prop: 'value', ...})
5. Relationship creation: MATCH (a {id: 'ID1'}), (b {id: 'ID2'}) CREATE (a)-[:REL {props}]->(b);
6. Footer comment (statistics)
```

**Estimated Time**: 2 hours

---

## Phase 3: Terminal.Gui UI

### Task 3.1: Main Window Layout
- [ ] Create `MainWindow.cs`
- [ ] Set up window layout (template selector, config, preview, log)
- [ ] Add menu bar (File, Edit, Generate, Validate, Export, Help)
- [ ] Add status bar
- [ ] Wire up basic navigation

**Files to Create**:
```
UI/
└── MainWindow.cs
```

**Estimated Time**: 2 hours

---

### Task 3.2: Template Selector Component
- [ ] Create template list view (RadioGroup or ListView)
- [ ] Load available templates from directory
- [ ] Display template description on selection
- [ ] Wire up to TemplateEngine

**Estimated Time**: 1 hour

---

### Task 3.3: Configuration Panel
- [ ] Add complexity slider (1-10)
- [ ] Add checkboxes (ethical data, geopolitical risks, sustainability)
- [ ] Add text field for focus countries (comma-separated)
- [ ] Add random seed input
- [ ] Add output format radio buttons
- [ ] Add output path text field with browse button
- [ ] Wire up configuration to GenerationOptions model

**Estimated Time**: 1.5 hours

---

### Task 3.4: Preview Panel
- [ ] Create tier summary view
- [ ] Update preview when template/config changes
- [ ] Show estimated node/relationship counts
- [ ] Add "Refresh Preview" button

**Estimated Time**: 1 hour

---

### Task 3.5: Log Panel
- [ ] Create `Logger.cs` utility
- [ ] Implement log levels (INFO, WARN, ERROR, SUCCESS)
- [ ] Create TextView for log output
- [ ] Add color coding for log levels
- [ ] Wire up to all engines

**Files to Create**:
```
Utils/
└── Logger.cs
```

**Estimated Time**: 1 hour

---

### Task 3.6: Generate, Validate, Export Actions
- [ ] Implement "Generate" button handler
  - Call GraphGenerator
  - Update preview with actual counts
  - Log progress
- [ ] Implement "Validate" button handler
  - Call Validator
  - Display results in log
  - Show error dialog if validation fails
- [ ] Implement "Export" button handler
  - Call CypherGenerator
  - Write to file
  - Show success message

**Estimated Time**: 2 hours

---

### Task 3.7: Data Editor Window (Optional - can be Phase 4)
- [ ] Create `DataEditorWindow.cs`
- [ ] Implement company/mine list view
- [ ] Implement detail editing form
- [ ] Add search/filter functionality
- [ ] Add CSV import functionality
- [ ] Wire up to DataManager

**Files to Create**:
```
UI/
└── DataEditorWindow.cs
```

**Estimated Time**: 3 hours (can be deferred)

---

## Phase 4: Data Creation

### Task 4.1: Create Smartphone Template
- [ ] Create `data/templates/smartphone.json`
- [ ] Define 8 tiers (7 → 0)
- [ ] Define node types per tier
- [ ] Define relationship rules
- [ ] Test template loading and validation

**Template Structure**:
```json
{
  "name": "Smartphone",
  "description": "Complete smartphone supply chain from mines to OEM",
  "tiers": [
    {
      "tierNumber": 7,
      "name": "Raw Materials",
      "nodeTypes": [
        {
          "label": "Mine",
          "minCount": 20,
          "maxCount": 100,
          "properties": [...]
        }
      ]
    },
    ...
  ],
  "relationshipRules": [...]
}
```

**Estimated Time**: 2 hours

---

### Task 4.2: Create Data Repository
- [ ] Create `data/facilities/mines.json` - 50+ mines
- [ ] Create `data/companies/battery-manufacturers.json` - 10+ companies
- [ ] Create `data/companies/semiconductor-manufacturers.json` - 15+ companies
- [ ] Create `data/companies/display-manufacturers.json` - 8+ companies
- [ ] Create `data/companies/assemblers.json` - 10+ companies
- [ ] Create `data/reference/countries.json` - country metadata
- [ ] Create `data/reference/certifications.json` - certification types

**Data Sources**: Use the detailed data we already created in parts 1-7

**Estimated Time**: 3 hours (mostly copying and formatting existing data)

---

## Phase 5: Testing & Refinement

### Task 5.1: Unit Tests
- [ ] Create test project
- [ ] Test TemplateEngine
- [ ] Test DataManager
- [ ] Test GraphGenerator
- [ ] Test Validator
- [ ] Test CypherGenerator
- [ ] Test IdGenerator

**Estimated Time**: 3 hours

---

### Task 5.2: Integration Testing
- [ ] Generate small supply chain (complexity 1-3)
- [ ] Load generated Cypher into Neo4j
- [ ] Verify all nodes created
- [ ] Verify all relationships created
- [ ] Test validation catches errors
- [ ] Generate large supply chain (complexity 8-10)
- [ ] Verify performance

**Estimated Time**: 2 hours

---

### Task 5.3: Documentation
- [ ] Complete README.md with usage instructions
- [ ] Add code comments
- [ ] Create sample data files
- [ ] Create screenshot/demo GIF
- [ ] Document template format
- [ ] Document data format

**Estimated Time**: 2 hours

---

## Phase 6: Advanced Features (Future)

### Task 6.1: Template Inheritance
- [ ] Allow templates to extend other templates
- [ ] Add template composition

### Task 6.2: Plugin System
- [ ] Custom validators
- [ ] Custom property generators
- [ ] Custom relationship logic

### Task 6.3: Additional Export Formats
- [ ] GraphML export
- [ ] JSON export
- [ ] CSV export (nodes + relationships)

### Task 6.4: Visual Graph Preview
- [ ] Integrate simple graph visualization
- [ ] Show tier structure visually

---

## Total Estimated Time

| Phase | Time |
|-------|------|
| Phase 1: Foundation | ~4 hours |
| Phase 2: Core Engines | ~11.5 hours |
| Phase 3: Terminal.Gui UI | ~11.5 hours |
| Phase 4: Data Creation | ~5 hours |
| Phase 5: Testing & Refinement | ~7 hours |
| **Total MVP** | **~39 hours** |

---

## Implementation Order (Recommended)

1. **Day 1** (4-5 hours):
   - Task 1.1: Project Setup
   - Task 1.2: Core Data Models
   - Task 1.3: Template Model
   - Task 1.4: Data Repository Model

2. **Day 2** (4-5 hours):
   - Task 2.1: ID Generator
   - Task 2.2: Template Engine
   - Task 2.3: Data Manager
   - Task 4.1: Create Smartphone Template (parallel)

3. **Day 3** (5-6 hours):
   - Task 2.4: Graph Generator
   - Task 4.2: Create Data Repository (parallel)

4. **Day 4** (4-5 hours):
   - Task 2.5: Validator
   - Task 2.6: Cypher Generator
   - Task 5.1: Unit Tests (start)

5. **Day 5** (5-6 hours):
   - Task 3.1-3.6: Terminal.Gui UI
   - Task 3.5: Logger

6. **Day 6** (3-4 hours):
   - Task 5.2: Integration Testing
   - Task 5.3: Documentation
   - Polish and bug fixes

**Total: ~25-30 hours of focused work over 6 sessions**

---

## Success Criteria

✅ MVP is complete when:
1. User can load smartphone template
2. User can configure generation options
3. User can generate a supply chain graph
4. Validation catches common errors
5. Cypher export creates valid Neo4j database
6. Generated graph matches complexity of our manual parts 1-7
7. All nodes have unique, correct IDs
8. All relationships reference valid node IDs
9. UI is usable and responsive
10. Code is documented and tested
