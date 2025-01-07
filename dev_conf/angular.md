# Angular Setup and Management Guide

## Updating Node.js and npm

### Using nvm

1. Check available Node.js versions:
   ```bash
   nvm ls-remote
   ```

2. Install the latest version of Node.js:
   ```bash
   nvm install node
   ```
   Or specify a version:
   ```bash
   nvm install 20.17.0
   ```

3. Use the installed version:
   ```bash
   nvm use node
   ```
   Or:
   ```bash
   nvm use 20.17.0
   ```

4. Verify Node.js and npm versions:
   ```bash
   node -v
   npm -v
   ```

5. Update npm to the latest version:
   ```bash
   npm install -g npm@latest
   ```

### If nvm is not installed

1. Install nvm:
   ```bash
   curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
   ```

2. Reload the shell configuration:
   ```bash
   source ~/.bashrc
   ```

## Updating Angular CLI

1. Uninstall the old version of Angular CLI (if needed):
   ```bash
   npm uninstall -g @angular/cli
   ```

2. Install the latest version of Angular CLI:
   ```bash
   npm install -g @angular/cli@latest
   ```

3. Update Angular in your project:
   ```bash
   ng update @angular/cli @angular/core
   ```

4. Update all Angular packages:
   ```bash
   ng update
   ```

5. Check Angular versions:
   ```bash
   ng version
   ```

## Creating an Angular Workspace and Application

### Create a new application:
```bash
ng new my-app
```

If you encounter `app.module.ts` errors, use the following:
```bash
ng new my-app --no-standalone
```

## Generating Components and Services

### Generate a Component
```bash
ng generate component component-name
```
Or shorthand:
```bash
ng g c component-name
```

### Generate a Service
```bash
ng generate service service-name
```
Or shorthand:
```bash
ng g s service-name
```
