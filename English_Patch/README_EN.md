# English localization for “わたしをそとにつれてって”

A complete English localization of the scenario and UI, preserving the original buttons, animations, routes, timing, and screen geometry.

by “Migdal Bavel” project.

Release date: August 30, 2026. Tested with Steam build `24158896` (App ID `4879010`).

## Installation

1. Close the game completely.
2. Run `Install English patch.cmd`.
3. Accept the automatically detected Steam folder or enter another path.
4. Wait for `app.asar` rebuilding and verification to finish. This usually takes a few minutes.

The package contains only modified files. The installer uses the Electron runtime bundled with the installed game, extracts a clean `app.asar`, overlays the localization, and rebuilds it. No extra software or internet connection is required.

About 1.5 GB of temporary free space is required on the game drive. Temporary files are removed automatically after a successful installation.

Run `Restore original.cmd` to return to the Japanese version.

## What is localized

- The full scenario, menus, system messages, choices, and input fields.
- Phone graphics and the final profile screens.
- Intro animations and text baked into images.
- Original bitmap buttons and hover states are preserved.
- A matching pixel font with full Latin and Cyrillic coverage is embedded.

If the game has updated or the installer cannot find a clean original `app.asar`, verify the game files in Steam and run the installer again.
