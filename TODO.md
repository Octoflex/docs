# TODO — Mejoras de la documentación OctoFlex

Estado tras la revisión de septiembre de 2026.
Lo ya aplicado está en [DONE.md](DONE.md).

Stack: MkDocs 1.6.1 + Material for MkDocs 9.7.7, español + inglés, despliegue a
GitHub Pages desde Actions.

---

## ⚠️ Decisión tomada que conviene revisar

**El blog está excluido del build.** El plugin `blog` de Material y
`mkdocs-static-i18n` no son compatibles todavía
([mkdocs-material#5909](https://github.com/squidfunk/mkdocs-material/issues/5909)):
con i18n activo los posts desaparecen del sitio. Probado en ambos órdenes de
plugins y con sufijo de idioma en el post; no hay forma de tener los dos.

Se ha priorizado el **multiidioma**, porque hay contenido técnico real traducido
y el conmutador de idioma ya estaba anunciado en el sitio. El blog (un post de
bienvenida) se conserva en `docs/blog/` y está excluido vía `exclude_docs`.

Para invertir la decisión: quitar `exclude_docs`, volver a añadir el plugin
`blog` y la entrada de `nav`, y eliminar el plugin `i18n`.

---

## 📋 Pendiente

- [ ] *(Opcional)* **Regenerar los códigos de recuperación de GitHub**: el
      fichero estaba dentro de la carpeta que se publica, pero se verificó que
      nunca entró en el historial ni llegó a publicarse — se creó un día
      después del único despliegue anterior, y no aparece en ningún blob ni en
      ninguno de los dos árboles publicados. No hubo exposición. Aun así,
      conviene sacarlos del Escritorio en texto plano y meterlos en un gestor
      de contraseñas.
- [ ] *(Opcional)* Migrar el despliegue de `gh-deploy` (rama `gh-pages`) a
      **GitHub Pages vía artifact** (`actions/upload-pages-artifact` +
      `deploy-pages`): evita commits de build en el repo. **Requiere cambiar a
      mano el origen de Pages a "GitHub Actions" en los ajustes del repo**, por
      eso no se ha hecho: hacerlo sin ese cambio rompe la publicación.
- [ ] Contenido por escribir: guía de instalación / quickstart, arquitectura,
      FAQ, glosario, troubleshooting.
- [ ] `docs/about.md` sigue siendo genérico: falta información real del equipo.
- [ ] *(Opcional)* `mike` para versionar la documentación si OctoFlex publica
      releases.
- [ ] *(Opcional)* `devcontainer.json` para colaboradores sin Python local.
