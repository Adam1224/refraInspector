# RefraInspector — Hardware Change History (HW)

Hardware numbering describes the **two deliverables** used with the inspection application. Software changes are in [CHANGELOG_SOFTWARE.md](./CHANGELOG_SOFTWARE.md); the [SW/HW correspondence](./CHANGELOG.md#correspondence-between-software-and-hardware) is maintained separately.

## HW-01 — U-shaped 3D-printed jig (STL)

**Design version:** v2.8.4 · **Documented:** 2026-10-30  
**Source:** [OpenSCAD v2.8.4](./hardware/HW03_v2.8.4_QR_adjacent_label_rotated.scad)  
**Deliverable:** STL for printing a U-shaped PL positioning fixture. **An actual published STL has not been verified.** The OpenSCAD file is source code, not the STL deliverable.

- Integrates top/left/right PL positioning surfaces, 1 mm ruler graduations and four ArUco marker mounting positions with nominal 300 × 300 mm centre spacing.
- Includes right-side M6 clearance holes, underside material-relief pockets, identification engraving and QR/manual label.
- The latest design adjusts QR and side-label orientation. Earlier v2.x iterations introduced scale labels, clearance changes, lightening pockets and QR placement; individual revision dates are not independently verified.
- **Validation outstanding:** connected printable mesh, printer build volume, PL fit, stiffness, clamping behavior, marker coplanarity, physical spacing and repeatable measurement performance. The v2.8.4 SCAD remains the approved design reference; do not silently change its geometry to resolve STL issues.

## HW-02 — ArUco marker target (PDF)

**File:** [Revised four-page A4 printable PDF](./docs/RefraInspector_ArUco_300x300_4A4_REVIEW_v13_fixed_labels.pdf)  
**Deliverable:** Print-and-assemble four ArUco markers, IDs 0–3, with millimetre scales.

- Layout: page 1 ID0 top-left; page 2 ID1 top-right; page 3 ID2 bottom-left; page 4 ID3 bottom-right.
- Print all pages at **100% / Actual Size**; check each sheet's 100 mm verification line and confirm actual 300 × 300 mm marker-centre spacing after assembly.
- `DICT_4X4_50`, nominal 30 mm squares. The ruler zero convention is distinct from Homography's marker-centre coordinate system.
- Keep marker faces aligned with the PL measurement plane. Printed accuracy, marker readability and complete optical measurement accuracy remain subject to testing.

## References

- [Software changelog](./CHANGELOG_SOFTWARE.md)
- [Numbering and correspondence](./CHANGELOG.md)
- [Assembly and calibration guide](./README.md)

**Release boundary:** Neither an STL/model nor a printed PDF constitutes a production-qualified calibration fixture without physical verification.
