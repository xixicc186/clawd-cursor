# 🦀 Clawd Cursor

A pixel-art cursor pack starring **Clawd**, a little coral crab — hand-built, transparent, multi-resolution, and ready to install on **Windows** and **Linux**. Includes a full 12-state scheme plus bonus "mascot" variants where Clawd tags along under the arrow, types under the I-beam, or clicks alongside the hand pointer.

<p align="center">
  <img src="preview/clawd-pointer.png" width="260" alt="Clawd mascot pointer">
</p>

<p align="center">
  <img src="preview/states.png" width="640" alt="All cursor states">
</p>

## What's inside

Every cursor is a true `.cur` file with a 32-bit alpha channel and multiple embedded sizes (32 / 48 / 64 / 96 / 128 px) so it stays crisp on high-DPI displays.

| File | Windows role | Hotspot |
|------|--------------|---------|
| `01-normal.cur` | Normal Select | arrow tip |
| `02-help.cur` | Help Select | arrow tip |
| `03-working.cur` | Working in Background | arrow tip |
| `04-busy.cur` | Busy | center |
| `05-precision.cur` | Precision Select | center |
| `06-text.cur` | Text Select | center |
| `07-handwriting.cur` | Handwriting | pen tip |
| `08-unavailable.cur` | Unavailable | center |
| `09-vresize.cur` | Vertical Resize | center |
| `10-hresize.cur` | Horizontal Resize | center |
| `11-diag1.cur` | Diagonal Resize 1 | center |
| `12-diag2.cur` | Diagonal Resize 2 | center |
| `13-link.cur` | Link Select (hand) | index fingertip |
| `clawd-pointer.cur` | Bonus mascot pointer (arrow + Clawd) | arrow tip |
| `06-text-clawd-ibeam.cur` | Bonus mascot Text Select (Clawd typing under an I-beam caret) | I-beam center |
| `13-link-clawd.cur` | Bonus mascot Link Select (Clawd clicking a mouse) | index fingertip |

> Move and Alternate Select are intentionally left to the system default.
> 
> The `linux/` directory contains pre-converted Xcursor files, an `index.theme`, and an automated install script.

<p align="center">
  <img src="preview/clawd-hand.png" width="180" alt="Clawd hand / link-select cursor">
</p>

## Install (Windows)

### One-click

1. Download this repo (**Code → Download ZIP**) and unzip it.
2. Open the `cursors/` folder, right-click **`install.inf`** → **Install**
   (on Windows 11 you may need **Show more options** first), and accept the UAC prompt.
   This copies the cursors to `C:\Windows\Cursors\Clawd\` and registers a scheme named **Clawd**.
3. If the pointer doesn't change immediately, log out and back in, or run in **Win+R**:
   ```
   RUNDLL32.EXE USER32.DLL,UpdatePerUserSystemParameters ,1 ,True
   ```

### Manual / per-cursor

Settings → search **"Change mouse cursor"** → **Pointers** tab → pick a state (e.g. *Normal Select*) → **Browse** → choose the matching `.cur`. Click **Save As…** to keep it as a reusable scheme.

To use the **mascot variants**, set *Normal Select* to `clawd-pointer.cur`, *Text Select* to `06-text-clawd-ibeam.cur`, and *Link Select* to `13-link-clawd.cur`.

<p align="center">
  <img src="preview/clawd-text-ibeam.png" width="180" alt="Clawd typing under an I-beam — text-select mascot variant">
  <img src="preview/clawd-link.png" width="180" alt="Clawd clicking a mouse — link-select mascot variant">
</p>

### Uninstall

Pointers tab → switch the scheme back to **Windows Default** → Apply. To fully remove: delete `C:\Windows\Cursors\Clawd\` and the `Clawd` entry under `HKCU\Control Panel\Cursors\Schemes`.

## Linux (GNOME / KDE / XFCE …)

Pre-converted Xcursor files are in `linux/cursors/`. One command:

```bash
linux/install.sh
```

This converts `.cur` → Xcursor (via `uvx win2xcur`), installs to `~/.local/share/icons/Clawd/`, maps all Xcursor standard names, and applies the theme via `gsettings`.

### Manual

1. Copy the Xcursor files and theme definition into place:
   ```bash
   mkdir -p ~/.local/share/icons/Clawd/cursors
   cp linux/cursors/* ~/.local/share/icons/Clawd/cursors/
   cp linux/index.theme ~/.local/share/icons/Clawd/
   ```
2. Create the Xcursor alias copies inside `~/.local/share/icons/Clawd/cursors/`:
   ```bash
   cd ~/.local/share/icons/Clawd/cursors
   for a in left_ptr default arrow; do cp 01-normal "$a"; done
   for a in hand2 hand pointing_hand pointer; do cp 13-link "$a"; done
   for a in xterm ibeam text; do cp 06-text "$a"; done
   # … see install.sh for the full mapping
   ```
3. Apply:
   ```bash
   gsettings set org.gnome.desktop.interface cursor-theme "Clawd"
   ```

### Mascot variants

Set Clawd as the pointer companion:

```bash
cd ~/.local/share/icons/Clawd/cursors
cp clawd-pointer       left_ptr default arrow    # Clawd under the arrow
cp 06-text-clawd-ibeam xterm ibeam text          # Clawd typing in the I-beam
cp 13-link-clawd       hand2 hand pointing_hand  # Clawd clicking
```

Wayland apps pick it up immediately. XWayland apps (Electron, Chromium) may need a re-login.

### Uninstall

```bash
gsettings set org.gnome.desktop.interface cursor-theme "Adwaita"
rm -rf ~/.local/share/icons/Clawd
```

## macOS

macOS has no built-in cursor-replacement UI. Use a tool like [Mousecape](https://github.com/alexzielenski/Mousecape) and import the PNGs/cursors manually.

## License

Released under the [MIT License](LICENSE). Clawd and the artwork are free to use, remix, and share.
