# React + Vite

## Deploying SmartHire on Netlify

The repository-root `netlify.toml` configures Netlify to install dependencies and
run the frontend build inside `smarthire-frontend`, then publish its generated
`dist` directory. Deploy the repository rather than uploading the source
`index.html` alone: that HTML loads `src/main.jsx`, which Vite must bundle for
production.

The deployment command explicitly runs `npm ci --include=dev` before the build
to install the locked dependencies, including Vite and its React plugin. This
also supports CLI deployments where frontend dependencies have not already
been installed, preventing a `vite: not found` failure.

The configuration also routes requests such as `/login`, `/register`, and
`/student/dashboard` to the application entry point so React Router can render
the existing pages when opened directly or refreshed. Existing static assets
are served normally. The frontend components, styling, and HTML are unchanged.

Netlify hosts the frontend, not the Java Spring Boot backend in
`smarthire-backend`. Backend-dependent features such as login and registration
require that backend to be deployed separately. Set `VITE_API_BASE_URL` in the
Netlify build environment to the backend's public API base URL, including its
`/api` path, and redeploy after changing it. Configure the backend to allow
requests from the Netlify site's origin. Without this setting, the frontend
defaults to `/api` on the current site, where no Java backend is hosted.

This template provides a minimal setup to get React working in Vite with HMR and some Oxlint rules.

Currently, two official plugins are available:

- [@vitejs/plugin-react](https://github.com/vitejs/vite-plugin-react/blob/main/packages/plugin-react) uses [Oxc](https://oxc.rs)
- [@vitejs/plugin-react-swc](https://github.com/vitejs/vite-plugin-react/blob/main/packages/plugin-react-swc) uses [SWC](https://swc.rs/)

## React Compiler

The React Compiler is not enabled on this template because of its impact on dev & build performances. To add it, see [this documentation](https://react.dev/learn/react-compiler/installation).

## Expanding the Oxlint configuration

If you are developing a production application, we recommend using TypeScript with type-aware lint rules enabled. Check out the [TS template](https://github.com/vitejs/vite/tree/main/packages/create-vite/template-react-ts) for information on how to integrate TypeScript and Oxlint's TypeScript related rules in your project.
