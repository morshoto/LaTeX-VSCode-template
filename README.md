# LaTeX-VSCode-template

Optimize your LaTeX environment with **VS Code** for seamless report and paper creation.

![demo.gif](src/demo.gif)

## Quick Start

1. Install [Nix](https://nixos.org/download/) on your machine.
2. Open this repository and enter the development shell:

```bash
nix develop
```

3. Open the folder in VS Code.
4. Install the recommended extension when prompted.
5. Open either `General/General.tex` or `IEEEtran/IEEEtran.tex` and build with LaTeX Workshop.

The shell provides `latexmk`, `platex`, `dvipdfmx`, and `biber`, so the same build works on any device with Nix installed.
Build artifacts are written to each template's `build/` directory.

Detailed usage is documented in [docs/usage.md](/Users/shotomorisaki/Engineering/LaTeX-VSCode-template/docs/usage.md).

## VS Code Setup

This repository recommends:

- `LaTeX Workshop`

If you want a command for managing the extension, use:

```bash
nix run .#setup
nix run .#teardown
```

You can also check whether it is already installed:

```bash
nix run .#extension-status
```

The workspace settings already point LaTeX Workshop at `latexmk`, and each template directory has its own `.latexmkrc` so the build stays local to the document being edited and does not overwrite the checked-in sample PDFs.

## Snippets

VS Code snippets still work well for quick template insertion. Add your own snippet under your user or workspace snippet file if needed.

## Legacy Manual Install

If you do not want to use Nix, you can still install a full TeX distribution manually. The template was originally written with that workflow in mind, but `nix develop` is now the preferred path.

![keyboard-shotcut](./src/keyboard-shotcut.png)
