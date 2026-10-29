# RefraInspector

**Refractory Sliding Gate Plate Inspection & Campaign Analysis**

**Current version:** v13.2  
**Status:** Beta  
**Platform:** Modern desktop and mobile web browsers

RefraInspector is a browser-based application for inspection and analysis of refractory sliding gate plates (PLs) used in steelmaking. It supports Upper/Lower PL photographic inspection, dimensional measurement, damage assessment, remaining-stroke calculations, and Campaign performance analysis.

## 1. Getting started

1. Download [refraInspector_v13.2.html](./refraInspector_v13.2.html).
2. Open the standalone HTML file in a modern browser.
3. Select **PL Inspection**, enter geometry and usage information, and inspect the PL photographs.
4. Save verified PL sets to the Campaign, then use **Campaign Report** for review and export.

A desktop browser is recommended for precise line adjustments. The mobile layout supports touch controls and continuous scrolling.

## v13.2 — Automatic ArUco, Homography and constrained bore alignment (Beta)

The current v13.2 application automatically attempts ArUco detection after importing each Upper/Lower photo. It uses **DICT_4X4_50, IDs 0–3**, mounted as four **30 × 30 mm markers with 300 × 300 mm marker-centre spacing**: ID 0 top-left, ID 1 top-right, ID 2 bottom-left and ID 3 bottom-right. The intended calibration region is around the PL bore and surrounding damage rather than the distant long-end tail.

When four markers are detected, the system estimates a planar Homography by **least-squares fitting all 16 marker corners** to their known physical positions, checks geometric residuals, and rectifies the image. The output size and displayed X/Y px/mm are selected from estimated original image sampling density rather than the former fixed 900 × 900 px output (with a maximum output dimension to protect browser memory). Homography success supersedes traditional ruler calibration for that photo, clears the obsolete manual-calibration/red warning state, and requires checking A–F guide positions and re-verifying alignment before saving.

If no markers are present, the application falls back to the traditional **Auto Level / Level with 2 Points → independent X/Y 100 mm auto/manual ruler calibration → Alignment** workflow. Failures involving detected but incomplete markers or bad geometry are distinguished from photos with no markers. The Auto ArUco button can be unavailable with a hover explanation. No manual four-point fallback button is offered in the standard interface.

**Important limitations:** These specifications require the actual physical markers to be mounted with accurate 300 × 300 mm centre spacing and consistent orientation on the PL reference plane. An A4 printout of four markers at a different spacing is only an identification test, **not** a valid metric calibration frame. Printed marker dimensions, camera lens distortion, PL surface height differences, edge detection, and image resampling affect real-world accuracy. The displayed px/mm describes the output image grid, **not** a certified measurement resolution. 16-corner RMS/max residuals measure fit consistency rather than actual A–F errors. Validate against independent known-length references before production use; full browser/device regression testing is still required.

## v13.2 — Inner/outer bore alignment and line constraints (Beta)

**Auto Align now treats the inner opening and outer wear boundary as distinct features.** The image-based inner-bore region detector proposes the inner opening's top/bottom guides (**H3/H4**) and left/right bounds. The outer wear-ring detector independently searches farther outside the inner opening and proposes an **outer ellipse**; its top, bottom, left and right tangents determine **H2/H5/V1/V2**. The two ellipses **may be eccentric**—their centres are not forced to coincide.

**Geometric safeguards:**

- Horizontal guide positions must remain ordered from the short end to the long end: **H1 < H2 < H3 < H4 < H5 < H6**. The constraint applies to auto placement and manual guide movement.
- **V1** must stay to the *left* of the detected inner-bore left boundary, and **V2** to its *right*; manual movement cannot drag these outside their permitted ranges.
- **The full fitted inner ellipse must lie strictly inside the fitted outer ellipse**. The outer-candidate check samples the inner perimeter at 720 points with a safety margin, not just the four tangent locations. If a candidate intersects or encroaches on the inner ellipse, the algorithm retries its search farther outward (up to three search passes). When no acceptable candidate is found, it retains the previous outer-guide positions and requires manual review.
- These are **software geometric constraints**, not a guarantee that a detected edge corresponds to the physically correct wear boundary. Strong shadows, slag, oxidation, poor focus, and non-elliptical damage can still mislead the algorithm. A geometrically valid ellipse can still be the wrong feature.

**Recommended operator check after Auto Align:** Confirm H3/H4 on the actual inner opening, confirm H2/H5/V1/V2 are tangential to the *outer wear boundary* rather than the plate perimeter or another contrast edge, check asymmetric wear, then use **Verify Alignment**. The inner-hole detector has shown promising results on a sample PL photo, but outer-boundary accuracy and complete browser regression remain **unverified**.

## ArUco calibration target — printing and assembly

**Printable target:** [Four A4 sheets · 300 × 300 mm · 1 mm rulers · ID 0 corner origin (PDF)](./docs/RefraInspector_ArUco_300x300_4A4_NoZeroLabel.pdf)

### Print four A4 sheets (no cutting)

1. Open the PDF and print **all four pages on A4 at Actual size / 100%**. Disable **Fit to page**, auto-scaling, poster/tile printing, and printer-driver enlargement/reduction. Print in the intended page orientation.
2. Check the **100 mm print verification scale** with a reliable physical ruler on the printed sheet. If it is not 100 mm, correct the print settings and reprint.
3. Lay the pages on a flat, rigid backing **without overlapping, trimming, or gaps**; align the actual paper edges and join in this order:

   | | Left | Right |
   |---|---|---|
   | **Top** | Page 1 · ID 0 (top-left) | Page 2 · ID 1 (top-right) |
   | **Bottom** | Page 3 · ID 2 (bottom-left) | Page 4 · ID 3 (bottom-right) |

4. Fix the pages against slipping, wrinkling, curling, or stretching. Tape the **back of the sheets or the outer margins**; never cover a marker's black squares or surrounding white quiet zone. Keep all markers flat and unobstructed.
5. Measure actual **marker-centre distances** horizontally (ID 0–1 and ID 2–3) and vertically (ID 0–2 and ID 1–3). The intended values are **300 mm in both directions**. Confirm the assembled marker corners also form an accurate rectangular/square geometry. Paper-edge alignment alone cannot guarantee those distances because printers have feed/registration tolerances.
6. The left and top rulers use the **bottom-right corner of the black ID 0 marker** as their 0 mm coordinate origin (the numeric zero labels are intentionally omitted). **This ruler origin is different from the ArUco marker-centre coordinate references used by the Homography calculation.** Some tick marks near markers and interior paper seams are intentionally omitted to prevent interference; do not use these omissions as physical gaps in the distance scale.

For metrology, mount the printed target on a stable rigid jig once its dimensions have been checked. Ordinary printed paper is a prototype/reference target, not by itself a precision-certified calibration standard. Do not use an assembled set with wrong centre spacing as a valid 300 × 300 mm reference.

### Position the frame relative to the PL

- Place the target around the **short-end / bore and surrounding damage measurement area** of the spindle-shaped PL; the less relevant long-end tail can extend beyond the target, provided everything you need to inspect remains visible.
- The **four marker faces must be coplanar with the PL's intended flat, unworn measurement reference surface**. Support the PL and jig independently if needed; **placing both on the same floor/table is insufficient when their heights differ**.
- Keep all four markers fully visible, with adequate white quiet zones, and avoid glare, shadows, perspective extremes and motion blur. A near-perpendicular camera position is recommended even though Homography can correct planar perspective.
- Homography assumes a single plane: recessed erosion, raised edges, camera lens distortion and fixture flex can still introduce errors. Use known dimensions at multiple positions for independent precision checks.

### Two supported inspection workflows

| Step | **With ArUco (new workflow)** | **Without ArUco (legacy workflow)** |
|---|---|---|
| **#0 Import** | Import Upper/Lower PL photographs showing all four markers | Import photographs showing traditional horizontal/vertical reference rulers |
| **Automatic attempt** | On import, attempt automatic ArUco detection (DICT_4X4_50; IDs 0–3) | If no ArUco is found, use the traditional calibration route |
| **#1 Level / Perspective** | Automatic 16-corner least-squares Homography for the 300 × 300 mm physical reference | Auto Level or Level with 2 Points |
| **#2 Calibration** | Physical reference is supplied by ArUco; inspect the displayed rectified-image X/Y px/mm, **do not recalibrate with a 100 mm ruler unnecessarily** | Auto 100mm Calibration for X/Y; use Start Manual Calibration if automatic detection fails, and check both axes |
| **#3 Alignment** | Check the A–F guides, then **Verify Alignment*** for each imported PL | Check the A–F guides, then **Verify Alignment*** for each imported PL |
| **#4 Save Set** | Review measurements and save verified PL set to Campaign | Same |

The ArUco workflow should be **automatic**, not require the user to click each marker. If detection or geometry validation fails, inspect the marker ID/position, print dimensions, orientation and image clarity. A missing marker does **not** justify pretending that a failed Homography has succeeded; use the legacy ruler workflow only if the photograph includes suitable ruler references. Manual A–F review and alignment verification remain mandatory in both paths.

## 2. Main features

- **Photo inspection:** Import one or two photographs, switch between Upper/Lower PLs, automatically or manually level images, and verify alignment.
- **Perspective correction (v13.2 beta):** Automatic detection of four 30 mm ArUco markers, 300 × 300 mm centre-spacing reference, 16-corner least-squares Homography, adaptive rectification resolution, and alignment re-verification.
- **Ruler calibration:** Independent horizontal and vertical px/mm scales, automatic 100 mm calibration, and manual fallback.
- **A–F dimensions and Auto Align (v13.2 beta):** Inner-opening detection proposes H3/H4 and bore sides; independent outer-wear ellipse detection proposes tangent guides H2/H5/V1/V2. H1–H6 ordering, V1/V2 inner-bore exclusion, and whole-arc inner/outer containment checks protect against invalid guide geometries. Automatic readings and editable manual overrides remain available.
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

For the ArUco workflow, show all four correctly positioned markers; for the legacy workflow, show both reference rulers. Avoid shadows, obstructions, and severe perspective distortion.

### Step 3 — Select perspective correction or traditional leveling

1. **With ArUco:** Import initiates automatic detection and Homography. Confirm that the frame is physically valid and that perspective correction succeeded; do not apply Auto Level afterward unless intentionally switching workflows.
2. **Without ArUco:** Under **#1 Level & Perspective Correction**, use **Auto Level**; confirm the plate reference, or select **Level with 2 Points**.
3. For manually leveled legacy photos, repeat X/Y ruler calibration, because rotation can alter effective image scale.

### Step 4 — Confirm ArUco scale or calibrate legacy rulers

**If ArUco Homography succeeded:** #2 displays the corrected-image X/Y px/mm. These figures describe output sampling rather than certified accuracy. No separate ruler calibration is necessary.

**For legacy photographs without ArUco:**

1. Under **#2 Calibration · X / Y (px/mm)**, select **Auto 100mm Calibration**.
2. Review the independent X and Y pixel-per-millimeter values against ruler markings.
3. When an axis cannot be calibrated reliably, select **Start Manual Calibration** and align the guides to known 100 mm spans.
4. Complete manual calibration and verify both scales before measuring.

Do not treat an invalid or uncertain automatic calibration as a reliable distance reference.

### Step 5 — Align and verify measurement guides

1. Under **#3 Alignment**, select **Auto Align**. The program first proposes the inner opening (H3/H4 and inner left/right), then independently searches for an enclosing outer wear ellipse and uses its tangents for H2/H5/V1/V2.
2. Check **inner** and **outer** boundaries separately: the outer wear ellipse may be offset from the inner opening. Ensure the outer guides follow the intended damage boundary, not merely any strong image edge.
3. Respect the enforced order **H1 < H2 < H3 < H4 < H5 < H6**, with **V1** to the left and **V2** to the right of the inner-bore bounds. Outer-ellipse candidates intersecting the inner ellipse are rejected and searched again farther outward. Failed detection leaves prior outer guides in place; it does **not** establish a verified contour.
4. Drag any inaccurate guides within their permitted ranges. **Undo Alignment** and **Reset Lines** are available when needed.
5. Select **Verify Alignment*** only after visually confirming the guide positions.

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

- Position the plate and either the ArUco target or traditional rulers on stable supports; keep the relevant reference surfaces at the PL measurement-plane height.
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
| Image is tilted | For ArUco photos, inspect the four-marker Homography; for legacy photos, repeat Auto Level or Level with 2 Points |
| ArUco cannot be detected | Confirm IDs 0–3, white margins, visibility, lighting, printing and correct physical spacing; use legacy rulers only when suitable ruler references exist |
| Auto ruler calibration fails | Use manual 100 mm calibration and verify both axes |
| A–F readings look incorrect | Review ruler scales, line positions and manual overrides |
| Outer ellipse misses the actual damage boundary | Inspect the inner H3/H4 guides, manually adjust H2/H5/V1/V2 within the constraints, and verify the real wear edge rather than relying only on automatic fitting |
| An outer ellipse is rejected or is not updated | Its arc may cross/approach the inner ellipse or fail recognition quality checks; retry on a clearer photo or adjust the lines manually before Verify Alignment |
| Cannot drag H or V guides across another boundary | Expected safety behavior: H guides remain ordered; V1/V2 remain outside the inner bore |
| Results unavailable | Check required input values and alignment verification |
| Cannot save a PL set | Verify each imported PL's alignment |
| Capture-time warning appears | Confirm both photos belong to the same PL set |
| Campaign Report omits working data | Save the PL set to Campaign first |

## 7. Documentation and support

- [Current application — refraInspector_v13.2.html](./refraInspector_v13.2.html)
- [Printable four-sheet ArUco target — 300 × 300 mm](./docs/RefraInspector_ArUco_300x300_4A4_NoZeroLabel.pdf)
- [SW/HW version mapping — CHANGELOG.md](./CHANGELOG.md)
- [Software releases (SW codes) — CHANGELOG_SOFTWARE.md](./CHANGELOG_SOFTWARE.md)
- [Hardware and ArUco target (HW codes) — CHANGELOG_HARDWARE.md](./CHANGELOG_HARDWARE.md)
- [Detailed historical changes — CHANGELOG_ARCHIVE.md](./CHANGELOG_ARCHIVE.md)

The current executable is **refraInspector_v13.2.html**. Obsolete **v13.0** and **v12.1.7** HTML files were removed from the current branch; their prior contents remain recoverable through Git history. Historical versions may still be mentioned in the software change log.

**Developer / Help Desk:** xuh@shinagawa-ref.jp
