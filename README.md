# RefraInspector

**Refractory Sliding Gate Plate Inspection & Campaign Analysis**

**Current version:** v13.2  
**Status:** Beta  
**Platform:** Modern desktop and mobile web browsers

RefraInspector is a browser-based application for inspection and analysis of refractory sliding gate plates (PLs) used in steelmaking. It supports Upper/Lower PL photographic inspection, dimensional measurement, damage assessment, remaining-stroke calculations, and Campaign performance analysis.

## Contents

- [1. Quick start — one inspection](#1-quick-start--complete-one-pl-inspection)
- [2. Warnings and errors](#2-warnings-and-errors--cause-and-solution)
  - [Diagnostic code index](#diagnostic-code-index-v132)
- [3. Detailed operation — states and transitions](#3-detailed-operation--states-permitted-actions-and-transitions)
  - [3.1 State flow](#31-at-a-glance-the-state-flow)
  - [3.2 S0 — No photo](#32-state-s0--no-photo-imported)
  - [3.3 S1 — Photo imported](#33-state-s1--photo-imported-automatic-setup-being-evaluated)
  - [3.4 S2 — Legacy calibration](#34-state-s2--traditional-leveling-and-xy-ruler-calibration)
  - [3.5 S3 — Alignment in progress](#35-state-s3--calibrated-photo-alignment-not-yet-verified)
  - [3.6 S4 — Verified photo](#36-state-s4--photo-alignment-verified)
  - [3.7 S5 — Ready to save](#37-state-s5--working-pl-set-ready-for-campaign-saving)
  - [3.8 S6 — Campaign saved](#38-state-s6--pl-set-saved-to-campaign)
  - [3.9 Actions that reset or alter state](#39-operations-that-can-change-the-state-unexpectedly)
  - [3.10 Troubleshooting by state](#310-state-transition-troubleshooting-shortcuts)
- [4. Features](#4-features-at-a-glance)
- [5. Calibration principles](#5-how-image-calibration-works-technical)
- [6. ArUco printing and installation](#6-aruco-target--printing-and-physical-setup)
- [7. Ellipse detection and constraints](#7-innerouter-ellipse-recognition-and-constraints-technical)
- [8. Data export and preservation](#8-export-and-data-preservation)
- [9. Measurement limitations](#9-measurement-guidance-and-limitations)
- [10. Documents and support](#10-documentation-and-support)

## Hardware design baseline — HW-03 v2.8.4 (2026-10-30)

**Current hardware concept: an integrated, bottom-open U-shaped jig intended for one-piece 3D printing**, evolved from the historical aluminum-extrusion proposal. The only authoritative design source for fabrication review is the [HW-03 v2.8.4 OpenSCAD file](./hardware/HW03_v2.8.4_QR_adjacent_label_rotated.scad). **Do not substitute the separately modified v2.8.5 design.**

The design incorporates three PL-positioning sides (top, left, right), numbered 1 mm rulers, four ArUco mounting areas (30 mm marker squares, nominal marker-centre spacing 300 × 300 mm), two right-side transverse M6 clearance holes for a future clamp, underside lightening pockets, a QR guide link, `SCAN FOR MANUAL` and `RefraInspector Jig`/version engraving. The lower side remains open for the PL long end. Apply physically printed **actual ArUco marker patterns**; CAD placeholder squares are not encoded markers.

**Prototype status:** The SCAD is a design reference, **not a verified one-piece watertight STL or a qualified manufactured part**. Do not change its dimensions, scale markings, QR matrix, lettering, ArUco positions, or geometry simply to force STL continuity. Record and review any disconnected geometry, print-envelope constraint, QR scan issue, M6 clamping deflection, or fit problem before proposing a separate revision. A single-piece build requires a printer with a suitable build envelope, approximately 360 × 360 mm in plan, plus margins. Measure the actual marker centre spacing and marker/PL coplanarity after fabrication.

**Marker printing:** use the original [4 × A4 ArUco calibration PDF](./docs/RefraInspector_ArUco_300x300_4A4_NoZeroLabel.pdf), printed at 100% and physically checked before installation. [Hardware revisions and validation status](./CHANGELOG_HARDWARE.md) remain distinct from [software releases](./CHANGELOG_SOFTWARE.md).

## v13.2 workspace update (2026-10-30)

The photo-workspace controls use a compact two-column arrangement with reduced spacing. Legacy X/Y ruler calibration starts collapsed and can be expanded when needed; ArUco detection remains accessible. Redundant inline workflow guidance was removed, with the verification and Campaign-saving controls retained. **Previous version:** [v13.0.6](./refraInspector_v13.0.6.html). Browser interaction and measurement accuracy have not been independently revalidated for this UI update.

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

## 3. Detailed operation — states, permitted actions and transitions

This section describes **what you can do in each state** and **what changes the state**. A PL set is a working pair of **Upper** and **Lower** photographs; each imported photograph has its **own** calibration, measurement guides and alignment verification. The two photographs do not have to reach the same state simultaneously.

### 3.1 At a glance: the state flow

```text
Open PL Inspection
    ↓
Enter / review PL Geometry and set identification
    ↓
No photo ── Import Upper, Lower or both ──→ Photo imported / unverified
                                              │
                      ┌───────────────────────┴───────────────────────┐
                      ↓                                               ↓
              ArUco detected? YES                              ArUco unavailable
                      ↓                                               ↓
              Homography passes?                                 Legacy Auto Level
                  │       │                                    / 2-point leveling
                 YES      NO                                          ↓
                  ↓       └── Check markers / retake           Calibrate X and Y
       Corrected image + valid scales                         (auto or manual)
                  │                                               │
                  └───────────────────────┬───────────────────────┘
                                          ↓
                                Scales valid on both axes
                                          ↓
                            Auto Align / manually adjust lines
                                          ↓
                              Review A–F and damage values
                                          ↓
                               Verify Alignment (per PL)
                                          ↓
                         Verified photo (may be only one side)
                                          ↓
               Review set usage / required fields / calculations
                                          ↓
                      Save set to Campaign (if requirements met)
                                          ↓
                Saved set → Campaign Performance / Report / export
```

**Two independent dimensions of status:** (1) each photo is absent, imported, calibrated, or verified; (2) the working PL set is unsaved or saved to Campaign. **Auto Align does not equal Verify Alignment.**

### 3.2 State S0 — no photo imported

**You can:** enter or paste **PL Geometry**; enter identifiers and operating information; import one photo or exactly two (Upper first, Lower second); open existing saved PL sets / Campaign views; access available data backups and restoration controls.

**You cannot complete:** photo-derived A–F measurements, photo alignment verification or a new Campaign save requiring a verified image.

**Transition:** import a readable photo → **S1** for that PL. Unsupported photo, too many selected files or failed decoding → remain **S0**, with `RI-IMP-001`–`RI-IMP-004` as applicable.

### 3.3 State S1 — photo imported, automatic setup being evaluated

**The application attempts ArUco automatically.** Check the current photo's assignment, timestamp and displayed setup status; swap Upper/Lower only after inspecting both photos.

| Condition | What you can do | Next state |
|---|---|---|
| Four markers recognized and geometry passes | Inspect corrected photo and X/Y px/mm; proceed to measurement-line review | **S3: scaled image** |
| No markers recognized | Use **Auto Level** or **Level with 2 Points**, then independent X/Y ruler calibration, provided both ruler references are visible | **S2: legacy leveling/calibration** |
| Some markers recognized or geometry invalid | Examine all IDs and quiet zones, verify 300 × 300 mm marker centres and same-plane mounting; retake/reimport, or use valid ruler references when available | **S1**, or **S2** if the legacy workflow is usable |
| Image import or processing problem | Check `RI-IMP-…` / `RI-ARU-…`; retry with a clear supported photo | **S0/S1** depending on whether a decoded photo was retained |

**Other permitted actions:** switch Upper/Lower views, replace imported photos after checking any unsaved-change prompt, examine time-gap warnings (`RI-PHO-001`) and possible assignment warnings (`RI-PHO-002`).

**Important:** ArUco failure does **not** make up a reliable px/mm scale. A greyed-out ArUco retry control has an explanatory hover on desktop; it is not proof that an image is calibrated.

### 3.4 State S2 — traditional leveling and X/Y ruler calibration

This state applies to photographs **without a successful ArUco Homography** and with suitable visible rulers.

1. Use **Auto Level** or **Level with 2 Points**. Review orientation; after a new rotation/leveling operation, check calibration again.
2. Select **Auto 100mm Calibration**; inspect **X and Y separately**.
3. If either axis fails (`RI-CAL-003`), choose **Start Manual Calibration** and mark the known 100 mm span for that axis. The failed axis must not silently retain an old valid scale.
4. Check the displayed values and photo references. Only when **both X and Y are valid** proceed to **S3**.

**Allowed while calibrating:** set/retry the ruler points, switch/replace photos (subject to any unsaved-edits warning), revisit geometry, and inspect the calibration status. When a *manual calibration interaction is actively collecting points*, other workspace controls can be temporarily disabled until that interaction is completed or cancelled.

**Blocked / unsuccessful transition:** **Verify Alignment** requires both scales. `RI-CAL-001` means invalid tick inputs; `RI-CAL-002` means points are too close; `RI-CAL-004` means an axis is missing when verification is attempted.

### 3.5 State S3 — calibrated photo, alignment not yet verified

**You can:** click **Auto Align**, inspect or drag guides, use **Undo Alignment** or **Reset Lines**, adjust the pink inner-bore bounds where available, inspect A–F estimates, choose manual A–F inputs, enter crack counts and remarks, and check calculated areas. A manual A–F value is a measurement override; it does **not** reposition the corresponding image guides.

**Auto Align does the following:** estimates the inner opening → proposes **H3/H4** and inner left/right bounds; independently searches the outer worn region → proposes **H2/H5/V1/V2** tangents. It does not require the two ellipses to be concentric.

**Hard geometric constraints:** `H1 < H2 < H3 < H4 < H5 < H6`; V1 stays left of the inner opening and V2 stays right of it. A candidate outer ellipse must encompass the **whole inner ellipse**; candidates crossing the inner arc are rejected and a more outward search may be attempted. These guards prevent invalid geometry but **do not guarantee that the visually chosen wear boundary is correct**.

**What can fail without blocking manual review:** low-confidence inner bore (`RI-ALN-001`), unavailable inner opening (`RI-ALN-002`), intersecting arcs (`RI-ALN-003`) and outer contour reaching the image edge (`RI-ALN-004`). In these cases inspect the photograph and manually adjust the permitted guides; a rejected outer candidate should not be treated as successfully detected.

**Transition:** visually review actual damage edges and press **Verify Alignment*** → **S4**, provided the image exists and both scales are valid. An uncalibrated photo cannot pass (`RI-CAL-004`).

### 3.6 State S4 — photo alignment verified

The current Upper **or** Lower photo is marked verified. **Verification is per photo**, not automatically shared with its partner.

**You can:** review/copy eligible data for that verified photo, work on the other photo, inspect results, enter usage and remarks, and proceed to saving when the PL set meets save requirements. A single-photo PL set can be verified and saved without inventing a second photo.

**Transition back to S3:** edits affecting the photo, image positioning, ruler scales or measurement-guide alignment may invalidate that photo's verification. After such a change, inspect it again and click **Verify Alignment*** once more. **Auto Align and manual movement do not automatically re-verify** the image.

**If both photos are imported:** verifying Upper alone does **not** verify Lower. Before saving a pair, complete the missing side as well; otherwise `RI-VER-002` identifies the side that still needs verification.

### 3.7 State S5 — working PL set ready for Campaign saving

**Check before saving:**

- Correct Campaign and PL pair identifiers, PL Geometry and shared safe-stroke data.
- Every **imported** PL photo has valid scales and a verified alignment. An absent partner is not implicitly required.
- A–F numbers and damage-area estimates are physically plausible; correct guides or enter manual A–F values as necessary and re-verify where required.
- PL Set Usage Info (runtime, used heats, etc.), cracks and remarks are accurate. **Usage values are pair-level information.**

**You can:** save the set using **Save set to campaign**, change allowable unsaved fields, or return to S3/S4 for corrections.

**Transitions:** successful save → **S6**. Missing photo/verification → appropriate S0/S3/S4 with `RI-VER-002`. Missing or invalid other required fields may trigger `RI-SAV-001` and a confirmation about an incomplete/session-only record; avoid treating such a record as an approved production measurement.

### 3.8 State S6 — PL set saved to Campaign

**You can:** select and review saved PL sets, inspect **Campaign Performance** and **Campaign Report**, copy/export supported tables and charts, back up/restore Campaign records, and select PL sets for deletion (with confirmation).

**Data-integrity rules:**

- The saved PL set remains a member of its Campaign unless the supported delete workflow removes it.
- **PL Set Usage Info is locked after a PL set has been saved.** Check heats and runtime before saving.
- Editing **shared PL Geometry** prompts a warning (`RI-SAV-002`) because it can affect calculations across existing saved sets; Campaign membership is preserved, but affected results must be reviewed.
- Some supported changes to a saved PL set may update its Campaign data; distinguish saved values from unsaved working edits. Copying saved records may warn that unsaved changes are excluded (`RI-DAT-003`).
- Deletion (`RI-DAT-001`) and restoration (`RI-DAT-004`) have different consequences from switching/selecting a set. Make a backup first.

**Transition:** choose/import another working PL set → relevant S0–S5 states for that set. Deleting a selected saved set removes its saved record; it does not restore a deleted record automatically.

### 3.9 Operations that can change the state unexpectedly

| User action | What to expect / what to do next |
|---|---|
| Replace Upper or Lower photo | Re-run the photo's import/ArUco or ruler workflow and review guides; its former verification should not be reused. |
| Rotate or level a ruler photo | Recheck **both X/Y** scales and re-verify alignment if invalidated. |
| Move H/V lines, Auto Align, Undo Alignment, Reset Lines | Review A–F and re-verify when verification is invalidated; never assume an automatic line placement was reviewed. |
| Change a manual A–F value | Review dependent calculations; check whether the current edit triggers verification invalidation before saving/export. |
| Swap Upper and Lower | Confirm identities and recheck any plate-specific interpretation; the swap carries the photo's supporting measurement/verification data with that photo. |
| Modify shared PL Geometry | Treat as a Campaign-wide calculation change; read the warning and inspect affected saved sets. |
| Import/restore backup | May replace current session and saved state; preserve a separate backup before accepting. |
| Clear browser storage | May destroy local recovery data; export/backup records externally first. |

### 3.10 State-transition troubleshooting shortcuts

- **Stuck before perspective/calibration?** Check `RI-ARU-001`–`004` or `RI-CAL-001`–`004`, then return to S1/S2.
- **Scales exist but the ellipses are wrong?** Stay at S3, manually inspect and correct lines; check `RI-ALN-001`–`004`.
- **Verify button does not complete?** Check that a photo exists (`RI-VER-001`) and both scales exist (`RI-CAL-004`).
- **Cannot save?** Check all **imported** photos' verification (`RI-VER-002`) and the required operating fields (`RI-SAV-001`).
- **Campaign results seem changed or missing?** Check the active Campaign, saved-vs-unsaved data, shared geometry updates (`RI-SAV-002`) and backup history.


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
