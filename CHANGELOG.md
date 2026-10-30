# RefraInspector — Change History and SW/HW Traceability

**Current software:** `SW-13.2` / RefraInspector v13.2 (Beta)  
**Hardware reference:** `HW-02` printable ArUco target; `HW-03 v2.5` lightweight 3D-print prototype (not a validated production jig).

Changes are maintained in two independently numbered registers:

- [Software changes — `CHANGELOG_SOFTWARE.md`](./CHANGELOG_SOFTWARE.md): application functions, measurement/calibration logic, UI, Campaign and exports.
- [Hardware changes — `CHANGELOG_HARDWARE.md`](./CHANGELOG_HARDWARE.md): physical rulers, printable markers, calibration fixtures and test plans.
- [Detailed archived software history — `CHANGELOG_ARCHIVE.md`](./CHANGELOG_ARCHIVE.md): previous patch-by-patch records, left intact.

## Numbering convention

| Domain | Format | Example | Scope |
|---|---|---|---|
| Software | `SW-<version>` | `SW-13.0` | HTML application release, linked to `refraInspector_v13.2.html` |
| Hardware | `HW-XX` | `HW-02` | Printable target, physical setup or proposed jig; **not** tied 1:1 to a software version |
| Mapping | `SW ⇄ HW` | `SW-13.0 ⇄ HW-02` | Compatibility or intended use, **not** proof of tested integration |

## Release note (2026-10-30)

`SW-13.2` updates the photo-workspace UI layout only, using the same ArUco target (`HW-02`) and existing measurement workflow. The last working application, [`v13.0.6`](./refraInspector_v13.0.6.html), is retained for rollback.

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
| **`SW-13.0` / coplanar calibration requirement** | **`HW-03`** | Planned jig keeps the marker surfaces and PL reference surface in one plane | Design proposal; not mechanically validated |
| `SW-9.0` + `SW-13.0` / measure accuracy comparison | `HW-04` | Controlled A–F validation across both workflows | Test plan, not validated specifications |

## HW-03 design iteration (2026-10-30)

The original aluminum extrusion U-jig concept is retained as HW-03's baseline. [HW-03 v2.5 lightweight 3D-print model](./hardware/HW03_v2.5_lightweight_3d_print_jig.scad) is its successor prototype: bottom opening; three engraved numbered bars; four coplanar ArUco targets at 300 mm centre spacing; clearance-cut corner pods; two right-bar M6 cross holes; and underside relief pockets. Strength, clamping deformation, coplanarity and real measurement accuracy remain unverified. Software v13.2 is unchanged.

## Interface and release rules

1. **Do not silently change geometry:** If `HW-02` marker spacing or size changes, update `SW-13.0` physical-coordinate assumptions and revalidate. A hardware revision is not automatically backward-compatible.
2. **Do not equate fit RMS with A–F accuracy:** Homography corner residuals, output px/mm and actual PL measurement error are separate quantities.
3. **Use the correct plane:** Both workflows need reference geometry close to the PL surface; marker installation height errors can dominate the 16-corner fit benefit.
4. **A software release does not certify a jig:** Concept drawings, printable PDFs, trial photos and measured device capability must have distinct statuses.

See the [README](./README.md) for printing, joining and measurement workflows.
