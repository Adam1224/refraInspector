# RefraInspector

**Refractory Sliding Gate Plate Inspection & Campaign Analysis**

**Current version:** v12.1.7  
**Status:** Beta  
**Platform:** Modern desktop and mobile web browsers

RefraInspector is a browser-based application for inspection and analysis of refractory sliding gate plates (PLs) used in steelmaking. It supports Upper/Lower PL photographic inspection, dimensional measurement, damage assessment, remaining-stroke calculations, and Campaign performance analysis.

## 1. Getting started

1. Download [refraInspector_v12.1.7.html](./refraInspector_v12.1.7.html).
2. Open the standalone HTML file in a modern browser.
3. Select **PL Inspection**, enter geometry and usage information, and inspect the PL photographs.
4. Save verified PL sets to the Campaign, then use **Campaign Report** for review and export.

A desktop browser is recommended for precise line adjustments. The mobile layout supports touch controls and continuous scrolling.

## 2. Main features

- **Photo inspection:** Import one or two photographs, switch between Upper/Lower PLs, automatically or manually level images, and verify alignment.
- **Ruler calibration:** Independent horizontal and vertical px/mm scales, automatic 100 mm calibration, and manual fallback.
- **A–F dimensions:** Photo guide lines, automatic readings, and editable manual overrides for each PL.
- **Damage assessment:** Used-bore and enlargement areas, edge-damage area estimates, long-end damage, crack counts, and inspection remarks.
- **PL Set and Campaign management:** ID and usage records, saved-set selector, independent photo verification, selective deletion, Campaign Performance statistics, browser-local recovery and backups.
- **Performance calculations:** Remaining Stroke (R), Stroke Reduction (ΔR), Erosion Rate (ER), Erosion per Heat (EPH), and comparison with a safe-stroke limit.
- **Campaign Report:** Saved-set data table, Campaign summary, Remaining Stroke versus Used Heats, Upper/Lower long-end damage versus Used Heats, and report/chart exports.
- **Capture-time validation:** If original EXIF timestamps are available for both photos and differ by more than 30 minutes, show a dismissible warning. Replacing either photo resets dismissal. Missing EXIF times are not substituted with file modification times; the warning never blocks inspection or export.
- **Mobile-friendly layout:** Continuous page scrolling, compact help control, thin guides with enlarged drag targets.

## 3. Standard inspection procedure

### Step 1 — Enter PL Geometry

In **PL Geometry**, enter the Campaign ID, six-column geometry input, and the required Remaining Stroke safe limit.

| Parameter | Description |
|---|---|
| W0 | Center-to-edge distance including band |
| X0 | Band thickness |
| Y0 | Original bore radius |
| Z0 | Closed center distance |
| R0 | Initial stroke |
| H0 | Original bore diameter (2 × Y0) |

Changing shared geometry can affect calculated results for Campaign-saved PL sets; review the impacted measurements and performance.

### Step 2 — Import Upper and Lower PL photographs

1. In **PL Photo Workspace**, select **Import PL photo**.
2. Import one image for the selected PL, or two images for an Upper/Lower pair.
3. Confirm Upper/Lower assignment and use the plate selector to switch views.
4. Check any capture-time mismatch notice; dismiss it with **×** after reviewing the pairing.

Use clear photographs showing the plate and reference rulers. Avoid shadows, obstructions, and severe perspective distortion.

### Step 3 — Level the photograph

1. Under **#1 Level**, use **Auto Level**.
2. Confirm the plate's reference edges are aligned.
3. If needed, select **Level with 2 Points** and identify two points on the horizontal reference.
4. After manual leveling, repeat automatic ruler calibration; rotation can alter the effective image scale.

### Step 4 — Calibrate the rulers

1. Under **#2 Calibration · X / Y (px/mm)**, select **Auto 100mm Calibration**.
2. Review the independent X and Y pixel-per-millimeter values against ruler markings.
3. When an axis cannot be calibrated reliably, select **Start Manual Calibration** and align the guides to known 100 mm spans.
4. Complete manual calibration and verify both scales before measuring.

Do not treat an invalid or uncertain automatic calibration as a reliable distance reference.

### Step 5 — Align and verify measurement guides

1. Under **#3 Alignment**, select **Auto Align**.
2. Check the proposed A–F guide positions against actual PL boundaries.
3. Drag any inaccurate lines. **Undo Alignment** and **Reset Lines** are available when needed.
4. Select **Verify Alignment*** after confirming the guide positions.

Each imported PL requires its own alignment verification. Changes to photo positioning, calibration, or measurement lines may invalidate verification.

### Step 6 — Review A–F measurements

In **PL A–F Dimensions · Upper / Lower**:

1. Review auto-calculated values for both PLs.
2. Correct the photo reference guides as required.
3. Enter manual values where appropriate.
4. Review bore-area and edge-damage estimates.

Use the panel's **i** icon to display the measurement reference legend. Automatic detection requires operator confirmation.

### Step 7 — Record operating conditions and observations

In **PL Set Usage Info**, enter PL pair ID, total runtime in minutes, and heats used. These are **pair-level** quantities, not separate Upper/Lower totals.

Use **Cracks** to record counts and **Remarks** for tags and observations.

### Step 8 — Review calculated results

| Indicator | Meaning |
|---|---|
| T_upper / T_lower | Long-end damage for each PL |
| R | Remaining Stroke |
| ΔR | Stroke Reduction |
| ER | Erosion Rate (mm/min) |
| EPH | Erosion per Heat (mm/heat) |
| J | Used Bore Area |
| K | Bore Enlargement Area |
| M | Bore Area Enlargement Ratio |
| L | Estimated Bore Edge Damage Area |

Check that required inputs are present and values are physically reasonable. Area results are model estimates, not validated segmentation measurements.

### Step 9 — Save the PL set to Campaign

1. Confirm all imported PL photographs have been verified.
2. Review geometry, A–F values, usage and calculated results.
3. Under **#4 Save Set**, choose **Save set to campaign**.
4. Confirm the saved record appears in the selector and Campaign Performance.

Previously saved sets can be reopened. Eligible edits update corresponding Campaign records automatically where supported.

### Step 10 — Review Campaign Report

Open **Campaign Report** to examine summary statistics, saved inspection records, Remaining Stroke versus Used Heats, and Upper/Lower long-end damage versus Used Heats.

Use the available panel controls to copy or export tables and charts. The report uses **saved Campaign records**, not unsaved working drafts.

## 4. Export and data preservation

- **Copy PLs details** and **Copy Campaign data** produce spreadsheet-compatible content.
- Campaign Report offers panel-specific copying, CSV/Excel-compatible exports, chart SVG/PNG, and printing.
- Browser-local IndexedDB recovery and Campaign backups assist with restoration, but do not replace externally preserved inspection records.
- Some header copy and backup controls are hidden on narrow mobile screens.

**Before clearing browser data, preserve required inspection records.** Never commit confidential customer images, production records, credentials, or exported inspection data without authorization.

## 5. Measurement guidance

- Position the plate and rulers on stable, level supports wherever practical.
- Ensure ruler marks and plate damage boundaries are visible.
- Check independent X/Y scale validity before using photo-derived dimensions.
- Manually review suggested alignment lines and contours.
- Report precision in accordance with the actual measuring tool.
- Investigate improbable stroke or erosion results for incorrect geometry, calibration, or missing inputs.

**Beta limitation:** Automatic image recognition, contour-derived areas, and touch behavior require validation with physical reference measurements and real devices.

## 6. Troubleshooting

| Issue | Action |
|---|---|
| Photo import fails | Check image format and browser support |
| Image is tilted | Repeat Auto Level or Level with 2 Points |
| Auto calibration fails | Use manual 100 mm calibration and verify both axes |
| A–F readings look incorrect | Review ruler scales, line positions and manual overrides |
| Results unavailable | Check required input values and alignment verification |
| Cannot save a PL set | Verify each imported PL's alignment |
| Capture-time warning appears | Confirm both photos belong to the same PL set |
| Campaign Report omits working data | Save the PL set to Campaign first |

## 7. Documentation and support

- [Current application — refraInspector_v12.1.7.html](./refraInspector_v12.1.7.html)
- [Feature-level release history — CHANGELOG.md](./CHANGELOG.md)
- [Detailed historical changes — CHANGELOG_ARCHIVE.md](./CHANGELOG_ARCHIVE.md)

Only the latest versioned HTML application file is retained on the current repository branch; older versions remain recoverable from Git history.

**Developer / Help Desk:** xuh@shinagawa-ref.jp
