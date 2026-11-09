// Colour palette: deep navy for structure, blue for links/icons,
// soft greys for cards and tags.
#let colors = (
  navy: rgb("#16324F"),
  accent: rgb("#2374AB"),
  accent-light: rgb("#E3EEF7"),
  ink: rgb("#1F2933"),
  muted: rgb("#5B6B7A"),
  card: rgb("#F5F7FA"),
  card-stroke: rgb("#DCE3EA"),
  on-navy: rgb("#FFFFFF"),
  on-navy-muted: rgb("#C9D6E3"),
)

#let header-style = (
  full-name: (size: 30pt, weight: "bold"),
  title: (size: 14pt, weight: "regular"),
)

#let body-style = (
  font: ("Tex Gyre Bonum", "Font Awesome 6 Free", "Font Awesome 6 Brands"),
  size: 9pt,
  leading: 0.55em,
)

#let page-style = (
  paper: "a4",
  margin: (
    top: 0.8cm,
    bottom: 1.0cm,
    left: 1.2cm,
    right: 1.2cm,
  ),
)
