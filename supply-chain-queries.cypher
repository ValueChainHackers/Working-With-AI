// ==================== VISUALIZATION QUERIES ====================

// 1. FULL SUPPLY CHAIN NETWORK
MATCH path = (prod:Product)-[*]-(n)
RETURN path
LIMIT 500;

// 2. COMPLETE TRACEABILITY - PRODUCT TO MINES
MATCH path = (prod:Product)<-[:MANUFACTURES]-(oem:OEM)
             <-[:SUPPLIES_MODULE]-(mod:ModuleAssembler)
             <-[:DELIVERS_TO]-(comp:ComponentMfg)
             <-[:SUPPLIES_COMPONENT]-(mat:MaterialSupplier)
             <-[:PROVIDES]-(proc:Processor)
             <-[:SUPPLIES]-(mine:Mine)
RETURN path
LIMIT 100;

// 3. TIER VISUALIZATION - ALL LEVELS
MATCH (prod:Product)
OPTIONAL MATCH (prod)<-[:MANUFACTURES]-(tier0:OEM)
OPTIONAL MATCH (tier0)<-[:SUPPLIES_MODULE]-(tier1:ModuleAssembler)
OPTIONAL MATCH (tier1)<-[:DELIVERS_TO]-(tier2:ComponentMfg)
OPTIONAL MATCH (tier2)<-[:SUPPLIES_COMPONENT]-(tier3:MaterialSupplier)
OPTIONAL MATCH (tier3)<-[:PROVIDES]-(tier4:Processor)
OPTIONAL MATCH (tier4)<-[:SUPPLIES]-(tier5:Mine)
RETURN prod, tier0, tier1, tier2, tier3, tier4, tier5;

// 4. BATTERY SUPPLY CHAIN DEEP DIVE
MATCH path = (prod:Product)<-[:MANUFACTURES]-(oem)
             <-[:SUPPLIES_MODULE]-(mod {module: 'Battery Pack'})
             <-[:DELIVERS_TO]-(comp:ComponentMfg {product: 'Li-ion Battery Cell 5000mAh'})
             <-[:SUPPLIES_COMPONENT]-(mat)
             <-[:PROVIDES]-(proc)
             <-[:SUPPLIES]-(mine)
RETURN path;

// 5. PROCESSOR SUPPLY CHAIN (SEMICONDUCTOR PATH)
MATCH path = (prod:Product)<-[:MANUFACTURES]-(oem)
             <-[:SUPPLIES_MODULE]-(mod)
             <-[:DELIVERS_TO]-(comp:ComponentMfg)
WHERE comp.product CONTAINS 'SoC'
MATCH (comp)<-[:SUPPLIES_COMPONENT]-(mat)
             <-[:PROVIDES]-(proc)
             <-[:SUPPLIES]-(mine)
RETURN path;

// 6. COBALT TRACEABILITY (ETHICAL SOURCING)
MATCH path = (mine:Mine {material: 'Cobalt Ore'})
             -[:SUPPLIES]->(proc:Processor)
             -[:PROVIDES]->(mat:MaterialSupplier)
             -[:SUPPLIES_COMPONENT]->(comp:ComponentMfg)
             -[:DELIVERS_TO]->(mod:ModuleAssembler)
             -[:SUPPLIES_MODULE]->(oem:OEM)
             -[:MANUFACTURES]->(prod:Product)
RETURN path;

// 7. RARE EARTH ELEMENTS FLOW
MATCH path = (mine:Mine)
             -[:SUPPLIES]->(proc:Processor)
             -[:PROVIDES]->(mat:MaterialSupplier)
             -[:SUPPLIES_COMPONENT]->(comp:ComponentMfg)
WHERE mine.material CONTAINS 'Rare Earth'
RETURN path;

// 8. LITHIUM BATTERY MATERIALS COMPLETE PATH
MATCH path = (mine:Mine)
             -[:SUPPLIES]->(proc:Processor)
             -[:PROVIDES]->(mat:MaterialSupplier)
             -[:SUPPLIES_COMPONENT]->(comp:ComponentMfg {product: 'Li-ion Battery Cell 5000mAh'})
WHERE mine.material CONTAINS 'Lithium'
RETURN path;

// 9. DISPLAY MANUFACTURING CHAIN
MATCH path = (mat:MaterialSupplier)
             -[:SUPPLIES_COMPONENT]->(comp:ComponentMfg {product: 'AMOLED Display 6.8"'})
             -[:DELIVERS_TO]->(mod:ModuleAssembler)
             -[:SUPPLIES_MODULE]->(oem:OEM)
             -[:MANUFACTURES]->(prod:Product)
RETURN path;

// 10. COPPER SUPPLY NETWORK (MULTIPLE SOURCES)
MATCH path = (mine:Mine)
             -[:SUPPLIES]->(proc:Processor)
             -[:PROVIDES]->(mat:MaterialSupplier {name: 'Sumitomo Metal Mining'})
             -[:SUPPLIES_COMPONENT]->(comp:ComponentMfg)
WHERE mine.material CONTAINS 'Copper'
RETURN path;

// 11. LOGISTICS & DISTRIBUTION NETWORK
MATCH path = (oem:OEM)
             -[:SHIPS_THROUGH]->(log1:LogisticsHub)
             -[:ROUTES_TO]->(log2:LogisticsHub)
             -[:DELIVERS_TO]->(dist:Distributor)
             -[:DISTRIBUTES_TO]->(retail:RetailChannel)
RETURN path;

// 12. RISK EXPOSURE MAP
MATCH (entity)-[:EXPOSED_TO]->(risk:Risk)
MATCH path = (entity)-[*0..3]-(connected)
RETURN path, risk
LIMIT 150;

// 13. ALTERNATIVE SUPPLIER NETWORK
MATCH (comp:ComponentMfg)-[:HAS_ALTERNATIVE]->(alt:AlternativeSupplier)
MATCH path1 = (comp)<-[*..5]-(upstream)
RETURN path1, comp, alt
LIMIT 100;

// 14. CERTIFICATION & COMPLIANCE VIEW
MATCH path = (entity)-[:CERTIFIED_BY|REQUIRES_CERTIFICATION]->(cert:Certification)
RETURN path;

// 15. SUSTAINABILITY METRICS
MATCH path = (prod:Product)-[:HAS_METRIC]->(sus:SustainabilityMetric)
MATCH path2 = (oem:OEM)-[:ACHIEVES_METRIC]->(sus2:SustainabilityMetric)
RETURN path, path2;

// 16. GEOGRAPHIC CONCENTRATION RISK
MATCH (supplier)-[r]->(entity)
WHERE supplier.country = 'China' OR entity.country = 'China'
RETURN supplier, r, entity
LIMIT 200;

// 17. SINGLE SOURCE DEPENDENCIES
MATCH (comp:ComponentMfg)<-[r:SUPPLIES_COMPONENT]-(mat:MaterialSupplier)
WITH comp, count(mat) as supplierCount
WHERE supplierCount = 1
MATCH path = (comp)<-[:SUPPLIES_COMPONENT]-(mat)
             -[:PROVIDES]->(proc)
             -[:SUPPLIES]->(mine)
RETURN path;

// 18. LONGEST LEAD TIME PATH
MATCH path = (prod:Product)<-[:MANUFACTURES]-(oem)
             <-[r1:SUPPLIES_MODULE]-(mod)
             <-[r2:DELIVERS_TO]-(comp)
             <-[r3:SUPPLIES_COMPONENT]-(mat)
             <-[r4:PROVIDES]-(proc)
             <-[r5:SUPPLIES]-(mine)
WITH path, (r1.lead_time_days + r2.lead_time_days + r3.lead_time_days +
            r4.lead_time_days + r5.contract_type) as totalLeadTime
ORDER BY totalLeadTime DESC
RETURN path
LIMIT 10;

// 19. COST ACCUMULATION VIEW
MATCH path = (mine:Mine)
             -[s:SUPPLIES]->(proc:Processor)
             -[p:PROVIDES]->(mat:MaterialSupplier)
             -[sc:SUPPLIES_COMPONENT]->(comp:ComponentMfg)
             -[d:DELIVERS_TO]->(mod:ModuleAssembler)
             -[sm:SUPPLIES_MODULE]->(oem:OEM)
WHERE mine.id = 'MINE-002'
RETURN path, s.price_per_tonne as mine_cost,
       p.volume_tonnes_year as proc_volume,
       sc.price_per_unit as material_cost,
       d.price as component_cost,
       sm.price as module_cost;

// 20. COMPLETE PRODUCT BOM (BILL OF MATERIALS)
MATCH (prod:Product)<-[:MANUFACTURES]-(oem:OEM)
MATCH (oem)<-[:SUPPLIES_MODULE]-(mod:ModuleAssembler)
MATCH (mod)<-[:DELIVERS_TO]-(comp:ComponentMfg)
RETURN prod.name as Product,
       oem.name as Assembly_Plant,
       mod.specialty as Module,
       comp.product as Component,
       comp.country as Component_Source
ORDER BY mod.specialty, comp.product;

// 21. CRITICAL MINERALS TRACEABILITY
MATCH path = (mine:Mine)-[*]->(prod:Product)
WHERE mine.material IN ['Cobalt Ore', 'Rare Earth Elements', 'Lithium Ore']
RETURN path
LIMIT 100;

// 22. MANUFACTURING CAPACITY ANALYSIS
MATCH (comp:ComponentMfg)-[:DELIVERS_TO]->(mod:ModuleAssembler)
RETURN comp.name as Component_Manufacturer,
       comp.product as Component,
       comp.annual_capacity as Annual_Capacity,
       comp.country as Country,
       collect(DISTINCT mod.name) as Customers
ORDER BY comp.annual_capacity DESC
LIMIT 20;

// 23. MULTI-HOP SUPPLIER DEPENDENCIES
MATCH path = (prod:Product)<-[*5..8]-(deepSupplier)
WHERE deepSupplier:Mine OR deepSupplier:Processor
RETURN path
LIMIT 50;

// 24. TAIWAN SEMICONDUCTOR CONCENTRATION
MATCH path = (entity)-[*]-(connected)
WHERE entity.country = 'Taiwan' AND
      (entity:ComponentMfg OR entity:ModuleAssembler OR entity:MaterialSupplier)
RETURN path
LIMIT 100;

// 25. ENVIRONMENTAL HOTSPOTS
MATCH (mine:Mine)
WHERE mine.ethical_concerns = true
   OR mine.material IN ['Cobalt Ore', 'Rare Earth Elements']
MATCH path = (mine)-[*]->(prod:Product)
RETURN path
LIMIT 50;

// 26. FULL NETWORK STATISTICS
MATCH (n)
RETURN labels(n)[0] as NodeType,
       count(n) as Count,
       collect(DISTINCT n.country)[0..5] as Sample_Countries
ORDER BY Count DESC;

// 27. RELATIONSHIP STATISTICS
MATCH ()-[r]->()
RETURN type(r) as RelationshipType,
       count(r) as Count
ORDER BY Count DESC;

// 28. SUPPLY CHAIN DEPTH ANALYSIS
MATCH path = (prod:Product)<-[*]-(n)
WITH prod, n, length(path) as depth
RETURN labels(n)[0] as NodeType,
       depth,
       count(DISTINCT n) as Count
ORDER BY depth DESC, Count DESC;

// 29. COUNTRY DIVERSIFICATION
MATCH (n)
WHERE n.country IS NOT NULL
RETURN n.country as Country,
       labels(n)[0] as EntityType,
       count(n) as Count
ORDER BY Country, EntityType;

// 30. END-TO-END VISUALIZATION (SIMPLIFIED)
MATCH path = (mine:Mine {id: 'MINE-002'})
             -[:SUPPLIES]->(:Processor)
             -[:PROVIDES]->(:MaterialSupplier)
             -[:SUPPLIES_COMPONENT]->(:ComponentMfg)
             -[:DELIVERS_TO]->(:ModuleAssembler)
             -[:SUPPLIES_MODULE]->(:OEM)
             -[:MANUFACTURES]->(prod:Product)
RETURN path;
