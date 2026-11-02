# RefraInspector — Change History and SW/HW Correspondence

**Current software:** [SW-13.3](./CHANGELOG_SOFTWARE.md) (Beta)  
**Hardware:** HW-01 U-shaped 3D-printed jig · HW-02 ArUco marker print (PDF)

Detailed version histories: [Software](./CHANGELOG_SOFTWARE.md) · [Hardware](./CHANGELOG_HARDWARE.md) · [Archived software changes](./CHANGELOG_ARCHIVE.md).

## Numbering convention

| Domain | ID | Deliverable | Reference |
|---|---|---|---|
| Software | `SW-<version>` | Browser inspection application | [Software changelog](./CHANGELOG_SOFTWARE.md) |
| Hardware | `HW-01` | U-shaped 3D-printed PL positioning jig (**STL deliverable**) | [Latest OpenSCAD design source, v2.8.4](./hardware/HW03_v2.8.4_QR_adjacent_label_rotated.scad) |
| Hardware | `HW-02` | Four-page ArUco marker print (**PDF deliverable**) | [ArUco PDF](./hardware/RefraInspector_ArUco_300x300_4A4_REVIEW_v13_fixed_labels.pdf) |

Hardware IDs identify **two deliverables**, not individual development revisions. The jig design retains its internal version number (currently v2.8.4). **STL supplied and inspected:** `HW03_v2.8.4_original_unmodified(1).stl` (user-provided; not yet committed to GitHub). The linked SCAD remains the repository design source. The STL contains five disconnected watertight bodies and is not yet confirmed as a single printable piece.

## Correspondence between software and hardware

| Software | Hardware | Interface / purpose | Verification |
|---|---|---|---|
| SW-9.0 onward (legacy fallback) | External perpendicular metric rulers (not a numbered deliverable) | Level and calibrate X/Y against known ruler spans | Supported fallback; measurement accuracy requires checking |
| SW-13.0 onward | **HW-02 · ArUco PDF** | `DICT_4X4_50` IDs 0–3; 30 mm markers, 300 × 300 mm centre spacing; automatic 16-corner planar Homography | Software implemented; printed geometry and real-world dimensional accuracy require verification |
| SW-13.2 onward | **HW-01 · U-shaped printed jig** + **HW-02 · ArUco PDF** | Mount markers on a stable frame, position PL and keep marker/reference planes coplanar | STL supplied; five separate watertight components. Print feasibility, rigidity and accuracy not yet confirmed |

**Compatibility rule:** A physical marker-size, layout or spacing change requires software geometry review and renewed dimensional testing. A print or CAD file alone is not evidence of measurement accuracy.
