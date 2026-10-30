# PersonalAgents

Claude Code agents, in one place, ready to install into any project. Free to use under the MIT licence.

## How it is organised

```
agents/<pack>/          Generic agents. No project names, IDs or paths inside.
profiles/_template/     Empty profile to copy for a new project.
profiles/<project>/     Your real profiles. Git-ignored: they never leave your machine.
install.sh              Copies a pack (and a profile) into a project's .claude/
```

**The rule:** an agent file holds the *method*. A profile holds the *facts* (domain, Notion IDs, sources, queries, hard rules). The same agent works on any project that has a profile. Each agent reads `.claude/profiles/<pack>.md` first and stops if it is missing.

## Packs

### `seo` — search team (SEO, AEO, GEO, AIO)

| Agent | Model | Job |
|---|---|---|
| `seo-strategist` | opus | Orchestrator. Six jobs: `audit`, `fix`, `stats`, `content`, `trends`, `competitors` (monthly), or `all`. Runs a learning loop (experiments → playbook) and writes the weekly report in Notion. |
| `fact-checker` | opus | Checks every figure, date and rule against the official authority. Records it in Fact Checks. Drafts fixes; applies them only after approval. |
| `ai-visibility-tracker` | sonnet | Weekly: runs a fixed query set in AI answer engines and records who is cited. |

Needs per project: a Notion setup (main page, Weekly Reports, Playbook, and the Experiments, Fact Checks, AI Visibility Tracker and Competitors databases), Search Console access, and optionally a PageSpeed key.

## Use

List what is available:

```bash
./install.sh --list
```

Install the SEO pack into a project with your profile (a name from `profiles/` or `$PERSONAL_AGENTS_PROFILES`, or a file path):

```bash
./install.sh seo ~/path/to/project myproject
```

Install into a new project (copies the empty template; fill it in before use):

```bash
./install.sh seo ~/path/to/project
```

Existing files are never overwritten; the script says which files differ. Add `--force` to overwrite. The script also adds `.claude/profiles/` to the project's local git exclude, so a profile is not committed by accident.

Then, in the project, ask Claude Code for example: "run seo-strategist: stats and audit".

## Privacy

This repo is public. Profiles hold private facts (Notion IDs, strategy, local paths), so real profiles are git-ignored and never committed — see `profiles/README.md`. No profile or agent may contain a key, password or token: write the variable name and where it lives, never the value.

## Add a new agent

1. Put the generic agent in `agents/<pack>/<name>.md` (frontmatter: `name`, `description`, `model`, optional `tools`).
2. Move every project-specific fact into your local profile, and add the section to `profiles/_template/<pack>.md`.
3. Add a row to the table above.

Checklist before committing an agent:
- No project names, Notion IDs, domains, local paths or secrets in `agents/`.
- The agent says which profile sections it needs, and stops when the profile is missing.
- Safety rules (no push, no merge, no deploy, read-only on external services) stay in the agent, not in the profile.
