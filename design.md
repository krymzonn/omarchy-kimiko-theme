# Kimiko Omarchy theme — design notes (Quattro)

Palette source of truth is `kimiko.nvim` (`lua/kimiko/palette.lua`, 37 colours).
This theme is a **desktop / TUI / aether** subset for Omarchy 4. Syntax leftovers
stay in the nvim plugin.

How to test: `AGENTS.md`. This document is colour reasoning and remaining 4.0 work.

Branch: `4.0`. `master` remains the Omarchy 3.4 line until that is dropped.


## Naming collision

**nvim `accent`** is violet `#aa83f8` (Special, members).

**Omarchy `accent`** is nvim **`fg1bri`** `#eaf4a0` (OSD bar, gum, vscode
chrome, keyboard RGB). Caret and window ring stay **`active` / cypher** via
`bright_foreground` and `hyprland_active_border`. Violet nvim `accent` remains
`magenta`.

Never mix those two.


## What Omarchy 4 actually consumes

`colors.toml` is ~26 hex slots. Generated terminals, aether.nvim, vscode, helix,
and the shell fall back to those names. A cloned theme (`omarchy theme install`,
directory has `.git`) **drops** `*.lua`, terminal configs, and `vscode.json`;
colour files (`btop.theme`, `helix.toml`, `shell.toml`, icons, backgrounds) are
kept.

Resolver traps (cannot be overridden from the theme):

- `color0` is forced to `background` (true black only survives as `dark_background`)
- `cursor` is forced to `bright_foreground`

`selection_foreground` is independently settable; if omitted it becomes
`bright_foreground`.


## Nvim inventory

### Backgrounds (dark → light)

| key | hex | palette comment | Used for |
|---|---|---|---|
| `b00` | `#000000` | special cases only | DiffDelete fg; Telescope selected fg |
| `bg0` | `#0d0f0f` | darkest base | WinBarNC, float shadow; 3.x `color0` |
| `bg1` | `#1d1a1b` | warmer | CursorLine, Neo-tree, floats; **`[popups]` flyout fill** |
| `bg2` | `#1d2121` | standard | 3.x `background`, waybar `bar` |
| `bg3` | `#2d2929` | interface bars | StatusLine, CursorColumn |

### Foregrounds

| key | hex | palette comment | Used for |
|---|---|---|---|
| `fg0` | `#ffffff` | special cases only | unused in groups |
| `fg1bri` | `#eaf4a0` | “locked in” base | Identifier; old vim Normal |
| `fg1` | `#bad094` | norm editable, tint | **nvim Normal**; 3.x `color3`; btop `main_fg` |
| `fg2` | `#fcc1d6` | htmlH2 | headings, characters; **`selection_foreground`** |
| `fg3` | `#8bb2d3` | htmlH3, “change” | waybar `change`; 3.x `color12` |
| `fg4` | `#5f87af` | NonText, htmlH4 | Type, PreProc; 3.x `color4` |
| `h5` | `#c7b7ca` | htmlH5 | doc comments; btop `graph_text` |
| `h6` | `#aaaaab` | htmlH6 | **Comments** |
| `line` | `#4e4e52` | mid neutral | LineNr; 3.x `color8` |
| `fg_see` | `#fedece` | emphasis read-only | StatusLine; 3.x `color15`; **dropped from 4.0 slots** (caret was too peach) |
| `fg_read` | `#f8d1aa` | main read-only | 3.x `foreground`, waybar `letter` |

### Accents

| key | hex | comment | Used for |
|---|---|---|---|
| `boom` | `#f8015d` | attention | errors; 3.x `color1` |
| `warn` | `#fa9903` | Conditional | waybar `orange`; missing from 3.x `colors.toml` |
| `fine` | `#b2e878` | mint | 3.x `color10` |
| `good` | `#5df85d` | green | 3.x `color2`; Walker selected-text |
| `loop` | `#83f8f8` | do/for | waybar `teal`; **`[popups]` border** |
| `accent` | `#aa83f8` | nvim name | 3.x `color5`; btop boxes |
| `num` | `#aaaaf8` | | 3.x `color13` |
| `str` | `#f8aaf8` | | **String**; waybar `pign` |
| `op` | `#f85d84` | operator | 3.x `color9` |
| `kw` | `#f8d15d` | Keyword | waybar `yellow` |
| `active` | `#d1f85d` | cypher | 3.x Omarchy `accent` |
| `fn` | `#d1f8f8` | Function | 3.x `color14` |
| `fgc` | `#aad1d1` | os dim | 3.x `color6` |

### Search / diff washes

| key | hex | Used for |
|---|---|---|
| `bg_match` | `#87004f` | MatchParen |
| `deep_inc` | `#670044` | IncSearch fg |
| `bg_del` | `#4c1100` | DiffDelete |
| `bg_vis` | `#004f87` | Visual |
| `bg_chg` | `#232345` | DiffText |
| `bg_search` | `#3d6900` | Search |
| `bg_add` | `#1b3f00` | DiffAdd, PmenuSel |


## Mapping as shipped (`colors.toml`)

Lean = 3.x desktop file where it already chose, nvim where 3.x had no slot,
honest hue names (`yellow` is gold `kw`, not olive `fg1`).

| Omarchy | nvim | hex | Notes |
|---|---|---|---|
| `accent` | `fg1bri` | `#eaf4a0` | locked-in widget chrome (OSD fill, gum, vscode); same paint as color11; ring/caret stay cypher |
| `selection` | `bg_vis` | `#004f87` | Visual wash; **not** neon `good` (that leaks into vscode/aether/Obsidian) |
| `selection_foreground` | `fg2` | `#fcc1d6` | rose on Visual blue; alt `h5`. Also gum selected rows, vscode selection fg |
| `muted` | `line` | `#4e4e52` | stock comments/gutter weight (~2:1 on bg) |
| `background` | `bg2` | `#1d2121` | |
| `dark_background` | `bg0` | `#0d0f0f` | old terminal black, as a shade |
| `darker_background` | `b00` | `#000000` | |
| `lighter_background` | `bg3` | `#2d2929` | |
| `foreground` | `fg_read` | `#f8d1aa` | 3.x letter; nvim Normal is demoted to `light_foreground` |
| `dark_foreground` | `line` | `#4e4e52` | same as muted; no nvim grey in the stock ~0.12 band |
| `light_foreground` | `fg1` | `#bad094` | almost unused on this machine: aether `@variable` (install-path nvim only); custom `btop.theme` does not use the template |
| `bright_foreground` | `active` | `#d1f85d` | **cursor**, color15, gum/helix/vscode carets; same paint as `accent`. Terminal “bright white”. `selection_foreground` does **not** follow this (set explicitly). |
| `red` | `boom` | `#f8015d` | |
| `orange` | `warn` | `#fa9903` | new vs 3.x `colors.toml` |
| `yellow` | `kw` | `#f8d15d` | 3.x had olive here |
| `green` | `good` | `#5df85d` | |
| `cyan` | `fgc` | `#aad1d1` | |
| `blue` | `fg4` | `#5f87af` | |
| `magenta` | nvim `accent` | `#aa83f8` | |
| `brown` | `bg_del` | `#4c1100` | aether-only (rainbow); experiment vs auto-mix of orange |
| `bright_red` | `op` | `#f85d84` | |
| `bright_yellow` | `fg1bri` | `#eaf4a0` | |
| `bright_green` | `fine` | `#b2e878` | |
| `bright_cyan` | `fn` | `#d1f8f8` | |
| `bright_blue` | `fg3` | `#8bb2d3` | |
| `bright_magenta` | `num` | `#aaaaf8` | vscode keywords use this slot |
| `hyprland_active_border` | `active` | `rgba(d1f85dee)` | generated lua; cloned themes drop shipped `hyprland.lua` |
| `hyprland_inactive_border` | `bg3` | `#2d2929` | very quiet vs `background`; bump to `line` if inactive windows vanish |

Same hex, two roles: `bright_foreground` = `hyprland_active_border` = nvim `active` (cypher).
Omarchy `accent` is a third role (`fg1bri`, also color11).
Neon `good`+`b00` is **not** in `colors.toml`; it lives on `[menu]` / `[launcher]`.


## Open palette forks

Settled (happy with looks): `bright_foreground` = `active`, `selection`/`selection_foreground` = `bg_vis`/`fg2`, `yellow` = `kw`. Do not steal `loop` for `cyan` — it is the flyout frame.

Still reasonable later; not blocking:

| Slot | Shipped | Alternatives |
|---|---|---|
| `muted` | `line` | `h6` `#aaaaab` (legible comments; also lifts linenr and vscode guides), `h5`, `fgc` |
| `brown` | `bg_del` | omit (auto mix of `warn` toward black, Y≈0.10, typical stock) |
| `hyprland_inactive_border` | `bg3` | `line`, or `rgba(595959aa)` (3.x default) |

`muted` vs stock: kimiko `bg2` is not a brighter stage than tokyo-night. Stock
`muted` on its own background is 1.5–2.5:1; `line` on `bg2` is 1.96:1. nvim
`h6` at 7:1 is the “comments should read” knob. VS Code comments use **solid**
`muted`; alpha suffixes (`muted40`) are indent guides, meant to be texture.


## Nvim colours with no Omarchy slot

Desktop gets 16+shades; these stay in kimiko.nvim (and can be hardcoded in
`helix.toml` / `btop.theme`):

| hex | nvim | Why |
|---|---|---|
| `#fedece` | `fg_see` | dropped from 4.0 (was color15 / caret; too like read-only) |
| `#c7b7ca` | `h5` | dusty lilac; btop `graph_text` by hand |
| `#aaaaab` | `h6` | comments, unless promoted to `muted` |
| `#f8aaf8` | `str` | **violet strings** — not in `colors.toml`; **`helix.toml` uses it**. Generated vscode/aether still colour strings green |
| `#ffffff` | `fg0` | unused special |
| search/diff washes | `bg_match`, `deep_inc`, `bg_search`, `bg_add`, `bg_chg` | editor only (`bg_vis` is `selection`; `bg_del` is `brown`) |


## Shell surfaces (`shell.toml`)

A theme-shipped `shell.toml` **replaces** the generated file. Sections we do
not list (`[bar]`, `[controls]`, `[tooltip]`, `[image-picker]`)
fall back to Color.qml / Style defaults from `colors.toml`. New upstream
sections will not appear until added here. Split `shell.<section>.toml`
overlays would pick those up automatically; we chose one file for legibility.

`[bar]` needs no overlay: `background`/`foreground`/`red` already match
waybar letter / charcoal / boom-for-alerts. Workspace “current” is a different
icon, not a cypher underline.

| Section | 3.x source | Intent |
|---|---|---|
| `[notifications]` | Mako | peach on `bg2` at **0.6** alpha; no lime window-chrome |
| `[popups]` | — | bar flyouts: **`bg1` at 0.9**, **`loop` frame**. OSD pill fill is hardcoded `bg2` at 0.97; OSD text/track use `popups.text` (`fgc`); OSD progress fill is global `Color.accent` (`fg1bri`). Flyout *copy* is `bar.foreground` (peach), not `popups.text` |
| `[menu]` | Walker | `b00` card, `fgc` text, boom frame, **good fill + b00 text** on the selected row |
| `[launcher]` | same tokens | Super+Space today reads **`[menu]`** (`Color.menu`); `[launcher]` is ready if they split |
| `[lock]` | Hyprlock | `b00` field, cypher text, good ring, boom on error; placeholder **`line`** (also the fingerprint glyph) |
| `[polkit]` | (new) | neon ring like lock, peach body on `bg2` |
| `[spacing]` | — | `panel-padding = 8` (Style default **18**) |

Placeholder alts tried: `fg1` (readable, a bit loud), `line` (kept). `bg_add` as
*text* on `b00` is ~1.4:1 (gone). `bg_search` is an unused moss alt.

### Menu padding / borders

- `panel-padding` is the card inset for menu, clipboard, emoji, reminders, polkit.
- Qt draws the card border **inside** the rectangle. Content starts at
  `border-width + panel-padding`.
- Menu **cardHeight does not include the border**, so the last selected row
  can paint over the bottom stroke when padding is small (`padding < 2 × border-width`).
- `selected-border` is drawn **on the row**, inside that inset. It cannot
  bridge into `panel-padding`, and a `good` border on a `good` fill is invisible.
- Row labels already have hardcoded 8–18px insets (`Style.space`); the search
  title does not (it lived inside `panel-padding`).
- Flush sides (`panel-padding = 0`) and a surviving bottom frame cannot both
  be done from `shell.toml`. 8px is a compromise: title gutter, bottom boom
  usually survives.


## How to test

Two instances on this machine:

| Path | What | `omarchy theme set` |
|---|---|---|
| `~/.config/omarchy/themes/kimiko` | install clone (`.git`) | **Kimiko** — lua dropped |
| `~/.config/omarchy/themes/kimiko-dev` → this repo | symlink | **Kimiko Dev** — lua kept |

Omarchy treats a symlink as a user-written theme (`! -L && .git`).

Re-apply without cycling wallpaper:

```bash
OMARCHY_THEME_SKIP_BACKGROUND=1 omarchy theme set kimiko-dev
```

Theme set otherwise advances the wallpaper (same theme → next image; Kimiko vs
Kimiko Dev are different paths so it restarts at `1-bronze-alps-6k.jpg`).


## Before merging `4.0` to `master`

Done: semantic `colors.toml`, `shell.toml`, Helix (nvim-named palette, violet
strings, heading bold/underline), `AGENTS.md`, `neovim.lua` for the author
symlink, 3.x extras in `old/`.

Still before merge:

1. **New `preview.png`** — current shot is a 3.x Waybar desktop.
2. **`unlock.png` + `preview-unlock.png`** — Plymouth and Style → Unlock
   (`omarchy plymouth preview` for the latter).
3. **Install-path smoke test** — clone with `.git` (lua dropped, aether + Helix
   + `shell.toml`). Confirm `omarchy theme install` from GitHub once `master`
   points here.
4. **Publish hygiene** — `old/` and `extra-assets/` are copied into the staged
   theme; decide whether they ship.
5. Helix H3/H4 colours if they still feel like syntax, not titles (old vim H3
   was near-white). Optional forks: `muted` → `h6`, `brown` auto-mix, inactive
   border `line`.
6. **Do not fast-forward `master` until this list is acceptable.** `omarchy
   theme install` clones the default branch. Until merge, 3.4 stays on
   `master` for Omarchy 3 machines.
