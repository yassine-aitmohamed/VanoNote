#!/bin/bash
cd "$(dirname "$0")"
if [ -x .venv/bin/python3 ]; then exec .venv/bin/python3 vanonote.py; fi
exec python3 vanonote.py
