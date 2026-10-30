# SEO profile — Ledgerly (example)

> **Fictional example.** Ledgerly does not exist. It shows what a finished profile looks like.
> `.example` is a reserved domain, so nothing here points to a real company.

Read by `seo-strategist`, `fact-checker` and `ai-visibility-tracker`.
Installed into the project as `.claude/profiles/seo.md`.

## Site

- **Brand:** Ledgerly — a simple bookkeeping app for freelancers and sole proprietors in Canada.
- **Production URL:** `https://ledgerly.example` (old domain: `getledgerly.example`). Never fetch: `staging.ledgerly.example`.
- **Repo:** `ledgerly/website`. Default branch `main`. **A push to `main` deploys the site.**
- **Owner:** Sam (approves every change).

## Locales

- English (`/`) and French (`/fr`). Every English page has a French twin; hreflang pairs them one to one.

## Memory

- none

## Storage

- **Where results live:** files — `.claude/data/seo/` (default, git-ignored).
- Fact-check status for "needs a change": `Awaiting owner`.

## Code map

- Metadata and schema: `src/lib/seo.ts`. Sitemap: `src/app/sitemap.ts`. Robots: `src/app/robots.ts`. `public/llms.txt`.
- Content: `content/en/*.mdx`, `content/fr/*.mdx`. Front matter holds `title`, `description`, `updated`, `sources`.
- New paths: add the page in both locales in the same commit.
- Content generation: none (written by people).
- **Content inventory:** `content/en/` file list.
- **Business pages** for internal links: `/pricing`, `/features/invoicing`, `/features/tax-estimates`.

## Commands

- Tests: `npm test`
- Type-check: `npx tsc --noEmit`
- Branches: `seo/<yyyy-mm-dd>-<topic>`, `fact/<yyyy-mm-dd>-<topic>`.

## Data access

- **Search Console:** property `sc-domain:ledgerly.example`, GCP project `ledgerly-web`, auth with gcloud application-default credentials. Fix if it fails: `gcloud auth application-default login --scopes=https://www.googleapis.com/auth/webmasters.readonly,https://www.googleapis.com/auth/cloud-platform`.
- **PageSpeed Insights:** `PAGESPEED_API_KEY` in `.env`.
- **GA4:** not available.
- **DataForSEO / Ahrefs:** none.

## Baseline

- Filled on the first `stats` run.
- Traffic level: small (a new site). Judge experiments by impressions and position first.

## Content rules

- Mix: 40% tax and deadlines explained · 30% invoicing and getting paid · 20% running a one-person business · 10% product news.
- Reader profiles: freelancer, new sole proprietor, part-time side business.
- Variety: never two tax articles in a row.
- Locales: French pieces are written for Quebec readers, not translated word for word.
- Paused or forbidden subjects: none.

## Hard rules

- Never give personal tax advice. Explain the rule, cite the authority, and say "talk to an accountant for your case".
- Never promise a refund amount or a tax saving.
- Never name a competitor in published content.

## Never touch

- `src/app/api/`, `prisma/`, `.github/`, `.env*`, billing code.

## Writing

- Reports in English.
- English: plain, short sentences, Canadian spelling.
- French: Quebec French; amounts written as `1 234,56 $`.

## Authorities

- Canada Revenue Agency (canada.ca/en/revenue-agency), Revenu Québec (revenuquebec.ca), the Justice Laws site (laws-lois.justice.gc.ca), each province's own business-registration site.

## Fact-check: where claims live

- `content/en/*.mdx`, `content/fr/*.mdx` (the `sources` and `updated` front-matter fields), and `src/lib/tax-dates.ts` (shared deadlines).

## Trends sources

- Policy: CRA news and "what's new" pages, Revenu Québec news.
- Press (leads only): CBC Business, The Globe and Mail small-business section.
- Communities: r/PersonalFinanceCanada, r/freelance.

## Competitors

- Classes: bookkeeping app / accounting firm blog / bank content hub / government page / forum.
- Most important class: bookkeeping apps aimed at freelancers.

## AI visibility

Query set **v1 (example)**. Never add "ledgerly" to a query.

**English (6)**
1. how to track expenses as a freelancer in canada
2. when do sole proprietors pay taxes in canada
3. gst hst registration threshold for freelancers
4. best way to invoice clients as a freelancer canada
5. what expenses can a self-employed person deduct canada
6. quarterly tax instalments self-employed canada

**French (4)**
1. comment facturer en tant que travailleur autonome au québec
2. dépenses déductibles travailleur autonome
3. inscription tps tvq travailleur autonome
4. acomptes provisionnels travailleur autonome

- Engines: Perplexity and Google AI Overview only (the rest need a sign-in).
- Samples per query: 2.

## Specialists

- none

## Known gaps

- GA4 is not connected.
- No baseline yet.
