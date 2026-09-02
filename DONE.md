# Hecho — revisión de septiembre de 2026

Trabajo ya aplicado sobre la documentación de OctoFlex.
Lo que queda pendiente vive en [TODO.md](TODO.md).

Stack resultante: MkDocs 1.6.1 + Material for MkDocs 9.7.7, español + inglés,
despliegue a GitHub Pages desde Actions.

---

## Seguridad

- [x] `docs/images/github-recovery-codes.txt` (códigos de recuperación reales de
      GitHub) sacado de la carpeta publicada → movido a `~/Desktop/`.
      **Pendiente por tu parte: regenerar esos códigos en GitHub.**
- [x] `.gitignore` reescrito: `.DS_Store`, `.venv/`, `*.pem`, `*.key`, `.env`,
      `*recovery-codes*`.
- [x] Hook `detect-private-key` en pre-commit.

## Dependencias

- [x] Material 9.6.4 → **9.7.7**.
- [x] `requirements.txt` con versiones fijadas (antes el CI instalaba sin pin).
- [x] `venv` local recreado (estaba roto: apuntaba a un `python3.12` inexistente).
- [x] `.github/dependabot.yml` para `pip` y `github-actions`.

## Configuración de MkDocs

- [x] `codehilite` (obsoleto) → `pymdownx.highlight` + `inlinehilite` +
      `superfences` (con bloque `mermaid`) + `snippets`.
- [x] Extensiones añadidas: `tabbed`, `tasklist`, `details`, `emoji`, `critic`,
      `keys`, `mark`, `caret`, `tilde`, `betterem`, `smartsymbols`, `abbr`,
      `def_list`, `md_in_html`, `tables`.
- [x] `repo_url`, `repo_name`, `edit_uri` → botón "editar esta página".
- [x] `site_author`, `copyright`, `extra.social`.
- [x] `validation:` activado (enlaces rotos, anclas y páginas huérfanas).
- [x] `toc.integrate` → `toc.follow`.
- [x] Features nuevas: `content.code.copy`, `content.code.annotate`,
      `content.action.edit`, `content.tooltips`, `search.highlight`,
      `navigation.footer`, `navigation.tracking`, `announce.dismiss`.
- [x] Plugin `privacy` (fuentes de Google servidas en local, coherente con el
      banner de cookies).
- [x] `extra.consent` con `actions: [accept, reject, manage]` — antes no se
      podía rechazar.
- [x] `analytics.feedback` ("¿te ha resultado útil esta página?").
- [x] Plugin `tags` + páginas `tags.md` / `tags.en.md`.
- [x] Plugin `git-revision-date-localized` (fecha de creación y actualización).
- [x] `social` y `privacy` sólo se activan en CI (`!ENV [CI, false]`), así el
      build local no necesita Cairo.
- [x] `favicon.ico` inexistente → generado `docs/images/favicon.png`.
- [x] `extra_javascript: javascripts/extra.js` apuntaba a un fichero que no
      existía → eliminado. `stylesheets/extra.css` creado de verdad.

## Traducciones

- [x] `docs/en/` (huérfano, fuera de `nav`, con el plugin i18n comentado)
      migrado a modo sufijo: `index.en.md`, `doc/ceph/ceph_base.en.md`,
      `doc/openstack/openstack_base.en.md`.
- [x] Traducciones nuevas: `about.en.md`, `tags.en.md`.
- [x] Plugin `i18n` activado con `nav_translations` y `fallback_to_default`.
- [x] `extra.alternate` manual (apuntaba a un `/en/` que daba 404) sustituido
      por el conmutador contextual que genera el plugin.
- [x] Imágenes duplicadas de `docs/en/` eliminadas (eran idénticas).

## CI/CD

- [x] Job de build en pull request (antes sólo se construía al desplegar).
- [x] `mkdocs build --strict` en CI.
- [x] `fetch-depth: 0` (necesario para las fechas de git).
- [x] Caché de pip + caché de `.cache`.
- [x] `concurrency` con `cancel-in-progress`.
- [x] Python fijado a 3.12 (antes `3.x`).
- [x] Dependencias nativas de Cairo instaladas para los plugins de imagen.
- [x] `.github/workflows/links.yml`: lychee semanal que abre incidencia si
      encuentra enlaces rotos.

## Contenido

- [x] Portada convertida en landing con *grid cards* (es + en).
- [x] Página 404 personalizada (`overrides/404.html`).
- [x] `about.md` enlazaba a `inicio.md` y `documentacion_tecnica.md`, que no
      existen → corregido.
- [x] Front matter con `title`, `description` y `tags` en las páginas técnicas.
- [x] `.authors.yml` del blog tenía un avatar falso (`ruta/imagen-perfil.png`)
      → corregido.

## Contenido de producto (fase 1)

- [x] Sección **OctoFlex** con cuatro páginas nuevas, en español e inglés:
      «Qué es OctoFlex», «Servicios», «Arquitectura de referencia» y
      «Decisiones técnicas».
- [x] Navegación reestructurada: OctoFlex primero, y las páginas de OpenStack y
      Ceph recolocadas bajo «Tecnologías» como contexto de apoyo, que es lo que
      realmente son.
- [x] Portada reescrita: dice a qué se dedica OctoFlex en la primera línea, en
      lugar de «una herramienta innovadora».
- [x] Página de Ceph actualizada de Reef a **Squid 19.2.6**, incluido el
      paquete `centos-release-ceph-squid`.
- [x] Instalación de cephadm corregida: la URL documentada devolvía 404.
- [x] Diagrama de arquitectura en mermaid. El plugin `privacy` lo sirve en
      local: cero peticiones a unpkg desde el navegador del visitante.

## Calidad

- [x] Imágenes optimizadas: **703 KB → 151 KB** (redimensionado a 1400 px máx.
      y recompresión). `estructura_openstack.png` 352 KB → 73 KB.
- [x] `Makefile` (`make install|serve|build|deploy|clean`).
- [x] `.editorconfig`.
- [x] `.pre-commit-config.yaml` con markdownlint, codespell y comprobaciones
      básicas + `.markdownlint.yaml`.
- [x] `README.md` real, con instrucciones de desarrollo local.
- [x] `CONTRIBUTING.md`.
- [x] `make deploy` exige un árbol de trabajo limpio: `gh-deploy` publica desde
      el disco, así que un fichero sin versionar dentro de `docs/` acabaría en
      la web aunque esté en `.gitignore`.
- [x] Hooks de pre-commit instalados y pasados sobre todo el repo. Dos ajustes
      necesarios: `MD025` con `front_matter_title: ""` (el `title` del front
      matter no es un H1) y `codespell` limitado a `*.en.md`, porque sobre texto
      en español daba falsos positivos constantes. `docs/CNAME` excluido del
      `end-of-file-fixer`: define el dominio publicado.
- [x] 6 PRs de Dependabot mergeados: `checkout` v7, `setup-python` v7, `cache`
      v6 y `create-issue-from-file` v6 (elimina el aviso de deprecación de
      Node 20), más `static-i18n` 1.3.1 y `git-revision-date-localized` 1.5.4,
      que corrigen dos pins que se habían fijado a versiones antiguas.
- [x] `git remote` apuntando a `Octoflex/docs`, la ubicación actual del repo.
