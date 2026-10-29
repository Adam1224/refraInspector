# RefraInspector

**Refractory Sliding Gate Plate Inspection & Campaign Analysis**

**Current version:** v13.2  
**Status:** Beta  
**Platform:** Modern desktop and mobile web browsers

RefraInspector is a browser-based application for inspection and analysis of refractory sliding gate plates (PLs) used in steelmaking. It supports Upper/Lower PL photographic inspection, dimensional measurement, damage assessment, remaining-stroke calculations, and Campaign performance analysis.

## 1. Quick start — complete one PL inspection

**You do not need to understand Homography or ellipse fitting to use RefraInspector.** Follow these steps in order:

| Step | What to do | What to check |
|---|---|---|
| **1. Open** | Download [RefraInspector v13.2](./refraInspector_v13.2.html) and open it in a current browser. Select **PL Inspection**. | Use a desktop browser when precise guide dragging is required. |
| **2. Prepare the photo** | Place each PL beside the **four ArUco markers** (preferred) or the **two reference rulers** (fallback). Photograph the entire measurement area with the reference visible. | With ArUco, all four markers must be visible and their faces at the same height as the unworn PL reference face. |
| **3. Enter PL Geometry** | Enter the required W0, X0, Y0, Z0 and R0 values, plus the safe-stroke limit where applicable. | Check units and the correct PL model. Changing shared geometry can affect saved Campaign data. |
| **4. Import** | Import the Upper photo, the Lower photo, or both. Confirm the **Upper/Lower** labels. | A photo-time difference warning means: check that the pair belongs together. |
| **5. Correct the image** | **ArUco:** detection and perspective correction run automatically. **No ArUco:** use **Auto Level** or **Level with 2 Points**, then calibrate **X and Y** rulers separately. | Do not continue with an uncalibrated axis in the ruler workflow. |
| **6. Align the lines** | Click **Auto Align**, then inspect every H/V guide. H3/H4 should touch the inner opening; H2/H5/V1/V2 should touch the **outer worn boundary**; check H1/H6 too. Drag guides to correct errors. | Outer-wear recognition is experimental: a plausible automatic line may still be wrong. |
| **7. Verify** | Click **Verify Alignment*** for each imported PL. | If you change a photo, calibration or guide afterwards, repeat verification when requested. |
| **8. Review measurements** | Check A–F values, bore/damage estimates and remarks. Add manual values when needed. Enter **PL Set Usage Info** (heats, runtime, ID). | Inspect the values, not only the image overlays. |
| **9. Save** | Use **Save set to campaign**, confirm that the PL set appears in the saved list. | Only verified, valid records should be saved; saved usage information may be locked. |
| **10. Report / export** | Open **Campaign Report** to view saved data, graphs and export tools. Back up important Campaign records. | Unsaved working drafts do not appear in Campaign reports. |

**Important:** An automatic result is a *suggestion*, never a substitute for visually checking actual damage boundaries. In this Beta release, **Verify Alignment is a human confirmation step**.

## 2. Warnings and errors — cause and solution

These are common on-screen warnings, restrictions or symptoms. The wording may differ slightly by workflow or browser.

| Warning / symptom | Why it happens | What to do |
|---|---|---|
| **ArUco not found / 0 of 4 markers** | Marker is hidden, blurred, small, poorly lit or the IDs/print contrast are incorrect. | Show all four IDs **0–3** and their white margins; remove glare, focus the image, and re-import. If using a ruler-only photo, follow the legacy calibration workflow. |
| **ArUco detected but correction fails** | Some markers are missing, arranged incorrectly or their observed geometry is inconsistent. | Check ID positions and the physical **300 × 300 mm centre spacing**, flatness and camera view. Re-photograph; do not assume calibration succeeded. |
| **Auto ArUco button greyed out** | The current image/mode does not permit a valid retry or the function is unavailable. | Read its hover explanation when on desktop; inspect the import/correction status. Use manual ruler calibration only when reference rulers are visible. |
| **X or Y auto calibration failed** | Tick marks or a reliable 100 mm ruler span could not be detected. The failed axis's earlier scale is cleared. | Choose **Start Manual Calibration**, mark a known **100 mm span** on that axis, and verify both X/Y values. |
| **X/Y scales differ greatly** | The rulers may not be coplanar, correctly oriented or accurately detected. | Check ruler placement, photo leveling, manual reference endpoints and physical heights; calibrate again. |
| **Upper/Lower photo capture times differ by over 30 minutes** | EXIF timestamps show an unusual capture-time gap. This **does not** prove incorrect pairing. | Confirm both photos belong to the same PL set. Dismiss the warning once reviewed; it does not block measurement. |
| **No EXIF capture time shown** | The photo lacks readable original capture metadata. | Confirm the pair manually; absence of metadata does not prevent inspection. |
| **Upper / Lower mix-up warning** | A possible Lower-PL closure mark was found on the photo labelled Upper. It is only a visual clue. | Check the actual surfaces and use **Swap Upper / Lower** if the assignment is wrong. |
| **H3/H4 or inner-bore guides are wrong** | Reflections, opening/background contrast, dirt or incomplete edges caused a poor region estimate. | Drag the inner guides onto the real visible opening; confirm before verification. |
| **Outer ellipse fails, crosses the inner hole or does not update** | The candidate does not satisfy full-arc containment or image-edge quality requirements. The app tries farther outward but may find nothing. | Check the true outer wear ring and manually adjust **H2/H5/V1/V2**; do not mistake the plate perimeter for wear. |
| **A guide will not drag past another guide** | This is the intended geometry restriction, **not a UI fault**. H1–H6 must stay in order; V1/V2 must remain outside the inner opening. | Move the neighboring line first if physically justified. Do not force an invalid guide crossing. |
| **Verify Alignment required / values unavailable / cannot save** | A photo's alignment has not been verified, or a later modification invalidated verification. | Check the affected photo, calibration and guides; click **Verify Alignment*** again. With two photos, check both separately. |
| **A–F readings seem unreasonable** | Incorrect line positions, bad px/mm scale, wrong PL Geometry or a wrong manual value. | Recheck geometry, scale and the corresponding H/V guides. Correct manually where needed. |
| **Saved PL-set usage cannot be edited** | The usage record is locked after saving to protect Campaign history. | Review usage carefully before saving; use only the supported correction workflow rather than changing locked fields. |
| **Changing PL Geometry affects saved sets** | PL Geometry is shared by saved Campaign records, so recalculation may alter results. | Confirm the correct geometry before accepting the warning; review affected saved results afterwards. |
| **Campaign Report has missing records** | The affected PL sets are still unsaved working drafts, or you are viewing a different Campaign. | Save verified sets, then reopen/refresh the report view. |
| **Lost data after browser cleanup** | Browser-local storage is not a guaranteed external archive. | Restore an available Campaign backup; regularly export/back up data before clearing browser data. |

For detailed operation, see **Section 3**. Technical reasons behind image and geometry constraints appear later in this README.

### Diagnostic code index (v13.2)

Each listed code is displayed in the matching application warning, error or confirmation message. **Find a code:** open this README and use **Ctrl+F** (Windows) or **⌘+F** (Mac), then enter the full code (for example, `RI-ALN-003`). The code identifies the condition; it does not by itself indicate the severity. Older screenshots without codes refer to earlier application builds.

| Code | When you see it / likely cause | How to resolve |
|---|---|---|
| `RI-IMP-001` | The selected photo cannot be decoded (unsupported/damaged file). | Convert to JPEG/PNG, check the file and re-import. |
| `RI-IMP-002` | Both HEIC decoding methods failed. | Export the original HEIC to JPEG and import that copy. |
| `RI-IMP-003` | More than two photos selected. | Import one photo or an Upper/Lower pair only. |
| `RI-IMP-004` | Unexpected import workflow failure. | Re-import a supported photo; refresh the browser if necessary after saving/backing up data. |
| `RI-PHO-001` | Upper and Lower EXIF capture times differ by over 30 minutes. | Verify that both photos belong to the same PL set; dismiss once checked. |
| `RI-PHO-002` | A possible Upper/Lower label mix-up is inferred from a closure mark. | Inspect the plates; swap assignments only if incorrect. |
| `RI-ARU-001` | No ArUco markers were found. | Make all four IDs clearly visible; with ruler-only photos, use the legacy route. |
| `RI-ARU-002` | Only part of the four-marker set was detected. | Check IDs **0–3**, white quiet zones, focus, lighting and occlusions. |
| `RI-ARU-003` | Marker geometry is unsuitable for Homography. | Recheck marker order, physical **300 × 300 mm** centre distances and flatness; retake photo. |
| `RI-ARU-004` | ArUco detector/library could not load from the internet. | Check network access, browser policies and CDN reachability; try again. |
| `RI-CAL-001` | Invalid ruler tick numbers or reference points. | Re-enter valid tick labels and choose correctly separated tick locations. |
| `RI-CAL-002` | Manual calibration reference points are too close. | Choose two endpoints at least 100 mm apart on the physical ruler. |
| `RI-CAL-003` | One/both automatic X/Y ruler scales could not be verified. | Calibrate each failed axis manually against a known 100 mm span. |
| `RI-CAL-004` | Verify Alignment was requested before valid X/Y calibration. | Complete valid calibration on **both axes**, then verify. |
| `RI-ALN-001` | Detected inner bore boundary has low confidence. | Drag the pink inner-opening guides to the actual bore edge. |
| `RI-ALN-002` | Inner opening was not found; outer guides were not updated. | Improve photo contrast/focus, position inner guides, and retry or set outer guides manually. |
| `RI-ALN-003` | Fitted outer ellipse intersects/approaches inner ellipse; outward search failed. | Inspect the true outer wear ring and set H2/H5/V1/V2 manually. |
| `RI-ALN-004` | Proposed outer contour extends beyond the image boundary. | Retake the photo with more margin around the wear zone. |
| `RI-VER-001` | Verify Alignment was requested before importing a photo. | Import a PL photo first. |
| `RI-VER-002` | Saving is blocked until imported PLs pass verification. | Verify Alignment separately for every imported Upper/Lower photo. |
| `RI-SAV-001` | Required PL set fields are missing or invalid. | Correct the indicated fields; do not save an incomplete production record. |
| `RI-SAV-002` | A PL Geometry change will affect existing saved Campaign sets. | Confirm the new geometry and review recalculated saved results. |
| `RI-DAT-001` | Permanent deletion of selected PL sets requested. | Review the selected IDs; cancel if unsure and back up first. |
| `RI-DAT-002` | Backup file has no saved PL sets. | Select a valid Campaign backup containing saved records. |
| `RI-DAT-003` | Unsaved working edits will not be included in copied saved data. | Save verified changes before exporting, or cancel the copy. |
| `RI-DAT-004` | Backup restoration will replace current session records. | Back up current data, then confirm only if replacement is intended. |
| `RI-DAT-005` | Browser found a local recovery snapshot. | Inspect the time and contents before restoring; keep a separate Campaign backup. |

**No-code notices:** Some ordinary status messages (for example, successful completion, automatic guide positioning summaries or disabled controls) are not errors and may not carry a diagnostic code. If an unfamiliar warning appears without a code, report its full text and a screenshot; new codes can be added without renumbering existing ones.

## 3. Step-by-step instructions (detailed)

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

## 4. Features at a glance

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

## 5. How image calibration works (technical)

The current v13.2 application automatically attempts ArUco detection after importing each Upper/Lower photo. It uses **DICT_4X4_50, IDs 0–3**, mounted as four **30 × 30 mm markers with 300 × 300 mm marker-centre spacing**: ID 0 top-left, ID 1 top-right, ID 2 bottom-left and ID 3 bottom-right. The intended calibration region is around the PL bore and surrounding damage rather than the distant long-end tail.

When four markers are detected, the system estimates a planar Homography by **least-squares fitting all 16 marker corners** to their known physical positions, checks geometric residuals, and rectifies the image. The output size and displayed X/Y px/mm are selected from estimated original image sampling density rather than the former fixed 900 × 900 px output (with a maximum output dimension to protect browser memory). Homography success supersedes traditional ruler calibration for that photo, clears the obsolete manual-calibration/red warning state, and requires checking A–F guide positions and re-verifying alignment before saving.

If no markers are present, the application falls back to the traditional **Auto Level / Level with 2 Points → independent X/Y 100 mm auto/manual ruler calibration → Alignment** workflow. Failures involving detected but incomplete markers or bad geometry are distinguished from photos with no markers. The Auto ArUco button can be unavailable with a hover explanation. No manual four-point fallback button is offered in the standard interface.

**Important limitations:** These specifications require the actual physical markers to be mounted with accurate 300 × 300 mm centre spacing and consistent orientation on the PL reference plane. An A4 printout of four markers at a different spacing is only an identification test, **not** a valid metric calibration frame. Printed marker dimensions, camera lens distortion, PL surface height differences, edge detection, and image resampling affect real-world accuracy. The displayed px/mm describes the output image grid, **not** a certified measurement resolution. 16-corner RMS/max residuals measure fit consistency rather than actual A–F errors. Validate against independent known-length references before production use; full browser/device regression testing is still required.

## 6. ArUco target — printing and physical setup

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

## 7. Inner/outer ellipse recognition and constraints (technical)

**Auto Align now treats the inner opening and outer wear boundary as distinct features.** The image-based inner-bore region detector proposes the inner opening's top/bottom guides (**H3/H4**) and left/right bounds. The outer wear-ring detector independently searches farther outside the inner opening and proposes an **outer ellipse**; its top, bottom, left and right tangents determine **H2/H5/V1/V2**. The two ellipses **may be eccentric**—their centres are not forced to coincide.

**Geometric safeguards:**

- Horizontal guide positions must remain ordered from the short end to the long end: **H1 < H2 < H3 < H4 < H5 < H6**. The constraint applies to auto placement and manual guide movement.
- **V1** must stay to the *left* of the detected inner-bore left boundary, and **V2** to its *right*; manual movement cannot drag these outside their permitted ranges.
- **The full fitted inner ellipse must lie strictly inside the fitted outer ellipse**. The outer-candidate check samples the inner perimeter at 720 points with a safety margin, not just the four tangent locations. If a candidate intersects or encroaches on the inner ellipse, the algorithm retries its search farther outward (up to three search passes). When no acceptable candidate is found, it retains the previous outer-guide positions and requires manual review.
- These are **software geometric constraints**, not a guarantee that a detected edge corresponds to the physically correct wear boundary. Strong shadows, slag, oxidation, poor focus, and non-elliptical damage can still mislead the algorithm. A geometrically valid ellipse can still be the wrong feature.

**Recommended operator check after Auto Align:** Confirm H3/H4 on the actual inner opening, confirm H2/H5/V1/V2 are tangential to the *outer wear boundary* rather than the plate perimeter or another contrast edge, check asymmetric wear, then use **Verify Alignment**. The inner-hole detector has shown promising results on a sample PL photo, but outer-boundary accuracy and complete browser regression remain **unverified**.

## 8. Export and data preservation

- **Copy PLs details** and **Copy Campaign data** produce spreadsheet-compatible content.
- Campaign Report offers panel-specific copying, CSV/Excel-compatible exports, chart SVG/PNG, and printing.
- Browser-local IndexedDB recovery and Campaign backups assist with restoration, but do not replace externally preserved inspection records.
- Some header copy and backup controls are hidden on narrow mobile screens.

**Before clearing browser data, preserve required inspection records.** Never commit confidential customer images, production records, credentials, or exported inspection data without authorization.

## 9. Measurement guidance and limitations

- Position the plate and either the ArUco target or traditional rulers on stable supports; keep the relevant reference surfaces at the PL measurement-plane height.
- Ensure ruler marks and plate damage boundaries are visible.
- Check independent X/Y scale validity before using photo-derived dimensions.
- Manually review suggested alignment lines and contours.
- Report precision in accordance with the actual measuring tool.
- Investigate improbable stroke or erosion results for incorrect geometry, calibration, or missing inputs.

**Beta limitation:** Automatic image recognition, contour-derived areas, and touch behavior require validation with physical reference measurements and real devices.

## 10. Documentation and support

- [Current application — refraInspector_v13.2.html](./refraInspector_v13.2.html)
- [Printable four-sheet ArUco target — 300 × 300 mm](./docs/RefraInspector_ArUco_300x300_4A4_NoZeroLabel.pdf)
- [SW/HW version mapping — CHANGELOG.md](./CHANGELOG.md)
- [Software releases (SW codes) — CHANGELOG_SOFTWARE.md](./CHANGELOG_SOFTWARE.md)
- [Hardware and ArUco target (HW codes) — CHANGELOG_HARDWARE.md](./CHANGELOG_HARDWARE.md)
- [Detailed historical changes — CHANGELOG_ARCHIVE.md](./CHANGELOG_ARCHIVE.md)

The current executable is **refraInspector_v13.2.html**. Obsolete **v13.0** and **v12.1.7** HTML files were removed from the current branch; their prior contents remain recoverable through Git history. Historical versions may still be mentioned in the software change log.

**Developer / Help Desk:** xuh@shinagawa-ref.jp
