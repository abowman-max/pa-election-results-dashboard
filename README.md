# Pennsylvania 2026 Election Results Dashboard

Static, GitHub Pages–ready dashboard for the supplied unofficial Pennsylvania election-return CSV.

## Share on GitHub

1. Create a new GitHub repository.
2. Upload the contents of this folder, keeping `index.html` and `data/` together.
3. In GitHub: **Settings → Pages → Deploy from a branch → main → / (root)**.
4. Open the Pages URL GitHub gives you.

## Keep it updated

The included GitHub Action can update the CSV on a schedule, but the PA Report Center does not expose a stable direct-download URL in the information supplied here. Set a repository secret named `PA_RESULTS_CSV_URL` to the direct CSV download URL you obtain from the Report Center, then enable the workflow under **Actions → Update PA election results**. You can also run it manually and paste the URL. If the site requires clicking through a report form rather than a direct URL, download the CSV in your browser and run `./update_results_mac.sh /path/to/file.csv`, then commit and push.

## Run locally on a Mac

Double-clicking `index.html` may block the CSV fetch in Safari. In Terminal, open this folder and run:

```bash
python3 -m http.server 8000
```

Then visit http://localhost:8000.

## Important interpretation notes

- The uploaded file is an unofficial county-candidate snapshot from the Pennsylvania Election Returns Report Center.
- Leaders and “flips” are result-indicated comparisons, not certified winners.
- Senate current-control baseline is the 2025–26 PA Senate membership (27 Republicans / 23 Democrats); only even-numbered Senate districts are on the 2026 ballot.
- The CSV contains no precinct reporting fields or total-precinct denominator, so the dashboard reports precinct status as unavailable.
- Baseline sources are linked in the dashboard: the PA Election Returns Report Center and the official PA Senate member list.
