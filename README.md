# FOIA Results

A results-first "wire" view of the [FOIA Around, Find Out](https://foia-around-find-out.pages.dev/) public-records dockets — what the records fight has actually pried loose, as plain headlines.

- **No Records** (orange-red) — an agency confirmed in writing that a document which *should* exist *doesn't*.
- **Records Released** (green) — actual documents produced.
- **Stonewalled** (deep red) — fee waiver / expedite denied, or pay-to-play invoices.
- **On the clock** — pending requests with a live countdown to their legal response deadline.

Single self-contained `index.html`, client-side only, no tracking. Headlines are curated by hand in the `RESULTS` / `PENDING` arrays as answers arrive.

## Deploy

Cloudflare Pages is primary (**foia-results.pages.dev**); GitHub Pages is a matched mirror. Both publish automatically on push to `main` via `.github/workflows/deploy.yml`. Manual Cloudflare fallback: `bash deploy.sh`.

CC0 — fork it, mirror it.
