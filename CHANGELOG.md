# RN Plate Pair Inspector — Complete Version Update History

## v11.0.0 — 2026-10-19 (JST)
**Type:** Major release / Consolidated Campaign inspection workflow
- Consolidates local improvements through v10.2.31 into the main application.
- Separates importing a new PL set from replacing photos in the active set, with confirmation before discarding unsaved work; fixes Upper/Lower photo assignment swapping.
- Shows five saved-set alignment/save statuses and blocks Save to Campaign until every imported PL photo is alignment-verified.
- Adds PL Performance animation after successful saves that change campaign summary values.
- Includes prior automatic IndexedDB recovery, capture-time extraction, Excel export refinements, Remaining Stroke judgments, and Upper/Lower selector controls.
- This major number is a release consolidation; it does not imply production validation. Browser and real-photo testing remain necessary.

## v10.2.25 — 2026-10-19 (JST)
**Type:** Photo workspace UI / usability and reporting
- Replaced Upper/Lower photo cards with a compact two-position selector, and restored the saved PL-set dropdown alongside it above workspace controls.
- Matched slider and saved-set selector widths/alignment; removed duplicate switching instructions.
- Added JPEG/HEIC photo capture timestamp extraction and preservation in saved campaigns, recovery snapshots and Excel reports (v10.2.19).
- Added browser-local IndexedDB auto-recovery with five retained snapshots, while keeping manual Campaign backups (v10.2.15).
- Added saved PL-set Remaining Stroke judgments, manual crack-count reporting fix, renamed Copy PLs data with clipboard confirmation, and cleared Marks for four non-dimensional report rows (v10.2.16–v10.2.18).
- Measurement calculation logic remains unchanged; browser/device validation remains necessary.

## v10.2.14 — 2026-10-16 (JST)
**Type:** PL inspection workflow / Excel reporting / UI enhancements
- Added full Campaign backup and restore, with backup filenames including Campaign ID, PL ID and date; corrected canvas reconstruction during restoration.
- Simplified campaign geometry to one recognized six-column input area and reorganized backup/restore controls.
- Standardized Excel exports with plate metadata, English measurement names, abbreviations and remarks, individual PL columns, and Campaign Performance values with source PL sets identified.
- Added fine keyboard adjustment of H/V measurement lines and measurement-source status for A–F and area calculations.
- Improved modular structure of report and UI helpers; removed redundant campaign-copy and old pair JSON/image export buttons.
- **Release date is a project label: 2026-10-16. Actual GitHub commit timestamps reflect the upload time.**

## v10.2.4 — 2026-10-15 (JST)
**Type:** Patch / Measurement-line guidance
- Shows contextual hover hints for H1–H6 and V1–V2 photo-workspace measuring lines, using the inspector-provided edge and damage definitions.
- Keeps measurement geometry and drag behavior unchanged.
- Includes prior local development through v10.2.3: campaign-wide W0/X0/Y0/Z0/R0 inputs and all-saved-set Excel copying with one column per individual PL.

## v10.1 — 2026-10-15 (JST)
**Type:** Photo workflow / Identification safeguards / UI / Version release
- Shows the full **Import / Replace Photo** label in the #0 workspace panel, including after a photograph is loaded.
- Adds **Swap U/L PL** in #0 to exchange Upper/Lower photographs and associated inspection data; alignment requires re-verification after swapping.
- Rechecks potential Upper/Lower photo misidentification each time the swap action is used.
- Adds an advisory visual check for the characteristic circular long-end closure mark usually present on RN Lower PLs, with manual confirmation rather than automatic reassignment.
- Suppresses mix-up warnings unless both Upper and Lower photographs have been imported.
- Allows switching PLs and importing/replacing photos even when automatic ruler calibration fails.
- Adds a self-contained RefraInspector browser favicon.
- Preserves the restored Save Reminder workspace control layout, in-session saved sets, and campaign exports from v10.0.

**Validation:** JavaScript syntax checks passed in local iterations; real-image recognition accuracy and interactive browser/device behavior have not yet been validated.

## v10.0 — 2026-10-15 (JST)
**Type:** Major version / Workspace & campaign functionality
- Restores the compact workspace layout based on the Save Reminder reference, with #0 Import/Replace, #1 Level, #2 Calibration, #3 Alignment, and #4 Save Set.
- Includes saved PL-set navigation, campaign data copying, save attention reminder, and existing per-photo alignment verification.

## v9.4.10 — 2026-10-14 (JST)
**Type:** UI / Measurement interaction
- Adds an **i** icon to the PL A–F Dimensions · Upper / Lower header; opens the existing PL photo workspace measurement legend without toggling the panel.
- Preserves editable side-by-side Upper/Lower A–F value boxes with automatic measurement as the default and manual override on entry (v9.4.8).
- Clearing an A–F manual override and leaving the textbox restores its automatically measured value when available (v9.4.9).
- Builds upon v9.4.7's per-photo alignment verification, iPhone ruler-calibration improvements, responsive workspace and Excel export restrictions.

**Note:** This is beta software; image detection and iPhone interactions need validation on actual devices.

## v9.4.7 — 2026-10-14 (JST)
**Type:** New / Modified / Calibration / Responsive UI / Verification

### iPhone ruler calibration (v9.3–v9.3.4)
- Increases image detail for ruler tick recognition and adds an adaptive retry for low-contrast graduation patterns, with separate X/Y diagnostics.
- When auto 100 mm calibration fails, hides measurement lines and shows two vertical X guides and two horizontal Y guides for independently marking 100 mm spans. Guide dragging updates px/mm readings live.
- Combines horizontal/vertical manual calibration into a single workflow. Auto 100 mm Calibration clears prior manual settings before attempting a new independent auto scan.
- Retains the last auto X/Y values near the button even after manual calibration; flags X/Y disagreement greater than a provisional 12% threshold. Never substitutes a guessed scale on failure.

### Workspace and usability (v9.3.5–v9.4.5)
- Groups photo actions by #0 Import/Replace, #1 Level, #2 Calibration, and #3 Alignment; reorganizes controls into a compact responsive 2×2 layout.
- Removes verbose ruler/ellipse status blocks and redundant geometry-paste controls. Campaign geometry paste remains automatically applied.
- Adds adjustable left geometry/right results widths, independent desktop scrolling, a wider photo-first default, and responsive stacking of Measured versus Calculated results when needed.
- Improves narrow A–F measurement rows, removes duplicate “Used” readout, preserves inline manual input space on Auto/Manual toggles, and prevents overlapping values.
- Replaces separate Start/Done calibration buttons with a single Start Manual Calibration / Finish Manual Calibration toggle that temporarily disables other workspace actions.
- Runs automatic leveling, ruler calibration, and feature alignment after photo import; initializes manual calibration guides near estimated ruler positions.

### Verification and export gating (v9.4.6–v9.4.7)
- Adds a required **Verify Alignment*** confirmation for each imported PL. Changes to its photo/lines/calibration invalidate only that plate's confirmation.
- Allows verified Upper or Lower PL data and per-plate exports independently, including when only one photo was imported.
- Warns when a second imported PL remains unverified; the unverified PL's values remain locked while already-verified data remains available.
- Keeps pair-dependent R/ΔR/ER and other paired calculations unavailable until both relevant photos are verified.
- Retains the standardized Excel Mark-or-Abbreviation + Upper/Lower table, missing-value blanks, and one-decimal numeric export format.

**Validation limitations:** JavaScript syntax validation completed during beta iterations; photo-processing accuracy and browser/iPhone interactions require real-device testing. Auto-alignment and photo-derived area estimates are not independently validated.

## v9.2 — 2026-10-13 (JST)
**Type:** Experimental / Modified / UI / Export

- Adds feature-specific **Auto Align** with separate inner used-bore and outer edge-damage ellipse contour detection. Candidate contour points are fitted, filtered for outliers and refitted before positioning H3/H4, inner bore guides, H2/H5 and V1/V2; H1/H6 use separate plate-reference edge searches.
- Keeps automatic suggestions subject to inspector review: high image-edge confidence is not validated physical measurement accuracy, especially for surface damage.
- Hides all contour dots and ellipse outlines in the photo workspace while preserving the two-ellipse calculations and manual line adjustment.
- Reorders workspace controls into numbered steps: 1. Auto Level, 2. Auto Align, 3. Level with 2 Points, 4. Undo Alignment, 5. Reset Lines.
- Expands the Paste Campaign Geometry textbox by default in its original location.
- Refines Copy pair report for Excel into Mark/Abbreviation and Upper/Lower data columns in the specified 25-item order. Uses Mark where provided and abbreviation otherwise; unavailable values remain blank and copied numeric data uses one decimal place.
- Removes the redundant selected-PL Excel copy button, selected image + JSON export button and the associated preview textbox. Retains the main pair Excel copy and pair JSON/image exports.
- Adds measurement Mark codes to available calculated-result labels.
- Updates browser title and Help & User Manual version labels to v9.2.

**Limitations:** Auto-alignment is experimental and has not yet been benchmarked against reference PL measurements. Operator confirmation and ruler calibration remain essential.

## Version 8.4 — 2026-10-13 (JST)
**Type:** Modified / Fix
- Bore Enlargement Area ⓘ now shows S = π × rₓ × rᵧ with current Upper/Lower radii, calibrated px/mm, and substituted numerical result.
- Shows ΔS = S − π × Y² with numerical substitution when Y is entered.
- Fixes incorrect W dependency highlighting and highlights the inner bore ellipse measurement region.
- Calculation formulas remain unchanged; only explanation and highlighting are modified.

## Version 8.3 — Date not recorded
**Type:** Modified
- Adds units in Excel pair-report column headers, including mm, mm/min, mm/heat, min, counts and mm².
- Adds units to selected-PL copy labels; numerical cell values remain suitable for Excel calculations.

## Version 8.2 — Date not recorded
**Type:** New / Modified
- Links crack-related Remarks tags to the numeric Cracks panel.
- Adds + / − controls and quantity indicators for four crack categories.
- Synchronizes direct Cracks panel edits with Remarks indicators for each PL.

## Version 8.1 — 2026-10-09 (JST)

**Type:** Modified / Fix — iPhone browser compatibility.

**New / modified features:**
- Open the photo picker directly from the Import PL Photo and Exchange/Replace controls to improve iPhone Safari usability.
- Make the native file input accessible to Safari while visually hiding it.
- Show the loading animation before asynchronous photo processing begins.
- Reduce oversized image working resolution to 2300 px (longest side) on iOS and 4200 px on desktop to improve memory reliability.
- Use asynchronous canvas Blob creation for photo previews, avoiding synchronous large Base64 strings.
- Skip automatic leveling during iPhone import; the user may choose Auto level or Level by 2 points afterward.
- Enlarge touch targets and adapt the layout for narrow screens.
- Preserve independent Upper/Lower photos, calibration, manual measurement inputs, and existing exports.

**Limitations:** iPhone Safari behavior has not yet been confirmed on a physical device. Resizing a photo reduces pixel detail; ruler calibration is based on the resized working image. v8.0 remains available in Git history.


**Current release:** v11.0.0  
**Release date:** 2026-10-15 (JST)  
**Earliest documented source:** `rn_plate_annotation_tool(2).html` (original five-horizontal/two-vertical annotation tool).  
**Source base:** `refra_inspector_v7_39_photo_import_ui.html` (v7.38 ruler algorithm + updated photo import UI).

## Version 8.0 baseline capabilities

- Upper and Lower PL photos, including JPEG/PNG/HEIC/HEIF (HEIC fallback may require internet).
- Photo import in the empty workspace, loading spinner, and replace/exchange icon once loaded.
- Independent ruler X/Y calibration per photo; improved tick detection with ruler-region scanning and subpixel estimates.
- Manual 100 mm horizontal and vertical calibration as fallback.
- Leveling by two points, dimension guide lines, A–F auto/manual input, area estimates, cracks candidate scan, notes.
- Campaign geometry, PL performance, LD and R calculations, Excel copy and image/JSON export.
- Version history available from the header.

## Chronological changelog — from the original annotation tool

| Version | Update date/time | Type | New feature / focus | Modified features / details | Status as of v10.1 |
|---|---|---|---|---|---|
| 1.0 | Not recorded | New | Initial RN Plate Line Annotation Tool | Image import, five draggable horizontal / two vertical lines, editable labels, VGG-like JSON export and copy | Historical starting point |
| 1.x (6H) | Not recorded | Modified | Six-horizontal-line prototype | Expanded the initial five-line layout to six horizontal reference lines | Superseded |
| 2.0 | Not recorded | Modified | Line annotation workflow v2 | Revised annotation and controls in v2 source | Superseded |
| 2.1 | Not recorded | Fix | Annotation v2.1 refinement | Incremental improvements preserved in v2.1 source | Superseded |
| 3.0 | Not recorded | New | Photo normalization | Image normalization workflow introduced | Superseded |
| 3.1 | Not recorded | Modified | Live rotation | Interactive rotation and live annotation update | Superseded |
| 4.0 | Not recorded | Modified | Automatic normalization | Automated photo normalization refinement | Superseded |
| 4.1 | Not recorded | New | Reference-line mode | Reference line added to normalization workflow | Superseded |
| 5.0 | Not recorded | New | Live dimensions | On-image measurement distance readouts | Evolved into later A–F workflow |
| 5.1 | Not recorded | New | Copy marks | Copy / reuse annotated marks | Superseded |
| 5.2 | Not recorded | New | Arrows and Excel output | Measurement arrows and spreadsheet-friendly data | Evolved into later export |
| 5.3 | Not recorded | Experimental | Early automatic ruler calibration | Ruler detection introduced to annotation tool | Superseded |
| 5.3.1 | Not recorded | Fix | Visible measurement lines | Restore/improve line visibility | Superseded |
| 5.3.2 | Not recorded | Fix | Measurement-line fixes | Additional line positioning fixes | Superseded |
| 5.4 | Not recorded | Modified | Ordered vertical output | Revised order of vertical output fields | Superseded |
| 5.5 | Not recorded | Modified | Photo-name copy | Include photo filename when copying measurements | Evolved into export |
| 6.0 | Not recorded | New | RN PL pair workspace | Transition from annotation tool to Upper/Lower inspection and calculations | Integrated / evolved |
| 6.1 | Not recorded | New | Bore and cracks | Initial bore-area and crack inspection UI | Evolved |
| 6.2 | Not recorded | New | Grid-based area estimate | Pixel/grid approximation for bore and damage areas | Evolved |
| 6.3 | Not recorded | Fix | Live dimension updating | Fix measurement recalculation as guides move | Integrated |
| 6.4 | Not recorded | New | Formula explanation icons | ⓘ formula popovers for derived values | Integrated |
| 6.5 | Not recorded | New | LD / stroke metrics | Long-end damage and remaining stroke calculations | Integrated |
| 6.6 | Not recorded | Modified | D0 / dependency highlights | Formula-related highlighting and input dependencies | Evolved |
| 6.7 | Not recorded | Modified | Pair ID UI placement | Move pair ID into measurement/right workspace | Integrated |
| 6.8 | Not recorded | Fix | Area reference radius Y | Use correct original bore radius for area comparisons | Integrated |
| 6.9 | Not recorded | Modified | Nested ellipse area model | Introduce nested used-bore and edge-damage ellipses | Integrated |
| 7.0 | Not recorded | New | Automatic nested-ellipse bore/edge area model | Introduced area-related overlays and calculations | Integrated |
| 7.1 | Not recorded | New | Campaign geometry bulk paste | Paste and validate W0, X0, Y0, Z0, R0, H0 | Integrated |
| 7.2 | Not recorded | Modified | Photo-driven inner bore boundary detection | Use image-based left/right bore edges | Integrated |
| 7.3 | 2026-10-09 JST* | New | Collapsible remarks | Independent Upper/Lower observation interface | Integrated |
| 7.4 | 2026-10-09 JST* | New | Two-photo pair import; adjustable inner bore boundaries | Upper/Lower photo workflow and bore guides | Integrated |
| 7.4.1 | Not recorded | Fix | Recalculate after leveling | Update measurements after image rotation | Integrated |
| 7.4.2 | Not recorded | Modified | PL geometry and performance layout | Campaign inputs / summary grouping | Integrated |
| 7.5 | 2026-10-09 JST* | Modified | Bore/edge measurement source toggles | Auto/manual selected dimension presentation | Integrated |
| 7.6 | 2026-10-09 JST* | Modified | Collapsible calculated subcategories | Grouped right-hand data and calculations | Integrated |
| 7.6.1 | Not recorded | New | PL set performance summary | Recorded sets, safe-limit count and average erosion | Integrated |
| 7.6.2 | Not recorded | Modified | Tangent / overlapping measurement guides | Support overlapping H4/H5/H6 boundaries | Integrated |
| 7.7 | 2026-10-09 JST* | Modified | Reorderable measurements and two-PL dimensions | More compact Upper/Lower A–F entry | Integrated |
| 7.8 | 2026-10-09 JST* | Modified | Bore enlargement formulas | Used bore and enlargement calculation definitions | Integrated |
| 7.8.1 | Not recorded | New | Workspace help / measurement reference legend | A–F definition overlay | Integrated |
| 7.9 | 2026-10-09 JST* | Modified | Compact inspection UI | Reduced table and input spacing | Integrated |
| 7.10 | Not recorded | Modified | Vertically grouped set sections | Earlier right-panel layout experiment | Superseded by 7.19 |
| 7.11 | Not recorded | New | Area diagnostics | Bore and edge area readout notes | Integrated |
| 7.12 | Not recorded | Modified | Dual Upper/Lower area result table | Side-by-side area comparisons | Integrated |
| 7.13 | Not recorded | New | Ruler calibration validation notices | Flag uncertain X/Y scale estimates | Integrated |
| 7.14 | Not recorded | Experimental | Numbered ruler reading | Early attempt to use marked ruler values | Superseded |
| 7.15 | Not recorded | Experimental | Automatic tick counting | Tick sequence-based scale estimation | Superseded |
| 7.16 | Not recorded | Experimental | Multi-strategy ruler tick detection | Additional calibration candidates | Superseded |
| 7.16.1 | Not recorded | Fix | Restore A–F table after detector changes | Repair removed-element script reference | Integrated |
| 7.17 | Not recorded | Modified | Return to pixel-based A–F dimensions | A–F = pixel distance / px-per-mm; no per-line tick interpolation | Integrated |
| 7.18 | Not recorded | Modified | Ruler calibration panel near photo | 100 mm span and X/Y consistency checks | Integrated |
| 7.19 | Not recorded | Modified | Compact two-column measured/calculated panel | Side-by-side results interface | Integrated |
| 7.20 | Not recorded | New | Auto-apply campaign Excel / TSV geometry | Improved bulk paste interaction | Integrated |
| 7.21 | Not recorded | Modified | Upper/Lower long-end damage comparison | LD, ΔT, total recession grouping | Integrated |
| 7.22 | Not recorded | Modified | Collapsible PL geometry/performance; formula focus and input refinements | Fine rotation removed; manual A–F fields conditional; Used Bore Area focus fix | Later continued via custom UI branch |
| 7.23 | 2026-10-09 JST* | New | HEIC/HEIF image import | Native decode with browser-side fallback | Integrated |
| 7.24 | 2026-10-09 JST* | Modified | Excel pair report export | One Upper row and one Lower row, standardized area headings | Integrated |
| 7.25 | 2026-10-09 JST* | Fix | HEIC decoder fallback | New decoder attempted before legacy decoder | Integrated |
| 7.26 | 2026-10-09 JST* | Modified | Multi-region ruler tick detector | Higher analysis resolution and candidate-band checks | Superseded by 7.35/7.38 |
| 7.27 | 2026-10-09 JST* | Experimental | OCR ruler numbers | Recognize centimeter labels for calibration | Rolled back |
| 7.28 | 2026-10-09 JST* | Modified | Horizontal-guided vertical scale checks | X/Y discrepancy threshold and fallback experiment | Superseded |
| 7.29 | 2026-10-09 JST* | New | Calibration failure warning and gray-out | Re-run detection; flag uncalibrated dimensions | Integrated |
| 7.30 | 2026-10-09 JST* | Experimental | Draggable 100 mm spans and visibility toggle | Photo overlay endpoints for X/Y scale | Rolled back |
| 7.31 | 2026-10-09 JST* | Fix | Separate image decode vs post-import errors | Avoid false “Unable to import” on successful HEIC decode | Integrated |
| 7.32 | 2026-10-09 JST* | Rollback | Restore pre-7.30 calibration UI | Remove draggable 100 mm overlays; retain import fix | Historical baseline |
| 7.33 | 2026-10-09 JST* | Fix | Independent Upper/Lower X/Y scales | Remove copy-from-other-plate and Y=X fallbacks | Integrated |
| 7.34 | 2026-10-09 JST* | Modified | Multi-scale ruler tick pattern analysis | 1/5/10 mm evidence and ambiguity checks | Superseded by 7.35/7.38 |
| 7.35 | 2026-10-09 JST* | Modified | Robust ruler search for inset rulers | 10 mm periodicity; right-side vertical ruler detection | Baseline for 7.38 |
| 7.36 | 2026-10-09 JST* | Experimental | Level-safe calibration using unrotated image | Avoid padded-canvas detection issue | Not included in v8.0 |
| 7.37 | 2026-10-09 JST* | Experimental | Virtual-tilt ruler detection fallback | Try small internal rotations | Rolled back to 7.35 |
| 7.38 | 2026-10-09 JST* | Modified | Per-image ruler ROI and subpixel spacing | Reduce fixture false positives and coarse quantization | Integrated |
| 7.39 | 2026-10-09 JST* | New | Improved photo import UX | Centered initial import button, loading spinner, replace icon | Integrated |
| 8.0 | 2026-10-09 JST* | Release | Major-version milestone from 7.39 | Visible version updated; version-history dialog and changelog added | Historical milestone |
| 8.1 | 2026-10-09 JST | Fix / Modified | iPhone Safari photo import reliability | Accessible file picker, loading spinner before processing, reduced working image sizes, asynchronous preview creation and larger mobile touch targets | Integrated |
| 8.2 | Not recorded | New / Modified | Crack-count and remarks-tag synchronization | Per-category plus/minus controls, quantitative tags and two-way Cracks/Remarks updates | Integrated |
| 8.3 | Not recorded | Modified | Units for Excel output | Include measurement units in pair report headers and selected-PL copy labels | Integrated |
| 8.4 | 2026-10-13 JST | Modified / Fix | Bore enlargement formula explanation | Numeric substitution for used-bore and enlargement-area popovers; fix W-dependency highlighting | Integrated |
| 9.2 Beta | 2026-10-13 JST | Experimental / Modified | Photo contour auto-alignment and standardized pair export | Inner/outer ellipse contour suggestions, numbered workspace actions and 25-item Upper/Lower Excel report; inspector review remains necessary | Integrated / experimental |
| 9.3–9.3.4 Beta | 2026-10-14 JST | Modified / Fix | Robust ruler calibration and manual 100 mm guides | Higher-resolution/adaptive tick detection; independent X/Y guide calibration; report significant scale disagreement without guessing | Integrated / requires testing |
| 9.3.5–9.4.5 Beta | 2026-10-14 JST | Modified | Compact resizable workspace and A–F input improvements | Grouped numbered controls, responsive photo-first layout, single manual-calibration toggle, automatic post-import workflow and less overlapping data | Integrated |
| 9.4.6–9.4.7 Beta | 2026-10-14 JST | New / Verification | Per-photo alignment confirmation and export gating | Require Verify Alignment per imported PL; independent verified data access; pair-dependent calculations require both relevant verifications | Integrated |
| 9.4.8–9.4.9 Beta | 2026-10-14 JST | Modified / Fix | Editable Upper/Lower A–F value boxes | Direct manual override, automatic measured defaults and restoration of automatic values after clearing overrides | Integrated |
| 9.4.10 Beta | 2026-10-14 JST | Modified | A–F measurement legend shortcut | Add ⓘ in A–F Dimensions panel; retain editable side-by-side entries | Integrated |
| v10.0 | 2026-10-15 JST | Major release / Modified | Restored Save Reminder control layout and campaign navigation | #0–#4 workspace controls, saved PL sets, campaign copying, save reminders and alignment verification | Superseded by v10.1 |
| v10.1 | 2026-10-15 JST | Modified / Fix | Upper/Lower identification and photo-import workflow | Characteristic Lower PL closure-mark warning when two photos exist; manual U/L swap and repeat checking; calibration-independent import/replace; visible button label; embedded favicon | Historical / detection unvalidated |
| v11.0.0 | 2026-10-19 JST | Major | Consolidated verified campaign workflow | New/replace photo controls, mandatory alignment verification, save status and performance animation | Current |
| v10.2.25 | 2026-10-19 JST | UI / Fix / Recovery | Upper–Lower slider and saved-set selector, timestamps, auto-recovery, reporting fixes | Improved in-browser inspection workflow | Historical |
| v10.2.14 | 2026-10-16 JST | Modified / New | Campaign backup, line precision, standardized reporting | Merged campaign and per-PL Excel reporting with provenance and English abbreviations/remarks | Historical |
| v10.2.4 | 2026-10-15 JST | Patch | Measurement-line hover hints | H1–H6 and V1–V2 definitions visible on hover; retains prior saved-set Excel and campaign geometry improvements | Historical |

## Date and traceability notes

Entries for the earliest stages are based on the available source filenames and code; precise release dates, as well as the exact contents of some intermediate change requests, cannot be verified. Descriptions are intentionally limited to confirmed or source-indicated functions.

`Not recorded` means the available source files and chat history do not establish a reliable release date/time. 
`2026-10-09 JST*` indicates the change was documented in the October 9 conversation, **not** a verified precise build timestamp. 
The user-facing Version 8.0 release is dated 2026-10-09 JST; exact minute has not been verified independently. 
Historical items describe development iterations, including experiments that were rolled back; they are **not** a guarantee that every historical feature remains active in v10.1. Newer computer-vision warnings are advisory and have not been validated against reference inspection data.