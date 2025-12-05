# Ember Theme Design Document

A dark theme with a warm, amber-toned palette.

---

## Overview

Ember uses yellows, oranges, and reds instead of the blues and purples found in most dark themes.

### Goals

- High contrast for readability
- Reduced eye strain during long sessions
- Clear visual hierarchy in syntax highlighting

### Design Principles

1. **Functional UI gets distinct colors** — Syntax uses the warm palette. Git status and diffs use clearer, more saturated colors (bright green/red/blue) for instant recognition.

2. **Yellow for functions** — Functions are the most important token, so they get the brightest color.

3. **Minimal noise** — Operators and punctuation are dimmed. Variables stay neutral.

4. **Language-specific fixes** — When treesitter produces odd results for a language, fix it for that language rather than changing global rules.

---

## Color Palette

### Backgrounds

| Role          | Hex       | Notes                              |
|---------------|-----------|------------------------------------|
| bg            | `#0d0d0d` | Main editor background             |
| bg1           | `#141414` | Subtle lift (status bar, floats)   |
| bg2           | `#1a1a1a` | Cursor line, hover                 |
| bg3           | `#2a2a2a` | Selection, active items            |

### Foregrounds

| Role          | Hex       | Notes                              |
|---------------|-----------|------------------------------------|
| fg            | `#e8e4e0` | Primary text                       |
| fg_dim        | `#908c88` | Operators, punctuation             |
| comment       | `#555555` | Comments                           |

### Syntax Accents

| Role          | Hex       | Usage                              |
|---------------|-----------|------------------------------------|
| yellow        | `#f0c000` | Functions, methods                 |
| orange        | `#e88a2a` | Keywords                           |
| red           | `#d44a3a` | Constants, numbers, booleans       |
| green         | `#a9b665` | Strings                            |
| blue          | `#7aa2c7` | Types                              |
| tan           | `#c4a87a` | Properties, UI accents             |

### Git Colors

| Role          | Hex       | Notes                              |
|---------------|-----------|------------------------------------|
| git_add       | `#73c936` | Bright green                       |
| git_change    | `#7aa2c7` | Blue (distinct from red)           |
| git_delete    | `#ff5555` | Bright red                         |

### Background Tints

| Role          | Hex       | Notes                              |
|---------------|-----------|------------------------------------|
| bg_yellow     | `#2d2a1a` | Changed text highlight             |
| bg_git_add    | `#1a2e1a` | Diff add background                |
| bg_git_change | `#1a2230` | Diff change background             |
| bg_git_delete | `#2e1a1a` | Diff delete background             |

---

## Syntax Highlighting

| Token Type    | Color     | Notes                              |
|---------------|-----------|------------------------------------|
| Function      | yellow    | Primary accent                     |
| Keyword       | orange    | Control flow                       |
| Type          | blue      | Contrast against warm tones        |
| Constant      | red       | Includes numbers, booleans         |
| String        | green     |                                    |
| Property      | tan       |                                    |
| Variable      | fg        | Neutral                            |
| Operator      | fg_dim    |                                    |
| Punctuation   | fg_dim    |                                    |
| Comment       | comment   | Italic                             |

---

## Diagnostics

| State         | Color     |
|---------------|-----------|
| Error         | red       |
| Warning       | orange    |
| Info          | blue      |
| Hint          | fg_dim    |
| Ok            | green     |

---

## UI Elements

| Element           | Background | Foreground | Border   |
|-------------------|------------|------------|----------|
| Editor            | bg         | fg         | -        |
| Cursor line       | bg2        | -          | -        |
| Selection         | bg3        | -          | -        |
| Status bar        | bg1        | fg         | -        |
| Floating windows  | bg         | fg         | tan      |
| Window separator  | -          | -          | tan      |
| Search match      | yellow     | bg         | -        |
| Match paren       | -          | yellow     | -        |

---

## Design Decisions

### Why yellow for functions?

Most themes use blue as their primary accent. Ember uses yellow instead. Functions are frequent and important — they get the brightest color.

### Why blue for types?

Blue provides contrast against the warm tones and makes type annotations easy to spot.

### Why separate git colors?

Git status is functional UI. Using orange for "changed" was too similar to red for "deleted". Blue for changes is distinct and follows common conventions.

### Why dim operators?

Reduces visual noise. Important tokens (functions, keywords, types) stand out more.

### Language-specific overrides

Some treesitter grammars tag things unexpectedly. Lua tags `{}` as `@constructor`, so we override `@constructor.lua` specifically rather than changing the global rule.
