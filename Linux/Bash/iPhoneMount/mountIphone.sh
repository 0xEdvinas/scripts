#!/usr/bin/env bash
set -e

MOUNT="$HOME/iPhone"

mkdir -p "$MOUNT"
fusermount3 -u "$MOUNT" 2>/dev/null || true
ifuse "$MOUNT"

echo "iPhone mounted at: $MOUNT"
xdg-open "$MOUNT" >/dev/null 2>&1 &
