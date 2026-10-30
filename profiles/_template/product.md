# Product profile — <Project name>

Read by `spec-writer`, `architect`, `builder`, `reviewer`, `security-checker`, `feature-engineer`, `release-docs` and the `feature-loop` skill.
Installed into the project as `.claude/profiles/product.md`.
You do not have to fill this by hand: run the `product-setup` skill and it asks only what it cannot find. If you fill it yourself, fill every `<…>`. Write "none" instead of leaving a section empty. Never put a key, password or token here.

## Product

- **Name:** <…>
- **One-line purpose:** <who it is for> + <what problem it solves>
- **Platforms:** <web (framework) · mobile (React Native / Flutter / native) · other>
- **Stage:** <discovery | MVP | product–market fit | scale>
- **North-star:** <the one outcome that means the product is working>
- **Owner:** <name> — decides what to build, what to cut, and when it is good enough

## Three facts

- **What triggers a deploy?** <e.g. "every push to main deploys production" | "manual release only"> — if a push deploys, no agent may push. Ever.
- **Tracking policy:** <"analytics allowed: PostHog" | "no tracking at all — privacy promise">
- **Public promises the code must keep:** <e.g. "no third-party requests", "works offline", "no account needed" — or "none">

## Stack

- Frontend web: <…>
- Mobile: <… or "none">
- Backend: <… or "none">
- Database: <… or "none">
- Hosting: <…>
- Auth: <… or "none">
- Analytics: <… or "none, by design">
- ML / AI: <models, providers — or "none">

## Commands

- Install: `<cmd>`
- Dev: `<cmd>` (port <n>; never stop processes on other ports)
- Lint: `<cmd>`
- Type-check: `<cmd>`
- Test: `<cmd>`
- Build: `<cmd>`
- E2E: `<cmd or "none">`

## Repo rules

- The law of this repo, by path: <`AGENTS.md`, `CONTRIBUTING.md`, … or "none">. On any conflict, these win over the agents.
- Branch naming: <…> · PR template: <path or "none">

## Where work goes

- Feature cards and requirements: <`docs/product/` | `.claude/data/product/`>
- Reviews: <`docs/reviews/` | `.claude/data/product/reviews/`>
- Decision records (ADR): <`docs/adr/` | `.claude/data/product/adr/`>
- Templates: `.claude/templates/product/`

## Never touch

- <signing keys, `.env*`, billing code, production data, store uploads …>

## Definition of Done

- [ ] Acceptance criteria all pass (automated where possible)
- [ ] Lint, type-check, tests green
- [ ] `reviewer` verdict = APPROVE
- [ ] `security-checker` has no CRITICAL/HIGH open
- [ ] Success signal defined (and instrumented only if the tracking policy allows)
- [ ] Changelog entry written for user-visible changes
- [ ] Owner approved the merge
- <extra items for this repo>

## Has an ML model?

- <no — `feature-engineer` is not used | yes — ML code lives in <path>>

## Known gaps

- <e.g. "baseline is red: 3 failing tests in …" — or "none">
