# RefraInspector

**Version:** v12.1.4

**Development status:** Beta — automatic image recognition and measurement accuracy require further validation.

Web-based refractory sliding gate plate inspection application.

## Usage
Open `refraInspector_v12.1.4.html` in a modern browser. Import Upper and Lower PL photographs, calibrate the image rulers, inspect dimensions A–F, and export the results.

## Features
- **v12.1.2 — iPhone scrolling:** one continuous vertical scroll through Geometry, Photo Workspace and Results on narrow screens; desktop independent scrolling preserved.
- **v12.1.3 — Compact mobile header:** ? Help icon and smaller header; mobile hides copy/backup/recovery status controls while the underlying recovery remains enabled.
- **v12.1.4 — Mobile precision:** thinner visible H/V dimension lines and enlarged invisible touch/drag targets; desktop line styling and physical measurement calculations unchanged.
- **Two views:** PL Inspection and Campaign Report, switched via a compact header control.
- **Campaign Report:** Campaign summary, saved PL-set A–F/usage/results table, RS versus Used Heats, and Upper/Lower T versus Used Heats charts.
- **Panel exports:** Clipboard, CSV, Excel-compatible .xls, SVG/PNG chart images, and print/save PDF.
- **Chart conventions (v12.1.1):** Used Heats X-axis shows integer ticks; both chart Y-axes start at zero.
- **Detection (v12.1.0):** Gradient-direction-aware scoring improves candidate selection for bore and damage boundaries, retaining geometry checks and manual confirmation.
- **Layout (v12.0.1–v12.0.2):** Independently scrollable tab sections and compact header navigation; redundant photo verification badge removed.
- PL set selector with independent verification and Campaign membership labels (without repeated Campaign ID)
- Automatic updates to previously saved Campaign records after eligible edits, with top-right toast notifications
- Campaign Performance: median/max heats, average erosion per minute/heat and average remaining stroke
- Excel-compatible **Copy PLs details** and **Copy Campaign data** actions
- IndexedDB session recovery and backup restore of verification/Campaign states
- Upper and Lower PL photographs
- Ruler tick detection and manual calibration
- A–F measurement lines and manual overrides
- Bore enlargement, damage area and stroke calculations
- Excel-compatible and JSON exports
- Integrated Help & User Manual

## Developer and help desk
xuh@shinagawa-ref.jp

## Data handling
Do not commit confidential production photographs, customer data, credentials, or exported inspection records without authorization.

## Application file naming
The current standalone app is [`refraInspector_v12.1.4.html`](./refraInspector_v12.1.4.html). Future releases use the same filename pattern with their version number. If hosting as a root URL, configure the deployment to serve this file or add a separate `index.html` entry point.
