# Usage

This repository is built around two workflows:

- setting up the LaTeX/VS Code environment
- building a document with `latexmk`

## 1. Start the environment

```bash
nix develop
```

That shell provides the LaTeX toolchain used by this template.

## 2. Manage the VS Code extension

The repository ships Nix apps for installing, uninstalling, and checking the recommended extension:

```bash
nix run .#setup
nix run .#teardown
nix run .#extension-status
```

The extension manager script targets `LaTeX Workshop`.

## 3. Build a document

Open VS Code after entering the Nix shell, then open one of these files:

- `General/General.tex`
- `IEEEtran/IEEEtran.tex`

With the workspace settings in place, saving the file triggers an automatic build.

You can also build manually from a terminal:

```bash
cd General
latexmk -g General.tex
```

or:

```bash
cd IEEEtran
latexmk -g IEEEtran.tex
```

Each template writes outputs into its own `build/` directory.

## 4. Troubleshooting

- If saving does not trigger a build, confirm `LaTeX Workshop` is installed and the workspace is trusted.
- If `nix run .#setup` fails, make sure the VS Code CLI (`code`, `code-insiders`, or `codium`) is on `PATH`.
- If the PDF does not update, check the log files under `General/build/` or `IEEEtran/build/`.
