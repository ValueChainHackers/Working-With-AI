using System;
using System.Collections.Generic;
using System.Linq;

namespace SupplyChainGen;

public class Node
{
    public string Id { get; set; } = string.Empty;
    public string Label { get; set; } = string.Empty;
    public int Tier { get; set; }
    public Dictionary<string, object> Properties { get; set; } = new();

    public string ToCypher()
    {
        var props = new List<string> { $"id: '{Id}'" };
        foreach (var (key, value) in Properties)
        {
            var valueStr = value switch
            {
                string s => $"'{s.Replace("'", "\\'")}'",
                bool b => b.ToString().ToLower(),
                double d => d.ToString("F2"),
                int i => i.ToString(),
                string[] arr => $"[{string.Join(", ", arr.Select(s => $"'{s.Replace("'", "\\'")}'"))}]",
                _ => $"'{value}'"
            };
            props.Add($"{key}: {valueStr}");
        }
        return $"CREATE (:{Label} {{{string.Join(", ", props)}}})";
    }
}

public class Relationship
{
    public string Type { get; set; } = string.Empty;
    public string FromNodeId { get; set; } = string.Empty;
    public string ToNodeId { get; set; } = string.Empty;
    public Dictionary<string, object> Properties { get; set; } = new();

    public string ToCypher()
    {
        var props = "";
        if (Properties.Any())
        {
            var propList = new List<string>();
            foreach (var (key, value) in Properties)
            {
                var valueStr = value switch
                {
                    string s => $"'{s.Replace("'", "\\'")}'",
                    bool b => b.ToString().ToLower(),
                    double d => d.ToString("F2"),
                    int i => i.ToString(),
                    _ => $"'{value}'"
                };
                propList.Add($"{key}: {valueStr}");
            }
            props = $" {{{string.Join(", ", propList)}}}";
        }
        return $"MATCH (a {{id: '{FromNodeId}'}}), (b {{id: '{ToNodeId}'}}) CREATE (a)-[:{Type}{props}]->(b)";
    }
}

public class SupplyChainGraph
{
    public List<Node> Nodes { get; set; } = new();
    public List<Relationship> Relationships { get; set; } = new();
    public Dictionary<string, string> Metadata { get; set; } = new();

    public string ToCypher(bool clearDatabase = false)
    {
        var lines = new List<string>
        {
            "// Supply Chain Graph - Generated " + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"),
            $"// Total Nodes: {Nodes.Count}",
            $"// Total Relationships: {Relationships.Count}",
            ""
        };

        if (clearDatabase)
        {
            lines.Add("// Clear existing data");
            lines.Add("MATCH (n) DETACH DELETE n;");
            lines.Add("");
        }

        lines.Add("// Create indexes for performance");
        var labels = Nodes.Select(n => n.Label).Distinct();
        foreach (var label in labels)
        {
            lines.Add($"CREATE INDEX IF NOT EXISTS FOR (n:{label}) ON (n.id);");
        }
        lines.Add("");

        lines.Add("// Create nodes");
        foreach (var node in Nodes)
        {
            lines.Add(node.ToCypher() + ";");
        }
        lines.Add("");

        lines.Add("// Create relationships");
        foreach (var rel in Relationships)
        {
            lines.Add(rel.ToCypher() + ";");
        }

        return string.Join(Environment.NewLine, lines);
    }
}
