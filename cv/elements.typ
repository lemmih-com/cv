#import "@preview/fontawesome:0.5.0": *
#import "style.typ": *

// ---------- Small building blocks ----------

#let icon-text(icon, body, fill: colors.accent) = {
  box(icon(fill: fill))
  h(3pt)
  body
}

// Rounded "pill" used for technology tags.
#let tag(body) = box(
  fill: colors.accent-light,
  inset: (x: 5pt, y: 2.5pt),
  radius: 3pt,
  baseline: 2.5pt,
  text(size: 7.5pt, fill: colors.navy, weight: "bold", body),
)

#let tags(..items) = {
  for item in items.pos() {
    tag(item)
    h(3pt)
  }
}

// Section heading: icon, small-caps title, rule.
#let section(title, icon: none) = {
  v(4pt)
  block(breakable: false, {
    if icon != none {
      box(icon(fill: colors.accent, size: 11pt))
      h(5pt)
    }
    text(size: 13.5pt, fill: colors.navy, weight: "bold", smallcaps(title))
    v(-4pt)
    line(length: 100%, stroke: 1.2pt + colors.navy)
  })
  v(5pt)
}

// Lighter heading used inside the sidebar.
#let side-heading(title, icon: none) = {
  v(2pt)
  block(breakable: false, {
    if icon != none {
      box(icon(fill: colors.accent, size: 9.5pt))
      h(4pt)
    }
    text(size: 11pt, fill: colors.navy, weight: "bold", smallcaps(title))
    v(-5pt)
    line(length: 100%, stroke: 0.7pt + colors.card-stroke)
  })
  v(3pt)
}

// ---------- Header ----------

#let contact-row(..items) = {
  set text(fill: colors.on-navy, size: 9.5pt)
  stack(dir: ltr, spacing: 12pt, ..items.pos())
}

#let github(handle) = icon-text(fa-github, link("https://github.com/" + handle, handle), fill: colors.on-navy-muted)
#let email(address) = icon-text(fa-envelope, link("mailto:" + address, address), fill: colors.on-navy-muted)
#let website(url) = icon-text(fa-globe, link("https://" + url, url), fill: colors.on-navy-muted)
#let location(city, country) = icon-text(fa-location-dot, city + ", " + country, fill: colors.on-navy-muted)

#let header(name, title, tagline, contacts, avatar) = {
  // Bleed past the page margins so the band spans the full page width.
  pad(
    left: -page-style.margin.left,
    right: -page-style.margin.right,
    top: -page-style.margin.top,
    block(
      width: 100%,
      fill: colors.navy,
      inset: (
        left: page-style.margin.left,
        right: page-style.margin.right,
        top: page-style.margin.top + 2pt,
        bottom: 12pt,
      ),
      {
        set text(fill: colors.on-navy, hyphenate: false)
        set par(justify: false)
        grid(
          columns: (1fr, auto),
          column-gutter: 20pt,
          align: horizon,
          {
            text(size: header-style.full-name.size, weight: header-style.full-name.weight, name)
            v(-9pt)
            text(size: header-style.title.size, fill: colors.on-navy-muted, title)
            v(-2pt)
            text(size: 9.5pt, fill: colors.on-navy, style: "italic", tagline)
            v(3pt)
            contacts
          },
          box(
            clip: true,
            radius: 50%,
            stroke: 2.5pt + colors.on-navy,
            avatar,
          ),
        )
      },
    ),
  )
}

// ---------- Highlight tiles ----------

#let stat(number, label) = box(
  width: 100%,
  fill: colors.card,
  stroke: 0.6pt + colors.card-stroke,
  radius: 4pt,
  inset: (x: 5pt, y: 6pt),
  align(center, {
    set par(justify: false)
    set text(hyphenate: false)
    text(size: 14pt, weight: "bold", fill: colors.navy, number)
    v(-4pt)
    text(size: 7.2pt, fill: colors.muted, label)
  }),
)

// ---------- Work experience ----------

#let experience(
  company,
  title,
  location,
  date,
  blurb,
  bullets,
  tech: (),
) = {
  block(breakable: false, {
    grid(
      columns: (1fr, auto),
      align: (left + bottom, right + bottom),
      text(size: 11pt, weight: "bold", fill: colors.navy, title),
      text(size: 8.5pt, fill: colors.muted, icon-text(fa-calendar, date, fill: colors.muted)),
    )
    v(-4pt)
    text(size: 9pt, weight: "bold", fill: colors.accent, company)
    text(size: 9pt, fill: colors.muted, [ · ] + location)
    if blurb != none {
      text(size: 8.5pt, fill: colors.muted, style: "italic", [ — ] + blurb)
    }
    v(1pt)
    set text(size: 9pt)
    set par(justify: false)
    list(indent: 2pt, body-indent: 5pt, spacing: 2.5pt, marker: text(fill: colors.accent, "▸"), ..bullets)
    if tech.len() > 0 {
      v(2pt)
      tags(..tech)
    }
  })
  v(4pt)
}

// ---------- Projects ----------

#let project(title, href, role, summary, details, tech: ()) = block(
  width: 100%,
  fill: colors.card,
  stroke: 0.6pt + colors.card-stroke,
  radius: 5pt,
  inset: 9pt,
  breakable: false,
  {
    grid(
      columns: (1fr, auto),
      align: (left + bottom, right + bottom),
      link(href, text(size: 13pt, weight: "bold", fill: colors.navy, title)),
      text(size: 8pt, fill: colors.muted, role),
    )
    v(-3pt)
    text(size: 9pt, fill: colors.accent, style: "italic", summary)
    v(3pt)
    text(size: 8.8pt, fill: colors.ink, details)
    v(5pt)
    tags(..tech)
  },
)
