# Complete Vite + React + Tailwind v4 Example

This is a complete, working example of Tailwind CSS v4 with Vite and React.

## Project Structure

```
vite-react/
├── package.json
├── vite.config.js
├── postcss.config.js  (NOT needed with @tailwindcss/vite)
├── index.html
├── src/
│   ├── main.jsx
│   ├── App.jsx
│   └── index.css
└── tailwind.config.js  (NOT needed in v4)
```

## Installation

### 1. Create Project

```bash
npm create vite@latest my-app -- --template react
cd my-app
```

### 2. Install Tailwind v4

```bash
npm install tailwindcss @tailwindcss/vite
```

**Note**: Do NOT install `@tailwindcss/postcss` when using the Vite plugin.

### 3. Configure Vite

Update `vite.config.js`:

```javascript
import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'
import tailwindcss from '@tailwindcss/vite'

export default defineConfig({
  plugins: [
    react(),
    tailwindcss(),
  ],
})
```

### 4. Import Tailwind CSS

In `src/index.css`:

```css
@import "tailwindcss";

/* Custom theme configuration */
@theme {
  /* Custom colors using OKLCH */
  --color-brand-500: oklch(0.5 0.15 250);
  --color-brand-600: oklch(0.45 0.15 250);

  /* Custom fonts */
  --font-display: 'Inter', system-ui, sans-serif;

  /* Custom spacing */
  --spacing-section: 2rem;
}

/* Custom component styles */
.btn {
  @apply rounded-lg px-4 py-2 font-semibold transition-all;
}

.btn-primary {
  @apply btn bg-brand-500 text-white hover:bg-brand-600;
}
```

### 5. Import CSS in App

In `src/main.jsx`:

```javascript
import React from 'react'
import ReactDOM from 'react-dom/client'
import './index.css' // Import Tailwind CSS
import App from './App.jsx'

ReactDOM.createRoot(document.getElementById('root')).render(
  <React.StrictMode>
    <App />
  </React.StrictMode>,
)
```

## Example Usage

In `src/App.jsx`:

```jsx
function App() {
  return (
    <div className="min-h-screen bg-gray-50 p-8">
      <div className="mx-auto max-w-4xl">
        <h1 className="text-4xl font-bold text-gray-900">
          Tailwind v4 + Vite + React
        </h1>

        <p className="mt-4 text-lg text-gray-600">
          This is a complete working example.
        </p>

        <div className="mt-8 flex gap-4">
          <button className="btn-primary">
            Primary Button
          </button>
          <button className="btn border border-gray-300 bg-white text-gray-700 hover:bg-gray-50">
            Secondary Button
          </button>
        </div>

        <div className="mt-8 grid grid-cols-1 gap-6 md:grid-cols-2 lg:grid-cols-3">
          {[1, 2, 3].map((i) => (
            <div key={i} className="rounded-lg border border-gray-200 bg-white p-6 shadow-sm">
              <h3 className="text-xl font-semibold text-gray-900">Card {i}</h3>
              <p className="mt-2 text-gray-600">
                This card uses Tailwind utilities.
              </p>
            </div>
          ))}
        </div>
      </div>
    </div>
  )
}

export default App
```

## package.json

```json
{
  "name": "vite-react-tailwind-v4",
  "private": true,
  "version": "0.0.0",
  "type": "module",
  "scripts": {
    "dev": "vite",
    "build": "vite build",
    "preview": "vite preview"
  },
  "dependencies": {
    "react": "^18.3.1",
    "react-dom": "^18.3.1"
  },
  "devDependencies": {
    "@tailwindcss/vite": "^4.0.0",
    "@vitejs/plugin-react": "^4.3.4",
    "tailwindcss": "^4.0.0",
    "vite": "^6.0.0"
  }
}
```

## Running the Project

```bash
# Install dependencies
npm install

# Start dev server
npm run dev

# Build for production
npm run build
```

## Key Points

1. **No PostCSS config needed**: The `@tailwindcss/vite` plugin handles everything
2. **No tailwind.config.js**: Use `@theme` in CSS instead
3. **No content array**: Tailwind auto-detects your files
4. **Single import**: Just `@import "tailwindcss"`
5. **CSS-first config**: All customization in CSS with `@theme`

## Troubleshooting

### Styles not loading

Make sure:
1. You're using `@tailwindcss/vite` (not `@tailwindcss/postcss`)
2. CSS file is imported in `main.jsx`
3. Vite dev server is running

### Build errors

If you see errors about `tailwindcss` PostCSS plugin:
1. Remove any PostCSS config files
2. Ensure you're using `@tailwindcss/vite` in `vite.config.js`
3. Don't use `tailwindcss` directly as a PostCSS plugin

### Custom theme not working

Ensure `@theme` is defined after `@import "tailwindcss"`:

```css
@import "tailwindcss";

@theme {
  /* Your theme here */
}
```

## Upgrading from v3

If migrating an existing Vite + React project:

1. Remove old dependencies:
```bash
npm uninstall tailwindcss postcss autoprefixer
```

2. Install v4:
```bash
npm install tailwindcss @tailwindcss/vite
```

3. Delete `tailwind.config.js` and `postcss.config.js`

4. Update `vite.config.js` to use `@tailwindcss/vite`

5. Replace `@tailwind` directives with `@import "tailwindcss"`

6. Convert `tailwind.config.js` to `@theme` in CSS

7. Run the upgrade tool for automated class name updates:
```bash
npx @tailwindcss/upgrade
```
