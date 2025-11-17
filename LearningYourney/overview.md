# VCH AI Usage Levels – Quick Summary

## Overview Table

| Level | Name                            | Main Shift                                                   | Typical Tools                                  |
|-------|---------------------------------|--------------------------------------------------------------|-----------------------------------------------|
| 0     | No AI Use                       | Everything manual, no AI at all                             | Google/Bing, PDFs, Excel, Word, PowerPoint    |
| 1     | Aware Chat User                 | From “AI says so” → “AI helps me understand + find sources” | OpenWebUI/ChatGPT, SearXNG, OneDrive/SharePoint |
| 2     | Source Collector & Curator      | From “some docs” → “curated knowledge base”                 | AI chat, SearXNG, OneDrive/SharePoint, Excel/OneNote |
| 3     | Data & Code Augmented Analyst   | From “documents” → “our own data & code as evidence”        | Cline + OpenAI/OpenRouter, Python/R, Excel, Jupyter/RStudio |
| 4     | Workflow Engineer               | From “we run scripts” → “we have a small working workflow”  | n8n, AI APIs, Supabase, Qdrant (opt.), MS 365 |
| 5     | System-Level Designer           | From “AI helps us” → “AI is part of our solution”           | All above + simple front-end (bot/app/dashboard) |


---

## Level 0 – No AI Use (Baseline)

- **What they do**
  - Use only browser search, PDFs, Excel, Word, PowerPoint.
  - Read, copy, summarise by hand.
- **Strengths**
  - Direct contact with texts and data.
  - No hallucinated content from AI.
- **Limits**
  - Slow, narrow, repetitive.
  - Little explicit reflection on “where does this information come from?”

This is the baseline to compare all AI levels against.

---

## Level 1 – Aware Chat User

- **Core idea**  
  Use AI for understanding and writing, but always **check with real sources**.
- **What students actually do**
  - Ask OpenWebUI/ChatGPT to explain Theory U, SCF, CSRD/EUDR etc. in simple language.
  - Use SearXNG to find 3–5 real documents per topic (EU/government/NGO/company).
  - Store sources in OneDrive/SharePoint folders per topic.
  - Add a short *“AI usage & sources”* section to their report.
- **What they’ve mastered**
  - Basic prompting for clarity and structure.
  - Using SearXNG to find credible PDFs/sites.
  - Seeing AI text as a **starting point**, not the truth.
- **Truth-seeking angle**
  - AI answer + at least 1–2 real sources.
  - First defence against “dead internet”: they always click and read.

---

## Level 2 – Source Collector & Curator

- **Core idea**  
  Turn random documents into a **curated, documented knowledge base**.
- **What students actually do**
  - Create a source folder structure (Regulations, Sector reports, Academic/NGO, Company, Data).
  - Keep a **source register** (Excel/OneNote/Word) with:
    - Title, organisation, year, link, summary, limitations.
  - Use AI to:
    - Summarise each source,
    - Compare multiple sources on the same topic,
    - Highlight agreements, disagreements, and gaps.
- **What they’ve mastered**
  - Thinking in source categories and perspectives.
  - Comparing and contrasting sources with AI, then checking the originals.
  - Seeing bias, missing voices, and contested issues.
- **Truth-seeking angle**
  - Truth = triangulated across **multiple documented sources**.
  - Defence against dead internet: a transparent, curated library, not just search results.

---

## Level 3 – Data & Code Augmented Analyst

- **Core idea**  
  Use AI to work with **real project data and code**, not just text.
- **What students actually do**
  - Store raw and cleaned data in `Raw/` and `Clean/` folders (OneDrive/SharePoint).
  - Use **Cline + OpenAI/OpenRouter** to:
    - Write and debug simple Python/R scripts or notebooks.
  - Load, clean, and analyse real data (surveys, chain data, financials).
  - Create basic plots/tables and use them in their report as evidence.
- **What they’ve mastered**
  - Talking to AI about code, then understanding and adjusting it.
  - Connecting data transformations to questions (“why this plot?”).
  - Trusting data and scripts more than AI text alone.
- **Truth-seeking angle**
  - Truth = what survives both **source checks** (Level 2) and **data analysis** (Level 3).
  - Defence against dead internet: locally analysed project data + reproducible notebooks.

---

## Level 4 – Workflow Engineer

- **Core idea**  
  Build at least one **repeatable workflow** where AI + data + tools run together.
- **What students actually do**
  - Map their project process and pick a good automation target (e.g. survey → insights).
  - Implement a workflow in **n8n** that:
    - Pulls data from MS Forms/Excel/SharePoint,
    - Cleans/transforms data,
    - Calls AI (OpenWebUI/OpenAI) for summarisation/classification,
    - Stores results (Supabase/Excel) and/or sends a summary to Teams.
  - Monitor runs and debug failures.
- **What they’ve mastered**
  - Thinking in triggers, steps, outputs.
  - Reading logs and fixing basic workflow problems.
  - Designing automations that actually help the project, not just demos.
- **Truth-seeking angle**
  - Truth = supported by **stable, inspectable pipelines** (data in → data/AI out).
  - Defence against dead internet: controlled flows from curated sources and project data into AI; nothing “mystically appears”.

---

## Level 5 – System-Level Designer

- **Core idea**  
  Design a **socio-technical system** where AI is a visible, explainable part of the solution.
- **What students actually do**
  - Choose a real stakeholder (e.g. SME CFO, buyer, co-op manager) and a concrete AI use case.
  - Design a system architecture including:
    - Data sources, AI components (RAG, scoring, suggestions),
    - Workflows (e.g. n8n),
    - Front-end (chatbot, dashboard, form), and human oversight.
  - Build a small but real **AI-enabled MVP** (e.g. compliance assistant, risk view, chain insight tool).
  - Document risks, bias, and safeguards; show how users can inspect evidence and override AI.
- **What they’ve mastered**
  - Treating AI as one actor in a bigger system (people, processes, data, tech).
  - Making AI outputs traceable to sources and data.
  - Talking about governance, roles, and impact, not just features.
- **Truth-seeking angle**
  - Truth = co-created by users + data + sources + AI, with **evidence always visible**.
  - Defence against dead internet: the system is designed so users can inspect, question, and correct AI instead of worshipping it.

