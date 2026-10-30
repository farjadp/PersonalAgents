# SEO profile — <Project name>

Read by `seo-strategist`, `fact-checker` and `ai-visibility-tracker`.
Installed into the project as `.claude/profiles/seo.md`.
Fill every `<…>`. Delete a section only if it truly does not apply, and write "none" instead of leaving it empty. Never put a key, password or token here: write the variable name and where it lives.

## Site

- **Brand:** <name> — <one line: what the business does and for whom>
- **Production URL:** <https://…> (legacy domains: <…>). Never fetch: <preview / staging URLs>
- **Repo:** <owner/repo>. Default branch <main>. Does a push to it deploy? <yes/no>
- **Owner:** <name> (who approves changes)

## Locales

- <locales and paths>. Do they pair with hreflang? <rule>

## Memory

- Memory folder: <path, or "none">
- Files the strategist must read: <…>
- Files the fact-checker must read: <…>

## Notion

Main SEO page: <id>

| Name in the agents | Notion |
|---|---|
| Weekly Reports (page) | <id> |
| Experiments (database) | <collection://…> |
| Playbook (page) | <id> |
| Fact Checks (database) | <collection://…> |
| AI Visibility Tracker (database) | <collection://…> |
| Competitors (database) | <collection://…> |

- Fact Checks status for "needs a change": <Awaiting …>
- Report fallback folder: <docs/seo-reports/>

## Code map

- Metadata / schema / sitemap / robots / llms.txt: <files>
- Content files per locale: <paths>
- Rules for adding a new path: <…>
- Content generation files (proposals only): <…>
- **Content inventory:** <file or method>
- **Business pages** for internal links: <…>

## Commands

- Tests: <…>
- Type-check: <…>
- Branch naming: `seo/<yyyy-mm-dd>-<topic>`, `fact/<yyyy-mm-dd>-<topic>`

## Data access

- **Search Console:** property <sc-domain:…>, GCP project <…>, auth <…>. Fix if auth fails: <command>
- **PageSpeed Insights:** key <ENV_NAME> in <file>
- **GA4:** <route, or "not available">
- **DataForSEO / Ahrefs:** <connected? where are the keys?>

## Baseline

- First baseline: <window, clicks, impressions>
- Traffic level: <small / medium / large — how to judge experiments>

## Content rules

- Mix: <…>
- Reader profiles: <…>
- Variety rules: <…>
- Locale strategy: <…>
- Paused or forbidden subjects: <…>

## Hard rules

- <rules that are never broken, e.g. no prices on the site>

## Never touch

- <files and folders the agents must not change without approval>

## Writing

- Report language: <…>
- Per-locale writing rules: <…>

## Authorities

- <the official bodies that set the facts this site states>

## Fact-check: where claims live

- <files and fields>

## Trends sources

- Policy / industry: <…>
- Press (leads only): <…>
- Communities: <…>

## Competitors

- Classes: <…>
- Most important class: <…>

## AI visibility

Query set **v1 (<date>)**. Never add the brand name to a query.

- <locale 1 queries>
- <locale 2 queries>
- Engines: <all five, or a shorter list>
- Samples per query: <1–3>

## Specialists

- Optional SEO sub-agents installed: <names, or "none">

## Known gaps

- <missing access, blocked tasks, open issues — with dates>
