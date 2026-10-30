# Roadmap

Ideas for the next packs. ⭐ = planned first. Each pack has one **lead** agent (the one you talk to, with a `setup` job) and specialists.

How an idea gets in: it must work for anyone (generic), be mostly method rather than facts, be checkable against evidence, and keep a human decision point.

## Packs

### `product` — product team · *done (v0.1)*

Setup and orchestration are skills (`product-setup`, `feature-loop`), because only the main session can call the other agents.

| Agent | Job |
|---|---|
| ⭐ `spec-writer` | Turns an idea into a small feature card with acceptance criteria and a success signal |
| ⭐ `architect` | Technical design and a task list |
| ⭐ `builder` | Builds one task at a time, with tests |
| ⭐ `reviewer` | Independent review; never reviews its own work |
| `security-checker` | Auth, payments, uploads, personal data, AI prompts — and the product's public promises |
| `feature-engineer` | Model input features, only when the product has an ML model |
| `release-docs` | Changelog and release checklist; never deploys |

### `ux` — UX and design

| Agent | Job |
|---|---|
| ⭐ `ux-auditor` (lead) | Mobile screens against Apple and Android rules and accessibility; PASS / FIX / BLOCK |
| `web-ux-auditor` | The same for websites |
| `accessibility-checker` | WCAG 2.2 AA: contrast, keyboard, screen readers |
| ⭐ `rtl-i18n-checker` | Right-to-left layout, Persian/Arabic digits, bidi text, local dates |
| `ux-copy-reviewer` | Buttons, errors, empty states |

### `content`

| Agent | Job |
|---|---|
| `content-planner` (lead) | A calendar from a content mix, reader profiles and variety rules |
| `writer` | Writes from a brief, using only cited sources |
| ⭐ `editor-reviewer` | Reviews on a **different model** from the writer — a model misses its own family's mistakes |
| `originality-checker` | Catches copying and near-duplicate articles |
| `social-repurposer` | Turns an article into posts that are published only after approval |
| `art-director` | Image prompts that fit the brand |

### `founder` — founders and startups

| Agent | Job |
|---|---|
| `venture-coach` (lead) | Routes the founder to the right specialist |
| ⭐ `idea-validator` | Problem, customer and evidence — every claim tagged as fact, assumption or unknown |
| `discovery-interviewer` | Customer interviews without leading questions |
| `market-sizer` | Market size as honest ranges, never one invented number |
| ⭐ `red-team` | A blind attack on the plan, the way an investor or a reviewer would |
| `business-model-stress-test` | The weak points of the business model |
| `pitch-reviewer` | Deck claims without evidence, weak slides |

### `growth`

| Agent | Job |
|---|---|
| `landing-page-auditor` | Message, proof, call to action |
| `tracking-auditor` | Are analytics events and conversions really recorded? |
| `email-sequence-writer` | Onboarding and re-engagement emails |
| `launch-checklist` | Store pages, press, communities |

### `appstore`

| Agent | Job |
|---|---|
| ⭐ `rejection-responder` | Reads an App Store or Google Play rejection; writes the fix plan and the reply |
| `store-listing-writer` | Store text within the length limits, in several languages |
| `release-notes-writer` | "What's new" notes |

### `ops` — engineering and operations

| Agent | Job |
|---|---|
| ⭐ `repo-onboarder` | Reads a repo and writes a correct CLAUDE.md / AGENTS.md |
| `test-gap-finder` | Risky code without tests |
| `dependency-auditor` | Old and vulnerable packages |
| `deploy-checker` | Env vars, migrations and rollback before a deploy |
| `incident-triager` | Likely causes from logs, with evidence |

### `meta` — agents that improve this library

| Agent | Job |
|---|---|
| ⭐ `agent-builder` | Turns a good session into a generic agent, following this repo's checklist |
| `profile-doctor` | Finds gaps and placeholders in a profile |
| `agent-eval` | Runs agents on the example business and checks their output |

## Order

1. `product` — done (v0.1).
2. `agent-builder` — speeds up every later pack.
3. `ux-auditor` + `rtl-i18n-checker`.
4. `red-team` + `idea-validator`.
5. `agent-eval`.

## Not planned

- **Trading agents.** Risk limits must be enforced by code, not by a prompt. A public prompt could cost someone real money.
- **Legal, tax or immigration advice.** A fact-checker that cites the official source is enough.
- **Many untested agents.** One pack at a time, each with a real test.
