#!/usr/bin/env bash
# Builds docs/prd/Porta-PRD.pdf from the HTML parts in docs/prd/src.
set -euo pipefail
cd "$(dirname "$0")"
cat src/*.html > porta-prd.html
google-chrome --headless=new --disable-gpu --no-sandbox --no-pdf-header-footer \
  --virtual-time-budget=20000 --run-all-compositor-stages-before-draw \
  --print-to-pdf="$PWD/Porta-PRD.pdf" "file://$PWD/porta-prd.html" 2>/dev/null
pdfinfo Porta-PRD.pdf | grep -E "Pages|File size"
