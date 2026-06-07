#!/usr/bin/env bash
# Clawd cursor theme - Linux installer
# Converts Windows .cur files to Xcursor and installs the theme.
# Requires: win2xcur (auto-installed via uvx)

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
THEME_DIR="${HOME}/.local/share/icons/Clawd"

echo "🦀 Clawd cursor theme installer"
echo ""

# --- Step 1: Convert .cur → Xcursor (if needed) ---
XCURSOR_DIR="${SCRIPT_DIR}/cursors"

if [ ! -f "${XCURSOR_DIR}/01-normal" ]; then
	echo "→ Converting .cur files to Xcursor format..."
	mkdir -p "$XCURSOR_DIR"
	uvx win2xcur "${SCRIPT_DIR}/../cursors"/*.cur -o "$XCURSOR_DIR"
fi

# --- Step 2: Install to ~/.local/share/icons ---
echo "→ Installing to ${THEME_DIR}"
mkdir -p "${THEME_DIR}/cursors"

# Copy actual cursor files
cp "${XCURSOR_DIR}"/* "${THEME_DIR}/cursors/"

# --- Step 3: Create Xcursor standard name aliases (hard copies, no symlinks) ---
cd "${THEME_DIR}/cursors"

# Normal Select
for alias in left_ptr default arrow top_left_arrow; do cp 01-normal "$alias"; done

# Help Select
for alias in question_arrow dnd-ask whatsthis; do cp 02-help "$alias"; done

# Working in Background
for alias in left_ptr_watch progress; do cp 03-working "$alias"; done

# Busy
for alias in watch wait; do cp 04-busy "$alias"; done

# Precision Select
for alias in crosshair cross tcross; do cp 05-precision "$alias"; done

# Text Select
for alias in xterm ibeam text; do cp 06-text "$alias"; done

# Handwriting
for alias in pencil draft; do cp 07-handwriting "$alias"; done

# Unavailable
for alias in circle dnd-none no-drop forbidden; do cp 08-unavailable "$alias"; done

# Vertical Resize
for alias in sb_v_double_arrow v_double_arrow size_ver split_v; do cp 09-vresize "$alias"; done

# Horizontal Resize
for alias in sb_h_double_arrow h_double_arrow size_hor split_h; do cp 10-hresize "$alias"; done

# Diagonal Resize 1 (NW-SE)
for alias in fd_double_arrow size_fdiag nwse-resize; do cp 11-diag1 "$alias"; done

# Diagonal Resize 2 (NE-SW)
for alias in bd_double_arrow size_bdiag nesw-resize; do cp 12-diag2 "$alias"; done

# Link Select
for alias in hand2 hand pointing_hand pointer; do cp 13-link "$alias"; done

# Move / Alternate (fallback to normal)
for alias in move fleur all-scroll center_ptr; do cp 01-normal "$alias"; done

# Up arrow (fallback to normal)
for alias in up_arrow sb_up_arrow; do cp 01-normal "$alias"; done

# --- Step 4: Copy index.theme ---
cp "${SCRIPT_DIR}/index.theme" "${THEME_DIR}/"

# --- Step 5: Apply ---
echo "→ Applying theme..."
gsettings set org.gnome.desktop.interface cursor-theme "Clawd"

echo ""
echo "✅ Done! Clawd cursor theme installed and applied."
echo "   If XWayland apps don't update, log out and back in."
