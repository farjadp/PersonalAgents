# Examples

Finished profiles for a **made-up business**, so you can see what a good profile looks like before you write your own.

| Example | What it is | Profiles |
|---|---|---|
| [`ledgerly/`](ledgerly/) | A bookkeeping app for freelancers in Canada, in English and French | [`seo.md`](ledgerly/seo.md) · [`competitors.md`](ledgerly/competitors.md) |

Ledgerly is fictional. It uses the reserved `.example` domain, so nothing here points to a real company.

## Three ways to use them

**Let the agent write your profile (easiest).** Install a pack without a profile, then run the pack's lead agent with `setup`. It reads your project, asks only what it cannot find, and shows you the profile before using it.

```bash
./install.sh seo ~/path/to/project
```

Then, in the project: "run seo-strategist setup" (or "run competitor-scout setup").

**Start from an example.** Copy it into your git-ignored `profiles/` folder, change every line to your business, then install by name:

```bash
mkdir -p profiles/myproject && cp examples/ledgerly/seo.md profiles/myproject/seo.md
```

```bash
./install.sh seo ~/path/to/project myproject
```

**Try the agents on a test folder.** Install with the example profile itself to see how the agents behave. They will treat Ledgerly as the business, so use an empty folder, not a real project.

```bash
./install.sh competitors /tmp/try-agents examples/ledgerly/competitors.md
```
