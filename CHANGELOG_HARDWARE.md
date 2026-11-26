# RefraInspector — Hardware Change History (HW)

Hardware numbering describes the **two deliverables** used with the inspection application. Software changes are in [CHANGELOG_SOFTWARE.md](./CHANGELOG_SOFTWARE.md); the [SW/HW correspondence](./CHANGELOG.md#correspondence-between-software-and-hardware) is maintained separately.

## HW-01 — U-shaped 3D-printed jig (STL)

**Design version:** v2.8.4 · **Documented:** 2026-10-30  
**Source:** [OpenSCAD v2.8.4](./hardware/HW03_v2.8.4_QR_adjacent_label_rotated.scad)  
**Deliverable:** STL for printing a U-shaped PL positioning fixture. **STL supplied by user:** `HW03_v2.8.4_original_unmodified(1).stl` (not yet published in this repository). Mesh inspection found 81,480 triangular faces, five disconnected watertight bodies and bounds of 360 × 360 × 32.05 mm. This is a real STL file, but a single watertight STL file is not necessarily one connected printable solid. The OpenSCAD file is separate design source.

- Integrates top/left/right PL positioning surfaces, 1 mm ruler graduations and four ArUco marker mounting positions with nominal 300 × 300 mm centre spacing.
- Includes right-side M6 clearance holes, underside material-relief pockets, identification engraving and QR/manual label.
- The latest design adjusts QR and side-label orientation. Earlier v2.x iterations introduced scale labels, clearance changes, lightening pockets and QR placement; individual revision dates are not independently verified.
- **Validation outstanding:** whether five disconnected components can be manufactured/assembled as intended, printer build volume, PL fit, stiffness, clamping behavior, marker coplanarity, physical spacing and repeatable measurement performance. The v2.8.4 SCAD remains the approved design reference; do not silently change its geometry to resolve STL issues.

## HW-02 — ArUco marker target (PDF)

**Current revision:** 2A4 v12 corrected · **Documented:** 2026-11-26  
**File:** [Two-sheet A4 printable PDF, 10 mm overlap](./hardware/RefraInspector_ArUco_300x300_2A4_10mm_Overlap_v12_corrected.pdf)  
**Deliverable:** Four ArUco markers, IDs 0–3, with millimetre scales.

- Replaces the previous four-sheet A4, A2 and alternative overlap layouts with a single two-sheet A4 release, reducing the number of paper joins.
- Print at **100% / Actual Size**, cut along the indicated lines, overlap and align the sheets using the nominal 10 mm overlap and printed alignment features.
- Temporarily secure the aligned sheets using sticky notes before attaching the assembled paper target to the jig. Keep marker faces, quiet zones and scales unobstructed.
- Verify 300 × 300 mm marker-centre spacing, ruler continuity, squareness and flatness before and after mounting.
- Calibration interface remains DICT_4X4_50, IDs 0–3, nominal 30 mm markers and 300 × 300 mm centre spacing. Keep the marker faces coplanar with the PL reference plane.
- Physical print and assembly accuracy remain subject to verification; no improvement in measurement accuracy is claimed without testing.

## References

- [Software changelog](./CHANGELOG_SOFTWARE.md)
- [Numbering and correspondence](./CHANGELOG.md)
- [Assembly and calibration guide](./README.md)

**Release boundary:** Neither an STL/model nor a printed PDF constitutes a production-qualified calibration fixture without physical verification.
