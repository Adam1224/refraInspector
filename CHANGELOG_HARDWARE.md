# RefraInspector — Hardware and Calibration Target Change History (HW)

**ID scheme:** `HW-XX` denotes a hardware concept or deliverable revision. It is independent of software version `SW-<release>`. **State** indicates whether a design exists, a printable artifact exists, or a physical assembly has been validated.

See [software changes](./CHANGELOG_SOFTWARE.md) and [traceability mapping](./CHANGELOG.md).

## HW-01 — Traditional orthogonal two-ruler photographic reference
**State:** Existing manual setup / photographic prototype; no certified measurement precision.

- Two independent horizontal/vertical reference rulers placed adjacent to the PL, with the readable ruler planes as close as possible to the **unworn PL measurement surface**.
- Provide at least one known 100 mm span on each axis; support legacy automatic or manual X/Y px/mm calibration.
- Main risks: camera perspective, differing ruler/plate elevations, ruler alignment, visibility of marks, reading errors and repeatability of camera placement.
- **Interfaces:** `SW-08`, `SW-9.0`, `SW-10.0`, `SW-13.0` (legacy fallback).

## HW-02 — Four-corner ArUco calibration target, 300 × 300 mm
**State:** Printable 4-A4 PDF available; photographed prototypes used for exploratory testing. Fixture accuracy not independently certified.

- Four `DICT_4X4_50` ArUco IDs: **0 top-left, 1 top-right, 2 bottom-left, 3 bottom-right**. Each black marker square: **30 × 30 mm**; intended marker-centre spacing: **300 mm horizontal × 300 mm vertical**.
- Four A4 pages assembled in a **2 × 2 no-cut, non-overlap** arrangement; print at Actual Size / 100% and measure the physical 100 mm print check plus marker-centre spacing **after assembly**.
- Millimeter rulers accompany the target, with selected numbers omitted to protect ArUco recognition and avoid paper seams. The rulers' zero coordinate starts at the **bottom-right black corner of ID 0**; the software's 300 mm reference geometry is defined by marker centres, so these are **different origins**.
- Repository artifact: [Printable four-page ArUco calibration PDF](./docs/RefraInspector_ArUco_300x300_4A4_NoZeroLabel.pdf).
- **Interfaces:** `SW-13.0` automatic ArUco detection, 16-corner Homography, quality checking, dynamic-resolution rectification.

## HW-03 — Rigid ArUco-supported PL inspection jig (design proposal)
**State:** Concept/design-stage only; not released as tested hardware.

- Proposed rigid frame or open-sided/U-shaped mounting arrangement supporting markers around the **short end / bore / damaged region** while allowing the long tail of spindle-shaped PLs to extend beyond the calibrated opening.
- Mount four marker **faces coplanar with the PL's reference measurement surface**, not just on the same floor. Use adjustable PL supports, leveling, anti-slip fixation and reproducible camera positioning.
- Proposed 300 × 300 mm marker-centre geometry is a calibrated **reference layout**, not necessarily the inner clear opening of the jig; mechanical clearances and PL-model fit must be measured.
- Main risks: marker-plane offset (parallax), fixture flex, mounting tolerances, occluded bore/edge features, optical distortion and target wear.
- **Interfaces:** `SW-13.0` (as designed), future camera/lens calibration and independent physical measurement verification (not yet released).

### HW-03 v2.5 — Lightweight 3D-printed iteration of the aluminum extrusion concept (2026-10-30)
**State:** Parametric OpenSCAD prototype uploaded; not physically validated. The earlier aluminum extrusion design is retained as the original concept.

- **Source:** [HW03_v2.5_lightweight_3d_print_jig.scad](./hardware/HW03_v2.5_lightweight_3d_print_jig.scad).
- Three-sided U frame, **opening down** to let the PL long end extend beyond the fixture. The corner mounting blocks are clipped so no protrusions intrude into the PL placement opening.
- Four 30 × 30 mm ArUco mounting regions, IDs 0–3 with 300 × 300 mm marker-centre spacing. Preview black squares are placeholders and **not machine-readable ArUco codes**; apply real printed markers.
- 1 mm engraved scales on the top/left/right bars with numbers every 10 mm; top numbers rotated 90° to avoid overlap. Reference origin follows the HW-02 ID0 black-corner convention.
- Three PL-contact side bars have nominal **34 mm width** and **32 mm height** (adjustable to actual PL model). Two right-side transverse **Ø6.6 mm M6 clearance bores** at nominal positions 90 / 210 mm for future horizontal clamping with protective pads.
- Modular 120 mm rail segments for smaller printers; underside material-relief pockets 34 × 20 × 22 mm, retaining nominal 7 mm side walls and 10 mm roof. Structural strength and assembled rigidity **have not been verified**.
- **Required before measurement use:** verify PL fit and support contact, M6 load path and printed-bore sizing, the complete physical 300 mm marker geometry, coplanarity of marker faces and unworn PL reference surface, assembly deformation, engraving visibility, and physical measurement repeatability. The drawing is not a fabrication tolerance certificate.
- **Interfaces:** existing SW-13.2 automatic ArUco/Homography workflow. Hardware update does not require or imply software algorithm changes.

## HW-04 — Measurement accuracy verification protocol (planned)
**State:** Proposed test plan; no validated tolerance claim.

- Compare physical ground-truth A–F reference dimensions with legacy ruler and ArUco measurements **on the same PL and defined endpoints**.
- Record camera-to-reference distance, marker/PL plane offset, printed target spacing, measured residuals, repeatability across operators and repeats, and any lens distortion correction.
- The previously discussed F readings from a particular trial are **not** acceptance criteria or a general accuracy specification.
- A coplanar plane can eliminate the *plane-height contribution* to systematic scale bias; it **does not** eliminate contour-picking, surface nonplanarity, printing, homography or lens-distortion errors.
- **Interfaces:** `SW-9.0` and `SW-13.0` validation; future qualified releases.
