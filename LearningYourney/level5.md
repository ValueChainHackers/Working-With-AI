# VCH AI Usage Level 5 – System-Level Designer

*Syllabus / Teacher Documentation*

---

## 1. Module Overview

**Title:** AI Usage Level 5 – System-Level Designer
**Context:** Value Chain Hackers (VCH) – supply chain finance & sustainability projects
**Position in AI Ladder:** After Level 4 – Workflow Engineer

At **Level 5**, students move from:

* “We have AI-supported workflows that help our project,”
  to
* **“We have a working socio-technical system where AI is part of the solution for real stakeholders.”**

They:

* Embed AI **inside** their prototype or concept (not just “in the background”),
* Make that AI **traceable, explainable, and challengeable**,
* Design with **stakeholders, risk, and truth-seeking** in mind,
* Keep a firm grip on where data, models, and decisions come from in a drifting, “dead-internet” world.

The key idea:

> From “AI helps our process”
> to
> **“Our solution uses AI responsibly to change how the system works.”**

---

## 2. Starting Points: Non-AI and Previous Levels

### 2.1 Non-AI student (no AI at all)

A student or team that never uses AI:

* Can still design strong conceptual solutions:

  * Policy changes, process redesigns, contracts, governance models.
* Strengths:

  * Often strong in stakeholder empathy and qualitative reasoning,
  * Less risk of hallucinated content.
* Limitations for Level 5:

  * Cannot demonstrate how an **AI-enabled system** would behave in practice,
  * Cannot prototype AI-supported decision support or insight tools,
  * Less prepared for real-world AI + data ecosystems.

At Level 5 we **do not replace** this thinking.
We **add** the ability to embody it in an AI-powered system.

### 2.2 Levels 1–4 (short recap)

* **Level 1 – Aware Chat User**

  * Uses AI consciously for understanding and writing, checks sources.

* **Level 2 – Source Collector & Curator**

  * Maintains a structured source library, uses AI to compare and cluster sources.

* **Level 3 – Data & Code Augmented Analyst**

  * Works with real data and code; AI supports scripts, analysis, and visualisation.

* **Level 4 – Workflow Engineer**

  * Builds at least one automated workflow (e.g. with n8n + AI) that runs reliably on project inputs.

### 2.3 What Level 5 adds

At **Level 5**, students:

* Bring together:

  * Sources (Level 2),
  * Data & code (Level 3),
  * Workflows (Level 4),
* Into a **coherent prototype / solution** that:

  * Serves specific stakeholders in the chain,
  * Embeds AI decisions or interpretations,
  * Is auditable and open to challenge,
  * Has thought-through failure modes & ethical safeguards.

---

## 3. Role of Level 5 – What’s New?

At **AI Level 5 – System-Level Designer**, the student team:

* Treats AI as one actor in a **socio-technical system**:

  * People,
  * Data,
  * Processes,
  * Digital tools.
* Designs a prototype where:

  * AI has a **clear, justified role** (e.g. risk assistant, compliance explainer, pattern detector),
  * Outputs are **connected to underlying evidence** (sources, data, logs),
  * Users can **inspect, contest, and override** AI suggestions.

They are:

* No longer “using AI”,
* They are **designing with AI** as part of organisational and chain change.

---

## 4. Learning Outcomes (Level 5)

After completing Level 5, students will be able to:

1. **Define the AI role in their solution**

   * Clearly articulate:

     * Who the primary user(s) are (e.g. SME CFO, sustainability officer, buyer, farmer co-op),
     * What problem the AI component addresses (e.g. regulatory complexity, data overload, risk interpretation),
     * Why AI is the right tool here (and where it is not).

2. **Design a socio-technical architecture**

   * Draw and explain an architecture that includes:

     * Data sources (documents, datasets, survey results),
     * AI components (e.g. RAG, classifier, recommender),
     * Workflows (n8n or other orchestration),
     * Frontstage interfaces (dashboard, chatbot, report generator),
     * Human checks and decision points.

3. **Implement a working AI-based MVP**

   * Deliver a small but real prototype where:

     * The user can **interact** with AI (ask questions, get suggestions, see analyses),
     * Responses are **grounded** in project data and curated sources,
     * There is at least a minimal **UI** (can be simple: a web form, chatbot interface, or dashboard).

4. **Ensure traceability and explainability**

   * The system can show:

     * Which sources/data points support an answer,
     * Which steps (prompts, workflows) were taken,
     * Where uncertainty or limitations lie.
   * Students can explain:

     * What the model can and cannot “know”,
     * How to check AI suggestions.

5. **Analyse risk, bias, and impact**

   * Identify:

     * Who could be harmed or disadvantaged by wrong/biased AI outputs,
     * What feedback loops could make things worse (e.g. reinforcing stereotypes, ignoring minority data).
   * Propose:

     * Safeguards, monitoring practices, or alternative designs.

6. **Strengthen truth-seeking at system level**

   * Show how their system:

     * Combines sources, data, and human judgement,
     * Helps users to question, not blindly accept, AI outputs,
     * Stays connected to reality in a “dead internet” context.

---

## 5. Tools & Environment (Level 5)

### 5.1 AI & backend tools (possible choices)

Depending on the project’s needs and the stack available, teams may use:

* **OpenWebUI / OpenAI stack**

  * For chat, RAG, classification, summarisation.

* **Qdrant / other vector store**

  * For semantic search and retrieval over:

    * Regulations,
    * Project reports,
    * Chain documents.

* **Supabase**

  * For storing:

    * Structured data (scored indicators, user inputs),
    * Logs of interactions.

* **n8n / other orchestrator**

  * For glueing together:

    * Data sources,
    * AI calls,
    * Notifications,
    * Periodic updates.

* **Neo4j (optional)**

  * For chain/graph representation and AI-assisted path or risk analysis.

* **Simple frontend frameworks**

  * E.g.:

    * Streamlit or Dash,
    * A basic web app,
    * A Teams chatbot or Power Apps front-end,
  * As long as they allow **real interaction** with the AI-backed system.

### 5.2 Front-stage tools (for users & stakeholders)

* **Microsoft 365** remains the main “front office”:

  * Teams (for chatbots, notifications, dashboards),
  * PowerPoint (for explaining the system),
  * Word (for policy/process documentation),
  * Excel/SharePoint (for configuration tables, logs, governance templates).

It is acceptable if the MVP is “rough” as long as:

* Real data and/or documents flow through it,
* Real interactions can be demonstrated,
* The logic and role of AI are clear.

---

## 6. Integration with Theory U & VCH Phases

### 6.1 Co Sensing → Co Presencing

* Students:

  * Start from the deep listening and evidence mapping of earlier levels,
  * Use sources + data + interviews to clarify:

    * “Where is the pain or confusion in this chain?”
    * “Where are decisions currently made with poor information?”

AI’s role is framed not as “magic optimiser” but as:

* A **supporting actor** that helps users see patterns, options, and consequences.

### 6.2 Co Creating

* Teams:

  * Turn insights into a **concrete service or tool**:

    * e.g. a CSRD/EUDR compliance assistant for SMEs,
    * a risk lens for a buyer portfolio,
    * a “chain transparency mirror” for an NGO or co-op.

* AI becomes part of:

  * How information is presented and interpreted,
  * How stakeholders explore “what if” scenarios,
  * How new patterns are surfaced from complex data.

### 6.3 Co Evolving

* Students:

  * Consider evolution over time:

    * How will the system be updated with new data and sources?
    * What happens if the model or underlying AI services change?
  * Reflect on:

    * How this AI-augmented system might change roles, power, and incentives in the chain.

---

## 7. Teaching Strategy (How We Teach Level 5)

### 7.1 Learning Goal for the “System Sprint”

By the end of a **system-focused sprint** (often the latter part of the semester), each team should have:

* A **clear concept** for an AI-enabled solution:

  * Who it serves,
  * What problem it tackles,
  * What AI does in it.

* A **working MVP**:

  * Small, but showing real AI in action on project-relevant inputs.

* **Documentation**:

  * Architecture diagram,
  * Risk & ethics notes,
  * User flow description.

### 7.2 Activity 1 – Role & Scope Workshop

**Prompt:**
“Where in your project would a trustworthy AI-supported assistant actually help a real person?”

Teams identify:

* Target users (persona):

  * e.g. “SME logistics coordinator,” “farmer co-op manager,” “bank risk analyst”.
* Core use cases:

  * 2–3 “jobs” where AI can:

    * Reduce confusion,
    * Reduce repetitive work,
    * Improve decision quality.

They explicitly decide:

* **What AI will not do**:

  * E.g. “AI does not make final approvals,” “AI does not assign blame,” etc.

### 7.3 Activity 2 – Architecture & Evidence Mapping

Students draw:

* A **system diagram**, showing:

  * Data in (which OneDrive/SharePoint files, forms, databases),
  * AI modules (RAG, classification, suggestion),
  * Workflows (n8n, triggers, schedules),
  * Outputs (Teams messages, dashboards, generated reports),
  * Human oversight points (who reviews what, when).

They add:

* For each AI decision/suggestion:

  * Which **evidence** it uses (documents, data columns),
  * How a user can **drill down** to that evidence.

### 7.4 Activity 3 – MVP Build

Teams choose a minimal vertical slice that they can implement in the available time:

Examples:

* A chatbot that:

  * Answers a specific set of compliance questions,
  * Always shows links to the underlying paragraph in regulations or internal policy.

* A dashboard that:

  * Shows a risk score per supplier,
  * Allows clicking through to:

    * Raw data,
    * Rationale (e.g. “score increased because X and Y changed”).

* A simple tool that:

  * Takes an SME’s answers in a form,
  * Returns a structured “risk/attention report” with references and next-step suggestions.

They then:

* Implement using the stack they know (OpenWebUI, Qdrant, Supabase, n8n, MS365, simple frontend),
* Keep the scope small but **end-to-end**.

### 7.5 Activity 4 – Risk & Ethics Session

Students prepare a short **risk canvas** for their system:

* Who could be harmed if the AI:

  * Is wrong,
  * Is biased,
  * Is overused/overtrusted,
  * Is hacked or misconfigured?

* Where do we put:

  * **Hard limits** (e.g. this system cannot make certain decisions),
  * **Warnings & disclaimers**,
  * **Oversight** (who checks logs, who responds to complaints).

The teacher leads a discussion:

* Connecting these risks to:

  * EU AI Act themes,
  * Responsible innovation,
  * VCH mission (non-superficial, socially and environmentally responsible solutions).

---

## 8. Assessment & Evidence

### 8.1 Formative checks

Throughout the system sprint, teachers can look for:

* A **coherent concept** for AI’s role:

  * Does the AI feature clearly serve a stakeholder and problem?

* A **live demonstration plan**:

  * Can the team walk through the system in 2–5 minutes:

    * Input → processing → output → insight/action?

* Early **risk notes**:

  * Are they thinking about misuse, error, bias, and oversight?

### 8.2 Summative criteria: “Has the team reached Level 5?”

A team qualifies as **Level 5 – System-Level Designer** if:

1. **AI-embedded MVP**

   * There is a working prototype (however small) where:

     * Users interact with AI in a way that is central to the solution,
     * Inputs and outputs are project-relevant,
     * AI is not just “nice to have” but part of the value proposition.

2. **Traceability and explainability**

   * The system can show:

     * Where an answer came from (source documents, data points),
     * How a recommendation was generated (in broad strokes),
     * At least one way to **double-check** a result.

3. **Socio-technical architecture**

   * There is a documented architecture that explains:

     * Data sources,
     * AI components and workflows,
     * Human roles (who uses it, who maintains it),
     * Boundaries and responsibilities.

4. **Risk and impact reflection**

   * They have:

     * Identified meaningful risks (not just generic “AI might be wrong”),
     * Suggested concrete mitigations (limits, reviews, logging, UX cues).

5. **Truth-seeking orientation**

   * They can articulate:

     * How their system helps users question, refine, and deepen understanding,
     * How it avoids becoming a “truth machine”,
     * How it remains anchored in real documents, data, and human judgement despite AI’s confidence and the noise of a “dead internet”.

---

## 9. Reflection Prompts (Student + Teacher)

### 9.1 Student reflection prompts

* “What decisions or insights in our system must **never** be automated?”
* “Where does our system clearly show its evidence, and where is it still a black box?”
* “If this system became widely used in the chain, who would gain power, and who might lose it?”
* “How can a user say ‘I disagree’ to the AI and do something different?”
* “What is one concrete way our prototype helps someone seek truth rather than just consume answers?”

### 9.2 Teacher reflection prompts

* “Are students designing AI features that genuinely match stakeholder pain points?”
* “Do they understand the socio-technical consequences (roles, power, accountability) of their system?”
* “Is AI treated as a partner in sensemaking, or as a replacement for thinking?”
* “Are teams showing humility about what their AI system cannot and should not do?”

---

## 10. From Information → Insight → Truth at Level 5

At Level 5, the full arc looks like this:

* **Information**

  * The system collects and organises:

    * Documents, data streams, user inputs, logs.

* **Insight**

  * AI components:

    * Summarise,
    * Cluster,
    * Score,
    * Suggest.
  * Workflows keep these insights **up-to-date** and connected.

* **Truth-seeking**

  * The system deliberately:

    * Shows evidence,
    * Exposes uncertainty,
    * Leaves space for human disagreement and revision.
  * Students design mechanisms for:

    * Updating sources and data,
    * Correcting mistakes,
    * Learning from misuse.

Against **dead internet theory**:

* Level 5’s defence is:

  * System designs that:

    * Keep a tight link to **primary data and documents**,
    * Log interactions and decisions,
    * Invite users to:

      * Inspect,
      * Question,
      * Override.

* The AI is not the final authority; it is a **tool in a living system** that keeps students, partners, and stakeholders **in the loop of seeking the truth together**.
