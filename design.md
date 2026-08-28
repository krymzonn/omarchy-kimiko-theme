# Kimiko Omarchy theme — design notes (Quattro)

Palette source of truth is `kimiko.nvim` (`lua/kimiko/palette.lua`, 37 colours).
This theme is a **desktop / TUI / aether** subset for Omarchy 4. Syntax leftovers
stay in the nvim plugin.

`AGENTS.md` is the wrong home for this: that file is for how to work in the
repo. This document is the colour reasoning and the 4.0 remaining work.

Branch: `4.0`. `master` remains the Omarchy 3.4 line until that is dropped.


## Naming collision

**nvim `accent`** is violet `#aa83f8` (Special, members).

**Omarchy `accent`** in this theme is nvim **`active` / cypher** `#d1f85d`
(window border, 3.x `colors.toml` accent, waybar `cypher`).

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
| `bg1` | `#1d1a1b` | warmer | CursorLine, Neo-tree, floats |
| `bg2` | `#1d2121` | standard | 3.x `background`, waybar `bar` |
| `bg3` | `#2d2929` | interface bars | StatusLine, CursorColumn |

### Foregrounds

| key | hex | palette comment | Used for |
|---|---|---|---|
| `fg0` | `#ffffff` | special cases only | unused in groups |
| `fg1bri` | `#eaf4a0` | “locked in” base | Identifier; old vim Normal |
| `fg1` | `#bad094` | norm editable, tint | **nvim Normal**; 3.x `color3`; btop `main_fg` |
| `fg2` | `#fcc1d6` | htmlH2 | headings, characters |
| `fg3` | `#8bb2d3` | htmlH3, “change” | waybar `change`; 3.x `color12` |
| `fg4` | `#5f87af` | NonText, htmlH4 | Type, PreProc; 3.x `color4` |
| `h5` | `#c7b7ca` | htmlH5 | doc comments; btop `graph_text` |
| `h6` | `#aaaaab` | htmlH6 | **Comments** |
| `line` | `#4e4e52` | mid neutral | LineNr; 3.x `color8` |
| `fg_see` | `#fedece` | emphasis read-only | StatusLine; 3.x `color15` |
| `fg_read` | `#f8d1aa` | main read-only | 3.x `foreground`, waybar `letter` |

### Accents

| key | hex | comment | Used for |
|---|---|---|---|
| `boom` | `#f8015d` | attention | errors; 3.x `color1` |
| `warn` | `#fa9903` | Conditional | waybar `orange`; missing from 3.x `colors.toml` |
| `fine` | `#b2e878` | mint | 3.x `color10` |
| `good` | `#5df85d` | green | 3.x `color2`; Walker selected-text |
| `loop` | `#83f8f8` | do/for | waybar `teal`; not in 3.x `colors.toml` |
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
| `accent` | `active` | `#d1f85d` | cypher, not nvim accent |
| `selection` | `bg_vis` | `#004f87` | Visual wash; **not** neon `good` (that leaks into vscode/aether/Obsidian) |
| `muted` | `line` | `#4e4e52` | stock comments/gutter weight (~2:1 on bg) |
| `background` | `bg2` | `#1d2121` | |
| `dark_background` | `bg0` | `#0d0f0f` | old terminal black, as a shade |
| `darker_background` | `b00` | `#000000` | |
| `lighter_background` | `bg3` | `#2d2929` | |
| `foreground` | `fg_read` | `#f8d1aa` | 3.x letter; nvim Normal is demoted to `light_foreground` |
| `dark_foreground` | `line` | `#4e4e52` | same as muted; no nvim grey in the stock ~0.12 band |
| `light_foreground` | `fg1` | `#bad094` | aether `@variable`; custom btop does not use the template |
| `bright_foreground` | `fg_see` | `#fedece` | **cursor** and color15 |
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

`selection_foreground` is omitted (follows `bright_foreground`). Neon
`good`+`b00` is **not** in `colors.toml`; it lives on `[menu]` / `[launcher]`.


## Open palette forks

Still reasonable to try later; not blocking:

| Slot | Shipped | Alternatives |
|---|---|---|
| `muted` | `line` | `h6` `#aaaaab` (legible comments; also lifts linenr and vscode guides), `h5`, `fgc` |
| `bright_foreground` | `fg_see` | `fg1bri` as cursor |
| `selection` | `bg_vis` | `bg_add` `#1b3f00` |
| `yellow` | `kw` | keep 3.x olive `fg1` as yellow |
| `cyan` | `fgc` | `loop` if cyan should look like cyan |
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
| `#1d1a1b` | `bg1` | fourth background; warmer twin of `bg2` |
| `#fcc1d6` | `fg2` | rose heading |
| `#c7b7ca` | `h5` | dusty lilac |
| `#aaaaab` | `h6` | comments, unless promoted to `muted` |
| `#83f8f8` | `loop` | unless a cyan slot takes it |
| `#f8aaf8` | `str` | **violet strings** — no Omarchy role named string; generated vscode/helix colour strings green |
| `#ffffff` | `fg0` | unused special |
| search/diff washes | `bg_match`, `deep_inc`, `bg_del`*, `bg_search`, `bg_add`*, `bg_chg` | editor only (`*` = used if chosen as `selection` / `brown`) |


## Shell surfaces (`shell.toml`)

A theme-shipped `shell.toml` **replaces** the generated file. Sections we do
not list (`[bar]`, `[controls]`, `[popups]`, `[tooltip]`, `[image-picker]`)
fall back to Color.qml / Style defaults from `colors.toml`. New upstream
sections will not appear until added here. Split `shell.<section>.toml`
overlays would pick those up automatically; we chose one file for legibility.

`[bar]` needs no overlay: `background`/`foreground`/`red` already match
waybar letter / charcoal / boom-for-alerts. Workspace “current” is a different
icon, not a cypher underline.

| Section | 3.x source | Intent |
|---|---|---|
| `[notifications]` | Mako | peach on `bg2` at **0.6** alpha; no lime window-chrome |
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


## Remaining for full Omarchy 4

Done on `4.0`: semantic `colors.toml`, 3.x extras in `old/`, `shell.toml`,
btop/chromium/icons kept, `neovim.lua` kept for the author symlink.

1. **README** — `omarchy theme install`, Omarchy 4, drop Waybar/Mako/Walker/Hyprlock and `omarchy-theme-install`. Note the nvim overlay.
2. **`helix.toml`** — violet strings (`str`). Install keeps this file; generated helix colours strings green.
3. **Neovim for `omarchy theme install`** — lua is dropped (aether from `colors.toml`). Document overlay / `krymzonn/kimiko.nvim`.
4. **`unlock.png` + `preview-unlock.png`** — Plymouth and Style → Unlock. `omarchy plymouth preview` for the latter.
5. **New `preview.png`** — current shot is still a 3.x Waybar desktop.
6. **Install-path smoke test** — a real clone with `.git`, not the symlink.
7. **Publish hygiene** — `old/` and `extra-assets/` are copied into the staged theme; decide whether 4.0 ships them.
8. Optional palette forks in the table above.
9. **Do not fast-forward `master`** until ready to drop 3.x.
