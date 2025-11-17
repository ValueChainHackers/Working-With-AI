# VCH AI Usage Level 4 – Workflow Engineer

*Syllabus / Teacher Documentation*

---

## 1. Module Overview

**Title:** AI Usage Level 4 – Workflow Engineer
**Context:** Value Chain Hackers (VCH) – supply chain finance & sustainability projects
**Position in AI Ladder:** After Level 3 – Data & Code Augmented Analyst

At **Level 4**, students move from:

* “We can analyse data and use AI/code when we choose,”
  to
* **“We design small, reliable workflows where data, AI, and tools work together automatically.”**

They:

* Identify repetitive or fragile parts of their project work,
* Use tools like **n8n** and the **local AI stack** (OpenWebUI, Supabase, Qdrant, SearXNG, etc.) to automate these,([GitHub][1])
* Still work mainly in **Microsoft 365** (Forms, Excel, OneDrive, SharePoint, Teams) as the “front stage,”
* Treat automations as **transparent systems** with logs and clear data flows.

The key idea:

> From “I run scripts when I feel like it”
> to
> **“Our project has at least one working AI-powered workflow that others can reuse.”**

---

## 2. Starting Points: Non-AI, Level 1, Level 2, Level 3

### 2.1 Non-AI student (no AI at all)

* **How they work:**

  * Everything is manual:

    * Exporting survey results,
    * Cleaning in Excel,
    * Copy–pasting into PowerPoint/Word,
    * Summarising by hand.
* **Strengths:**

  * Direct understanding of each step.
* **Limitations:**

  * Slow, error-prone, not repeatable.
  * Hard to keep up when data changes or scales.

### 2.2 Level 1 – Aware Chat User

* Uses AI for explanations and writing.
* Checks key claims with real sources.
* Still runs everything **by hand**.

### 2.3 Level 2 – Source Collector & Curator

* Maintains a structured source library.
* Uses AI to compare/cluster documents.
* Source handling is still manual (download, rename, file).

### 2.4 Level 3 – Data & Code Augmented Analyst

* Has at least one script or notebook that:

  * Loads data,
  * Cleans/transforms it,
  * Produces charts/tables.
* Still has to:

  * Manually run scripts,
  * Manually move files,
  * Manually paste outputs into reports.

---

## 3. Role of Level 4 – What’s New?

At **Level 4 – Workflow Engineer**, the student:

* Looks at the whole project and asks:

  * “Which tasks do we repeat every week?”
  * “Which steps are easy to break or forget?”
  * “What should run reliably in the background?”
* Designs **end-to-end workflows** that connect:

  * Microsoft 365 (forms, spreadsheets, files, Teams),
  * Local AI stack (n8n, OpenWebUI, Supabase, Qdrant, SearXNG, etc.),([GitHub][1])
  * Simple code/notebooks from Level 3.

**Key shift:**

> From “we can code”
> to
> **“we can build and maintain a simple AI-powered system.”**

---

## 4. Learning Outcomes (Level 4)

After completing Level 4, students will be able to:

1. **Identify valuable automation targets**

   * Map out their project process and highlight:

     * Repetitive tasks (e.g. weekly survey exports, recurring summaries),
     * Error-prone tasks (e.g. manual copy–paste of numbers),
     * Slow tasks (e.g. manually reading many open answers).

2. **Design a small but real workflow**

   * Define:

     * Trigger (when/where does data enter?),
     * Steps (transform, store, enrich with AI),
     * Outputs (what gets updated or delivered to the team/partner).

3. **Implement workflows in n8n / local AI stack**

   * Use **n8n** to:

     * Connect to Microsoft systems (Forms, Excel/OneDrive, SharePoint, Teams),
     * Call local or remote LLMs (OpenWebUI / OpenAI),
     * Store results in Supabase or a file,
     * Optionally use Qdrant for semantic search/RAG.([GitHub][1])

4. **Monitor and debug workflows**

   * Read and interpret logs or execution histories,
   * Handle common failure cases (missing data, bad formats, timeouts),
   * Provide a simple “restart / manual override” option.

5. **Explain the workflow in plain language**

   * Document:

     * What the workflow does,
     * Why it exists,
     * How it supports the project,
     * How someone else could maintain or adapt it.

6. **Maintain truth-seeking and transparency**

   * Ensure automated AI outputs:

     * Are traceable back to sources and data,
     * Do not silently overwrite key decisions,
     * Have clear status and limits.

---

## 5. Tools & Environment (Level 4)

### 5.1 Core tools

* **n8n (local or hosted, via local-ai-packaged)**

  * Low-code workflow engine connecting APIs, files, databases, and AI.([GitHub][1])
* **OpenWebUI / OpenAI stack**

  * For AI calls inside workflows (summaries, classifications, RAG).
* **Supabase**

  * As a database/vector store for structured outputs (surveys, scores, logs).([GitHub][1])
* **Qdrant (optional but recommended)**

  * Vector store for semantic search/RAG over documents.([GitHub][1])
* **SearXNG (optional)**

  * Metasearch engine for workflows that need web search.([GitHub][1])

### 5.2 Front-stage tools (student day-to-day)

* **Microsoft 365**

  * **Forms** – input (surveys, questionnaires),
  * **Excel / SharePoint** – structured data tables,
  * **OneDrive / SharePoint** – file storage,
  * **Teams** – notifications and status messages,
  * **PowerPoint / Word** – final reports, slides.

### 5.3 Recommended structures

* OneDrive / SharePoint:

  * `ProjectName/03-Workflows/`

    * `Design/` (diagrams, notes)
    * `Configs/` (JSON exports, .env references if allowed)
    * `Logs/` (CSV exports from n8n, screenshots of run history)

* n8n:

  * One workflow per clear purpose, named:

    * `ProjectName – Survey-to-Insights`,
    * `ProjectName – Weekly-Data-Refresh`,
    * etc.

---

## 6. Integration with Theory U & VCH Phases

### 6.1 Co Sensing – Automating listening

* Instead of:

  * Manually exporting survey answers and reading each one,
* Level 4 students:

  * Create a workflow that:

    * Pulls new responses from Microsoft Forms or Excel,
    * Cleans and stores them (Supabase/SharePoint),
    * Uses AI to tag, cluster, or summarise open answers,
    * Posts a digest into Teams (e.g. every Monday).

**Effect:**
The “listening system” stays alive during the project; new signals are continuously incorporated.

### 6.2 Co Presencing – Keeping the mirror clear

* They ensure that:

  * Automated summaries are linked to underlying responses,
  * Stakeholders can trace insights back to raw comments or data.
* AI becomes a **mirror cleaner**, not a black box oracle.

### 6.3 Co Creating – Prototypes with a heartbeat

* Their prototypes (dashboards, tools, processes) are:

  * Fed automatically by these workflows,
  * Kept up-to-date without manual effort,
  * Easier to hand over to partners or future student teams.

---

## 7. Teaching Strategy (How We Teach Level 4)

### 7.1 Learning Goal for the “Workflow Sprint”

By the end of a **workflow-focused sprint**, each team should have:

* Designed and implemented at least **one working automation** that:

  * Starts from a realistic trigger (e.g. new row in Excel / Forms),
  * Includes at least one AI step (summarise, classify, enrich),
  * Ends in a useful output (e.g. Teams message, updated table, file).

* Documented:

  * Its purpose,
  * Its steps (diagram + text),
  * How to run/debug it.

### 7.2 Activity 1 – Workflow Walkthrough (Teacher Demo)

**Example demo scenario: “Survey → Summary → Teams”**

1. **Trigger**

   * New response in Microsoft Forms / Excel table.

2. **n8n workflow**

   * Node 1: Microsoft 365 connector (poll new responses or read from Excel).
   * Node 2: Clean/reshape data.
   * Node 3: Call OpenWebUI/OpenAI to:

     * Summarise open answers,
     * Extract key themes or pain points.
   * Node 4: Save structured output to:

     * Supabase table or a new Excel file.
   * Node 5: Send summary into a Teams channel.

3. **Explain**

   * Trigger, path of data, AI step, output.
   * Where logs live and how to see if it failed.

### 7.3 Activity 2 – Team Workflow Design

**Step 1 – Identify candidate processes**

Teams map their process (whiteboard/Miro/OneNote):

* Data and documents they:

  * Collect regularly,
  * Transform manually,
  * Reuse in weekly meetings.

They mark 1–2 good candidates:

* Repetitive,
* Clear inputs and outputs,
* Not too critical to break while learning.

**Step 2 – Draw a simple workflow diagram**

For one chosen process, they answer:

* Trigger: “When does this start?”
* Inputs: “What comes in? From where?”
* Steps: “What transformations / AI calls happen?”
* Outputs: “Where does the result go? Who sees it?”

They draw it as:

* Boxes and arrows with labels,
* Short notes about data and AI steps.

**Step 3 – Implement the workflow in n8n**

Using their diagram:

* Build nodes step-by-step,
* Test with sample data before making it live,
* Use AI/Chat in n8n or OpenWebUI for:

  * Writing small code expressions,
  * Structuring prompts,
  * Handling edge cases.

### 7.4 Activity 3 – “Break & Fix” Session

Teacher deliberately:

* Breaks a simple demo workflow (wrong field name, API key missing, unexpected data),
* Asks students to:

  * Inspect logs,
  * Identify the failing node,
  * Fix the problem,
  * Document what went wrong.

Goal:

* Normalise debugging,
* Connect automation with responsibility and transparency.

---

## 8. Assessment & Evidence

### 8.1 Formative checks

Teachers can quickly check if:

* The team has a **clear diagram** of at least one workflow,

* There is a **running workflow in n8n** that:

  * Can be manually triggered in front of you,
  * Produces expected outputs with test data.

* The team can answer (without diving into code immediately):

  * “What starts this?”
  * “Where does the data go next?”
  * “Which node uses AI and why?”
  * “How do we know if it failed?”

### 8.2 Summative criteria: “Has the team reached Level 4?”

A team qualifies as **Level 4 – Workflow Engineer** if:

1. **Implemented workflow**

   * At least one n8n workflow:

     * Works end-to-end with real or realistic project data,
     * Includes at least one AI call (OpenWebUI/OpenAI),
     * Produces outputs used in the project (not just a toy).

2. **Documented design**

   * There is a short document (Word, OneNote, or slide) that includes:

     * A diagram of the workflow,
     * A bullet list of steps in plain language,
     * The purpose and expected benefit of the automation.

3. **Monitoring and debugging**

   * They can:

     * Show where to see past runs/logs in n8n,
     * Explain at least one real issue they encountered and how they fixed it.

4. **Impact on the project**

   * They can describe:

     * What manual work the workflow replaces,
     * How often it runs,
     * How it helps their Co Sensing / Co Creating work.

5. **Ethical and truth-seeking awareness**

   * They can explain:

     * Which parts of the workflow rely on AI judgement,
     * How outputs can be checked against underlying data/sources,
     * How they would notice if the workflow started to produce nonsense.

---

## 9. Reflection Prompts (Student + Teacher)

### 9.1 Student reflection prompts

* “Which manual task did our workflow replace? How much time/effort does it save?”
* “Where in our workflow do we most need human oversight?”
* “What information do we log so we can audit what happened?”
* “If someone else inherited this workflow next year, could they understand and maintain it?”
* “Where did AI inside the workflow do something unexpected? How did we handle that?”

### 9.2 Teacher reflection prompts

* “Are students designing workflows that actually matter to their project, or just gadgets?”
* “Do they understand that automation increases responsibility, not reduces it?”
* “Are they documenting workflows in a way that partners and future students can reuse?”
* “Is AI being used as a black box, or are data paths and prompts visible and discussable?”

---

## 10. From Information → Insight → Truth at Level 4

At Level 4, the ladder looks like this:

* **Information**

  * Continuous inflow of data and text (surveys, logs, documents),
  * Collected and processed by workflows rather than ad-hoc actions.

* **Insight**

  * Regular, up-to-date summaries and indicators:

    * Weekly digests in Teams,
    * Updated tables/graphs based on fresh data,
    * Semantic search over up-to-date document sets.

* **Truth-seeking**

  * Truth is supported by:

    * Stable, transparent pipelines,
    * Logs of how each output was created,
    * The ability to replay or inspect past runs.

Against the **dead internet** risk:

* Level 4’s defence is:

  * **Controlled data and document flows** into their AI systems,
  * Automations that always start from:

    * Their own project data,
    * Curated sources from Level 2,
    * Analyses from Level 3.
  * A culture of:

    * “Don’t just automate; make it inspectable, explainable, and easy to challenge.”

[1]: https://github.com/coleam00/local-ai-packaged "GitHub - coleam00/local-ai-packaged: Run all your local AI together in one package - Ollama, Supabase, n8n, Open WebUI, and more!"
