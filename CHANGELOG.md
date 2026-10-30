# RefraInspector — Change History and SW/HW Traceability

**Current software:** `SW-13.2.7` / RefraInspector v13.2.7 (Beta)  
**Hardware reference:** `HW-02` printable ArUco target; `HW-03 v2.8.4` integrated 3D-print design baseline (not a validated production jig).

Changes are maintained in two independently numbered registers:

- [Software changes — `CHANGELOG_SOFTWARE.md`](./CHANGELOG_SOFTWARE.md): application functions, measurement/calibration logic, UI, Campaign and exports.
- [Hardware changes — `CHANGELOG_HARDWARE.md`](./CHANGELOG_HARDWARE.md): physical rulers, printable markers, calibration fixtures and test plans.
- [Detailed archived software history — `CHANGELOG_ARCHIVE.md`](./CHANGELOG_ARCHIVE.md): previous patch-by-patch records, left intact.

## Version-specific change notes

Jump directly to an individual release or hardware iteration. The linked descriptions are the authoritative change records; hardware versions below are **design iterations**, not independently validated production parts.

**Software releases** (newest first): [SW-13.2.7](./CHANGELOG_SOFTWARE.md#sw-1327--v1327--2026-10-30-beta) · [SW-13.2](./CHANGELOG_SOFTWARE.md#sw-132--v132--2026-10-30-beta) · [SW-13.0](./CHANGELOG_SOFTWARE.md#sw-130--v130--2026-10-28) · [SW-12.1.7](./CHANGELOG_SOFTWARE.md#sw-1217--v1217--2026-10-22) · [SW-12.1.4](./CHANGELOG_SOFTWARE.md#sw-1214--v1214--2026-10-20) · [SW-12.1.1](./CHANGELOG_SOFTWARE.md#sw-1211--v1211--2026-10-20) · [SW-12.0.0](./CHANGELOG_SOFTWARE.md#sw-1200--v1200--2026-10-20) · [SW-11.0](./CHANGELOG_SOFTWARE.md#sw-110--v110--2026-10-1920) · [SW-10.0](./CHANGELOG_SOFTWARE.md#sw-100--v100--2026-10-1519) · [SW-9.0](./CHANGELOG_SOFTWARE.md#sw-90--v90--2026-10-1314) · [SW-08 and earlier](./CHANGELOG_SOFTWARE.md#sw-08--v80-and-earlier--through-2026-10-13).

**HW-03 jig iterations** (newest first): [v2.8.4](./CHANGELOG_HARDWARE.md#current-design--hw-03-v284--2026-10-30) · [v2.8.3](./CHANGELOG_HARDWARE.md#hw03-v2-8-3) · [v2.8.2](./CHANGELOG_HARDWARE.md#hw03-v2-8-2) · [v2.8.1](./CHANGELOG_HARDWARE.md#hw03-v2-8-1) · [v2.8](./CHANGELOG_HARDWARE.md#hw03-v2-8) · [v2.7](./CHANGELOG_HARDWARE.md#hw03-v2-7) · [v2.6](./CHANGELOG_HARDWARE.md#hw03-v2-6) · [v2.5](./CHANGELOG_HARDWARE.md#hw03-v2-5) · [v2.4](./CHANGELOG_HARDWARE.md#hw03-v2-4) · [v2.3](./CHANGELOG_HARDWARE.md#hw03-v2-3) · [v2.2](./CHANGELOG_HARDWARE.md#hw03-v2-2) · [v2.1](./CHANGELOG_HARDWARE.md#hw03-v2-1) · [v2](./CHANGELOG_HARDWARE.md#hw03-v2).

**Other hardware records:** [HW-02 ArUco calibration target](./CHANGELOG_HARDWARE.md#hw-02--aruco-calibration-target-four-a4-sheets) · [HW-01 legacy rulers](./CHANGELOG_HARDWARE.md#hw-01--two-ruler-photographic-reference-legacy) · [HW-04 accuracy validation plan](./CHANGELOG_HARDWARE.md#hw-04--measurement-accuracy-verification-protocol-planned).

## Numbering convention

| Domain | Format | Example | Scope |
|---|---|---|---|
| Software | `SW-<version>` | `SW-13.0` | HTML application release, linked to `refraInspector_v13.2.7.html` |
| Hardware | `HW-XX` | `HW-02` | Printable target, physical setup or proposed jig; **not** tied 1:1 to a software version |
| Mapping | `SW ⇄ HW` | `SW-13.0 ⇄ HW-02` | Compatibility or intended use, **not** proof of tested integration |

## Release note (2026-10-30)

`SW-13.2.7` is the current software release, adding unified Campaign export, true XLSX output, paired PL details, separated Campaign reference/results and corrected chart terminology. Earlier `SW-13.2` introduced a compact workspace layout, using the same ArUco target (`HW-02`) and existing measurement workflow. The last working application, [`v13.0.6`](./refraInspector_v13.0.6.html), is retained for rollback.

## Correspondence between software and hardware

| Software ID / feature | Hardware ID | Relationship | Verification status |
|---|---|---|---|
| `SW-08` / baseline photo measurements and A–F | `HW-01` | Two perpendicular scales support image measurement | Needs independent precision assessment |
| `SW-9.0` / X/Y ruler calibration, Auto/Manual Level | `HW-01` | Two independent 100 mm references | Implemented software; physical validation incomplete |
| `SW-10.0` / photo import, Upper/Lower and export workflow | `HW-01` | Standardized ruler-based photo setup | Workflow available |
| `SW-11.0` / verification and Campaign data integrity | `HW-01`, `HW-02` | Photo/geometry verification regardless of chosen reference | Application-state checks, not physical accuracy |
| `SW-12.0.0`–`SW-12.1.7` / reports and mobile UI | `HW-01`, `HW-02` | Hardware-independent reporting and inspection data preservation | Released as software features |
| **`SW-13.0` / 4-marker 16-corner Homography** | **`HW-02`** | Exact IDs 0–3 and 300 × 300 mm marker-centre geometry, 30 mm square markers | Implemented; complete device/accuracy validation outstanding |
| `SW-13.0` / dynamic rectification and X/Y px/mm display | `HW-02` | Image transformation based on 16 detected marker corners | Adaptive image output is not actual camera resolution |
| `SW-13.0` / legacy fallback when no markers | `HW-01` | Preserve Level + X/Y ruler calibration workflow | Supported compatibility path |
| **`SW-13.2` / coplanar calibration requirement** | **`HW-03 v2.8.4`** | One-piece 3D-print jig concept aims to keep marker faces and unworn PL reference surface coplanar | SCAD prototype; physical accuracy and structure not validated |
| `SW-9.0` + `SW-13.0` / measure accuracy comparison | `HW-04` | Controlled A–F validation across both workflows | Test plan, not validated specifications |

## HW-03 hardware baseline (2026-10-30)

- **Historical concept:** aluminum-extrusion jig with PL reference-plane alignment.
- **Current design baseline:** [HW-03 v2.8.4 OpenSCAD](./hardware/HW03_v2.8.4_QR_adjacent_label_rotated.scad), conceived as a **one-piece 3D-printed**, bottom-open U-frame rather than a kit of separately printed rails and corner pods.
- **Incorporated features:** three-positioning-side geometry and numbered ruler marks; four 30 mm ArUco target locations with 300 × 300 mm nominal centres; two right-bar M6 transverse clearance holes; underside weight-relief pockets; outward-facing QR/manual label and engraved name/version.
- **Unchanged interface:** software v13.2.7 continues to use the four-marker Homography workflow; marker print is [HW-02 PDF](./docs/RefraInspector_ArUco_300x300_4A4_NoZeroLabel.pdf). Changing fabrication method does not change the SW marker geometry.
- **Verification gate:** no approved continuous/watertight STL, printer fit, jig stiffness, clamping-force deflection, QR readability, marker-to-PL coplanarity or dimensional accuracy claim is established. Do not modify the authoritative v2.8.4 SCAD merely to get a one-piece STL; discrepancies must be reported and separately approved.

## Interface and release rules

1. **Do not silently change geometry:** If `HW-02` marker spacing or size changes, update `SW-13.0` physical-coordinate assumptions and revalidate. A hardware revision is not automatically backward-compatible.
2. **Do not equate fit RMS with A–F accuracy:** Homography corner residuals, output px/mm and actual PL measurement error are separate quantities.
3. **Use the correct plane:** Both workflows need reference geometry close to the PL surface; marker installation height errors can dominate the 16-corner fit benefit.
4. **A software release does not certify a jig:** Concept drawings, printable PDFs, trial photos and measured device capability must have distinct statuses.

See the [README](./README.md) for printing, joining and measurement workflows.
