# Context Engineering Template for AI Systems

## 1. Define System Role and Instructions  
- Specify the AI model’s overall role, behavior, and constraints.  
  Example: “You are an expert sustainability analyst providing concise, data-backed insights.”

## 2. Collect User Input and Interaction History  
- Include the latest user query plus relevant recent conversation context for continuity.  
  Example: “User asked about carbon footprint reduction; previous discussion included transport emissions.”

## 3. Retrieve Relevant External Knowledge  
- Identify and fetch pertinent documents, datasets, or knowledge base excerpts.  
  Example: “Pull latest supply chain emission reports and recent research summaries.”

## 4. Incorporate User Profile and Preferences  
- Add personalized data such as user role, expertise level, and interests.  
  Example: “User is a policy advisor focusing on European regulations.”

## 5. Prepare Tool and API Context  
- Provide information on callable tools, APIs, or modules the AI can use.  
  Example: “AI can request live emissions data or access compliance databases through API calls.”

## 6. Context Formatting and Prioritization  
- Organize, summarize, and truncate inputs to fit the model’s token limit while preserving priority info.  
  Example: “Prioritize recent regulatory updates and critical user questions; omit redundant background.”

## 7. Specify Expected Output Formats or Constraints  
- Define response style, structure, and length limits.  
  Example: “Output as bullet points with citations, max 300 words.”

---

### Example of a Filled Template

1. Role: Sustainability analyst specializing in supply chain emissions.  
2. User Input: User asks, “How can I reduce transportation emissions in my logistics network?” Conversation history includes discussion of current fleet fuel use.  
3. External Knowledge: Latest supply chain carbon reports 2023, lifecycle assessment data.  
4. User Profile: Logistics manager with intermediate AI familiarity.  
5. Tools: Access to real-time vehicle tracking API and carbon calculator API.  
6. Formatting: Summarize key strategies; list pros and cons in bullets; limit to 5 points.  
7. Expected Output: Bullet points with citations and actionable recommendations.
