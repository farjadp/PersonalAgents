# Profiles

A profile holds the private facts about one project: domain, Notion IDs,
official sources, target queries, hard rules, local paths.

**Real profiles are never committed here.** `.gitignore` blocks everything in
this folder except `_template/` and this file. This repo is public.

Keep your profiles in one of these places:

- **On your machine, in this folder:** `profiles/<project>/<pack>.md`. Git ignores it.
- **In a private folder or repo:** set `PERSONAL_AGENTS_PROFILES=/path/to/profiles`.
- **Anywhere:** pass the file path to `install.sh` instead of a name.

To start a new one:

```bash
mkdir -p profiles/myproject && cp profiles/_template/seo.md profiles/myproject/seo.md
```

Never put a key, password or token in a profile. Write the variable name and
where it lives (for example `PAGESPEED_API_KEY in .env`), never its value.
