provider = require './provider'

module.exports =
  activate: -> provider.loadCompletions()

  getProvider: -> provider

atom.commands.add 'atom-text-editor',
 'htl:aem:comment': ->
    editor = atom.workspace.getActiveTextEditor()

    selection = editor.getLastSelection()
    {start, end} = selection.getBufferRange()

    scope = editor.scopeDescriptorForBufferPosition([start.row, 0])
    {commentStartString, commentEndString} = editor.languageMode.commentStartAndEndStringsForScope(scope)

    if commentStartString && commentEndString
      commentStartString = "<!--/* "
      commentEndString = " */-->"
      tpl = "#{commentStartString}#{editor.getTextInRange([start, end])}#{commentEndString}"

      editor.setTextInBufferRange([start, end], tpl)
