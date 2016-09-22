# HTML Template Language (HTL, formerly Sightly) language support in Atom

Adds syntax highlighting, completions, and snippets to HTML Template Language in Atom.

Contributions are greatly appreciated. Please fork this repository and open a
pull request to add snippets, make grammar tweaks, etc.

## Snippets

To use a snippet, simply type one of the available prefixes, then press the tab key (↹). Press ↹ repeatedly to jump to the next hotspot within the snippet.

* `<!--` becomes `<!--/*  */-->`
* `div` becomes `<div data-sly-="${}">`
* `sly` becomes `<sly data-sly-="${}">`
* `component` becomes `<sly data-sly-use.component="template.html" data-sly-call="${component.template @ properties=properties}" />`
* `template` becomes `<template data-sly-template.template="${@ properties}"></template>`
