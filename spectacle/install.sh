#!/usr/bin/env bash
#
# Symlink spectacle settings

CURRENT_DIR="$(dirname "$0")"
SETTINGS_DIR="$HOME/Library/Application Support/Spectacle"

ln -fs "$CURRENT_DIR"/Shortcuts.json "$SETTINGS_DIR"/Shortcuts.json
