# PureScript Migration

This project has been successfully migrated from TypeScript/Next.js to PureScript with Halogen.

## Structure

- `src/Main.purs` - Main entry point
- `src/App/Root.purs` - Root component
- `src/purs/Components/` - PureScript components
- `src/purs/Store/` - Application state management
- `spago.dhall` - PureScript project configuration
- `packages.dhall` - Package set configuration

## Scripts

- `npm run dev` - Build and serve for development
- `npm run build` - Build for production
- `npm run purs:build` - Build PureScript only
- `npm run purs:bundle` - Bundle with esbuild
- `npm run purs:watch` - Watch mode for development
- `npm run purs:serve` - Serve the built application

## Features Implemented

- ✅ Basic Halogen application setup
- ✅ Header component with theme toggle
- ✅ Theme state management (light/dark mode)
- ✅ Build and bundle pipeline
- ✅ Development server

## Next Steps

To continue migration:
1. Convert remaining React components to Halogen
2. Add routing with purescript-routing
3. Migrate MDX blog functionality
4. Add CSS-in-JS or styled components equivalent