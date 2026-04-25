---
name: mvp-9-phases
description: Nine-phase procedure for creating any product, tool, service or project from scratch through interrogation. The agent never decides what enters the MVP — it asks, proposes, measures, documents; the user decides. Applies to any language, platform or domain. Invoke when the user asks to create a new project/product/tool, or when about to write the first file of an empty repository. Do NOT invoke for modifications to existing projects.
allowed-tools: AskUserQuestion
---

# MVP from Scratch — 9 Mandatory Phases

Building a product without a disciplined process produces one of three outcomes:
unbounded scope creep, a duplicate of something that already exists, or an MVP
that doesn't actually work end-to-end. This skill defines a deterministic,
nine-phase flow to avoid all three.

## Global principles

**The agent informs; the user decides.** Whenever there are N reasonable options,
the agent presents ALL of them — ranked by estimated impact, with effort and
trade-offs — and the user picks. The agent never silently drops an option for
being "low impact".

**Every product output must be deterministic and measurable.** Findings the
product reports must be:

1. Verifiable — the user can confirm they exist
2. Measurable — they include numbers (bytes, counts, deltas)
3. Reproducible — the same input produces the same output
4. Demonstrable — the source of the data is traceable (file, line, record)

Opinions, "best practices", and subjective suggestions are NOT findings. They
go as separate, clearly labeled suggestions.

**An undocumented phase is an incomplete phase.** Each phase leaves a trace in
`DEFINICION.md` (at the project root) or in `MEJORAS.md`. Conversation does not
count as proof of execution.

**E2E in one day.** If the minimum scope doesn't fit in one working day, reduce
it until it does. A small finished product beats an ambitious half-finished one.

---

## Interaction protocol

Each phase has gates where the user must approve, choose, or classify. Two
interaction modes are used, deliberately:

- **Plain chat** — for open-ended, free-form answers (project name, problem
  statement, differentiator narrative, finding descriptions).
- **`AskUserQuestion` tool** — for structured decisions where the answer fits
  one of a small set of predefined options. Up to 4 questions can be batched
  into a single invocation. Each option may include a `preview` for visual
  side-by-side comparison (e.g., proposed file trees, architecture sketches).

| Phase / gate                                        | Mode                                  |
|-----------------------------------------------------|---------------------------------------|
| Phase 1 — name, problem, user, demo path            | Plain chat                            |
| Phase 1 — propose 2-4 architecture sketches         | `AskUserQuestion` with `preview`      |
| Phase 2 — differentiator narrative                  | Plain chat                            |
| Phase 2 — pivot/integrate/differentiate decision    | `AskUserQuestion` (3 options)         |
| Phase 3 — scope questionnaire (5 questions)         | `AskUserQuestion` batched (4 + 1)     |
| Phase 5 — per-gap strategy approval                 | `AskUserQuestion` 1 question × 3 opts (RESOLVE/NARROW/DEFER) |
| Phase 6 — coherence doubts                          | Plain chat (one at a time)            |
| Phase 7 — test scope (datasets, count, method)      | `AskUserQuestion` batched (multiSelect for datasets, single-select for method) |
| Phase 7 — per-finding true/false positive           | `AskUserQuestion` 1 question × 2 opts |
| Phase 7 — gap severity classification               | `AskUserQuestion` 1 question × 2 opts (CRITICAL/IMPROVEMENT) |
| Phase 8 — per-fix approval                          | `AskUserQuestion` 1 question × 3 opts (APPROVE/MODIFY/REJECT) |
| Phase 8 — efficiency optimization plan              | `AskUserQuestion` per optimization (multiSelect) |
| Phase 9 — UX finding classification                 | `AskUserQuestion` 1 question × 3 opts (BLOCKER/FRICTION/DESIRE) |

**Why this matters:** structured decisions with `AskUserQuestion` give the user
a clean UI (radio buttons, checkboxes, side-by-side previews) and make the
audit trail unambiguous. Free-form prompts in plain chat are reserved for
content that can't be reduced to a small option set.

---

## Phase 1 — E2E Definition

Before writing any code, answer with the user:

1. **Name** — 2-3 words, self-descriptive, unique within the user's ecosystem
2. **Problem** — one sentence: what concrete problem it solves
3. **User** — who uses it (developer, admin, end-user, another system)
4. **Minimum viable scope** — a CLOSED list of features mandatory for the
   product to work end-to-end. Removing any one of them breaks the purpose.
   For each candidate item, confirm INCLUSION explicitly with the user before
   it enters the scope — never assume an item is in or out by silent
   omission. Items not confirmed go to Phase 4 (improvements).
5. **Minimum architecture** — modules, files, dependencies needed for the
   E2E. Propose 2-4 architecture sketches via `AskUserQuestion` with
   `preview` (rendered file trees / module diagrams) so the user can compare
   side-by-side and pick one.
6. **Expected output** — what the product produces (binary, report, page, API,
   file)
7. **Demo path** — how it is shown to work (command, URL, screenshot, test)

**If** the MVP spans multiple domains/targets, prioritize the one with the
**greatest measurable impact**: where does the problem cause the most
quantifiable damage? That one goes first. The rest are later improvements.
For single-domain MVPs, this rule does not apply — skip it.

→ Document in `DEFINICION.md § Phase 1`.

## Phase 2 — Uniqueness search

Search official and public sources (repositories, package registries, forums,
papers) for projects that solve the SAME problem. Document:

- **What exists** — name, link, what it does
- **What it lacks** — concrete gap the new project covers
- **Differentiator** — the one thing that justifies this project's existence

If no clear differentiator emerges, use `AskUserQuestion` with three options:
**Differentiate** (commit to a unique angle), **Integrate** (build on top of an
existing project), **Change problem** (drop and pick a different one).

The project does not advance without a confirmed differentiator.

→ Document in `DEFINICION.md § Phase 2`.

## Phase 3 — Scope questionnaire

Conceptual questions that bound the scope, after the E2E is defined.
Any answer that introduces new scope goes to Phase 4 (improvements), NOT to
the MVP.

Minimum:

- Does it work offline or require network?
- Standalone or with external dependencies?
- Is the output fixed or configurable?
- Interactive mode or arguments only?
- Which ecosystems/formats/standards does it support?

The agent may add questions specific to the project's domain.

→ Document in `DEFINICION.md § Phase 3`.

## Phase 4 — Improvements

Ideas surfaced during Phases 1-3 that are NOT part of the minimum E2E.
They go to `MEJORAS.md` with estimated priority for implementation AFTER the
MVP ships.

**Rule:** never fold an improvement back into the MVP. If one feels essential,
the E2E was defined wrong — return to Phase 1.

## Phase 5 — Gap analysis

Identify ALL known limitations of the MVP. For each gap:

1. **Describe** — what limitation it has
2. **Impact** — effect on the user or product quality
3. **Strategy** — exactly one of:
   - **RESOLVE** — implement a fix within the MVP scope
   - **NARROW** — reduce the MVP scope so the gap stops being a gap, and
     document it as a feature, not a limitation
   - **DEFER** — move it to `MEJORAS.md` with justification
4. **Verification** — how the mitigation is checked

**One-by-one approval**: each gap is presented to the user individually via
`AskUserQuestion` with three options — **RESOLVE**, **NARROW**, **DEFER** —
each option's description showing the proposed action for that gap. The
question header is the gap number/name; the question body states the
limitation and impact.

Never batch gap approvals into a single question — the user must decide each
one in isolation. The MVP does not advance with any gap that lacks an approved
strategy.

→ Document in `DEFINICION.md § Phase 5`.

## Phase 6 — Pre-implementation review

Before writing code, the agent performs an autonomous review:

1. Re-read `DEFINICION.md` in full (Phases 1-5)
2. Re-read `MEJORAS.md` — verify nothing from the MVP leaked there by mistake
3. Coherence check:
   - The architecture covers ALL features in the scope
   - Resolved/narrowed gaps don't contradict the scope
   - The listed dependencies are sufficient
   - The demo path is executable with the defined architecture
   - No feature depends on something moved to improvements
4. Doubts or contradictions → ask the user, one at a time
5. No doubts → start implementation directly

This phase is autonomous: the agent decides if it has doubts. The user has
already authorized the start by approving Phases 1-5.

→ Document in `DEFINICION.md § Phase 6` (inline).

## Phase 7 — Real-world validation

After the MVP is functional, before publishing. Ask the user at every step.

**Define test scope** with `AskUserQuestion` batched (up to 4 questions per
invocation):

- Datasets to validate against — `multiSelect: true`, options proposed from
  the user's systems
- Method — single-select: user's projects / open-source / synthetic
- Test count — single-select: 2 / 3-5 / 6-10 / more

**Execute and audit one by one** — gate each transition with `AskUserQuestion`:

1. Run the product
2. Review each finding via `AskUserQuestion` (1 question × 2 options:
   true positive / false positive)
3. Identify gaps: what should it have detected and didn't?
4. Measure performance: time, memory, I/O
5. Present results; gate "next test" via `AskUserQuestion`
   (next test / re-run this test / stop here)
6. Classify each gap via `AskUserQuestion` (CRITICAL / IMPROVEMENT)

CRITICAL gaps must be resolved before publishing. IMPROVEMENT gaps go to
`MEJORAS.md` unless trivial (<15 min).

→ Document in `DEFINICION.md § Phase 7`.

## Phase 8 — Iteration: gaps + efficiency

Cycle until convergence. Ask the user before EVERY action.

**Focus A — Fix gaps from Phase 7:**
For each gap: classify (CRITICAL/IMPROVEMENT) → design fix → present proposal
via `AskUserQuestion` (APPROVE / MODIFY / REJECT) → implement → re-validate
against the same test that found it → check non-regression.

**Focus B — Efficiency (three criteria):**

| Criterion | What to optimize                                     | How to measure |
|-----------|------------------------------------------------------|----------------|
| Time      | Slow algorithms, useless loops, blocking I/O         | wall-clock     |
| Space     | Excess allocations, duplicated buffers, copies       | peak RSS       |
| I/O       | Redundant reads, useless scans                       | syscalls       |

Every optimization measures before and after with concrete data: "before →
after". Prioritize what the user perceives (the product's response time).
Micro-optimizations on cold paths are wasted effort.

**Cycle ends when:** zero CRITICAL gaps, zero false positives, performance
approved by the user, final state approved by the user.

→ Document each iteration in `DEFINICION.md § Phase 8` with before/after
metrics.

## Phase 9 — UX evaluation

The USER tries the product. The agent facilitates; it does not decide what is
acceptable.

**Setup**: ask the user which scenario/data to use for the trial.

**Guided evaluation** (ask per aspect, adapted to product type):

- Output legibility
- Ergonomics of use (arguments, interaction, flow)
- Result format (does it cover the user's actual use cases?)
- Installation and distribution
- Portability
- Scalability under realistic load
- Any aspect specific to the product

A CLI has different aspects from an API, a web service, or a library — adapt.

**Classify each finding** via `AskUserQuestion` (1 question × 3 options):

- **BLOCKER** — prevents functional use
- **FRICTION** — works but improvable
- **DESIRE** — something the user wants and doesn't exist yet

After classification, present ALL findings and gate disposition via
`AskUserQuestion` per finding (resolve now / defer to MEJORAS.md / discard).

→ Document in `DEFINICION.md § Phase 9`.

---

## File architecture

- Files: 2-3 words, snake_case, self-descriptive, unique within the repo
- Exceptions: language conventions (`main.rs`, `mod.rs`, `lib.rs`, `index.ts`)
  and industry conventions (`Cargo.toml`, `package.json`, `Dockerfile`,
  `README.md`, `LICENSE`, `CHANGELOG.md`)
- Depth-1 folders: 2 self-descriptive words, kebab-case or snake_case
- Maximum 2000 lines per file. Plan a split before exceeding it.

The tree is defined in `DEFINICION.md § Phase 1` (Minimum architecture) and
validated against these rules BEFORE creating files.

---

## Anti-patterns (forbidden)

- Coding without Phase 1 fully complete
- Adding features to the MVP "while we're at it"
- Skipping the uniqueness search and discovering duplicates after implementing
- Defining an E2E that doesn't fit in one day
- Mixing improvements into the minimum scope
- Implementing with gaps that have no defined mitigation
- Leaving a gap "for later" without an explicit strategy
- Reporting subjective findings as if they were facts
- Citing "best practices" without numbers behind them
- Skipping Phase 6 (pre-implementation review)
- Ignoring contradictions between scope, gaps, and architecture
- Publishing without Phase 7 (real-world validation)
- Optimizing without before/after metrics
- Deciding what to test without consulting the user
- Running tests in batch without reviewing one by one
- Publishing without the user trying the product (skipping Phase 9)
- The agent decides which improvement to implement without asking

---

## Origen / Origin (ES)

Esta skill es la generalización de un procedimiento personal del autor para
crear proyectos desde cero mediante interrogación. La regla de oro: el agente
nunca decide qué entra al MVP — informa, propone, mide, documenta; el usuario
decide. La idea es evitar tres patrones comunes de fracaso: scope sin límite,
duplicar algo que ya existe, y un MVP que no funciona end-to-end.

Términos clave: `DEFINICION.md` (definition document, project root),
`MEJORAS.md` (improvements backlog), `RESOLVE/NARROW/DEFER` (gap mitigation
strategies), `BLOCKER/FRICTION/DESIRE` (UX finding classification).
