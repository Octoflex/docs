VENV := venv
PY   := $(VENV)/bin/python

.PHONY: help install serve build deploy check-clean clean

help:  ## Muestra esta ayuda
	@grep -E '^[a-z-]+:.*?## ' $(MAKEFILE_LIST) | awk -F':.*## ' '{printf "  %-10s %s\n", $$1, $$2}'

install:  ## Crea el entorno virtual e instala las dependencias
	python3 -m venv $(VENV)
	$(VENV)/bin/pip install --upgrade pip
	$(VENV)/bin/pip install -r requirements.txt

serve: ## Servidor local con recarga en caliente (http://127.0.0.1:8000)
	$(VENV)/bin/mkdocs serve

build: ## Build de producción, falla ante cualquier warning
	$(VENV)/bin/mkdocs build --strict

deploy: check-clean ## Publica en GitHub Pages (normalmente lo hace el CI)
	$(VENV)/bin/mkdocs gh-deploy --force

check-clean: ## Verifica que el árbol de trabajo está limpio antes de publicar
	@test -z "$$(git status --porcelain)" || { \
		echo "Árbol de trabajo sucio. gh-deploy publica desde el disco, no desde git:"; \
		echo "cualquier fichero sin versionar dentro de docs/ acabaría en la web."; \
		echo; \
		git status --short; \
		echo; \
		echo "Commitea o limpia antes de desplegar, o deja que publique el CI."; \
		exit 1; \
	}

clean: ## Borra la salida del build y las cachés
	rm -rf site .cache
