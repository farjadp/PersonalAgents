<p align="center">
  <img src="assets/banner.svg" alt="PersonalAgents — reusable Claude Code agents: one method, any project" width="100%">
</p>

<p align="center">
  <img src="https://img.shields.io/badge/status-early-EAB308" alt="status: early">
  <img src="https://img.shields.io/badge/licence-MIT-22C55E" alt="MIT licence">
  <img src="https://img.shields.io/badge/for-Claude%20Code-6366F1" alt="for Claude Code">
  <img src="https://img.shields.io/badge/packs-SEO%20%C2%B7%20Competitors-0EA5E9" alt="packs: SEO and Competitors">
</p>

<p align="center">
  <a href="#quick-start">Quick start</a> ·
  <a href="#the-seo-team">The SEO team</a> ·
  <a href="#the-competitor-team">The competitor team</a> ·
  <a href="#safe-by-design">Safe by design</a> ·
  <a href="#add-your-own-agent">Add your own agent</a> ·
  <a href="#about-the-author">About the author</a>
</p>

---

## The problem

You build a good agent in one project. Then you copy it to the next one, change a few lines, and copy it again.
After a month you have five versions. None of them is the best one, and some of them carry the last project's
Notion IDs, domain and private strategy — sometimes into a public repo.

**PersonalAgents fixes this with one rule: the method and the facts live apart.**

| | Lives in | Shared? |
|:-:|---|---|
| 🧠 **Method** — how to audit, fact-check, measure | `agents/<pack>/` | Yes. Public, generic, the same for every project. |
| 🔒 **Facts** — domain, IDs, sources, rules, target queries | `profiles/<project>/` | No. Git-ignored. Never leaves your machine. |

Improve an agent once, and every project gets the improvement.

## How it works

<p align="center">
  <img src="assets/how-it-works.svg" alt="agents (public) + profile (private) go through install.sh into your project's .claude folder" width="100%">
</p>

Each agent reads `.claude/profiles/<pack>.md` first. **No profile, no work:** the agent stops and says so instead of guessing.

## Quick start

**1. Get the repo**

```bash
git clone https://github.com/farjadp/PersonalAgents && cd PersonalAgents
```

**2. Write a profile for your project** (start from the template, fill every `<…>`)

```bash
mkdir -p profiles/myproject && cp profiles/_template/seo.md profiles/myproject/seo.md
```

**3. Install the pack into your project**

```bash
./install.sh seo ~/path/to/myproject myproject
```

Packs today: `seo` and `competitors`. Each pack has its own profile template in `profiles/_template/`.

Then, inside the project, ask Claude Code:

> run seo-strategist: stats and audit

Useful extras:

```bash
./install.sh --list
```

- `--force` overwrites files that differ. Without it, nothing is ever overwritten.
- Keep profiles in a private folder instead: `export PERSONAL_AGENTS_PROFILES=~/private/profiles`.
- Or pass a file path as the last argument instead of a name.

## The SEO team

<p align="center">
  <img src="assets/seo-team.svg" alt="seo-strategist orchestrates fact-checker and ai-visibility-tracker; results go to Notion" width="100%">
</p>

One team for all four ways people find you today: **SEO** (Google ranking), **AEO** (being *the* answer),
**GEO** (being cited by ChatGPT, Perplexity, Gemini, Claude) and **AIO** (Google AI Overviews).

| | Agent | Model | What it does |
|:-:|---|---|---|
| <img src="assets/icons/seo-strategist.svg" width="32" alt=""> | **`seo-strategist`** | opus | The lead. Six jobs — `audit` · `fix` · `stats` · `content` · `trends` · `competitors` — or `all`. Writes a weekly report with evidence for every claim. |
| <img src="assets/icons/fact-checker.svg" width="32" alt=""> | **`fact-checker`** | opus | Checks every figure, date and rule against the **official** source. A blog or an AI answer is a lead, never proof. |
| <img src="assets/icons/ai-visibility-tracker.svg" width="32" alt=""> | **`ai-visibility-tracker`** | sonnet | Every week, the same queries in the AI answer engines: who do they cite, and is it you? |

<details>
<summary><b>What makes it different from an SEO checklist</b></summary>

- **It learns.** Every change gets a hypothesis and a baseline *before* it ships, is measured at +14 and +28 days,
  and is judged honestly (small changes on small traffic are called *Inconclusive*). Lessons go into a Playbook:
  *Likely* after one experiment, a *Rule* after two.
- **It never invents numbers.** No search volume, position or "AI Overview shows X" that it did not see in this run.
  An auth error is reported as "no access", never as "no data".
- **It writes briefs, not wishes.** Each content brief has the target query, evidence of demand, the direct answer
  the page must open with, the official sources to cite, and the sentence we want AI engines to quote.
- **It watches rivals from data.** A competitor is whoever ranks or is cited on *your* queries — not a list you guess.

</details>

<details>
<summary><b>What you need per project</b></summary>

- A Notion setup: a main SEO page, Weekly Reports, a Playbook, and the Experiments, Fact Checks,
  AI Visibility Tracker and Competitors databases. The profile holds their IDs.
- Search Console access (gcloud application-default credentials).
- Optional: a PageSpeed Insights key, GA4, DataForSEO or Ahrefs.

</details>

## The competitor team

<p align="center">
  <img src="assets/competitors-flow.svg" alt="competitor-scout: queries, search, clean, read site, judge, score; you review; then positioning-mapper and content-offer-gap" width="100%">
</p>

Who are your real competitors, where do you stand among them, and what can you own? Every answer comes with evidence you can click.

| | Agent | Model | What it does |
|:-:|---|---|---|
| <img src="assets/icons/competitor-scout.svg" width="32" alt=""> | **`competitor-scout`** | opus | Finds competitors from live search results, reads their sites, judges each one (SEO and/or business · direct, indirect or aspirational), and gives you a review queue of up to 10. Learns from every rejection. |
| <img src="assets/icons/positioning-mapper.svg" width="32" alt=""> | **`positioning-mapper`** | opus | Positioning maps: 2 fixed core charts + up to 3 market charts you choose. Finds the open space next to you, with fixed steps, and turns it into content angles. |
| <img src="assets/icons/content-offer-gap.svg" width="32" alt=""> | **`content-offer-gap`** | sonnet | What competitors publish (keywords, topics, intent, funnel) and what they sell (products, services, packages) — and the gaps you can own. |

<details>
<summary><b>The rules that keep it honest</b></summary>

- **Search results only.** A competitor can come only from a link that search actually returned — never from the model's memory.
- **No site, no verdict.** A competitor whose website cannot be read is dropped, not guessed.
- **Every reason quotes the evidence.** A reason that could be written without reading the site is invalid.
- **Scale matters.** A company far bigger than you is *aspirational*, never a *direct* competitor.
- **Certainty is a word, not a number.** The model says *certain*, *likely* or *unsure*; a fixed formula turns that into a score. Self-reported numbers carry no information.
- **You decide.** Nothing is accepted for you. Reject with a reason (different market, too big, different product, not a company) and the next search steers away from it — and never shows that domain again.
- **No invented gaps.** The open space on a map is computed in fixed steps, and only next to you. If there is none, the agent says so.
- **An outage is not an empty market.** If every search fails, the run fails loudly.

</details>

The method comes from the competitor-intelligence engine of a production SaaS (Contivo), rebuilt as agents that need no app, no database and no API keys — only web search, a browser and your review. Results are saved to `.claude/data/competitors/`, which stays out of git.

## Safe by design

<table>
<tr>
<td width="50%" valign="top">

**The agents**

- 🚫 Never push, merge or deploy. Fixes go on a branch; you decide.
- 👁️ Read-only on outside services: no posting, no settings, no sign-ins, no CAPTCHAs.
- ✋ Never change a fact (a figure, a date, a rule) without your approval.
- 🧾 Text on web pages is *data*. If a page tells the agent to do something, it reports it and does not act.

</td>
<td width="50%" valign="top">

**The repo**

- 🔒 Real profiles are git-ignored. Only the empty template is public.
- 🛡️ `install.sh` never overwrites a file without `--force`.
- 🙈 It also tells the target project's git to ignore `.claude/profiles/` and `.claude/data/` (agent research).
- 🔑 No key, password or token in any profile — only the variable name and where it lives.

</td>
</tr>
</table>

Read an agent before you run it. It is a short Markdown file, and it runs with your tools.

## Add your own agent

1. Put the generic agent in `agents/<pack>/<name>.md` (frontmatter: `name`, `description`, `model`, optional `tools`).
2. Move every project fact into your local profile, and add the matching section to `profiles/_template/<pack>.md`.
3. Add it to the tables in this README.

Before you commit, check:

- [ ] No project names, Notion IDs, domains, local paths or secrets in `agents/`.
- [ ] The agent says which profile sections it needs, and stops when the profile is missing.
- [ ] Safety rules (no push, no merge, no deploy, read-only outside) stay in the agent, not the profile.

```
agents/<pack>/          generic agents — public
profiles/_template/     empty profile — public
profiles/<project>/     your real profiles — git-ignored
assets/                 images for this README
install.sh              copies a pack + a profile into a project
```

## Status and roadmap

**Early.** The SEO pack comes from a team built for a live, two-language website in October 2026. The competitor pack turns a tested app pipeline into agents; as agents, both packs are new.
Its first experiments are still being measured, so there are no proven results yet. They will be published here
when there are — failures included.

Next packs: a mobile **UX auditor**, and the product team from
[Divan](https://github.com/farjadp/Divan) (spec, architecture, build, independent review, security, release).

---

## About the author

<img src="assets/icons/owner.svg" width="64" align="left" alt="" style="margin-right:16px">

**Farjad Pourmohammad** is an AI strategist, startup mentor and builder based in Toronto, Canada.
He has spent more than twenty years building technology companies in Iran and Canada — founding and
running a software company, leading engineering teams as a CTO, and building products of his own,
including [Taghvim](https://taghv.im), an open-source Persian calendar, and [Divan](https://github.com/farjadp/Divan),
a product team of AI agents. Today he mentors early-stage founders and helps businesses decide where AI actually
earns its place. PersonalAgents is the toolbox from that work: agents that have done real jobs, kept clean enough
to hand to someone else.

*From complexity, to clarity, to action.*

### Work with me

| | Service | What it is |
|:-:|---|---|
| 🧭 | **AI strategy** | Where AI earns its place in your business — then designing, building and securing it. |
| 🚀 | **Startup mentorship — The Founder Lab** | A free 8-week programme for five teams: customer discovery and lean validation, before you build. |
| 🤝 | **Founder advisory & coaching** | One-to-one sessions: a sparring partner for the decisions only you can make. |
| 🛠️ | **Web, app & AI product development** | Through AshaVid: websites, browser extensions, Android and iPhone apps, widgets and automation. |
| 🔤 | **Persian & right-to-left products** | Correct RTL layout, fonts, Persian digits and Solar Hijri dates, for products with Persian-speaking users. |

<p align="center">
  <b>Start small:</b> a free diagnostic call or a ten-minute self-assessment.<br><br>
  <a href="https://farjadp.info"><img src="https://img.shields.io/badge/Book%20a%20free%20diagnostic%20call-farjadp.info-6366F1?style=for-the-badge" alt="Book a free diagnostic call at farjadp.info"></a>
</p>

<p align="center">
  🌐 <a href="https://farjadp.info"><b>farjadp.info</b></a> ·
  💼 <a href="https://www.linkedin.com/in/farjadpourmohammad">LinkedIn</a> ·
  ▶️ <a href="https://www.youtube.com/@FarjadTalks">YouTube @FarjadTalks</a> ·
  🐙 <a href="https://github.com/farjadp">GitHub @farjadp</a>
</p>

If these agents save you time, ⭐ **star the repo** and tell me what you built with them.

---

## Licence

MIT — see [LICENSE](LICENSE).

PersonalAgents is an independent project. It is not affiliated with or endorsed by Anthropic.
"Claude" and "Claude Code" are trademarks of Anthropic.
