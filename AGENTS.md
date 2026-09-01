# Agents

This is an Omarchy **theme** repo, not desktop config. Do not edit
`/usr/share/omarchy/` or `~/.local/state/omarchy/`.

Colour reasoning, nvim→Omarchy mapping, and the 4.0 checklist: `design.md`.
Palette source of truth: sibling repo `../kimiko.nvim` (`lua/kimiko/palette.lua`).

## Test on this machine

| Path | What |
|---|---|
| `~/.config/omarchy/themes/kimiko` | install clone (`.git`) — lua dropped |
| `~/.config/omarchy/themes/kimiko-dev` | symlink here — lua kept |

```bash
OMARCHY_THEME_SKIP_BACKGROUND=1 omarchy theme set kimiko-dev
```

Without that env, `omarchy theme set` cycles the wallpaper.

Work on branch `4.0`. Leave `master` as the Omarchy 3.4 line.
