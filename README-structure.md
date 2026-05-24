# Thesis book — Jupyter Book example

A minimal Jupyter Book site demonstrating the structure for a thesis-style technical documentation site (quantum computing + homomorphic encryption used as the running example).

## Layout

```
.
├── _config.yml              # Site settings
├── _toc.yml                 # Table of contents (sidebar navigation)
├── intro.md                 # Landing page
├── references.bib           # BibTeX bibliography
├── requirements.txt         # Python deps for building
├── chapters/
│   ├── quantum-basics.md
│   ├── he-basics.md
│   └── references.md
├── notebooks/
│   └── grover-demo.ipynb
└── .github/workflows/
    └── deploy.yml           # Auto-deploys on push to main
```

## Build locally

```bash
pip install -r requirements.txt
jupyter-book build .
```

Then open `_build/html/index.html` in a browser.

## Deploy to GitHub Pages

1. Create a GitHub repo and push this content.
2. In the repo, go to **Settings → Pages** and set **Source** to     **GitHub Actions**.
3. Edit `_config.yml`: set `repository.url` to your repo URL.
4. Push to `main`. The workflow in `.github/workflows/deploy.yml`    builds the book and publishes it.
5. Site goes live at `https://<your-username>.github.io/<repo>/`.

## Add new content

- **A new page**: drop a `.md` file in `chapters/`, then add its path (without `.md`) to `_toc.yml` under `chapters:`.
- **A new notebook**: drop a `.ipynb` file in `notebooks/`, then add it to `_toc.yml` the same way.
- **Math**: use `$...$` inline and `$$...$$` for display.
- **Citations**: add a BibTeX entry to `references.bib`, then cite with `` {cite}`yourkey` ``.
- **Callouts** (note / tip / warning): use ` ```{admonition} ... ``` ` or ` ```{note} ... ``` ` fences.
