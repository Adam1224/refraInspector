# RefraInspector — Hardware Change History

Hardware revision history is maintained independently of software releases. **Latest design first; older iterations follow in reverse chronological order.** This document distinguishes *design intent*, *generated files*, and *physically validated hardware*.

## Current design — HW-03 v2.8.4 · 2026-10-30

**RefraInspector Jig: one-piece 3D-printed U-frame (design baseline; not production-qualified).**

- **Source:** [HW-03 v2.8.4 OpenSCAD](./hardware/HW03_v2.8.4_QR_adjacent_label_rotated.scad).
- **Purpose:** reproducibly locate the refractory plate (PL), expose the inspection region and provide four ArUco fiducials for Homography-based perspective correction.
- **Structure:** integrated U-shaped frame, **opening downward** for the PL long end; top, left and right sides act as positioning surfaces. The earlier aluminum-extrusion concept is superseded as the intended build method, but retained in the history.
- **References:** four 30 × 30 mm ArUco mounting positions (IDs 0 top-left, 1 top-right, 2 bottom-left, 3 bottom-right), **300 × 300 mm nominal marker-centre spacing**. Print and apply real [HW-02 ArUco targets](./docs/RefraInspector_ArUco_300x300_4A4_NoZeroLabel.pdf); CAD marker placeholders are not decodable targets.
- **Measurement aids:** 1 mm engraved scales and numbered 10 mm marks on all three sides; top-side numeral orientation adjusted to avoid overlaps.
- **Fixing provision:** two right-side Ø6.6 mm M6 clearance holes for a future lateral PL-clamping mechanism. They are **not** a completed clamp; protective contact pads and secure fastening still require design.
- **Material reduction:** underside relief pockets, retaining the intended PL contact, ruler and fiducial surfaces.
- **Identification:** recessed QR linking to RefraInspector usage information, adjacent `SCAN FOR MANUAL`, plus `RefraInspector Jig` and hardware-version engraving.

**Design authority:** The user-supplied v2.8.4 SCAD is the sole approved geometry baseline. Do **not** change dimensions, rail lengths, corner recesses, marker locations, QR matrix, lettering or ruler positions merely to achieve STL connectivity. Any later revision needs an explicit, reviewed change. The GitHub SCAD is the repository's published version; compare it against the approved uploaded source before claiming byte-for-byte equivalence.

**Validation status:** Not yet physically manufactured or accuracy qualified. A direct STL export was reported as watertight but comprising **five distinct connected mesh components**; hence a single-file STL does **not** yet establish a one-piece printable solid. Check printer build volume (nominal ~360 × 360 mm envelope plus clearance), geometry connectivity, print mass, PL fit, post-print 300 mm spacing, marker/PL reference-plane coplanarity, clamp-induced deformation, readability of markings and QR, and repeatability of A–F measurements. The 3D printing method does not alter the SW-13.2 image-processing algorithms.

## HW-03 iteration history — newest to oldest

| Revision | Main change relative to previous iteration | Status |
|---|---|---|
| **v2.8.4** <a id="hw03-v2-8-4"></a> | Rotated `SCAN FOR MANUAL` 180° and moved it closer to the QR; updated version engraving | **Current SCAD design baseline** |
| v2.8.3 <a id="hw03-v2-8-3"></a> | Corrected the side-label left-to-right reading direction | Historical |
| v2.8.2 <a id="hw03-v2-8-2"></a> | Rotated the QR and adjacent side text 180° to correct upside-down display | Historical |
| v2.8.1 <a id="hw03-v2-8-1"></a> | Corrected top-face project name and version lettering after global model mirroring | Historical |
| v2.8 <a id="hw03-v2-8"></a> | Added `SCAN FOR MANUAL` instruction and engraved project name/version | Historical |
| v2.7 <a id="hw03-v2-7"></a> | Verified the embedded QR URL against the RefraInspector repository link; clarified that earlier displayed example QR was incorrect | Historical |
| v2.6 <a id="hw03-v2-6"></a> | Added recessed QR to the outer face of the top bar for access to project instructions | Historical |
| **v2.5** <a id="hw03-v2-5"></a> | Rotated the top ruler numbers by 90° and adjusted text size to avoid overlap | Historical |
| v2.4 <a id="hw03-v2-4"></a> | Added underside lightening pockets while retaining load-bearing regions around the M6 holes | Historical; strength unverified |
| v2.3 <a id="hw03-v2-3"></a> | Corrected the displayed frame orientation so the open side faces down | Historical |
| v2.2 <a id="hw03-v2-2"></a> | Added 10 mm numeric labels to the 1 mm scales and two transverse M6 clearance holes in the right bar | Historical |
| v2.1 <a id="hw03-v2-1"></a> | Trimmed inward-projecting corner-pad features to preserve PL clearance | Historical |
| v2 <a id="hw03-v2"></a> | Added top/left/right engraved ruler concepts and thicker PL-contact side bars | Historical |
| Initial HW-03 concept | Aluminum extrusion, orthogonal reference rulers / ArUco mounting and a U-shaped PL positioning fixture | **Superseded concept**, retained for traceability |

**Versioning note:** These are hardware design iterations, not separately certified prints. Historical SCAD files have intentionally been removed from the repository's `hardware/` directory so it holds only the latest design source.

## Other hardware references and verification

### HW-02 — ArUco calibration target (four A4 sheets)

**State:** Printable PDF reference available; physical precision not certified.

- [Original ArUco 300 × 300 mm 4-A4 PDF](./docs/RefraInspector_ArUco_300x300_4A4_NoZeroLabel.pdf), printed at **Actual Size / 100%** and assembled without overlap.
- `DICT_4X4_50`, IDs 0–3, with 30 mm black-square markers and 300 mm centre spacing in each axis.
- Scale-origin convention follows the bottom-right black corner of ID 0; this is distinct from the marker-centre-based 300 mm geometry used by Homography.
- Measure the 100 mm print check and actual marker spacing after print/installation. Compatible with the SW-13.2 four-marker workflow.

### HW-01 — Two-ruler photographic reference (legacy)

**State:** Existing manual method; physical accuracy not certified.

- Two orthogonal rulers, each providing a known 100 mm reference for independent X/Y calibration.
- Align their readable surfaces with the PL's unworn reference plane when possible. Perspective and height mismatch are significant error sources.
- Retained for the software's legacy Auto/Manual Level and ruler-calibration fallback.

### HW-04 — Measurement accuracy verification protocol (planned)

**State:** Test proposal, not measured acceptance criteria.

- Compare physical ground-truth A–F dimensions against ruler and ArUco image measurements using the **same PL and endpoints**.
- Record camera distance/angle, marker-to-PL plane offset, marker spacing, fit residuals, operator repeatability and lens-distortion assumptions.
- Coplanarity reduces plane-height-related systematic bias; it cannot remove surface non-planarity, optical distortion or contour-identification errors.
- Prior individual F readings are not universal tolerance criteria.

## Cross-references

- [Software changes](./CHANGELOG_SOFTWARE.md)
- [Software ↔ hardware compatibility](./CHANGELOG.md)
- [User guide](./README.md)

**Release rule:** Do not describe a CAD source, an STL export, a printable PDF or a trial photograph as a validated production jig without separate physical verification.
