# Task objetivo

<!-- hy-mt2-i18n:start -->
[English](./README.md) | [中文](./README_zh-CN.md) | [日本語](./README_ja.md) | **Español**
<!-- hy-mt2-i18n:end -->

Traducir los datos en formato Markdown a continuación al español.

# Restricciones estrictas
1. **Solo salida en español**: No se debe incluir ningún resultado rodeado por código.
2. **Estructura intacta**: Se debe mantener completamente sin cambios la estructura original de Markdown, los sangrados, los niveles de título, las tablas, los enlaces, las URL, las insignias, los bloques de código y el código dentro de las líneas.
3. **Traducción selectiva**: Solo se deben traducir los contenidos de lenguaje natural visibles para el usuario (texto principal, títulos, texto explicativo y texto de tablas).
4. **Prohibición de modificaciones**: Está **estrictamente prohibido** traducir o cambiar etiquetas de código, nombres de claves, placeholders de variables (como {{var}}, ${var}, %s, %d, etc.), ejemplos de comandos, rutas de archivos, nombres de proyectos, nombres de API, nombres de paquetes, nombres de modelos, identificadores y símbolos de código; a menos que el texto original ya tenga una traducción correspondiente.

# Entrada de datos
Archivo de origen: README.md

Contenido de Markdown:
[![Principios EO respetados aquí](https://www.elegantobjects.org/badge.svg)](https://www.elegantobjects.org)
[![DevOps de Rultor.com](https://www.rultor.com/b/yegor256/hoc)](https://www.rultor.com/p/yegor256/hoc)
[![Recomendamos RubyMine](https://www.elegantobjects.org/rubymine.svg)](https://www.jetbrains.com/ruby/)

[![rake](https://github.com/yegor256/hoc/actions/workflows/rake.yml/badge.svg)](https://github.com/yegor256/hoc/actions/workflows/rake.yml)
[![Versión de Gem](https://badge.fury.io/rb/hoc.svg)](https://badge.fury.io/rb/hoc)
[![Mantenibilidad](https://api.codeclimate.com/v1/badges/4302208cf578d101143e/maintainability)](https://codeclimate.com/github/yegor256/hoc/maintainability)
[![Cobertura de pruebas](https://img.shields.io/codecov/c/github/yegor256/hoc.svg)](https://codecov.io/github/yegor256/hoc?branch=master)
[![Hits-of-Code](https://hitsofcode.com/github/yegor256/hoc)](https://hitsofcode.com/view/github/yegor256/hoc)

Es una herramienta de línea de comandos para calcular la métrica Hits-of-Code
en un repositorio de código fuente (por el momento soportamos Git 2+ y Subversion 1.7+).
Puede leer más sobre la métrica Hits-of-Code en esta entrada de blog:
[Hits-of-Code en lugar de SLoC](https://www.yegor256.com/2014/11/14/hits-of-code.html).

También puede utilizar [hitsofcode.com](https://hitsofcode.com) de
[Valentin Brandl](https://www.vbrandl.net/), si desea tener una insignia
en su repositorio.

Instálelo primero:

```bash
$ gem install hoc
```

Ejécutelo localmente y lea su salida:

```bash
$ hoc --help
```

Para obtener estadísticas de Subversion, debe tener instalado
[diffstat](https://sourceforge.net/projects/mingw/files/MSYS/Extension/diffstat/).

## Cómo contribuir

Lea [estas pautas](https://www.yegor256.com/2014/04/15/github-guidelines.html).
Asegúrese de que su compilación muestre estado verde antes de enviar
su solicitud de pull request. Necesitará tener instalado [Ruby](https://www.ruby-lang.org/en/) 2.3+ y
[Bundler](https://bundler.io/). Luego:

```
$ bundle update
$ bundle exec rake
```

Si todo está correcto y no ve mensajes de error, envíe su solicitud de pull request.
