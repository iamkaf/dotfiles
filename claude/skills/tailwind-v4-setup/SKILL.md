---
name: tailwind-v4-setup
description: This skill should be used when the user asks to "setup Tailwind v4", "install Tailwind CSS v4", "configure Tailwind v4", "migrate to Tailwind v4", "upgrade from Tailwind v3 to v4", or needs help with Tailwind CSS version 4 installation, @theme configuration, or project integration.
version: 0.1.0
---

# Tailwind CSS v4 Setup

This skill provides guidance for installing, configuring, and migrating to Tailwind CSS v4. Tailwind v4 introduces a new CSS-first configuration approach, simplified installation, and significant performance improvements.

## Key Concepts

### What's New in Tailwind v4

Released January 22, 2025, Tailwind CSS v4 includes:

- **CSS-first configuration**: Use `@theme` directive in CSS instead of `tailwind.config.js`
- **Simplified installation**: Just two packages (`tailwindcss` + integration package)
- **Single import**: `@import "tailwindcss"` replaces `@tailwind` directives
- **Automatic content detection**: No `content` array configuration needed
- **Vite plugin**: First-class `@tailwindcss/vite` plugin for better performance
- **Modern CSS**: Uses `@property`, `color-mix()`, cascade layers, and OKLCH colors
- **Upgrade tool**: `npx @tailwindcss/upgrade` automates v3 to v4 migration

### Installation Packages

Tailwind v4 uses modular packages:

- **`tailwindcss`** - Core framework (always required)
- **`@tailwindcss/postcss`** - PostCSS plugin (for Next.js, Angular, Webpack)
- **`@tailwindcss/vite`** - Vite plugin (recommended for Vite projects)
- **`@tailwindcss/cli`** - Standalone CLI tool

**Important**: In v4, `tailwindcss` is NOT a PostCSS plugin. Use `@tailwindcss/postcss` instead.

## FIRST: Verify Setup Type

Before proceeding, determine the installation scenario:

```
AskUserQuestion or check:
- What build tool are you using? (Vite, Next.js, Webpack, None)
- Is this a new project or migrating from v3?
- What framework? (React, Vue, Svelte, Next.js, etc.)
```

**This determines which packages to install and configuration approach.**

## Key Guidelines

- **Use `@tailwindcss/vite` for Vite** - Not `@tailwindcss/postcss` (better performance)
- **Use `@tailwindcss/postcss` for Next.js** - Not the Vite plugin
- **`@import "tailwindcss"` replaces `@tailwind` directives** - New import syntax
- **No `tailwind.config.js` needed** - Use `@theme` in CSS instead
- **No `content` array** - Auto-detection works via `.gitignore` heuristics
- **OKLCH for colors** - Use OKLCH for wider gamut and consistency
- **Run upgrade tool for migrations** - `npx @tailwindcss/upgrade` automates v3→v4

## Quick Reference

| Scenario | Packages | Command |
|----------|----------|---------|
| New Vite project | `tailwindcss` + `@tailwindcss/vite` | `npm install tailwindcss @tailwindcss/vite` |
| New Next.js project | `tailwindcss` + `@tailwindcss/postcss` | `npm install tailwindcss @tailwindcss/postcss` |
| Standalone CLI | `tailwindcss` + `@tailwindcss/cli` | `npm install tailwindcss @tailwindcss/cli` |
| Upgrade v3→v4 | Run upgrade tool | `npx @tailwindcss/upgrade` |

| File | v3 Syntax | v4 Syntax |
|------|-----------|-----------|
| CSS import | `@tailwind base;` etc. | `@import "tailwindcss";` |
| Config | `tailwind.config.js` | `@theme { ... }` in CSS |
| PostCSS | `tailwindcss` plugin | `@tailwindcss/postcss` plugin |
| Vite config | PostCSS approach | `@tailwindcss/vite` plugin |

| Breaking Change | v3 | v4 |
|-----------------|-----|-----|
| Import | `@tailwind base;` | `@import "tailwindcss";` |
| shadow-sm | `shadow-sm` | `shadow-xs` |
| shadow | `shadow` | `shadow-sm` |
| outline-none | `outline-none` | `outline-hidden` |
| ring width | 3px default | 1px default (`ring-3` for old) |
| border color | gray-200 default | currentColor default |

## Project Setup

### Vite Integration (Recommended)

For Vite projects, use the dedicated Vite plugin:

1. **Install dependencies**:

```bash
npm install tailwindcss @tailwindcss/vite
```

2. **Configure Vite**:

Update `vite.config.js` or `vite.config.ts`:

```js
import { defineConfig } from 'vite'
import tailwindcss from '@tailwindcss/vite'

export default defineConfig({
  plugins: [
    tailwindcss(),
  ],
})
```

3. **Import Tailwind CSS**:

In your CSS entry point (e.g., `src/index.css`, `src/style.css`):

```css
@import "tailwindcss";
```

4. **Import CSS in your app**:

```js
import './index.css'
```

**Note**: When using `@tailwindcss/vite`, do NOT use PostCSS configuration. The Vite plugin replaces the PostCSS approach.

### PostCSS Integration

For frameworks like Next.js or when using PostCSS directly:

1. **Install dependencies**:

```bash
npm install tailwindcss @tailwindcss/postcss
```

2. **Configure PostCSS**:

Create `postcss.config.mjs`:

```js
export default {
  plugins: {
    '@tailwindcss/postcss': {},
  },
}
```

Or use array syntax:

```js
export default {
  plugins: ['@tailwindcss/postcss'],
}
```

3. **Import Tailwind CSS**:

```css
@import "tailwindcss";
```

**Important**: Do NOT use `tailwindcss` directly as a PostCSS plugin. This is a common v3 to v4 migration error.

### Next.js Integration

For Next.js projects (App Router):

1. **Install dependencies**:

```bash
npm install tailwindcss @tailwindcss/postcss
```

2. **Configure PostCSS**:

Create `postcss.config.mjs`:

```js
export default {
  plugins: {
    '@tailwindcss/postcss': {},
  },
}
```

3. **Create globals CSS**:

In `app/globals.css`:

```css
@import "tailwindcss";
```

4. **Import in layout**:

In `app/layout.js` or `app/layout.tsx`:

```js
import './globals.css'
```

### Standalone CLI

For projects without a build tool:

1. **Install CLI**:

```bash
npm install -D tailwindcss @tailwindcss/cli
```

2. **Build CSS**:

```bash
npx @tailwindcss/cli -i src/input.css -o dist/output.css --watch
```

## Theme Configuration

### Using the @theme Directive

Tailwind v4 uses CSS-based theming. Define custom themes directly in your CSS file:

```css
@import "tailwindcss";

@theme {
  /* Custom colors using OKLCH */
  --color-brand-500: oklch(0.5 0.15 250);
  --color-accent-300: oklch(0.85 0.12 330);

  /* Custom fonts */
  --font-display: "Satoshi", sans-serif;
  --font-mono: "Fira Code", monospace;

  /* Custom spacing */
  --spacing-unit: 0.5rem;

  /* Custom breakpoints */
  --breakpoint-3xl: 1920px;

  /* Custom easing */
  --ease-fluid: cubic-bezier(0.3, 0, 0, 1);
}
```

### CSS Variables are Automatically Generated

All `@theme` values become CSS variables:

```css
/* Generated automatically: */
:root {
  --color-brand-500: oklch(0.5 0.15 250);
  --color-accent-300: oklch(0.85 0.12 330);
  --font-display: "Satoshi", sans-serif;
  /* ... */
}
```

Access these variables anywhere:

```css
.custom-element {
  background: var(--color-brand-500);
}
```

### Extending Default Theme

The default theme is always included. Use `@theme` to add or override values:

```css
@theme {
  /* Add new colors */
  --color-neon-blue: #00f3ff;

  /* Override default spacing */
  --spacing-scale: 0.5rem;

  /* Add custom animations */
  --animate-float: float 3s ease-in-out infinite;
}

@keyframes float {
  0%, 100% { transform: translateY(0); }
  50% { transform: translateY(-10px); }
}
```

### Dark Mode Setup

Tailwind v4 respects system preferences by default. For class-based dark mode:

```html
<html class="dark">
```

Customize dark mode colors using media queries:

```css
@theme {
  --color-background: white;
  --color-text: black;
}

@media (prefers-color-scheme: dark) {
  @theme {
    --color-background: black;
    --color-text: white;
  }
}
```

## Migration from Tailwind v3

### Using the Automated Upgrade Tool

Tailwind provides an automated upgrade tool for most v3 to v4 migrations:

```bash
npx @tailwindcss/upgrade
```

**Requirements**: Node.js 20 or higher

**Recommendation**: Run in a new branch, review the diff, and test thoroughly.

The upgrade tool handles:
- Updating dependencies
- Converting `tailwind.config.js` to CSS `@theme`
- Updating class names for breaking changes
- Removing deprecated utilities

### Manual Migration Steps

If migrating manually or the upgrade tool can't handle everything:

1. **Update dependencies**:

```bash
# Remove v3 packages
npm uninstall tailwindcss postcss-import autoprefixer

# Install v4 packages
npm install tailwindcss @tailwindcss/postcss
# OR for Vite:
npm install tailwindcss @tailwindcss/vite
```

2. **Convert tailwind.config.js to @theme**:

Before (v3 `tailwind.config.js`):
```js
module.exports = {
  theme: {
    extend: {
      colors: {
        brand: '#3b82f6',
      },
      fontFamily: {
        display: ['Satoshi', 'sans-serif'],
      },
    },
  },
}
```

After (v4 CSS):
```css
@import "tailwindcss";

@theme {
  --color-brand: #3b82f6;
  --font-display: 'Satoshi', sans-serif;
}
```

3. **Remove @tailwind directives**:

Before (v3):
```css
@tailwind base;
@tailwind components;
@tailwind utilities;
```

After (v4):
```css
@import "tailwindcss";
```

4. **Update PostCSS configuration**:

Remove old plugins:

```js
// postcss.config.mjs
export default {
  plugins: {
    // Remove these:
    // 'postcss-import': {},
    // 'tailwindcss': {},
    // 'autoprefixer': {},

    // Use this:
    '@tailwindcss/postcss': {},
  },
}
```

5. **Remove content array**:

Tailwind v4 auto-detects source files using `.gitignore` and heuristics. No `content` configuration needed.

If you need to add specific sources:

```css
@import "tailwindcss";
@source "../node_modules/@my-company/ui-lib";
```

### Breaking Changes in v4

#### Renamed Utilities

| v3 | v4 |
|---|---|
| `shadow-sm` | `shadow-xs` |
| `shadow` | `shadow-sm` |
| `drop-shadow-sm` | `drop-shadow-xs` |
| `drop-shadow` | `drop-shadow-sm` |
| `blur-sm` | `blur-xs` |
| `blur` | `blur-sm` |
| `backdrop-blur-sm` | `backdrop-blur-xs` |
| `backdrop-blur` | `backdrop-blur-sm` |
| `rounded-sm` | `rounded-xs` |
| `rounded` | `rounded-sm` |
| `outline-none` | `outline-hidden` |
| `ring` | `ring-3` (changed from 3px to 1px) |

#### Removed Deprecated Utilities

- `bg-opacity-*`, `text-opacity-*`, `border-opacity-*` → Use opacity modifiers like `bg-black/50`
- `flex-shrink-*` → Use `shrink-*`
- `flex-grow-*` → Use `grow-*`
- `overflow-ellipsis` → Use `text-ellipsis`

#### Default Border Color Change

In v3, borders defaulted to `gray-200`. In v4, borders default to `currentColor`.

Update code that depended on v3 behavior:

```html
<!-- v3 -->
<div class="border px-2">...</div>

<!-- v4 -->
<div class="border border-gray-200 px-2">...</div>
```

Or preserve v3 behavior:

```css
@layer base {
  *, ::before, ::after {
    border-color: var(--color-gray-200, currentColor);
  }
}
```

#### Default Ring Width Change

The `ring` utility changed from 3px to 1px:

```html
<!-- v3 -->
<button class="focus:ring ring-blue-500">...</button>

<!-- v4 -->
<button class="focus:ring-3 ring-blue-500">...</button>
```

#### Important Modifier Position

In v4, place `!important` modifier at the END of the class:

```html
<!-- v3 -->
<div class="flex! bg-red-500!">

<!-- v4 -->
<div class="flex! bg-red-500/50!">
```

#### Variant Stacking Order

Stacked variants now apply left-to-right instead of right-to-left:

```html
<!-- v3 -->
<ul class="py-4 first:*:pt-0">

<!-- v4 -->
<ul class="py-4 *:first:pt-0">
```

#### CSS Variables in Arbitrary Values

Changed from square brackets to parentheses:

```html
<!-- v3 -->
<div class="bg-[--brand-color]">

<!-- v4 -->
<div class="bg-(--brand-color)">
```

#### Grid Template Arbitrary Values

Commas replaced with underscores:

```html
<!-- v3 -->
<div class="grid-cols-[max-content,auto]">

<!-- v4 -->
<div class="grid-cols-[max-content_auto]">
```

#### Hover on Mobile

The `hover` variant now only applies when the device supports hover (`(hover: hover)`). Touch devices won't trigger hover on tap.

#### Space-X and Divide-Y Selectors

Changed from general sibling combinator to `:not(:last-child)` for better performance:

```css
/* Before */
.space-y-4 > :not([hidden]) ~ :not([hidden]) {
  margin-top: 1rem;
}

/* Now */
.space-y-4 > :not(:last-child) {
  margin-bottom: 1rem;
}
```

#### Individual Transform Properties

Transform utilities now use individual CSS properties (`rotate`, `scale`, `translate`):

```html
<!-- Reset changed -->
<button class="scale-150 focus:scale-none">

<!-- Transitions need specific properties -->
<button class="transition-[scale,opacity] hover:scale-150">
```

#### Using @apply in Vue/Svelte/CSS Modules

Use `@reference` instead of `@import` to access theme variables:

```vue
<style>
  @reference "../../app.css";
  h1 {
    @apply text-2xl font-bold text-red-500;
  }
</style>
```

Or use CSS variables directly:

```vue
<style>
  h1 {
    color: var(--color-red-500);
  }
</style>
```

## Additional Resources

### Reference Files

- **`references/v3-to-v4-breaking-changes.md`** - Complete list of breaking changes
- **`references/theme-configuration.md`** - Detailed `@theme` directive reference
- **`references/framework-integrations.md`** - Setup guides for Next.js, Nuxt, SvelteKit, etc.

### Example Configurations

- **`examples/vite-react/`** - Vite + React setup
- **`examples/vite-vue/`** - Vite + Vue setup
- **`examples/next-app/`** - Next.js App Router setup
- **`examples/migrated-from-v3/`** - Example v3 to v4 migration
- **`examples/custom-theme/`** - Advanced theme configuration

### Scripts

- **`scripts/detect-v3-patterns.sh`** - Detect v3 patterns that need migration
- **`scripts/validate-theme.sh`** - Validate `@theme` configuration
- **`scripts/upgrade-checklist.sh`** - Pre-upgrade checklist

## Quick Start Checklist

### New Projects

- [ ] Install `tailwindcss` + `@tailwindcss/vite` (or `@tailwindcss/postcss`)
- [ ] Configure build tool (Vite/Next.js/PostCSS)
- [ ] Create CSS file with `@import "tailwindcss"`
- [ ] Define custom theme in `@theme` if needed
- [ ] Import CSS in application
- [ ] Test with basic Tailwind classes

### Migration from v3

- [ ] Create new branch for migration
- [ ] Run `npx @tailwindcss/upgrade` or migrate manually
- [ ] Update dependencies to v4
- [ ] Convert `tailwind.config.js` to CSS `@theme`
- [ ] Replace `@tailwind` directives with `@import "tailwindcss"`
- [ ] Update PostCSS/Vite configuration
- [ ] Update renamed utility classes
- [ ] Fix `border-*` and `ring` utilities
- [ ] Update important modifier positions
- [ ] Test all components in browser
- [ ] Update third-party plugins for v4 compatibility

## Troubleshooting

### Build Errors

**Error**: "It looks like you're trying to use tailwindcss directly as a PostCSS plugin"

**Solution**: Use `@tailwindcss/postcss` instead:

```js
// Wrong
plugins: { tailwindcss: {} }

// Correct
plugins: { '@tailwindcss/postcss': {} }
```

### Styles Not Applying

1. Verify `@import "tailwindcss"` is present
2. Check PostCSS/Vite configuration
3. Ensure CSS file is imported in your app
4. Inspect browser dev tools for CSS loading errors

### Upgrade Tool Issues

If the automated upgrade tool fails:

1. Ensure Node.js 20+ is installed
2. Clear node_modules: `rm -rf node_modules && npm install`
3. Migrate manually following the steps above
4. Check browser console for deprecation warnings

## Browser Support

Tailwind v4 requires:
- Safari 16.4+
- Chrome 111+
- Firefox 128+

The framework uses modern CSS features like `@property` and `color-mix()` that are not available in older browsers.

If you need to support older browsers, continue using Tailwind v3.4.

## Sources

- [Tailwind CSS v4.0 Announcement](https://tailwindcss.com/blog/tailwindcss-v4)
- [Official Installation Documentation](https://tailwindcss.com/docs/installation)
- [Framework Guides](https://tailwindcss.com/docs/installation/framework-guides)
- [Upgrade Guide](https://tailwindcss.com/docs/upgrade-guide)
- [Installing with PostCSS](https://tailwindcss.com/docs/installation/using-postcss)
- [Installing with Vite](https://tailwindcss.com/docs)
