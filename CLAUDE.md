# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Development Commands

### Build & Development
- `npm run build` - Build PureScript application and bundle to `dist/index.js` (minified)
- `npm run dev` - Build and serve application on http://localhost:3000
- `npm run watch` - Build with watch mode for development
- `npm run serve` - Serve the built application
- `npm run format` - Format code with Prettier

### Testing
- Currently no test commands configured - tests would use PureScript's test framework

## Architecture Overview

This is a **PureScript + Halogen** single-page application that has been migrated from TypeScript/Next.js. The application uses a component-based architecture with functional reactive programming patterns.

### Core Architecture
- **Entry Point**: `src/Main.purs` - Bootstraps the Halogen application
- **Root Component**: `src/App/Root.purs` - Main application component managing global state and layout
- **Component System**: Halogen components with HTML generation and event handling
- **State Management**: Local component state with theme management in `Store.Theme`

### Project Structure
```
src/
├── Main.purs              # Application entry point
├── App/Root.purs          # Root component with sidebar navigation
├── purs/
│   ├── Components/        # Reusable UI components
│   │   ├── Icons.purs     # Font Awesome icon components
│   │   └── Header.purs    # Legacy header (may be removed)
│   ├── Pages/             # Page components for multi-page structure
│   │   ├── Home.purs      # Landing page with navigation buttons
│   │   ├── Developers.purs # Technical documentation page
│   │   └── General.purs   # General audience information page
│   ├── Store/
│   │   └── Theme.purs     # Theme state and light/dark mode logic
│   ├── Types/
│   │   └── Page.purs      # Page routing types
│   └── Utils/             # Utility modules (currently empty)
```

### UI/UX Architecture
- **Fixed Sidebar Navigation**: 200px width sidebar with navigation items and theme toggle
- **Multi-Page Structure**: Three main pages (Home, Developers, General) with client-side navigation
- **Theme System**: Light/dark mode toggle with consistent color schemes
- **Icon System**: Font Awesome icons loaded via CDN with PureScript wrapper components
- **Responsive Design**: CSS-in-JS styling approach with inline styles

### Key Components
1. **Root Component** (`App.Root`): 
   - Manages global application state (theme, current page)
   - Renders fixed sidebar and main content area
   - Handles page navigation actions

2. **Page Components**:
   - `Home`: Simple landing page with two navigation buttons
   - `Developers`: Technical documentation with architecture details, API examples, testing info
   - `General`: User-friendly overview with features, benefits, FAQ

3. **Icon System** (`Components.Icons`):
   - Unified Font Awesome icon components
   - Consistent sizing and styling across the application

### State Management
- **Theme State**: Centralized theme management with light/dark mode
- **Page Navigation**: Simple enum-based routing without URL updates
- **Component State**: Local state management using Halogen's built-in state system

## Development Workflow

### Code Conventions
- **PureScript Style**: Functional programming patterns, type safety, immutable data
- **Naming**: PascalCase for modules, camelCase for functions and values
- **Imports**: Explicit import lists, qualified imports for common modules
- **Styling**: Inline CSS-in-JS approach using HP.style with string concatenation

### Git Workflow
- Uses **Lefthook** for git hooks with Prettier formatting and commitlint
- **Conventional Commits** required: `feat:`, `fix:`, `docs:`, `style:`, `refactor:`, `test:`, `chore:`
- Pre-commit hooks run Prettier on staged files
- Post-merge hooks run `bun install` to update dependencies

### Package Management
- **Spago** for PureScript package management (configured in `spago.yaml`)
- **npm/bun** for JavaScript tooling dependencies
- Core dependencies: `halogen`, `aff`, `effect`, `prelude`, `maybe`, `strings`

### Build System
- **Spago** compiles PureScript to JavaScript
- Bundles to single `dist/index.js` file
- Development server uses `http-server` on port 3000
- No complex webpack/bundler configuration needed

## Important Notes

### Font Awesome Integration
- Uses Font Awesome 6.4.0 via CDN link in `index.html`
- Icon components in `Components.Icons` provide type-safe wrappers
- Icons are rendered as `<i>` elements with Font Awesome CSS classes

### CSS & Styling
- Global CSS reset applied in `index.html` to remove default margins/padding
- No external CSS framework - all styling via inline styles
- Theme colors managed through centralized theme state
- Responsive design through CSS Grid and Flexbox

### Navigation System
- Client-side only (no URL routing)
- Page state managed in root component
- Navigation triggered through component actions
- Could be extended with `purescript-routing` for URL-based routing

This application represents a successful migration from React/Next.js to PureScript/Halogen while maintaining the same user-facing functionality.