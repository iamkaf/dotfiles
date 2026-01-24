# Tailwind v3 to v4 Migration Checklist

Use this checklist when migrating an existing project from Tailwind CSS v3 to v4.

## Pre-Migration

### Preparation
- [ ] Create a new branch for migration: `git checkout -b upgrade-tailwind-v4`
- [ ] Ensure Node.js 20 or higher is installed
- [ ] Check browser support requirements (v4 needs Safari 16.4+, Chrome 111+, Firefox 128+)
- [ ] Review third-party plugins for v4 compatibility
- [ ] Commit or stash any uncommitted changes

### Backup
- [ ] Copy current `tailwind.config.js` for reference
- [ ] Document any custom theme values
- [ ] Note any custom utilities or variants
- [ ] Check for any PostCSS plugins that might conflict

## Migration

### 1. Update Dependencies

- [ ] Remove v3 packages:
  ```bash
  npm uninstall tailwindcss postcss-import autoprefixer
  ```

- [ ] Install v4 packages:

  For **PostCSS** (Next.js, Angular):
  ```bash
  npm install tailwindcss @tailwindcss/postcss
  ```

  For **Vite**:
  ```bash
  npm install tailwindcss @tailwindcss/vite
  ```

  For **CLI**:
  ```bash
  npm install tailwindcss @tailwindcss/cli
  ```

- [ ] Verify package versions in `package.json`

### 2. Update Build Configuration

**For Vite:**
- [ ] Add `@tailwindcss/vite` to `vite.config.js`:
  ```js
  import tailwindcss from '@tailwindcss/vite'
  export default { plugins: [tailwindcss()] }
  ```
- [ ] Remove PostCSS configuration (if exists)

**For PostCSS:**
- [ ] Update `postcss.config.mjs`:
  ```js
  export default {
    plugins: {
      '@tailwindcss/postcss': {},
    },
  }
  ```
- [ ] Remove `postcss-import` and `autoprefixer`

**For Next.js:**
- [ ] Update PostCSS config to use `@tailwindcss/postcss`
- [ ] Update globals.css import: `@import "tailwindcss";`

### 3. Convert CSS Imports

- [ ] Replace `@tailwind` directives in all CSS files:

  **Before:**
  ```css
  @tailwind base;
  @tailwind components;
  @tailwind utilities;
  ```

  **After:**
  ```css
  @import "tailwindcss";
  ```

- [ ] Search for `@tailwind` in all CSS files and replace

### 4. Convert Configuration

- [ ] Convert `tailwind.config.js` to `@theme` in CSS:

  **Before (JS):**
  ```js
  module.exports = {
    theme: {
      extend: {
        colors: {
          brand: '#3b82f6',
        },
      },
    },
  }
  ```

  **After (CSS):**
  ```css
  @theme {
    --color-brand: #3b82f6;
  }
  ```

- [ ] Convert `theme.extend.colors` → `--color-*`
- [ ] Convert `theme.extend.fontFamily` → `--font-*`
- [ ] Convert `theme.extend.spacing` → `--spacing-*`
- [ ] Convert `theme.extend.screens` → `--breakpoint-*`
- [ ] Convert any animation definitions

### 5. Remove Content Configuration

- [ ] Delete `content` array from config (auto-detected in v4)
- [ ] If specific sources needed, use `@source`:
  ```css
  @import "tailwindcss";
  @source "../node_modules/@my-company/ui-lib";
  ```

### 6. Run Upgrade Tool

- [ ] Run automated upgrade tool:
  ```bash
  npx @tailwindcss/upgrade
  ```

- [ ] Review the generated diff carefully
- [ ] Test the application
- [ ] Commit automated changes

### 7. Manual Code Updates

#### Renamed Utilities
- [ ] `shadow-sm` → `shadow-xs`
- [ ] `shadow` → `shadow-sm`
- [ ] `drop-shadow-sm` → `drop-shadow-xs`
- [ ] `drop-shadow` → `drop-shadow-sm`
- [ ] `blur-sm` → `blur-xs`
- [ ] `blur` → `blur-sm`
- [ ] `backdrop-blur-sm` → `backdrop-blur-xs`
- [ ] `backdrop-blur` → `backdrop-blur-sm`
- [ ] `rounded-sm` → `rounded-xs`
- [ ] `rounded` → `rounded-sm`
- [ ] `outline-none` → `outline-hidden` (if a11y needed)
- [ ] `ring` → `ring-3` (if 3px width needed)

#### Removed Utilities
- [ ] Replace `bg-opacity-*` with `/` modifier: `bg-black/50`
- [ ] Replace `text-opacity-*` with `/` modifier: `text-white/50`
- [ ] Replace `border-opacity-*` with `/` modifier
- [ ] Replace `divide-opacity-*` with `/` modifier
- [ ] Replace `ring-opacity-*` with `/` modifier
- [ ] Replace `placeholder-opacity-*` with `/` modifier
- [ ] Replace `flex-shrink-*` with `shrink-*`
- [ ] Replace `flex-grow-*` with `grow-*`
- [ ] Replace `overflow-ellipsis` with `text-ellipsis`

#### Behavior Changes
- [ ] Add explicit border colors (defaults to `currentColor` in v4)
- [ ] Add explicit ring colors (defaults to `currentColor` in v4)
- [ ] Update `outline-none` to `outline-hidden` for a11y
- [ ] Check button hover behavior (no hover on touch devices)

#### Syntax Changes
- [ ] Move `!important` to end of class: `bg-red-500!` instead of `!bg-red-500`
- [ ] Update variant stacking order: `*:first:pt-0` instead of `first:*:pt-0`
- [ ] Update CSS variables: `bg-(--var)` instead of `bg-[--var]`
- [ ] Update grid templates: `grid-cols-[a_b]` instead of `grid-cols-[a,b]`

#### Framework-Specific
- [ ] For Vue/Svelte/CSS modules: Use `@reference` instead of `@import` for `@apply`
- [ ] Remove any Sass/Less/Stylus preprocessing (not supported in v4)

## Post-Migration

### Testing
- [ ] Run development server: `npm run dev`
- [ ] Check browser console for errors
- [ ] Test all pages and components visually
- [ ] Test responsive breakpoints
- [ ] Test hover/focus states
- [ ] Test dark mode (if used)
- [ ] Test any custom components using `@apply`
- [ ] Test animations and transitions

### Build Verification
- [ ] Run production build: `npm run build`
- [ ] Check build output for warnings
- [ ] Preview production build: `npm run preview`
- [ ] Test production build in browser

### Performance
- [ ] Compare build times with v3
- [ ] Check bundle size
- [ ] Verify CSS is generated correctly

### Documentation
- [ ] Update team documentation
- [ ] Note any custom workarounds
- [ ] Document any remaining v3 patterns
- [ ] Update CI/CD dependencies if needed

## Rollback Plan

If migration fails:
1. `git checkout` your pre-migration branch
2. Restore `package.json` and lock file
3. Restore any configuration files
4. Run `npm install`
5. Document what failed for future attempts

## Common Issues

### Build Fails with "tailwindcss is not a PostCSS plugin"

**Cause**: Using `tailwindcss` directly in PostCSS config

**Fix**: Use `@tailwindcss/postcss` instead:
```js
// Wrong
plugins: { tailwindcss: {} }

// Correct
plugins: { '@tailwindcss/postcss': {} }
```

### Styles Not Applying

**Check**:
1. CSS file has `@import "tailwindcss"`
2. CSS file is imported in your app
3. PostCSS/Vite config is correct
4. No conflicting CSS imports

### Utilities Not Generated

**Check**:
1. Template files are not ignored by `.gitignore`
2. Use `@source` for additional sources if needed
3. Check for file extension issues

### Custom Theme Not Working

**Check**:
1. `@theme` comes after `@import "tailwindcss"`
2. Theme uses CSS custom property syntax: `--color-*`
3. No syntax errors in theme definition

## Success Criteria

Migration is complete when:
- [ ] All tests pass
- [ ] No visual regressions
- [ ] Build completes without errors
- [ ] Performance is equal or better than v3
- [ ] Team has reviewed and approved changes
- [ ] Documentation is updated

## Additional Resources

- [Official Upgrade Guide](https://tailwindcss.com/docs/upgrade-guide)
- [v4 Announcement](https://tailwindcss.com/blog/tailwindcss-v4)
- [Breaking Changes Reference](./v3-to-v4-breaking-changes.md)
