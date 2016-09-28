provider = require './provider'

module.exports =
  activate: -> provider.loadCompletions()
  getProvider: -> provider


isCurrentSelectionEmptyRow = () ->
  editor = atom.workspace.getActiveTextEditor()
  selection = editor.getLastSelection()
  {start, end} = selection.getBufferRange()
  textBuffer = editor.getBuffer()

  isSameRow = start.row == end.row
  isSameColumn = start.column == end.column
  lineWithNoWhitespace = textBuffer.lineForRow(start.row).replace(/\s/g, "")
  hasNoLength = lineWithNoWhitespace.length == 0

  return isSameRow && isSameColumn && hasNoLength


atom.commands.add 'atom-text-editor',
 'htl:aem:comment': ->
    commentStartString = '<!--/* '
    commentEndString = ' */-->'

    atom.config.set('editor.commentStart', commentStartString, {scopeSelector: '.htl.aem'})
    atom.config.set('editor.commentEnd', commentEndString, {scopeSelector: '.htl.aem'})

    editor = atom.workspace.getActiveTextEditor()
    selection = editor.getLastSelection()
    {start, end} = selection.getBufferRange()

    if isCurrentSelectionEmptyRow()
      # Add empty HTL comment
      template = commentStartString + commentEndString
      editor.setTextInBufferRange([start, end], template)

      # Move cursor into comment
      cursor = editor.getLastCursor()
      newCursorPosition = [start.row, start.column + commentEndString.length + 1]
      cursor.setScreenPosition(newCursorPosition)

    else
      # Fall back to regular toggle
      selection.toggleLineComments()
