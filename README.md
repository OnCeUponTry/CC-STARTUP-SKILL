# CC-STARTUP-SKILL

A collection of [Claude Code](https://claude.com/claude-code) skills for
disciplined project startup. Each skill is a self-contained folder with a
`SKILL.md` that the agent reads when relevant context is detected, or when
invoked explicitly with `/<skill-name>`.

> Skills are Claude Code's mechanism for packaging procedural knowledge: a
> markdown file with `name` and `description` frontmatter that Claude loads on
> demand. See the official Claude Code documentation for details.

## Skills in this repository

| Skill                                | What it does                                                           |
|--------------------------------------|------------------------------------------------------------------------|
| [`mvp-9-phases`](./mvp-9-phases/)    | Nine-phase, interrogation-driven flow for building any new product from scratch. The agent informs, the user decides. Outputs are deterministic and measurable. |

## Installation

Skills live in `~/.claude/skills/<name>/`. To install one of these:

```bash
git clone https://github.com/OnCeUponTry/CC-STARTUP-SKILL.git
cp -r CC-STARTUP-SKILL/mvp-9-phases ~/.claude/skills/
```

Or symlink during local development:

```bash
ln -s "$PWD/mvp-9-phases" ~/.claude/skills/mvp-9-phases
```

Restart Claude Code (or open a new session) so the skill is picked up.

## Usage

Once installed, Claude will auto-invoke a skill when its `description` matches
the conversation context. You can also invoke it explicitly:

```
/mvp-9-phases
```

For `mvp-9-phases` specifically: invoke at the very start of a new project,
before the first file is written.

## Why this exists

Most "MVP from scratch" attempts fail in one of three ways:

1. **Unbounded scope** — the project grows mid-build until it never ships.
2. **Duplicate of something existing** — discovered too late.
3. **MVP that doesn't actually work end-to-end** — features ship in isolation
   without a demo path.

The `mvp-9-phases` skill enforces an interrogation-driven flow that addresses
all three: a closed E2E definition (Phase 1), a uniqueness search before
committing (Phase 2), gap analysis with explicit mitigation (Phase 5), real
data validation before publishing (Phase 7), and UX evaluation by the user, not
the agent (Phase 9).

The agent never decides what enters the MVP. It informs, proposes, measures,
documents — the user decides.

## Author

**Carlos Enrique Castro Lazaro** ([@OnCeUponTry](https://github.com/OnCeUponTry))
Independent Researcher · System Engineer · AI / Telecom · [angriestboy.com](https://www.angriestboy.com)

## License

Licensed under either of:

- **Apache License, Version 2.0** ([LICENSE-APACHE](LICENSE-APACHE) or
  <http://www.apache.org/licenses/LICENSE-2.0>)
- **MIT license** ([LICENSE-MIT](LICENSE-MIT) or
  <http://opensource.org/licenses/MIT>)

at your option.

### Contribution

Unless you explicitly state otherwise, any contribution intentionally submitted
for inclusion in the work by you, as defined in the Apache-2.0 license, shall
be dual licensed as above, without any additional terms or conditions.

Copyright (c) 2026 Carlos Enrique Castro Lazaro.

---

## Versión en español

Una colección de skills para [Claude Code](https://claude.com/claude-code)
orientadas a empezar proyectos con disciplina. Cada skill es una carpeta
autocontenida con un `SKILL.md` que el agente lee cuando detecta contexto
relevante, o cuando se invoca explícitamente con `/<nombre-de-la-skill>`.

### Skills en este repositorio

| Skill                                | Qué hace                                                              |
|--------------------------------------|-----------------------------------------------------------------------|
| [`mvp-9-phases`](./mvp-9-phases/)    | Flujo de 9 fases dirigido por interrogación para crear cualquier producto desde cero. El agente informa, el usuario decide. Los resultados son deterministas y medibles. |

### Instalación

Las skills viven en `~/.claude/skills/<nombre>/`. Para instalar una:

```bash
git clone https://github.com/OnCeUponTry/CC-STARTUP-SKILL.git
cp -r CC-STARTUP-SKILL/mvp-9-phases ~/.claude/skills/
```

O un enlace simbólico durante desarrollo local:

```bash
ln -s "$PWD/mvp-9-phases" ~/.claude/skills/mvp-9-phases
```

Reinicia Claude Code (o abre una sesión nueva) para que la skill quede
disponible.

### Uso

Una vez instalada, Claude invocará la skill cuando su `description` coincida
con el contexto de la conversación. También puede invocarse explícitamente:

```
/mvp-9-phases
```

Para `mvp-9-phases` específicamente: invocar al inicio de un proyecto nuevo,
antes de escribir el primer archivo.

### Por qué existe

La mayoría de los intentos de "MVP desde cero" fallan por uno de tres motivos:

1. **Scope sin límite** — el proyecto crece a mitad de construcción y nunca
   se publica.
2. **Duplicado de algo existente** — descubierto demasiado tarde.
3. **MVP que no funciona end-to-end** — features sueltas sin un demo path real.

La skill `mvp-9-phases` impone un flujo dirigido por interrogación que ataca
los tres frentes: definición E2E cerrada (Fase 1), búsqueda de unicidad antes
de comprometerse (Fase 2), análisis de gaps con mitigación explícita (Fase 5),
validación con datos reales antes de publicar (Fase 7), y evaluación UX por
parte del usuario, no del agente (Fase 9).

El agente nunca decide qué entra al MVP. Informa, propone, mide, documenta —
el usuario decide.

### Autor

**Carlos Enrique Castro Lazaro** ([@OnCeUponTry](https://github.com/OnCeUponTry))
Investigador independiente · Ingeniero de sistemas · IA / Telecom · [angriestboy.com](https://www.angriestboy.com)

### Licencia

Licenciado bajo cualquiera de las dos siguientes, a elección del usuario:

- **Apache License, Version 2.0** ([LICENSE-APACHE](LICENSE-APACHE))
- **MIT License** ([LICENSE-MIT](LICENSE-MIT))

A menos que se indique lo contrario, toda contribución enviada intencionalmente
para su inclusión en el proyecto, según se define en la licencia Apache-2.0,
queda licenciada de forma dual como se describe arriba, sin términos ni
condiciones adicionales.

Copyright (c) 2026 Carlos Enrique Castro Lazaro.
