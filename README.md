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

## Prerequisites — install Claude Code

If you don't have Claude Code yet, install it first. The official commands
(from <https://code.claude.com/docs/en/setup>) are:

| Platform              | Command                                                                                  |
|-----------------------|------------------------------------------------------------------------------------------|
| macOS / Linux / WSL   | `curl -fsSL https://claude.ai/install.sh \| bash`                                        |
| Windows PowerShell    | `irm https://claude.ai/install.ps1 \| iex`                                               |
| Windows CMD           | `curl -fsSL https://claude.ai/install.cmd -o install.cmd && install.cmd && del install.cmd` |
| Homebrew              | `brew install --cask claude-code`                                                        |
| WinGet                | `winget install Anthropic.ClaudeCode`                                                    |
| npm                   | `npm install -g @anthropic-ai/claude-code`                                               |

Native Windows additionally requires [Git for Windows](https://git-scm.com/downloads/win).
Verify with `claude --version` or `claude doctor`.

## Install this skill

Skills are read from `~/.claude/skills/` (personal, all projects) or
`.claude/skills/` (per-project). The Claude Code CLI, the **VS Code extension**,
and the **Desktop app** all read from the same locations — install once, use
from any of them.

### macOS / Linux / WSL

```bash
git clone https://github.com/OnCeUponTry/CC-STARTUP-SKILL.git
mkdir -p ~/.claude/skills
cp -r CC-STARTUP-SKILL/mvp-9-phases ~/.claude/skills/
```

Or, for local development with live edits:

```bash
ln -s "$PWD/CC-STARTUP-SKILL/mvp-9-phases" ~/.claude/skills/mvp-9-phases
```

### Windows (PowerShell, native)

```powershell
git clone https://github.com/OnCeUponTry/CC-STARTUP-SKILL.git
New-Item -ItemType Directory -Force -Path "$env:USERPROFILE\.claude\skills" | Out-Null
Copy-Item -Recurse CC-STARTUP-SKILL\mvp-9-phases "$env:USERPROFILE\.claude\skills\"
```

### Windows + WSL

Inside the WSL terminal, follow the **macOS / Linux / WSL** instructions above.
Skills installed in WSL are available to Claude Code launched inside WSL.

### Per-project install (any OS)

To make the skill available only inside a specific repository, copy it under
`.claude/skills/` in that repo and commit it:

```bash
mkdir -p .claude/skills
cp -r CC-STARTUP-SKILL/mvp-9-phases .claude/skills/
git add .claude/skills/mvp-9-phases && git commit -m "Add mvp-9-phases skill"
```

### Verify

Claude Code picks up new skills without a restart (live change detection). To
confirm the skill is loaded, ask Claude:

```text
What skills are available?
```

`mvp-9-phases` should appear in the list.

## Usage

Skills can be invoked two ways:

1. **Automatic** — Claude loads the skill when its `description` matches the
   conversation context. For `mvp-9-phases`, that triggers when you ask to
   create a new project, product, tool, or service from scratch.
2. **Explicit** — type `/mvp-9-phases` to invoke it directly.

For `mvp-9-phases` specifically, invoke it at the very start of a new project,
**before the first file is written**. The skill drives a guided
interrogation that requires up-front input from you, so trying to run it
mid-project produces noise rather than value.

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

### Requisitos previos — instalar Claude Code

Si todavía no tenés Claude Code, instalalo primero. Comandos oficiales
(de <https://code.claude.com/docs/en/setup>):

| Plataforma            | Comando                                                                                  |
|-----------------------|------------------------------------------------------------------------------------------|
| macOS / Linux / WSL   | `curl -fsSL https://claude.ai/install.sh \| bash`                                        |
| Windows PowerShell    | `irm https://claude.ai/install.ps1 \| iex`                                               |
| Windows CMD           | `curl -fsSL https://claude.ai/install.cmd -o install.cmd && install.cmd && del install.cmd` |
| Homebrew              | `brew install --cask claude-code`                                                        |
| WinGet                | `winget install Anthropic.ClaudeCode`                                                    |
| npm                   | `npm install -g @anthropic-ai/claude-code`                                               |

Windows nativo requiere también [Git for Windows](https://git-scm.com/downloads/win).
Verificá con `claude --version` o `claude doctor`.

### Instalar esta skill

Las skills se leen desde `~/.claude/skills/` (personal, todos los proyectos) o
desde `.claude/skills/` (por proyecto). Claude Code CLI, la **extensión de
VS Code** y la **app de escritorio** leen del mismo lugar — instalás una vez
y queda disponible en todos.

#### macOS / Linux / WSL

```bash
git clone https://github.com/OnCeUponTry/CC-STARTUP-SKILL.git
mkdir -p ~/.claude/skills
cp -r CC-STARTUP-SKILL/mvp-9-phases ~/.claude/skills/
```

O, para desarrollo local con edición en vivo:

```bash
ln -s "$PWD/CC-STARTUP-SKILL/mvp-9-phases" ~/.claude/skills/mvp-9-phases
```

#### Windows (PowerShell, nativo)

```powershell
git clone https://github.com/OnCeUponTry/CC-STARTUP-SKILL.git
New-Item -ItemType Directory -Force -Path "$env:USERPROFILE\.claude\skills" | Out-Null
Copy-Item -Recurse CC-STARTUP-SKILL\mvp-9-phases "$env:USERPROFILE\.claude\skills\"
```

#### Windows + WSL

Dentro de la terminal de WSL seguí las instrucciones de **macOS / Linux / WSL**
de arriba. Las skills instaladas en WSL están disponibles para el Claude Code
que se ejecuta dentro de WSL.

#### Instalación por proyecto (cualquier OS)

Para que la skill esté disponible solo dentro de un repo específico, copiala
bajo `.claude/skills/` en ese repo y commiteala:

```bash
mkdir -p .claude/skills
cp -r CC-STARTUP-SKILL/mvp-9-phases .claude/skills/
git add .claude/skills/mvp-9-phases && git commit -m "Add mvp-9-phases skill"
```

#### Verificar

Claude Code detecta cambios en las skills sin reiniciar (live change
detection). Para confirmar que la skill está cargada, preguntale a Claude:

```text
¿Qué skills están disponibles?
```

`mvp-9-phases` debería aparecer en la lista.

### Uso

Las skills se invocan de dos maneras:

1. **Automática** — Claude carga la skill cuando su `description` coincide con
   el contexto de la conversación. Para `mvp-9-phases`, eso pasa cuando pedís
   crear un proyecto, producto, herramienta o servicio nuevo desde cero.
2. **Explícita** — escribís `/mvp-9-phases` para invocarla directamente.

Para `mvp-9-phases` específicamente, invocala al inicio de un proyecto nuevo,
**antes de escribir el primer archivo**. La skill conduce una interrogación
guiada que requiere input previo de tu parte, así que ejecutarla a mitad de un
proyecto produce ruido en lugar de valor.

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
