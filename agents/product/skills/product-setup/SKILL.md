---
name: product-setup
description: Set up the product team (spec-writer, architect, builder, reviewer, security-checker, feature-engineer, release-docs) for this repository. Reads the repo's own rules, commands, deploy trigger and public promises, asks the owner only what it cannot find, writes the product profile (.claude/profiles/product.md), shows every conflict between the generic team and the repo, and verifies the quality gate. Use right after installing the product pack, when an agent says "run product-setup first", or when the owner says "set up the product team".
---

# Set up the product team

The generic team is a starting point, not a rulebook. A real repo already encodes decisions — some written down,
some only visible in its scripts and history. **The repo always wins.** Your job is to bend the team to fit it,
and to write what you learn into `.claude/profiles/product.md`.

Change nothing in the product code.

## Step 1 — Read before writing (no edits yet)

Read, in this order, and take notes:
1. Existing agent or contributor instructions: `AGENTS.md`, `CLAUDE.md`, `CONTRIBUTING.md`, `.cursorrules`,
   `.github/copilot-instructions.md`. These are the repo's law. The profile points to them; it never copies them.
2. `package.json` / `pyproject.toml` / `Makefile` / `go.mod` — the real install, dev, lint, type-check, test and build commands.
3. CI and release: `.github/workflows/`, release scripts, deploy config (Railway, Vercel, Fly, Netlify, EAS…).
   Answer: **what exactly triggers a production deploy?**
4. PR template and branch-naming rules.
5. Privacy statements, `SECURITY.md`, store listings, the website's privacy page — **the public promises**.
6. Analytics in the code: is there any tracking? Does a page promise there is none?
7. Is there a machine-learning model in the product?
8. Recent history: `git log --oneline -30` — how the owner actually works.

## Step 2 — Baseline

Run the tests, type-check and lint **before** changing anything. Write down the numbers
(e.g. "559 tests pass, type-check clean"). If the baseline is already red, tell the owner:
nobody can prove a change broke nothing on a red baseline.

## Step 3 — Ask only what you could not find

In one message, numbered, each with your best guess as the default:
1. In one line: who the product is for and what problem it solves. Its stage (discovery, MVP, product–market fit, scale).
2. The north-star: the one outcome that means the product is working.
3. **What triggers a deploy?** (If a push deploys, no agent may push — ever.)
4. **Tracking policy:** which analytics are allowed, or "none, by design".
5. **Public promises** the code must keep (e.g. "no account needed", "works offline", "no third-party requests").
6. Where agent work goes: `docs/product/` (committed) or `.claude/data/product/` (kept out of git).
7. Anything agents must never touch (signing keys, billing, migrations, store uploads).

## Step 4 — Write the profile

Write `.claude/profiles/product.md` with these sections, in this order:
Product · Three facts (deploy trigger · tracking policy · public promises) · Stack · Commands · Repo rules
(which files are the law, by path) · Where work goes · Never touch · Definition of Done · Has an ML model? · Known gaps.
Write `none` or `unknown` rather than leave a section empty. Never write a key, password or token.

Then write `.claude/hooks/quality-gate.commands`: one line each for lint, type-check and **fast** tests
(leave builds and end-to-end tests to the reviewer).

## Step 5 — Show the conflict table

For every generic rule of the team, ask: *does this repo contradict it?* Typical conflicts:

| The generic team assumes | What the repo may say instead | Resolution |
|---|---|---|
| Agents may push a branch | A push deploys production | Agents never push or tag |
| Success measured with an analytics event | The product promises no tracking | Success signal from feedback, issues, reviews, server counts |
| A generic security checklist | Specific public promises | `security-checker` checks those promises by name |
| An ML `feature-engineer` | No model in the product | Do not call it; say so in the profile |
| One design proposal | The owner picks between variants | `architect` prepares A/B/C |
| A changelog entry for everything | The changelog is user-facing only | `release-docs` writes no entry for internal work |
| `docs/product/` for feature cards | The roadmap lives elsewhere (Notion, Linear) | Cards as notes in `.claude/data/product/` |
| A generic code style | File headers, design tokens, i18n rules | `builder` and `reviewer` cite the repo's style rules |

Show this table to the owner. It is the most useful result of the setup.

## Step 6 — Safety settings

The pack installs `.claude/settings.json` only if the project had none. Check it now:
- If it exists and was not written by the pack, propose (do not apply) the deny rules and the Stop hook from
  `.claude/settings.product.example.json`.
- Add the repo's own dangerous commands to the deny list as a proposal: release tags, signing scripts, store uploads, key paths.

## Step 7 — Verify

1. The quality gate exits 0 when only docs changed, exits 2 when a check fails, and exits 0 when
   `stop_hook_active` is true.
2. Re-run the baseline: the numbers must be unchanged.
3. Validate `settings.json` as JSON.

## Step 8 — Hand over

Show the owner: the profile, the conflict table, the baseline, and every decision that is theirs.
**Wait for the owner's OK.** Then the team is ready: "run the feature loop on <idea>".
Commit nothing yourself unless the owner asks.
