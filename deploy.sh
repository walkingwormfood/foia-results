#!/bin/bash
# Manual Cloudflare Pages deploy — the primary site is foia-results.pages.dev.
# Normally the GitHub Action (.github/workflows/deploy.yml) deploys BOTH Cloudflare
# (primary) and GitHub Pages (mirror) on every push to main. This is the manual
# Cloudflare fallback. It uses wrangler's native OAuth login (NOT an API token), so:
#   npx wrangler login      # one-time; approve in the browser
#   bash deploy.sh
# The OAuth config is XDG-relocated on this machine (hence XDG_CONFIG_HOME below).
set -e
cd "$(dirname "$0")"
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-C:/Users/walki/AppData/Roaming/xdg.config}"
export CLOUDFLARE_ACCOUNT_ID="4ff969ce831c43ea0c37553883217353"
STAGE=$(mktemp -d)
git archive main | tar -x -C "$STAGE"
npx wrangler pages project create foia-results --production-branch main 2>/dev/null || true
npx wrangler pages deploy "$STAGE" --project-name foia-results --branch main --commit-dirty=true
rm -rf "$STAGE"
