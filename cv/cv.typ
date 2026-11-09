#import "@preview/fontawesome:0.5.0": *
#import "style.typ": *
#import "elements.typ": *

#set text(font: body-style.font, size: body-style.size, fill: colors.ink)
#set par(leading: body-style.leading, justify: true)
#show link: set text(fill: colors.accent)
#set page(
  paper: page-style.paper,
  margin: page-style.margin,
  footer: {
    set text(size: 8pt, fill: colors.muted)
    grid(
      columns: (1fr, 1fr),
      align: (left, right),
      [David Himmelstrup · Curriculum Vitae],
      context [Page #counter(page).display() of #counter(page).final().first() · Updated 2026-11-09],
    )
  },
)

// ================= PAGE 1 =================

#header(
  [David Himmelstrup],
  [Senior Software Engineer],
  [I build the software that other software depends on: compilers, blockchain nodes, package managers and testing tools, mostly in Rust and Haskell. I write code that behaves the same every time it runs, prove it with large-scale automated testing, and lately build it with AI coding agents.],
  contact-row(
    github("lemmih"),
    email("lemmih@gmail.com"),
    website("lemmih.com"),
    location("Copenhagen", "Denmark"),
  ),
  image("media/avatar.png", width: 84pt),
)

#v(8pt)

#grid(
  columns: (1fr, 5.0cm),
  column-gutter: 18pt,

  // ---------- Main column ----------
  {
    section("Work experience", icon: fa-briefcase)

    experience(
      "Dune", "Software Engineer", "Remote", "Sep 2025 – May 2026",
      "blockchain data analytics platform",
      (
        [Built and ran backend services serving blockchain data to customers.],
        [Led the team's move to AI coding tools, reshaping how features are written and reviewed.],
      ),
      tech: ("Rust", "Kubernetes", "AI coding agents"),
    )

    experience(
      "ChainSafe", "Protocol Engineer", "Remote", "Jan 2022 – Mar 2025",
      "blockchain infrastructure company",
      (
        [Lead developer of Forest, an in-house Filecoin node in Rust that validates the blockchain and serves its data to other applications.],
        [Filecoin Core Devs member, reviewing and proposing changes to the protocol itself.],
        [Designed the compressed snapshot format that became the network's default for sharing chain data.],
      ),
      tech: ("Rust", "Filecoin", "libp2p", "Distributed systems"),
    )

    experience(
      "Standard Chartered", "Quantitative Developer", "Singapore", "May 2019 – Dec 2020",
      "international bank",
      (
        [Ran the on-premise services and tooling behind a twenty-developer pricing team.],
        [Automated regression testing of a custom pricing engine, catching errors before production.],
      ),
      tech: ("Haskell", "DevOps", "Regression testing"),
    )

    experience(
      "AlphaSheets", "Software Engineer", "Remote", "Nov 2016 – Sep 2017",
      "spreadsheet start-up",
      (
        [Built a parallel scheduling engine for multi-language spreadsheet formulas.],
        [Packaged and deployed the system reproducibly with Nix.],
      ),
      tech: ("Haskell", "Nix", "Parallel computing"),
    )

    experience(
      "Better AG", "Software Engineer", "Zurich, Switzerland", "Mar 2012 – Oct 2013",
      "e-learning start-up",
      (
        [Co-designed and shipped a full-stack e-learning platform in a team of eight.],
        [Split time between the Haskell backend and the JavaScript frontend.],
      ),
      tech: ("Haskell", "JavaScript", "Full-stack"),
    )

    experience(
      "HAppS", "Software Engineer", "Remote", "Feb 2006 – Mar 2008",
      "open-source web framework",
      (
        [Designed a family of Haskell web-development libraries with a small team.],
        [Two of them, happstack and acid-state, are still widely used and maintained today.],
      ),
      tech: ("Haskell", "Web frameworks", "Open source"),
    )
  },

  // ---------- Sidebar ----------
  {
    side-heading("Highlights", icon: fa-star)
    grid(
      columns: (1fr, 1fr),
      gutter: 5pt,
      stat("20+", "years of software"),
      stat("2005", "cabal-install co-founder"),
      stat("5.5k", "stars on criterion"),
      stat("1.4k", "stars on Reanimate"),
    )
    v(12pt)

    side-heading("Skills", icon: fa-code)
    text(size: 8.5pt, fill: colors.muted, weight: "bold", [Languages]) 
    v(-2pt)
    tags("Rust", "Haskell", "Go", "Python", "JavaScript")
    v(5pt)
    text(size: 8.5pt, fill: colors.muted, weight: "bold", [Infrastructure])
    v(-2pt)
    tags("Nix", "Kubernetes", "WebAssembly", "Linux", "CI/CD")
    v(5pt)
    text(size: 8.5pt, fill: colors.muted, weight: "bold", [Domains])
    v(-2pt)
    tags("Compilers", "Blockchain", "Distributed systems", "Computational geometry")
    v(5pt)
    text(size: 8.5pt, fill: colors.muted, weight: "bold", [Practices])
    v(-2pt)
    tags("Property-based testing", "Deterministic systems", "AI-assisted development", "Open source")
    v(12pt)

    side-heading("Education", icon: fa-graduation-cap)
    text(weight: "bold", fill: colors.navy, [BSc, Computer Science])
    linebreak()
    text(fill: colors.muted, size: 9pt, [University of Copenhagen · 2019])
    v(2pt)
    text(size: 9pt, [Partial credits towards an MSc.])
    v(12pt)

    side-heading("Languages", icon: fa-language)
    text(size: 9pt, [Danish — native])
    linebreak()
    text(size: 9pt, [English — fluent])
  },
)

// ================= PAGE 2 =================

#pagebreak()

#section("Open-source projects", icon: fa-code-branch)

#text(fill: colors.muted, size: 9pt)[
  Side projects and community libraries I created or maintain. Each is a tool other programmers use to build their own software.
]
#v(8pt)

#project-grid(
  width: 21cm - page-style.margin.left - page-style.margin.right,

  project(
    "AI Haskell Compiler", "https://github.com/ai-haskell-compiler/aihc",
    "Designer & lead, 2025 –",
    [A complete Haskell compiler written by AI coding agents, directed by a human.],
    [
      An experiment in how far AI agents can be pushed: I designed the architecture and wrote the
      prompts; agents such as Claude, ChatGPT and Qwen-Coder wrote the code. Built as reusable
      libraries rather than one monolith, it passes almost all of the type-checking test suite,
      compiles itself, and benchmarks on par with GHC, the industry-standard Haskell compiler.
    ],
    tech: ("Haskell", "LLVM", "WebAssembly", "Nix", "Claude", "ChatGPT", "Qwen-Coder"),
  ),

  project(
    "criterion", "https://github.com/bheisler/criterion.rs",
    "Maintainer",
    [The standard tool for measuring how fast Rust code runs.],
    [
      Measuring performance is noisy: the same code runs at slightly different speeds every time.
      Criterion runs each benchmark many times and uses statistics to separate real speed-ups and
      slow-downs from noise, then produces charts and reports. It is the most widely used Rust
      library of its kind and works on WebAssembly as well as native code.
    ],
    tech: ("Rust", "Statistics", "WebAssembly", "gnuplot"),
  ),

  project(
    "rgeometry", "https://rgeometry.org",
    "Creator & maintainer",
    [Geometry algorithms for Rust, with an interactive playground in the browser.],
    [
      Points, lines, polygons and the algorithms that operate on them: convex hulls, triangulation,
      random polygon generation and more. Every algorithm is checked with property-based testing,
      which throws thousands of random inputs at it to find edge cases, making it the most thoroughly
      tested geometry library available. The documentation site runs the library in the browser via
      WebAssembly so readers can drag the shapes around.
    ],
    tech: ("Rust", "WebAssembly", "proptest", "Computational geometry"),
  ),

  project(
    "Reanimate", "https://github.com/reanimate/reanimate",
    "Creator",
    [Make animated explainer videos by writing code instead of using video software.],
    [
      Inspired by 3Blue1Brown's manim, Reanimate turns Haskell code into vector animations. It glues
      together SVG for drawing, LaTeX for maths notation and ffmpeg for video encoding, and can pull
      in Blender and POV-Ray for 3D scenes. A live viewer reloads the animation as you type, and
      voice control aligns timings to a narrated transcript.
    ],
    tech: ("Haskell", "SVG", "LaTeX", "ffmpeg", "Blender", "Elm"),
  ),

  project(
    "cabal-install", "https://www.haskell.org/cabal/",
    "Co-founder, 2005",
    [The package manager that installs libraries for the Haskell programming language.],
    [
      Co-founded with Isaac Jones in 2005. A package manager downloads, builds and links together
      the third-party code a program depends on; cabal-install is the one almost every Haskell
      developer uses. Two decades later it is still actively maintained and remains a cornerstone
      of the ecosystem.
    ],
    tech: ("Haskell", "CLI", "Dev tooling", "Package management", "Dependency resolution"),
  ),

  project(
    "acid-state", "https://github.com/acid-state/acid-state",
    "Creator",
    [A database you don't have to set up: your program's data survives crashes automatically.],
    [
      Instead of translating data into database tables, acid-state keeps your ordinary in-memory
      data structures and records a log of every change made to them. After a crash it replays the
      log to recover exactly where it left off, with the same ACID safety guarantees a traditional
      database gives. Ideal for rapid prototyping and services that want persistence without a
      separate database.
    ],
    tech: ("Haskell", "Event sourcing", "ACID transactions", "Template Haskell"),
  ),
)

#v(6pt)

#section("Approach to engineering", icon: fa-lightbulb)

#grid(
  columns: (1fr, 1fr, 1fr),
  column-gutter: 14pt,
  {
    text(weight: "bold", fill: colors.navy, [Deterministic by design])
    v(2pt)
    text(size: 9pt)[
      The same input should always produce the same output. Compilers, blockchain nodes and
      package managers are unforgiving, and I have spent twenty years shipping exactly this kind
      of software.
    ]
  },
  {
    text(weight: "bold", fill: colors.navy, [Tested at absurd scale])
    v(2pt)
    text(size: 9pt)[
      Property-based testing generates thousands of random inputs to hunt for edge cases, and
      reproducible Nix builds mean what works on my machine works everywhere. Correctness is checked
      by machines, continuously, rather than hoped for.
    ]
  },
  {
    text(weight: "bold", fill: colors.navy, [Fluent with AI tooling])
    v(2pt)
    text(size: 9pt)[
      I have directed AI agents to write a full compiler and helped a production team adopt the same
      tools. I know where they excel and where a human must stay in the loop.
    ]
  },
)
