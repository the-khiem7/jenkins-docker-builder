# Documentation Setup Guide

This guide explains how to set up and deploy the JenkinsDock documentation site.

## Quick Start

The documentation is built with [Docsify](https://docsify.js.org/) and automatically deployed to GitHub Pages.

## Local Development

To preview the documentation locally:

### Option 1: Using docsify CLI

```bash
# Install docsify CLI globally
npm install -g docsify-cli

# Serve the documentation locally
docsify serve ./docs
```

Then open http://localhost:3000 in your browser.

### Option 2: Using npx (no installation required)

```bash
npx docsify-cli serve ./docs
```

### Option 3: Using Docker

```bash
docker run --rm -it -p 3000:3000 -v $(pwd)/docs:/docs docsify/cli serve
```

## Project Structure

```
jenkins-docker-builder/
├── docs/
│   ├── index.html          # Main entry point (Docsify config)
│   ├── _coverpage.md       # Landing page
│   ├── _sidebar.md         # Navigation sidebar
│   ├── README.md           # Home page content
│   ├── getting-started.md  # Quick reference
│   ├── jenkins-host-vs-container.md
│   ├── docker-in-docker.md
│   ├── custom-jenkins-image.md
│   ├── security-risks.md
│   ├── reverse-proxy.md
│   ├── resources.md
│   └── .nojekyll           # Prevents Jekyll processing
├── .github/
│   └── workflows/
│       └── deploy-docs.yml  # GitHub Actions deployment
└── README.md               # Main repository README
```

## Deployment

### Automatic Deployment (Recommended)

The documentation is automatically deployed to GitHub Pages when you push changes to the `main` branch:

```bash
git add docs/
git commit -m "docs: update documentation"
git push origin main
```

The GitHub Actions workflow will:
1. Detect changes in the `docs/` folder
2. Build the documentation artifact
3. Deploy to GitHub Pages

### Manual Deployment

To manually trigger deployment:

1. Go to the **Actions** tab in your GitHub repository
2. Select **Deploy Documentation to GitHub Pages** workflow
3. Click **Run workflow**
4. Select the branch and click **Run workflow**

## GitHub Pages Configuration

After the first deployment:

1. Go to **Settings** > **Pages** in your GitHub repository
2. Under **Source**, ensure it's set to **GitHub Actions**
3. Your documentation will be available at:
   `https://yourusername.github.io/jenkins-docker-builder/`

## Custom Domain (Optional)

To use a custom domain:

1. Create a `docs/CNAME` file with your domain:
   ```
   docs.yourdomain.com
   ```

2. Configure DNS records for your domain:
   ```
   docs.yourdomain.com.  CNAME  yourusername.github.io.
   ```

3. Update the documentation URL in the main README.md

## Customization

### Changing the Theme

Edit `docs/index.html` and change the theme:

```html
<!-- Available themes: core, core-dark, vue, buble, simple, pure -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/docsify@5/dist/themes/core-dark.min.css">
```

### Adding Plugins

Add plugins in `docs/index.html`:

```html
<!-- Search plugin (already included) -->
<script src="//cdn.jsdelivr.net/npm/docsify@5/lib/plugins/search.min.js"></script>

<!-- Pagination plugin (already included) -->
<script src="//cdn.jsdelivr.net/npm/docsify-pagination@latest/dist/docsify-pagination.min.js"></script>

<!-- Copy code plugin (already included) -->
<script src="//cdn.jsdelivr.net/npm/docsify-copy-code@2"></script>
```

### Updating Navigation

Edit `docs/_sidebar.md` to update the navigation menu:

```markdown
- **Section Name**
  - [Page Title](file.md)
```

### Adding New Pages

1. Create a new `.md` file in the `docs/` folder
2. Add the page to `docs/_sidebar.md`
3. Push changes to trigger automatic deployment

## Troubleshooting

### Documentation Not Deploying

1. Check the **Actions** tab for workflow errors
2. Ensure the `docs/` folder exists and contains `index.html`
3. Verify GitHub Pages is enabled in repository settings

### 404 Error After Deployment

1. Wait a few minutes for GitHub Pages to propagate
2. Ensure `.nojekyll` file exists in the `docs/` folder
3. Check that `index.html` is in the `docs/` folder

### Mermaid Diagrams Not Rendering

1. Ensure you're using the correct syntax:
   ```mermaid
   graph TD
       A --> B
   ```
2. Check browser console for JavaScript errors
3. Verify the Mermaid script is loaded in `index.html`

## Resources

- [Docsify Documentation](https://docsify.js.org/)
- [Docsify Configuration](https://docsify.js.org/#/configuration)
- [Docsify Plugins](https://github.com/docsifyjs/awesome-docsify)
- [GitHub Pages Documentation](https://docs.github.com/en/pages)
