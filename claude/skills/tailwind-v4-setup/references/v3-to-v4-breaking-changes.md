# Tailwind CSS v3 to v4 Breaking Changes

Quick reference for all breaking changes when upgrading from Tailwind CSS v3 to v4.

## Installation Changes

| v3 | v4 |
|---|---|
| `npm install -D tailwindcss` | `npm install tailwindcss @tailwindcss/postcss` OR `@tailwindcss/vite` |
| `tailwindcss` as PostCSS plugin | Use `@tailwindcss/postcss` plugin |
| `postcss.config.js` with `tailwindcss` | `postcss.config.mjs` with `'@tailwindcss/postcss'` |
| Separate `postcss-import`, `autoprefixer` | Built-in, remove these dependencies |

## Import Syntax

| v3 | v4 |
|---|---|
| `@tailwind base;` <br> `@tailwind components;` <br> `@tailwind utilities;` | `@import "tailwindcss";` |

## Configuration

| v3 | v4 |
|---|---|
| `tailwind.config.js` | CSS `@theme` directive |
| `content: ["./src/**/*.{html,js}"]` | Auto-detected (or `@source` directive) |
| `theme.extend.colors.brand = "#3b82f6"` | `@theme { --color-brand: #3b82f6; }` |
| `theme.extend.fontFamily.display = ["Satoshi"]` | `@theme { --font-display: "Satoshi", sans-serif; }` |
| `resolveConfig()` helper | Use CSS variables directly with `getComputedStyle()` |

## Renamed Utilities

### Shadow Scale
| v3 | v4 |
|---|---|
| `shadow-sm` | `shadow-xs` |
| `shadow` | `shadow-sm` |
| `shadow-md` | `shadow-md` (unchanged) |
| `shadow-lg` | `shadow-lg` (unchanged) |

### Blur Scale
| v3 | v4 |
|---|---|
| `blur-sm` | `blur-xs` |
| `blur` | `blur-sm` |

### Rounded Scale
| v3 | v4 |
|---|---|
| `rounded-sm` | `rounded-xs` |
| `rounded` | `rounded-sm` |

### Outline
| v3 | v4 |
|---|---|
| `outline-none` | `outline-hidden` (keeps a11y behavior) <br> `outline-none` (now truly removes outline) |

### Ring Width
| v3 | v4 |
|---|---|
| `ring` (3px) | `ring-3` <br> `ring` is now 1px |

## Removed Utilities

| Deprecated v3 | v4 Replacement |
|---|---|
| `bg-opacity-*` | Use `/` modifier: `bg-black/50` |
| `text-opacity-*` | Use `/` modifier: `text-white/50` |
| `border-opacity-*` | Use `/` modifier: `border-red-500/50` |
| `divide-opacity-*` | Use `/` modifier: `divide-gray-200/50` |
| `ring-opacity-*` | Use `/` modifier: `ring-blue-500/50` |
| `placeholder-opacity-*` | Use `/` modifier: `placeholder-gray-400/50` |
| `flex-shrink-*` | Use `shrink-*` |
| `flex-grow-*` | Use `grow-*` |
| `overflow-ellipsis` | Use `text-ellipsis` |
| `decoration-slice` | Use `box-decoration-slice` |
| `decoration-clone` | Use `box-decoration-clone` |

## Behavior Changes

### Default Border Color
- **v3**: Borders defaulted to configured `gray-200`
- **v4**: Borders default to `currentColor`

**Migration**: Explicitly specify border color
```html
<!-- Before -->
<div class="border">...</div>

<!-- After -->
<div class="border border-gray-200">...</div>
```

### Default Ring Color
- **v3**: Ring defaulted to `blue-500`
- **v4**: Ring defaults to `currentColor`

**Migration**: Explicitly specify ring color
```html
<!-- Before -->
<button class="focus:ring">...</button>

<!-- After -->
<button class="focus:ring-3 ring-blue-500">...</button>
```

### Default Placeholder Color
- **v3**: Used configured `gray-400`
- **v4**: Uses current text color at 50% opacity

### Button Cursor
- **v3**: `cursor: pointer`
- **v4**: `cursor: default` (browser default)

### Hover Variant
- **v3**: Applied on tap for touch devices
- **v4**: Only applies when `(hover: hover)` is true (doesn't trigger on touch)

## Syntax Changes

### Important Modifier
- **v3**: `!` at beginning (after variants): `hover:bg-red-500!`
- **v4**: `!` at very end: `bg-red-500/50!`

### Variant Stacking Order
- **v3**: Right-to-left: `first:*:pt-0`
- **v4**: Left-to-right: `*:first:pt-0`

### CSS Variables in Arbitrary Values
- **v3**: Square brackets: `bg-[--my-var]`
- **v4**: Parentheses: `bg-(--my-var)`

### Grid Template Arbitrary Values
- **v3**: Commas: `grid-cols-[max-content,auto]`
- **v4**: Underscores: `grid-cols-[max-content_auto]`

## Selector Changes

### Space-X/Y
```css
/* v3 */
.space-y-4 > :not([hidden]) ~ :not([hidden]) {
  margin-top: 1rem;
}

/* v4 */
.space-y-4 > :not(:last-child) {
  margin-bottom: 1rem;
}
```

**Impact**: If adding custom margins to children, layout may change.

### Divide-X/Y
```css
/* v3 */
.divide-y-4 > :not([hidden]) ~ :not([hidden]) {
  border-top-width: 4px;
}

/* v4 */
.divide-y-4 > :not(:last-child) {
  border-bottom-width: 4px;
}
```

## Transform Properties

Transform utilities now use individual CSS properties (`rotate`, `scale`, `translate`) instead of `transform`.

### Resetting Transforms
```html
<!-- v3 -->
<button class="scale-150 focus:transform-none">

<!-- v4 -->
<button class="scale-150 focus:scale-none">
```

### Transitioning
```html
<!-- v3 - Including 'transform' worked -->
<button class="transition-[opacity,transform] hover:scale-150">

<!-- v4 - Must include individual properties -->
<button class="transition-[opacity,scale] hover:scale-150">
```

## Configuration Features Removed

- `corePlugins` option
- `safelist` option (use `@source inline()` instead)
- `separator` option
- JavaScript config files (must load with `@config` directive)
- `resolveConfig` helper function

## Color System

- **v3**: Used `rgb()` color space
- **v4**: Uses `oklch()` for wider gamut and more vivid colors

### Gradient Naming
- **v3**: `bg-gradient-to-r`
- **v4**: `bg-linear-to-r` (but `bg-gradient-to-r` still works for compatibility)

## Container Queries

No longer need `@tailwindcss/container-queries` plugin:

```html
<!-- v3: Required plugin -->
<div class="container">
  <div class="@sm:grid-cols-3">...</div>
</div>

<!-- v4: Built-in -->
<div class="@container">
  <div class="@sm:grid-cols-3">...</div>
</div>
```

## Prefix Usage

Prefixes now look like variants and are always at the beginning:

```html
<!-- v3 -->
<div class="tw-flex hover:tw-bg-red-500">

<!-- v4 -->
<div class="tw:flex tw:hover:bg-red-500">
```

## Framework-Specific Changes

### Vue/Svelte/CSS Modules with @apply
Use `@reference` instead of `@import`:

```vue
<!-- v3 -->
<style>
  @import "../../app.css";
  h1 { @apply text-2xl; }
</style>

<!-- v4 -->
<style>
  @reference "../../app.css";
  h1 { @apply text-2xl; }
</style>
```

### Sass/Less/Stylus
Tailwind v4 **does not support** CSS preprocessors. Use Tailwind as your preprocessor.

## Browser Requirements

- **v3**: Supported older browsers
- **v4**: Requires Safari 16.4+, Chrome 111+, Firefox 128+

Continue using v3.4 if you need to support older browsers.

## Quick Migration Checklist

1. Update dependencies to v4 packages
2. Convert `tailwind.config.js` to `@theme` in CSS
3. Replace `@tailwind` directives with `@import "tailwindcss"`
4. Update PostCSS/Vite configuration
5. Run `npx @tailwindcss/upgrade` to automate class name updates
6. Manually fix any remaining issues:
   - Border colors (add explicit colors)
   - Ring utilities (update widths)
   - Important modifiers (move to end)
   - CSS variables in arbitrary values (use parentheses)
   - Grid templates (use underscores)
7. Test all components in browser
8. Update any third-party plugins for v4 compatibility
