provider = require './provider'

module.exports =
  activate: -> provider.loadCompletions()
  getProvider: -> provider

atom.commands.add 'atom-text-editor',
 'htl:aem:comment': ->
    atom.config.set('editor.commentStart', '<!--/* ', {scopeSelector: '.htl.aem'})
    atom.config.set('editor.commentEnd', ' */-->', {scopeSelector: '.htl.aem'})

    editor = atom.workspace.getActiveTextEditor()
    selection = editor.getLastSelection()
    selection.toggleLineComments()
