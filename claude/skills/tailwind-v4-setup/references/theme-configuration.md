# Tailwind v4 Theme Configuration

Complete guide to configuring Tailwind CSS v4 themes using the `@theme` directive.

## @theme Directive

Tailwind v4 uses CSS for configuration instead of JavaScript. All customization happens in your CSS file using the `@theme` directive.

### Basic Structure

```css
@import "tailwindcss";

@theme {
  /* Custom theme values here */
}
```

## Theme Variables

### Colors

Define custom colors using any CSS color format (OKLCH recommended):

```css
@theme {
  /* Named colors */
  --color-brand: #3b82f6;
  --color-accent: rgb(168, 85, 247);
  --color-success: oklch(0.65 0.15 145);

  /* Color scales */
  --color-brand-50: oklch(0.95 0.05 250);
  --color-brand-100: oklch(0.90 0.08 250);
  --color-brand-200: oklch(0.85 0.10 250);
  --color-brand-300: oklch(0.80 0.12 250);
  --color-brand-400: oklch(0.70 0.14 250);
  --color-brand-500: oklch(0.60 0.15 250);
  --color-brand-600: oklch(0.50 0.15 250);
  --color-brand-700: oklch(0.40 0.15 250);
  --color-brand-800: oklch(0.30 0.15 250);
  --color-brand-900: oklch(0.20 0.15 250);

  /* With opacity */
  --color-brand-500/50: oklch(0.60 0.15 250 / 0.5);

  /* Semantic colors */
  --color-primary: var(--color-brand-500);
  --color-secondary: var(--color-accent);
}
```

### Fonts

Define custom font families:

```css
@theme {
  /* Font families */
  --font-sans: 'Inter', system-ui, sans-serif;
  --font-serif: 'Merriweather', Georgia, serif;
  --font-mono: 'Fira Code', 'Courier New', monospace;
  --font-display: 'Cal Sans', sans-serif;

  /* Font weights (if custom values needed) */
  --font-weight-thin: 100;
  --font-weight-extralight: 200;
  --font-weight-light: 300;
  --font-weight-normal: 400;
  --font-weight-medium: 500;
  --font-weight-semibold: 600;
  --font-weight-bold: 700;
  --font-weight-extrabold: 800;
  --font-weight-black: 900;
}
```

### Spacing

Custom spacing scale:

```css
@theme {
  /* Base spacing unit */
  --spacing: 0.25rem;

  /* Named spacing values */
  --spacing-xs: 0.25rem;
  --spacing-sm: 0.5rem;
  --spacing-md: 1rem;
  --spacing-lg: 1.5rem;
  --spacing-xl: 2rem;
  --spacing-2xl: 3rem;
  --spacing-3xl: 4rem;

  /* Semantic spacing */
  --spacing-section: var(--spacing-3xl);
  --spacing-container: var(--spacing-xl);
}
```

### Breakpoints

Custom responsive breakpoints:

```css
@theme {
  /* Breakpoints (min-width) */
  --breakpoint-sm: 640px;
  --breakpoint-md: 768px;
  --breakpoint-lg: 1024px;
  --breakpoint-xl: 1280px;
  --breakpoint-2xl: 1536px;
  --breakpoint-3xl: 1920px;
}
```

### Border Radius

Custom border radius values:

```css
@theme {
  --radius-sm: 0.125rem;
  --radius: 0.25rem;
  --radius-md: 0.375rem;
  --radius-lg: 0.5rem;
  --radius-xl: 0.75rem;
  --radius-2xl: 1rem;
  --radius-3xl: 1.5rem;
  --radius-full: 9999px;
}
```

### Shadows

Custom shadow values:

```css
@theme {
  --shadow-xs: 0 1px 2px rgb(0 0 0 / 0.05);
  --shadow-sm: 0 1px 3px rgb(0 0 0 / 0.1), 0 1px 2px rgb(0 0 0 / 0.06);
  --shadow: 0 4px 6px rgb(0 0 0 / 0.1), 0 2px 4px rgb(0 0 0 / 0.06);
  --shadow-md: 0 10px 15px rgb(0 0 0 / 0.1), 0 4px 6px rgb(0 0 0 / 0.05);
  --shadow-lg: 0 20px 25px rgb(0 0 0 / 0.1), 0 8px 10px rgb(0 0 0 / 0.04);
  --shadow-xl: 0 25px 50px rgb(0 0 0 / 0.25);
}
```

### Animation

Custom animations:

```css
@theme {
  /* Animation durations */
  --animate-duration-fast: 150ms;
  --animate-duration-normal: 300ms;
  --animate-duration-slow: 500ms;

  /* Animation timing */
  --animate-linear: linear;
  --animate-ease: ease;
  --animate-ease-in: ease-in;
  --animate-ease-out: ease-out;
  --animate-ease-in-out: ease-in-out;
  --animate-bounce: cubic-bezier(0.5, 0, 0.5, 1);
}

/* Define keyframes */
@keyframes fadeIn {
  from { opacity: 0; }
  to { opacity: 1; }
}

@keyframes slideIn {
  from { transform: translateY(-10px); opacity: 0; }
  to { transform: translateY(0); opacity: 1; }
}
```

### Z-Index

Custom z-index scale:

```css
@theme {
  --z-index-base: 0;
  --z-index-above: 10;
  --z-index-dropdown: 1000;
  --z-index-sticky: 1100;
  --z-index-fixed: 1200;
  --z-index-overlay: 1300;
  --z-index-modal: 1400;
  --z-index-popover: 1500;
  --z-index-tooltip: 1600;
}
```

## Extending vs Overriding

### Overriding Default Values

Replace default values entirely:

```css
@theme {
  /* Overrides default spacing unit */
  --spacing: 0.5rem; /* Default is 0.25rem */

  /* Overrides default font family */
  --font-sans: 'CustomFont', sans-serif;
}
```

### Adding New Values

Add new values without affecting defaults:

```css
@theme {
  /* New custom colors (doesn't affect default palette) */
  --color-brand-dark: oklch(0.3 0.15 250);
  --color-neon: oklch(0.7 0.25 180);

  /* New custom spacing */
  --spacing-gutter: 2.5rem;

  /* New custom breakpoint */
  --breakpoint-mobile: 480px;
}
```

## Using Theme Values

### In Tailwind Classes

Theme values automatically become Tailwind utilities:

```html
<!-- Colors -->
<div class="bg-brand-500 text-white">
  <h1 class="font-display text-xl">
    Custom font and color
  </h1>
</div>

<!-- Spacing -->
<div class="p-md m-xl">
  Padding and spacing
</div>

<!-- Responsive -->
<div class="grid-cols-1 md:grid-cols-2 lg:grid-cols-3">
  Custom breakpoints
</div>

<!-- Shadows -->
<div class="shadow-md rounded-lg">
  Custom shadow and radius
</div>
```

### As CSS Variables

All theme values are available as CSS variables:

```css
.custom-element {
  background: var(--color-brand-500);
  padding: var(--spacing-lg);
  font-family: var(--font-display);
  border-radius: var(--radius-lg);
  box-shadow: var(--shadow-md);
}
```

### In JavaScript

Access theme values using `getComputedStyle`:

```js
// Get a theme value
const styles = getComputedStyle(document.documentElement)
const brandColor = styles.getPropertyValue('--color-brand-500')
const spacingLg = styles.getPropertyValue('--spacing-lg')

// Use in animations
element.animate(
  { backgroundColor: [brandColor, '#ffffff'] },
  { duration: 300 }
)
```

## Dark Mode

### System Preference (Default)

Tailwind v4 uses system preference by default:

```html
<!-- Automatically respects prefers-color-scheme -->
<div class="dark:bg-gray-900 dark:text-white">
  Dark mode content
</div>
```

### Manual Dark Mode

Use class-based dark mode:

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

Add class to HTML:

```html
<html class="dark">
```

### Custom Dark Mode Colors

Define different values for dark mode:

```css
@theme {
  --color-card: #ffffff;
  --color-card-text: #1f2937;
}

@media (prefers-color-scheme: dark) {
  @theme {
    --color-card: #1f2937;
    --color-card-text: #f9fafb;
  }
}
```

## Dynamic Values

Tailwind v4 supports dynamic values without configuration:

```html
<!-- Any spacing value works -->
<div class="p-17 pr-29">Custom spacing</div>

<!-- Any grid size works -->
<div class="grid grid-cols-15">15 columns</div>

<!-- Any data attribute variant works -->
<div data-state="open" class="data-[state=open]:bg-blue-500">
  Dynamic variant
</div>
```

## Container Queries

Built-in container query support:

```html
<div class="@container">
  <div class="@sm:grid-cols-2 @lg:grid-cols-4">
    Responsive to container, not viewport
  </div>
</div>
```

Max-width container queries:

```html
<div class="@container">
  <div class="@max-md:grid-cols-1 @md:grid-cols-3">
    Maximum width breakpoints
  </div>
</div>
```

## Custom Utilities

Create custom utilities using `@utility`:

```css
@utility card {
  background: var(--color-white);
  border-radius: var(--radius-lg);
  padding: var(--spacing-lg);
  box-shadow: var(--shadow-md);
}

@utility flex-center {
  display: flex;
  align-items: center;
  justify-content: center;
}
```

Use them like Tailwind utilities:

```html
<div class="card">Custom card utility</div>
<div class="flex-center">Centered content</div>
```

## Complete Example

```css
@import "tailwindcss";

@theme {
  /* Colors */
  --color-primary: oklch(0.55 0.18 250);
  --color-primary-50: oklch(0.95 0.05 250);
  --color-primary-100: oklch(0.90 0.08 250);
  --color-primary-500: oklch(0.55 0.18 250);
  --color-primary-600: oklch(0.50 0.18 250);

  /* Typography */
  --font-sans: 'Inter', system-ui, sans-serif;
  --font-display: 'Cal Sans', sans-serif;

  /* Spacing */
  --spacing-xs: 0.25rem;
  --spacing-sm: 0.5rem;
  --spacing-md: 1rem;
  --spacing-lg: 1.5rem;
  --spacing-xl: 2rem;

  /* Breakpoints */
  --breakpoint-sm: 640px;
  --breakpoint-md: 768px;
  --breakpoint-lg: 1024px;

  /* Effects */
  --radius-lg: 0.5rem;
  --shadow-md: 0 10px 15px rgb(0 0 0 / 0.1);
}

/* Custom animations */
@keyframes fadeIn {
  from { opacity: 0; }
  to { opacity: 1; }
}

@keyframes slideUp {
  from { transform: translateY(20px); opacity: 0; }
  to { transform: translateY(0); opacity: 1; }
}

/* Custom utilities */
@utility card {
  @apply rounded-lg p-6 shadow-md bg-white;
}
```

## Best Practices

1. **Use OKLCH for colors**: Wider gamut, more consistent perceptual uniformity
2. **Group related values**: Use semantic names like `--color-*`, `--spacing-*`
3. **Reference other values**: Use `var()` to create semantic aliases
4. **Keep defaults when possible**: Only override what you need
5. **Use descriptive names**: `--color-primary` instead of `--color-blue`
6. **Document custom values**: Comment complex theme values
7. **Test in both light/dark modes**: Ensure colors work in both modes

## Troubleshooting

### Theme Not Working

- Ensure `@theme` comes after `@import "tailwindcss"`
- Check for syntax errors in CSS
- Verify variable names use correct prefix (e.g., `--color-*`)
- Check browser dev tools for generated CSS variables

### Values Not Generating Utilities

- Ensure proper naming convention: `--color-*`, `--spacing-*`, etc.
- Check for typos in variable names
- Verify CSS file is being imported

### Color Inconsistencies

- Use OKLCH for consistent color spaces
- Test colors on different displays
- Consider browser support for color-mix() and @property
