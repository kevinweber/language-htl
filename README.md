# HTML Template Language (HTL, formerly Sightly) language support in Atom

Adds syntax highlighting, completions, and snippets to HTML Template Language in Atom.

Contributions are greatly appreciated. Please fork this repository and open a
pull request to add snippets, make grammar tweaks, etc.

## Snippets

To use a snippet, simply type one of the available prefixes, then press the tab key (↹). Press ↹ repeatedly to jump to next hotspots within the snippet. Examples:

* `<!--` becomes `<!--/*  */-->`
* `component` becomes `<sly data-sly-use.component="template.html" data-sly-call="${component.template @ properties=properties}" />`
* `template` becomes `<template data-sly-template.template="${@ properties}"></template>`
* `@ c` becomes `@ context=''`

A list with all snippets is available on the settings page of this extension within Atom.

If you're using [Emmet](http://emmet.io), you'll see that the tab key doesn't work for your Emmet snippets anymore. Use "cmd-e" instead.
