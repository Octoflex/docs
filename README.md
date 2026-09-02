# OctoFlex Docs

Documentación oficial de OctoFlex — <https://docs.octoflex.es>

Construida con [MkDocs](https://www.mkdocs.org/) y
[Material for MkDocs](https://squidfunk.github.io/mkdocs-material/), en español
e inglés.

## Desarrollo local

Requiere Python 3.12 o superior.

```bash
make install   # crea venv/ e instala requirements.txt
make serve     # http://127.0.0.1:8000 con recarga en caliente
make build     # build de producción (--strict)
```

Sin `make`:

```bash
python3 -m venv venv
./venv/bin/pip install -r requirements.txt
./venv/bin/mkdocs serve
```

Los plugins `social` y `privacy` sólo se activan en CI (variable de entorno
`CI`), porque necesitan librerías nativas de Cairo. El build local es idéntico
en todo lo demás.

## Estructura

```
docs/
├── index.md                  # portada (es)   ─┐
├── index.en.md               # portada (en)   ─┤ traducciones por sufijo
├── about.md / about.en.md    # acerca de       │
├── tags.md / tags.en.md      # índice de etiquetas
├── doc/
│   ├── ceph/ceph_base.md · ceph_base.en.md
│   └── openstack/openstack_base.md · openstack_base.en.md
└── blog/                     # excluido del build (ver más abajo)
overrides/404.html            # página 404 personalizada
```

Las traducciones usan [mkdocs-static-i18n](https://github.com/ultrabug/mkdocs-static-i18n)
en modo sufijo: `pagina.md` es español (idioma por defecto) y `pagina.en.md` su
traducción. Si falta la traducción, se muestra la versión en español.

> **Blog:** el contenido de `docs/blog/` está excluido del build. El plugin
> `blog` de Material y `mkdocs-static-i18n` todavía no son compatibles
> ([mkdocs-material#5909](https://github.com/squidfunk/mkdocs-material/issues/5909)):
> los posts se pierden en el build multiidioma. El contenido se conserva para
> cuando se resuelva.

## Publicación

Cada push a `main` dispara [`.github/workflows/ci.yml`](.github/workflows/ci.yml),
que construye con `--strict` y despliega a la rama `gh-pages`. Los pull requests
sólo construyen, no despliegan.

`mkdocs gh-deploy` publica desde el árbol de trabajo, no desde git: un fichero
sin versionar dentro de `docs/` acabaría en la web aunque esté en `.gitignore`.
Por eso `make deploy` se niega a ejecutarse si el árbol está sucio. Lo normal es
no usarlo y dejar que publique el CI, que construye desde un checkout limpio.

## Contribuir

Ver [CONTRIBUTING.md](CONTRIBUTING.md).
