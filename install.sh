#!/bin/bash
set -e
REPO="https://github.com/yassine-aitmohamed/VanoNote"
SRC="$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")" 2>/dev/null && pwd || true)"
if [ -n "$SRC" ] && [ -f "$SRC/vanonote.py" ]; then
  DIR="$SRC"
else
  DIR="${VANONOTE_DIR:-$HOME/VanoNote}"
  echo "Downloading VanoNote to $DIR ..."
  TMP="$(mktemp -d)"
  curl -fsSL "$REPO/archive/refs/heads/main.zip" -o "$TMP/vanonote.zip"
  unzip -q "$TMP/vanonote.zip" -d "$TMP"
  mkdir -p "$DIR"
  cp -R "$TMP"/VanoNote-main/. "$DIR"/
  rm -rf "$TMP"
fi
PY="$(command -v python3 || true)"
if [ -z "$PY" ]; then
  echo "Python 3 is required. On macOS: xcode-select --install  (or https://www.python.org/downloads/)"
  exit 1
fi
echo "Setting up VanoNote ..."
"$PY" -m venv "$DIR/.venv"
"$DIR/.venv/bin/python3" -m pip install -q --upgrade pip || true
"$DIR/.venv/bin/python3" -m pip install -q -r "$DIR/requirements.txt" || echo "PyMuPDF was not installed: PDF import will be limited. Run install.sh again later."
chmod +x "$DIR/start.command"
if [ "$(uname)" = "Darwin" ] && [ -d "$HOME/Desktop" ]; then
  printf '#!/bin/bash\nexec "%s/start.command"\n' "$DIR" > "$HOME/Desktop/VanoNote.command"
  chmod +x "$HOME/Desktop/VanoNote.command"
  echo "Shortcut created: Desktop/VanoNote.command"
fi
command -v soffice >/dev/null 2>&1 || command -v libreoffice >/dev/null 2>&1 || echo "Tip: install LibreOffice to import Word and PowerPoint files."
echo "VanoNote is installed in $DIR. Starting ..."
exec "$DIR/start.command"
