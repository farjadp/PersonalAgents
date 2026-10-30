# Product profile — Ledgerly (example)

> **Fictional example.** Ledgerly does not exist. It shows what a finished profile looks like.
> `.example` is a reserved domain, so nothing here points to a real company.

Read by `spec-writer`, `architect`, `builder`, `reviewer`, `security-checker`, `feature-engineer`, `release-docs` and the `feature-loop` skill.
Installed into the project as `.claude/profiles/product.md`.

## Product

- **Name:** Ledgerly
- **One-line purpose:** for freelancers in Canada who hate bookkeeping — track income and expenses, send invoices, and know how much tax to set aside.
- **Platforms:** web (Next.js) · mobile (Expo / React Native, iOS and Android)
- **Stage:** MVP
- **North-star:** freelancers who log at least one transaction in 3 of their first 4 weeks
- **Owner:** Sam — decides what to build, what to cut, and when it is good enough

## Three facts

- **What triggers a deploy?** Every push to `main` deploys the web app to production. Mobile releases are manual (EAS). → No agent may push.
- **Tracking policy:** analytics allowed: PostHog, product events only, no personal data in event properties.
- **Public promises the code must keep:** "Your financial data is never sold or shared with advertisers." "Export all your data as CSV at any time." "Delete your account and all data in one click."

## Stack

- Frontend web: Next.js (App Router), TypeScript, Tailwind
- Mobile: Expo / React Native
- Backend: Next.js route handlers
- Database: PostgreSQL (Supabase), row-level security on
- Hosting: Vercel (web), EAS (mobile)
- Auth: Supabase Auth (email + Google)
- Analytics: PostHog
- ML / AI: none

## Commands

- Install: `pnpm install`
- Dev: `pnpm dev` (port 3000; never stop processes on other ports)
- Lint: `pnpm lint`
- Type-check: `pnpm typecheck`
- Test: `pnpm test`
- Build: `pnpm build`
- E2E: `pnpm test:e2e` (Playwright; reviewer only)

## Repo rules

- The law of this repo, by path: `AGENTS.md` (code style, money as integer cents, French/English copy rules). On any conflict, it wins over the agents.
- Branch naming: `feat/<slug>`, `fix/<slug>` · PR template: `.github/pull_request_template.md`

## Where work goes

- Feature cards and requirements: `docs/product/`
- Reviews: `docs/reviews/`
- Decision records (ADR): `docs/adr/`
- Templates: `.claude/templates/product/`

## Never touch

- `.env*`, `supabase/migrations/` without an approved ADR, billing code (`src/billing/`), EAS credentials, production data.

## Definition of Done

- [ ] Acceptance criteria all pass (automated where possible)
- [ ] Lint, type-check, tests green
- [ ] `reviewer` verdict = APPROVE
- [ ] `security-checker` has no CRITICAL/HIGH open
- [ ] Success signal defined (and instrumented only if the tracking policy allows)
- [ ] Changelog entry written for user-visible changes
- [ ] Owner approved the merge
- [ ] Every new user-facing string exists in English and French

## Has an ML model?

- no — `feature-engineer` is not used

## Known gaps

- E2E tests are slow (about 6 minutes); the quality gate runs only lint, type-check and unit tests.
