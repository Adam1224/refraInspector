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

## HW-03 — PL inspection jig: aluminum extrusion → one-piece 3D printing
**Current baseline:** [HW-03 v2.8.4 OpenSCAD](./hardware/HW03_v2.8.4_QR_adjacent_label_rotated.scad) (2026-10-30). **Status:** design prototype; no approved, physically validated one-piece STL or manufacturing tolerance certification.

### Design history and changes

- **Original concept:** rigid aluminum extrusion, an open-sided U-frame with separate ruler/marker installation and PL side positioning. Retained as historical design context, not the current intended build.
- **v2.1:** removed inward-protruding corner-pod material from PL positioning area.
- **v2.2–v2.3:** three engraved mm ruler sides, two nominal Ø6.6 mm transverse M6 clearance bores on the right; displayed U-shaped opening at the **bottom** to let the PL tail extend.
- **v2.4–v2.5:** underside weight-relief pockets and top ruler numbers rotated to avoid collisions; historical source file superseded.
- **v2.6–v2.8.4:** QR code linking to the RefraInspector repository instructions, adjacent `SCAN FOR MANUAL`, and `RefraInspector Jig` and hardware-version engraving, with revisions to text/QR orientation and placement.
- **Authoritative geometry:** user's latest supplied v2.8.4 design is the baseline; no unapproved stretching of connecting rails, removal of marker recesses, repositioning of fiducials, or editing of QR/lettering to make STL conversion easier. The GitHub SCAD file is the documented repository version; compare any regenerated outputs to the supplied source before release.

### Intended construction and use

- **Construction:** intended as a **single integrated printed U-frame**, **not** a production kit of modular parts. A single STL can encode an entire assembly, but is not proof of one continuous printable solid; verify watertightness and connected-component count before fabrication. Approximate build envelope in plan: 360 × 360 mm plus printer clearance.
- **Fiducials:** four ArUco marker sites (IDs 0/1/2/3, black-square size 30 × 30 mm), nominal **300 × 300 mm marker-centre geometry**. Attach the actual printed ArUco codes from [HW-02 PDF](./docs/RefraInspector_ArUco_300x300_4A4_NoZeroLabel.pdf), not generic placeholder squares.
- **Measurement:** top/left/right 1 mm rulers with numeric major marks, usable PL contact faces, and plane-height adjustment specific to the PL model. Marker upper faces must be coplanar with the PL's unworn reference measurement face.
- **Clamping:** two transverse M6 clearance bores on the right are provisions for a future clamp. A protective pressure pad and adequate locking/insert method remain to be designed and verified; clearance holes alone do not form a functional clamp.
- **Weight and materials:** underside recessed pockets reduce the solid-CAD material volume, but actual printed mass depends on slicer walls/infill, supports and material; no verified lightweight strength or dimensional accuracy claim.
- **Instructions:** QR/manual text and project/version marking are embedded in SCAD geometry; QR scan success after printing is **not verified**.
- **Validation required:** check geometry connectivity/watertightness, 3D-printer capacity, post-print 300 mm marker spacing, marker/PL coplanarity, jig deflection under M6 loading, joint/edge stability, readable scales and QR, photo framing and A–F measurement repeatability.
- **Compatibility:** existing software v13.2 Homography and legacy ruler workflows; **software algorithms are unchanged**.

## HW-04 — Measurement accuracy verification protocol (planned)
**State:** Proposed test plan; no validated tolerance claim.

- Compare physical ground-truth A–F reference dimensions with legacy ruler and ArUco measurements **on the same PL and defined endpoints**.
- Record camera-to-reference distance, marker/PL plane offset, printed target spacing, measured residuals, repeatability across operators and repeats, and any lens distortion correction.
- The previously discussed F readings from a particular trial are **not** acceptance criteria or a general accuracy specification.
- A coplanar plane can eliminate the *plane-height contribution* to systematic scale bias; it **does not** eliminate contour-picking, surface nonplanarity, printing, homography or lens-distortion errors.
- **Interfaces:** `SW-9.0` and `SW-13.0` validation; future qualified releases.
