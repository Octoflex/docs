# Cómo contribuir

Gracias por querer mejorar la documentación de OctoFlex 🐙

## Cambios rápidos

Cada página publicada tiene un icono de lápiz ✏️ arriba a la derecha que lleva
directamente al editor de GitHub. Para una errata o un párrafo, es la vía más
rápida.

## Cambios más grandes

1. Haz un fork y crea una rama: `git checkout -b docs/mi-cambio`.
2. Monta el entorno: `make install`.
3. Escribe y revisa en local: `make serve`.
4. Comprueba que el build pasa sin warnings: `make build`.
5. Abre un pull request describiendo el cambio.

El CI construye con `--strict`, así que **cualquier warning rompe el build**:
enlaces rotos, anclas inexistentes o páginas fuera de `nav`.

## Convenciones

- **Idioma por defecto: español.** El fichero `pagina.md` es la versión en
  español; `pagina.en.md` es su traducción al inglés. No hace falta traducir
  todo: si falta la versión inglesa, se muestra la española.
- **Front matter** en cada página nueva:

  ```yaml
  ---
  title: Título de la página
  description: Una frase que resume la página (se usa en buscadores y redes).
  tags:
    - tema
  ---
  ```

- **Imágenes** en la misma carpeta que el `.md` que las usa, con texto
  alternativo descriptivo: `![Arquitectura de Ceph](Estructura_Ceph.png)`.
  Antes de subirlas, redimensiona a un máximo de 1400 px de ancho.
- **Nada de secretos** en `docs/`: todo lo que hay ahí acaba publicado.

## Hooks de pre-commit (opcional pero recomendado)

```bash
pip install pre-commit
pre-commit install
```

Formatea Markdown, detecta claves privadas y erratas antes de cada commit.
