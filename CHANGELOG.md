# RefraInspector — Version History

**Current version:** v12.1.7  
**Development status:** Beta

This changelog groups related changes by feature rather than listing every intermediate implementation or corrective patch. See [Detailed development history](./CHANGELOG_ARCHIVE.md) for individual version records, experiments, rollbacks, and traceability.

## v12.1.7 — 2026-10-22
### Photo Capture Time Validation
- Added an EXIF-based warning when Upper and Lower PL photos were captured more than 30 minutes apart. The responsive warning can be dismissed, resets when either photo is replaced, and does not restrict inspection, saving, or export. Missing capture timestamps are not replaced with file modification or import times.

## v12.1.4 — 2026-10-20
### Mobile Browser Optimization
- Improved iPhone compatibility with continuous vertical scrolling, a compact mobile header, and thinner visible measurement lines with enlarged touch targets.
- Preserved desktop layout and measurement calculations.

## v12.1.1 — 2026-10-20
### Campaign Chart and Image Analysis Refinements
- Improved chart readability with integer Used Heats axis labels and Y-axes starting at zero.
- Refined automatic bore and edge-damage boundary detection using image-gradient orientation; accuracy remains subject to physical validation.

## v12.0.0 — 2026-10-20
### Campaign Report
- Introduced separate PL Inspection and Campaign Report views with campaign statistics, saved measurement tables, Remaining Stroke and damage-thickness charts, and spreadsheet/image export formats.
- Subsequent refinements improved navigation, scrolling, and panel-level exports.

## v11.0 — 2026-10-19–20
### PL Set Management and Campaign Data Integrity
- Improved PL set selection, saving, alignment verification, deletion, recovery, and Campaign Performance calculations.
- Added automatic updates to eligible saved Campaign data, with notifications and improved report copying.
- Preserved independent Upper/Lower verification states and saved-set membership through supported workflows.

## v10.0 — 2026-10-15–19
### Inspection Workflow and Data Management
- Consolidated numbered photo inspection controls, Upper/Lower photo management, Campaign backup and recovery, and standardized Excel-compatible reporting.
- Improved PL identification safeguards, EXIF capture timestamp extraction, and saved-set navigation.

## v9.0 — 2026-10-13–14
### Photo Measurement and Calibration
- Added feature-specific automatic alignment, improved independent X/Y ruler calibration with manual fallback, and mandatory per-photo alignment verification.
- Refined editable A–F measurements, responsive workspace controls, and verification-dependent exports.

## v8.0 and Earlier — Through 2026-10-13
### Initial Inspection Platform
- Developed the original plate photo annotation tool into Upper/Lower PL inspection with ruler calibration, A–F measurements, cracks and remarks, area estimates, and remaining-stroke calculations.
- Earlier experimental iterations and superseded approaches are recorded in the [detailed history](./CHANGELOG_ARCHIVE.md).

## Development and Traceability Notes
- RefraInspector is beta software. Automatic image recognition and derived measurement accuracy still require testing against physical references.
- Intermediate development versions and bug fixes are consolidated above rather than presented as separate features. Individual descriptions, experimental iterations, and rollbacks are preserved in the [archive](./CHANGELOG_ARCHIVE.md) and Git history.
- Release dates reflect recorded project history, not independent certification or production validation.
