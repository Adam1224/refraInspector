# RefraInspector — Software Change History (SW)

**Current software:** v13.2 (Beta) · **ID scheme:** `SW-<release>` (e.g. `SW-13.0`). Software version numbers reflect the executable HTML, not the physical fixture's revision.

See [hardware changes](./CHANGELOG_HARDWARE.md), [software-to-hardware mapping](./CHANGELOG.md), and [original detailed history](./CHANGELOG_ARCHIVE.md).

## SW-13.2 · v13.2 — 2026-10-29 (Beta)

- Published `refraInspector_v13.2.html` from the tested-development line (v13.0.6), retaining the v13.0 release separately.
- Inner-bore region detection establishes H3/H4 and inner left/right bounds; independent outer wear-ring search generates tangent guides H2/H5/V1/V2.
- Enforces V1 to the left of the inner opening and V2 to the right during guide manipulation. Maintains H1–H6 top-to-bottom ordering.
- Validates that the entire fitted inner ellipse remains enclosed by the outer ellipse (sampling 720 perimeter points with margin); retries farther outward for intersecting candidates, and declines invalid updates.
- **Status:** experimental image algorithm; actual-photo browser accuracy and interaction regression still require verification.

## SW-13.0 · v13.0 — 2026-10-28

- **Auto Align revision (2026-10-29):** Improved inner-bore region detection and H3/H4 positioning; introduced an independent outer-wear contour candidate to position H2/H5/V1/V2 as tangents, without assuming concentricity. Added H1 < H2 < H3 < H4 < H5 < H6 ordering constraints during automated and manual positioning. Requires image-based regression and accuracy verification; these are provisional algorithmic improvements, not certified recognition rates.
- **Workspace usability fix (2026-10-28):** Prevented H1–H6/V1–V2 hover hints (notably H6 at the bottom of the scrollable photo workspace) from changing scroll height by showing line hints in a non-interactive fixed overlay. Preserves line dragging and manual calibration guidance. JavaScript syntax checked; browser regression pending.
### Automatic ArUco Homography and Adaptive Resolution (Beta)
- Added automatic on-import detection of four ArUco `DICT_4X4_50` markers (IDs 0–3), with 300 × 300 mm marker-centre geometry and 30 mm square markers.
- Added 16-corner least-squares planar Homography fitting, geometry quality checks, perspective rectification, and automatic alignment-verification invalidation.
- Replaced the fixed 900 × 900 px output with source-density-based adaptive output resolution and displayed corrected-image X/Y px/mm, subject to a memory-protection dimension limit.
- Fixed the obsolete red/manual X/Y calibration state after successful ArUco rectification; normal success is quiet. Partial/invalid marker detection retains targeted diagnostics, while photos with no markers can use the traditional Auto Level + X/Y ruler calibration path.
- Kept manual 4-point control out of the primary interface; updated layout guidance to focus the marker square on the bore/damage measurement region.
- **Validation:** Marker decoding and syntax checks have been carried out during development, but actual measurement accuracy and complete browser regression remain unverified. Pixel density is not measurement accuracy; homography cannot correct non-planar PL wear or uncalibrated lens distortion.

## SW-12.1.7 · v12.1.7 — 2026-10-22
### Photo Capture Time Validation
- Added an EXIF-based warning when Upper and Lower PL photos were captured more than 30 minutes apart. The responsive warning can be dismissed, resets when either photo is replaced, and does not restrict inspection, saving, or export. Missing capture timestamps are not replaced with file modification or import times.

## SW-12.1.4 · v12.1.4 — 2026-10-20
### Mobile Browser Optimization
- Improved iPhone compatibility with continuous vertical scrolling, a compact mobile header, and thinner visible measurement lines with enlarged touch targets.
- Preserved desktop layout and measurement calculations.

## SW-12.1.1 · v12.1.1 — 2026-10-20
### Campaign Chart and Image Analysis Refinements
- Improved chart readability with integer Used Heats axis labels and Y-axes starting at zero.
- Refined automatic bore and edge-damage boundary detection using image-gradient orientation; accuracy remains subject to physical validation.

## SW-12.0.0 · v12.0.0 — 2026-10-20
### Campaign Report
- Introduced separate PL Inspection and Campaign Report views with campaign statistics, saved measurement tables, Remaining Stroke and damage-thickness charts, and spreadsheet/image export formats.
- Subsequent refinements improved navigation, scrolling, and panel-level exports.

## SW-11.0 · v11.0 — 2026-10-19–20
### PL Set Management and Campaign Data Integrity
- Improved PL set selection, saving, alignment verification, deletion, recovery, and Campaign Performance calculations.
- Added automatic updates to eligible saved Campaign data, with notifications and improved report copying.
- Preserved independent Upper/Lower verification states and saved-set membership through supported workflows.

## SW-10.0 · v10.0 — 2026-10-15–19
### Inspection Workflow and Data Management
- Consolidated numbered photo inspection controls, Upper/Lower photo management, Campaign backup and recovery, and standardized Excel-compatible reporting.
- Improved PL identification safeguards, EXIF capture timestamp extraction, and saved-set navigation.

## SW-9.0 · v9.0 — 2026-10-13–14
### Photo Measurement and Calibration
- Added feature-specific automatic alignment, improved independent X/Y ruler calibration with manual fallback, and mandatory per-photo alignment verification.
- Refined editable A–F measurements, responsive workspace controls, and verification-dependent exports.

## SW-08 · v8.0 and Earlier — Through 2026-10-13
### Initial Inspection Platform
- Developed the original plate photo annotation tool into Upper/Lower PL inspection with ruler calibration, A–F measurements, cracks and remarks, area estimates, and remaining-stroke calculations.
- Earlier experimental iterations and superseded approaches are recorded in the [detailed history](./CHANGELOG_ARCHIVE.md).



## Software validation boundary
- `SW-13.0` implementation: 16-corner planar fit, printed marker model, adaptive image rectification and legacy ruler fallback. This is **not** equivalent to verified dimensional accuracy of the plate.
- Earlier release sections remain grouped by implemented features. Minor fixes and abandoned branches are in the archive.
