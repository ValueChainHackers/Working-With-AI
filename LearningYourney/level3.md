# VCH AI Usage Level 3 – Data & Code Augmented Analyst

*Syllabus / Teacher Documentation*

---

## 1. Module Overview

**Title:** AI Usage Level 3 – Data & Code Augmented Analyst
**Context:** Value Chain Hackers (VCH) – supply chain finance & sustainability projects
**Position in AI Ladder:**
After Level 2 – Source Collector & Curator, before Level 4 – Workflow Engineer

At **Level 3**, students move from:

* “We understand the problem and have a curated library of sources”
  to
* **“We work with real data and code. AI helps us build scripts, analyses, and visualisations, but the data is the ground truth.”**

They:

* Use AI (via **Cline + OpenAI/OpenRouter**) to write and debug simple code,
* Analyse **actual project data** (Excel, survey exports, financials, chain data),
* Document their analysis in a **reproducible way** (scripts/notebooks),
* Strengthen truth-seeking by grounding claims in **their own numbers and structures**, not just documents or AI text.

---

## 2. Starting Points: Non-AI, Level 1, Level 2

### 2.1 Non-AI student (no AI at all)

A non-AI student:

* Works with data using:

  * Excel, maybe basic Power BI,
  * Manual formulas and pivot tables.
* Strengths:

  * Direct contact with data,
  * Low risk of AI hallucinations in analysis.
* Limitations:

  * Struggles to move beyond basic summaries,
  * Repetitive manual work,
  * Harder to reproduce/automate steps,
  * Often avoids coding altogether.

### 2.2 Level 1 – Aware Chat User

A Level 1 student:

* Uses AI chat for:

  * Concept explanations (SCF, CSRD, etc.),
  * Writing support,
  * Light fact-checking with SearXNG.
* Data work is still:

  * Mostly manual (Excel),
  * Or not done at all if they are afraid of data.

### 2.3 Level 2 – Source Collector & Curator

A Level 2 student:

* Maintains a **structured library** of documents:

  * Regulations, reports, company docs, datasets.
* Uses AI to:

  * Summarise and compare sources,
  * Identify gaps and contradictions.
* Data handling:

  * Still mainly at the “document + indicator” level,
  * Only basic Excel or descriptive stats.

---

## 3. Role of Level 3 – What’s New?

At **Level 3 – Data & Code Augmented Analyst**, the student:

* Starts treating data (tables, surveys, chain mappings) as a **first-class citizen** in the project.
* Uses AI not just for text, but for **code and analysis**:

  * Cline helps write scripts and notebooks,
  * AI suggests transformations and visualisations.
* Produces **reproducible analysis**:

  * Someone else can run their script and get the same result.

**Key shift:**

> From “we know what reports say”
> to
> **“we can show what our data says, and how we got there.”**

---

## 4. Learning Outcomes (Level 3)

After completing Level 3, students will be able to:

1. **Set up a basic data workflow**

   * Identify relevant project data:

     * Surveys, Excel sheets, CSV exports, financials, chain structures.
   * Store them in a clear location in **OneDrive/SharePoint/Teams** with versioning.

2. **Use AI (Cline) to build and debug simple code**

   * Use **Cline + OpenAI/OpenRouter** in VS Code (or similar):

     * Read and understand existing Python/R code snippets,
     * Generate simple scripts or notebooks,
     * Fix errors and adjust scripts to match their data.

3. **Perform basic analysis and visualisation**

   * Use Python/R (via Cline and/or notebooks) to:

     * Clean and transform data (missing values, types),
     * Compute simple statistics (counts, averages, distributions),
     * Create basic plots (bar charts, line charts, scatter plots),
     * Optionally export images/tables to PowerPoint/Word.

4. **Explain what the code does and why it is trustworthy**

   * Comment their scripts/notebooks in simple language,
   * Describe the analytic steps in their report (not only show code),
   * Connect each figure/table directly to a question or decision.

5. **Strengthen truth-seeking behaviour with data**

   * Use data to:

     * Confirm or challenge claims from sources and stakeholders,
     * Reveal patterns, outliers, and contradictions.
   * Treat AI suggestions as **hypotheses**, but:

     * Trust the numbers/logs as the check,
     * Document all steps that led from raw data to insight.

---

## 5. Tools & Environment (Level 3)

### 5.1 Required tools

* **OpenWebUI / ChatGPT (OpenAI stack)**

  * For explaining code, stats, and concepts.

* **Cline (with OpenAI/OpenRouter API key)**

  * Running inside **VS Code** (or compatible editor),
  * Main interface for AI-assisted coding.

* **Programming & analysis environment**

  * Python or R, via:

    * VS Code Jupyter notebooks,
    * Local Jupyter installation,
    * Or institutionally provided Jupyter/RStudio servers.

* **Microsoft 365**

  * OneDrive/SharePoint for:

    * Raw data,
    * Cleaned data,
    * Outputs (charts, tables).
  * Excel for:

    * Quick checks and simpler transformations.

### 5.2 Recommended structures

* OneDrive/SharePoint:

  * `ProjectName/02-Data/`

    * `Raw/` (original files from partners or surveys)
    * `Clean/` (processed files for analysis)
    * `Notebooks/` or `Scripts/` (code)
    * `Figures/` (exported charts used in reports)

* GitHub (optional but recommended for advanced teams):

  * `data/` (mirrored from “Raw/Clean”),
  * `notebooks/` or `src/` (code),
  * `README.md` documenting steps.

---

## 6. Integration with Theory U & VCH Phases

### 6.1 Co Sensing – Data as part of the field

* Students treat data as a **way of listening**:

  * To customers,
  * To suppliers,
  * To operational processes.
* AI (Cline) helps them:

  * Transform messy data into readable forms,
  * Generate first visuals and summary tables.

**Outcome:**
Quantitative and structural patterns become visible (e.g. lead times, variability, risk exposure).

### 6.2 Co Presencing – Facing what the data shows

* Students ask:

  * “What assumptions did we have that the data confirms?”
  * “What surprises us in the data?”
  * “Which stakeholders are in the worst position according to these numbers?”
* AI supports:

  * Drafting short narratives that connect data patterns to stakeholder stories and earlier source work (Level 2).

**Outcome:**
Insights that link data + documents + lived experience emerge, shaping a more honest understanding of the problem.

### 6.3 Co Creating – Data-informed prototypes

* In designing solutions, students:

  * Use their analyses to justify design choices,
  * Explore “what if” scenarios in a simple way (e.g. changing parameters in code or Excel).
* AI helps:

  * Suggest new metrics or segments to look at,
  * Propose improvements to scripts so they can test ideas faster.

---

## 7. Teaching Strategy (How We Teach Level 3)

### 7.1 Learning Goal for the “Data Sprint”

By the end of the **data-focused sprint**:

* Each team has:

  * At least one **working script or notebook** that:

    * Loads project data,
    * Cleans/transforms it,
    * Produces 1–3 meaningful charts or tables.
  * Documentation (in report or comments) explaining:

    * What the code does,
    * How it affects their understanding of the chain/problem.

### 7.2 Activity 1 – Guided Cline Onboarding

**Teacher demo:**

1. Open VS Code with Cline installed.
2. Show a **small CSV file** (e.g. 50–200 rows: suppliers, volumes, delays, scores).
3. Ask Cline (in natural language) to:

   * “Write a Python script that loads this CSV and prints basic statistics.”
4. Run the script, show the output.
5. Ask Cline to:

   * Add a simple plot,
   * Save the result as a PNG.

Narrate:

* How to read and adjust AI-generated code,
* When to ask “what does this line do?”,
* How to verify results (e.g. cross-check with Excel).

### 7.3 Activity 2 – Team Data Mini-Project

**Inputs:**

* Each team receives:

  * Their own project data if available (survey results, partner data, etc.),
  * Or a realistic sample dataset related to their theme (e.g. cocoa shipments, SME invoices, resilience scores).

**Tasks:**

1. Store raw data in:

   * `ProjectName/02-Data/Raw/`.
2. With Cline + AI chat:

   * Write a small script or notebook that:

     * Loads data,
     * Cleans obvious issues (wrong types, missing values),
     * Computes basic stats and creates 1–2 plots.
3. Export plots to:

   * `ProjectName/02-Data/Figures/`.

**Deliverable:**

* 1–2 pages in their report:

  * A short explanation of:

    * The data,
    * The script steps (in words),
    * What the graphs/tables show,
    * At least one surprising or important finding.

### 7.4 Activity 3 – “AI vs Data” Reflection

Students answer:

* “What did AI suggest we should do with this data (e.g. transformations, charts)?”
* “What did the data actually show once we ran the code?”
* “Where did AI propose something that did not make sense for our dataset?”

Teacher encourages:

* Noticing when AI “hallucinates structure” (e.g. columns that don’t exist),
* Leaning on **actual data shape and content** as the arbiter.

---

## 8. Assessment & Evidence

### 8.1 Formative checks

Teachers can ask teams to show:

* Their **02-Data** folder structure (Raw/Clean/Notebooks/Figures),
* A working script or notebook that they can run in front of you,
* A short, human-language explanation of:

  * The analysis steps,
  * Why these steps are relevant for the project.

### 8.2 Summative criteria: “Has the team reached Level 3?”

A team **qualifies as Level 3 – Data & Code Augmented Analyst** if:

1. **Functional data pipeline (small but real)**

   * There is at least one script/notebook that:

     * Loads real project data,
     * Performs meaningful cleaning/transformations,
     * Outputs charts or tables used in the report.

2. **AI-assisted coding with understanding**

   * They can show Cline/AI conversations that:

     * Helped generate or debug the code,
     * Were not blindly accepted (they adjusted/tweaked).
   * They can explain at a high level what the code is doing.

3. **Data-informed insight**

   * The report includes:

     * At least one insight that directly comes from their data,
     * Clear linking between graphs/tables and project questions.

4. **Critical behaviour**

   * They have at least one example where:

     * AI suggested something incorrect or unhelpful (e.g. wrong column name, nonsensical model),
     * They spotted the issue using data and fixed it.

---

## 9. Reflection Prompts (Student + Teacher)

### 9.1 Student reflection prompts

* “What did we learn from the data that we could not see in documents alone?”
* “Which part of the code do we actually understand, and which part still feels like magic?”
* “Where did the AI give us a code suggestion that was wrong or dangerous?”
* “If we had to do this without AI, what would take much longer or be too hard?”

### 9.2 Teacher reflection prompts

* “Are students truly interacting with the code, or just pressing ‘run’ on AI output?”
* “Do they see data as a conversation partner in Co Sensing, or just as a requirement?”
* “Are weaker programmers actually empowered by Cline, or are they avoiding thinking about the logic?”
* “Are we giving them datasets that are meaningful enough to change their view of the chain/problem?”

---

## 10. From Information → Insight → Truth at Level 3

At Level 3, the progression looks like this:

* **Information**

  * Data points, columns, rows, raw exports, logs.

* **Insight**

  * Patterns in the data:

    * Distributions,
    * Clusters,
    * Outliers,
    * Correlations.
  * AI helps them build and interpret these patterns faster.

* **Truth-seeking**

  * Truth is now:

    * What survives both **document cross-checking** (Level 2) and **data analysis** (Level 3).
  * Students triage:

    * AI’s suggestions,
    * Source claims,
    * Data evidence.

Against the **dead internet**:

* Level 3’s defence is:

  * **Locally analysed project data** that AI cannot “invent”,
  * Scripts and notebooks that show exactly how numbers are produced,
  * A habit of saying:

    * “Show me the data and the code, not just the sentence.”

---

## 11. Progression to Level 4

Once Level 3 is in place, teams are ready for **Level 4 – Workflow Engineer**, where:

* They move from:

  * “We can analyse data”
  * to
  * **“We can build small automated workflows around our analysis.”**

In Level 4, they will:

* Use tools like **n8n** and simple APIs,
* Build repeatable pipelines (data in → clean → store → analyse → update visualisations),
* Potentially add semantic search (e.g. vector stores) over their documents and outputs.

Level 3 prepares them by:

* Making code and data **normal** parts of their toolkit,
* Giving them the confidence to let AI help with more complex workflows,
* Deepening their sense that **truth in complex supply chains is triangulated**:

  * Sources,
  * Data,
  * Code,
  * Human judgement.
